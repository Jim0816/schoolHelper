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
	//��֤��ͨ�û���Ϣ
	public User checkUser(User user){
		List<User> findUser = userDao.getUser(user.getUserId());
		if(findUser.size()>0){
			User user1 = findUser.get(0);
			if(user1.getUserPwd().equals(user.getUserPwd())){
				//������ȷ
				return user1;
			}else{
				//���벻��ȷ
				return null;
			}
		}else{
			return null;
		}	
	}
	@Transactional
	//ע����ͨ�û��Ļ�����Ϣ
	public int registUser(User user){
		return userDao.addUser(user);
	}
	@Transactional
	//�޸��û���Ϣ
	public User updateUser(User user){
		 int result = userDao.updateUser(user);
		 System.out.println("���ݿ��޸ķ���ֵ��"+result);
		 if(result>0){
			 return userDao.getUser(user.getUserId()).get(0); 
		 }else{
			 return null;
		 }	 
	}
	//��ȡ�û������ж�����Ϣ
	public PageUtil getUserOrder(int currentPage,int numPerPage,int userId){
		return goodsOrderDao.queryShopAllGoodsOrderInfoByUser(currentPage, numPerPage, userId);
	}
}
