package com.changingpay.shiro.dao;

import java.util.List;

import com.changingpay.shiro.entity.User;

public interface UserDao {

    public User createUser(User user);
    public User updateUser(User user);
    public void deleteUser(Long userId);

    User findOne(Long userId);

    List<User> findAll();

    User findByUsername(String username);

}
