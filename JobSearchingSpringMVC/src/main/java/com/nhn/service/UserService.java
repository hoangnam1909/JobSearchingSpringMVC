package com.nhn.service;

import com.nhn.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    User getById(int userId);

    boolean addOrUpdate(User user);

    User getByUsername(String username);

    List<User> getUsers(String username, int page);

    boolean delete(User user);

    long count();

    int getMaxItemsInPage();

    List<User> getUsersByRole(String role, int page, int active);

}
