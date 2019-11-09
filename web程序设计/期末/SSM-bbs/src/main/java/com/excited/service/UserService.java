package com.excited.service;

import com.excited.domain.User;
import java.util.List;

public interface UserService {
    //添加用户
    public void addUser(User user);
    //按用户名名更新用户
    public void updateUserByUserName(User user);
    //按用户名获取用户
    public User getUserByUserName(String userName);
    //按用户名删除用户
    public void deleteUserByUserName(String userName);
    //登录成功
    public void loginSuccess(User user);
    //获取登录密码
    public String getPassword(String userName);
    //获取所有用户
    public List<User> getAllUser();
}
