package com.nhn.service;

import com.nhn.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    User getById(int userId);

    boolean add(User user);

    User getByUsername(String username);

    List<User> getUsers(String username, int page);

    boolean delete(User user);

    boolean update(User user);

    long count();

    int getMaxItemsInPage();
}
