package com.nhn.service;

import com.nhn.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    User getUserById(int userId);
    boolean addUser(User user);
    User getUserByUsername(String username);
    List<User> getUsers(String username);
    boolean deleteUser(User user);
    boolean updateUser(User user);

}
