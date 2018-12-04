package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.utils.PageUtil;

@Repository
public class ShopAdvInfo {
	@Resource  
	private JdbcTemplate jdbcTemplate;  
	//查询所有商品广告信息（分页）
	public PageUtil queryAllShopAdvInfo(int currentPage,int numPerPage){
		String sql="select * from shopAdvInfo order by time desc";
		PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		return pageUtil;
	 }
}
