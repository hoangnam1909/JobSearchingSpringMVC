package com.nhn.repository;

import com.nhn.pojo.User;

import java.util.List;

public interface UserRepository {

    User getById(int id);

    boolean addOrUpdate(User user);

    User getByUsername(String username);

    List<User> getUsers(String username, int page);

    boolean delete(User user);

    long count();

    int getMaxItemsInPage();

    List<User> getUsersByRole(String role, int page, int active);

}
