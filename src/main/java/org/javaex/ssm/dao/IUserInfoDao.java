package org.javaex.ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.javaex.ssm.view.User;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserInfoDao {

    /*检验用户*/
   public User checkUser(@Param("username")String username,@Param("password")String password );
}
