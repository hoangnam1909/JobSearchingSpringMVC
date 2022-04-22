package com.nhn.repository;

import com.nhn.pojo.User;

import java.util.List;

public interface UserRepository {
    User getUserById(int id);
    boolean addUser(User user);
    User getUserByUsername(String username);
    List<User> getUsers(String username);
    boolean deleteUser(User user);
    boolean updateUser(User user);
}
