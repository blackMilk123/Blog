package org.javaex.ssm.service;

import org.javaex.ssm.dao.IUserInfoDao;
import org.javaex.ssm.view.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private IUserInfoDao iUserInfoDao ;

    public User checkUser(String username,String password){
       return iUserInfoDao.checkUser(username,password);
    }
}
