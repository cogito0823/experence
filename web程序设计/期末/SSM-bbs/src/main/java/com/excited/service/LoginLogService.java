package com.excited.service;

import com.excited.domain.UserLoginLog;

public interface LoginLogService {
    //列出所有用户的登录日志
    public void listAllUserLoginLog();
    //添加用户登录日志
    public void addUserLoginLog(UserLoginLog userLoginLog);
}
