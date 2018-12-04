package com.school.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.personbeans.User;
import com.school.imp.UserRowMapper;
@Repository
public class UserDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //ͨ��id��ѯ�û���Ϣ
	 public List<User> getUser(int id){
		 String sql = "select *from user where userId=?";
		 return jdbcTemplate.query(sql, new UserRowMapper(), id); 
	 }	 
	 
	 //������û�,�����������˺�
	 public int addUser(User user){
		 //0��ʾʧ�ܣ��������˺�
		 int newId = 0;
		 String name = "\"���û�\"";
		 //�������˺�
		 String sql1="select count(*) from user";
		 newId = jdbcTemplate.queryForInt(sql1)+1;
		 //��������
		 String sql2="insert into user(userName,userPassword,userTel) values ("+name+","+user.getUserPwd()+","+user.getUserTel()+");";
		 try{
			 jdbcTemplate.update(sql2);
		 }catch(Exception e){
			 System.out.println("����ʧ��");
			 newId = 0;
		 }
		 return newId; 
	 }
	 
	 //�޸��û���Ϣ
	 public int updateUser(User user){
		 StringBuffer sql = new StringBuffer("update user set ");
		 if(user.getUserPwd()!=null){
			 sql.append("userPassword="+"'"+user.getUserPwd()+"'");
		 }
		 if(user.getUserPhoto()!=null){
			 sql.append(" , userPhoto="+"'"+user.getUserPhoto()+"'");
		 }
		 if(user.getUserTrueName()!=null){
			 sql.append(" , userTrueName="+"'"+user.getUserTrueName()+"'");
		 }
		 if(user.getUserName()!=null){
			 sql.append(" , userName="+"'"+user.getUserName()+"'");
		 }
		 if(user.getUserAge()!=null){
			 sql.append(" , userAge="+user.getUserAge());
		 }
		 if(user.getUserSex()!=null){
			 sql.append(" , userSex="+"'"+user.getUserSex()+"'");
		 }
		 if(user.getUserIdCard()!=null){
			 sql.append(" , userIdCard="+"'"+user.getUserIdCard()+"'");
		 }
		 if(user.getUserEmail()!=null){
			 sql.append(" , userEmail="+"'"+user.getUserEmail()+"'");
		 }
		 if(user.getUserAddress()!=null){
			 sql.append(" , userAddress="+"'"+user.getUserAddress()+"'");
		 }
		 if(user.getUserTel()!=null){
			 sql.append(" , userTel="+"'"+user.getUserTel()+"'");
		 }
		 sql.append(" where userId="+user.getUserId());
		 System.out.println(sql.toString());
		 return jdbcTemplate.update(sql.toString());
	 }
}
