package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.utils.PageUtil;

@Repository
public class ShopDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //通过店主id查询店铺信息
	 public List<Map<String, Object>> queryShopInfoByUser(int shopUserId){
		 String sql="select *from shops where shopUserId=?";
		 return jdbcTemplate.queryForList(sql,shopUserId);
	 }
	 //通过店铺id查询店铺信息
	 public List<Map<String, Object>> queryShopInfo(int shopId){
		 String sql="select *from shops as a,academy_map as b where a.belongsAcademy=b.academyFlag" +
			 		" and a.shopId=?";
		 return jdbcTemplate.queryForList(sql,shopId);
	 }
	 
	 //通过店铺id查询店铺基本信息(买家请求查询方式)
	 public List<Map<String, Object>> queryShopInfoForbuyer(int shopId){
		 //shopUserName,userName分别为用户真实姓名，用户昵称
		 String sql = "select shopId,shopName,belongsAcademy,academyName,shopUserId,shopUserName,userName," +
		 		"shopAdress,shopDesc,shopReform,shopImg,shopTel,shopCreateTime,shopState," +
		 		"shopStatus from shops,academy_map,user where shops.belongsAcademy=academy_map.academyFlag" +
		 		" and shops.shopUserId=user.userId and shops.shopId=?";
		 return jdbcTemplate.queryForList(sql,shopId);
	 }
	 //修改店铺基本信息
	 public int updateShopBasicInfo(String sql){
         return jdbcTemplate.update(sql);
	 }
	 
	 //查询指定院系的所有店铺(销量降序排序)
	 public PageUtil queryAllShopsByAcademy(String belongsAcademy,int currentPage,int numPerPage){
		 String sql="select shopId,shopName,shopImg,shopUserId,userName," +
		 		"shopAdress,shopDesc from shops,user " +
		 		"where user.userId=shops.shopUserId " +
		 		"and shops.belongsAcademy='"+belongsAcademy+"'";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil; 
	 }
	 
	//查询所有店铺(销量降序)
	 public PageUtil queryAllShops(int currentPage,int numPerPage){
		 String sql="select shopId,shopName,shopImg,shopUserId,userName," +
		 		"shopAdress,shopDesc,shopAllSaleNum from shops,user " +
		 		"where user.userId=shops.shopUserId order by shopAllSaleNum desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil; 
	 }
		 
	 //按照降序查询店铺中商品的部分信息（店铺浏览时的特殊显示）
	 public List<Map<String, Object>> getHeadSale(int shopId){
		 String sql="select goodsId,goodsPrice,goodsImg,goodsTitle from shops,goods " +
		 		"where shops.shopId=goods.shopId and shops.shopId=? order by goods.goodsSaleNum desc";
		 return jdbcTemplate.queryForList(sql, shopId);
	 }
	 //通过店铺id获取店铺的商品总数、销量信息
	 public List<Map<String, Object>> getShopGoodsNumAndSaleNum(int shopId){
		 String sql="select (ifnull((select sum(goodsNum) from goods where shopId=?),0)) as allGoodsNum," +
		 		"(ifnull((select sum(goodsSaleNum) from goods where shopId=?),0))as allGoodsSaleNum";
		 return jdbcTemplate.queryForList(sql, shopId,shopId);
	 }
}
