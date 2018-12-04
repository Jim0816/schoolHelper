package com.school.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.GoodsOrderDao;
import com.school.dao.UserDao;
import com.school.domain.personbeans.User;
import com.school.utils.PageUtil;
@Service
public class PersonService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private GoodsOrderDao goodsOrderDao;
	//验证普通用户信息
	public User checkUser(User user){
		List<User> findUser = userDao.getUser(user.getUserId());
		if(findUser.size()>0){
			User user1 = findUser.get(0);
			if(user1.getUserPwd().equals(user.getUserPwd())){
				//密码正确
				return user1;
			}else{
				//密码不正确
				return null;
			}
		}else{
			return null;
		}	
	}
	@Transactional
	//注册普通用户的基本信息
	public int registUser(User user){
		return userDao.addUser(user);
	}
	@Transactional
	//修改用户信息
	public User updateUser(User user){
		 int result = userDao.updateUser(user);
		 System.out.println("数据库修改返回值："+result);
		 if(result>0){
			 return userDao.getUser(user.getUserId()).get(0); 
		 }else{
			 return null;
		 }	 
	}
	//获取用户的所有订单信息
	public PageUtil getUserOrder(int currentPage,int numPerPage,int userId){
		return goodsOrderDao.queryShopAllGoodsOrderInfoByUser(currentPage, numPerPage, userId);
	}
}
