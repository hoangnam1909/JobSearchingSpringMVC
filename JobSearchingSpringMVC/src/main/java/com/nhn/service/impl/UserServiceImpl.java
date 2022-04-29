package com.nhn.service.impl;

import com.cloudinary.utils.ObjectUtils;
import com.nhn.pojo.User;
import com.nhn.repository.UserRepository;
import com.nhn.service.UserService;
import com.nhn.utils.utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cloudinary.Cloudinary;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service("userDetailsService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public User getById(int userId) {
        return this.userRepository.getById(userId);
    }

    @Override
    @Transactional
    public boolean add(User user) {
        try {
            String pass = user.getPassword();

            Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            user.setAvatar((String) r.get("secure_url"));

            String sDate = String.format("%02d/%02d/%04d", user.getDay(), user.getMonth(), user.getYear());
            user.setDob(utils.stringToDate(sDate, "dd/MM/yyyy"));

            return this.userRepository.add(user);
        } catch (IOException | ParseException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public User getByUsername(String username) {
        return this.userRepository.getByUsername(username);
    }

    @Override
    public List<User> getUsers(String username, int page) {
        return this.userRepository.getUsers(username, page);
    }

    @Override
    public boolean delete(User user) {
        return this.userRepository.delete(user);
    }

    @Override
    public boolean update(User user) {
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        String avatar = user.getAvatar();

        if (!user.getFile().isEmpty()) {
            Map r = null;
            try {
                r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (r != null)
                user.setAvatar((String) r.get("secure_url"));
            user.setAvatar(avatar);
        }

        String sDate = String.format("%02d/%02d/%04d", user.getDay(), user.getMonth(), user.getYear());
        try {
            user.setDob(utils.stringToDate(sDate, "dd/MM/yyyy"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return this.userRepository.update(user);
    }

    @Override
    public long count() {
        return this.userRepository.count();
    }

    @Override
    public int getMaxItemsInPage() {
        return this.userRepository.getMaxItemsInPage();
    }

    @Override
    public List<User> getUsersByRole(String role, int page, int active) {
        return this.userRepository.getUsersByRole(role, page, active);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username, 0);
        if (users.isEmpty())
            throw new UsernameNotFoundException("User does not exist!!!");

        User user = users.get(0);

        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getUserType()));

        return new org.springframework.security.core
                .userdetails.User(user.getUsername(), user.getPassword(), auth);
    }

}
