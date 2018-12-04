package com.school.imp;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.school.domain.personbeans.User;

public class UserRowMapper implements RowMapper<User> {
	 public User mapRow(ResultSet rs, int rowNum) throws SQLException {  
         User user = new User();  
         user.setUserId(rs.getInt("userId")); 
         user.setUserPwd(rs.getString("userPassword"));
         user.setUserPhoto(rs.getString("userPhoto"));
         user.setUserName(rs.getString("userName"));
         user.setUserTrueName(rs.getString("userTrueName"));
         user.setUserAge(rs.getInt("userAge"));
         user.setUserSex(rs.getString("userSex"));
         user.setUserIdCard(rs.getString("userIdCard"));
         user.setUserEmail(rs.getString("userEmail"));
         user.setUserAddress(rs.getString("userAddress"));
         user.setUserTel(rs.getString("userTel"));
         return user;  
     }      
}  

