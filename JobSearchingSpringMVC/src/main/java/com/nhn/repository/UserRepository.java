package com.nhn.repository;

import com.nhn.pojo.User;

import java.util.List;

public interface UserRepository {

    User getById(int id);
    boolean add(User user);
    User getByUsername(String username);
    List<User> getUsers(String username, int page);
    boolean delete(User user);
    boolean update(User user);
    long count();
    int getMaxItemsInPage();

}
