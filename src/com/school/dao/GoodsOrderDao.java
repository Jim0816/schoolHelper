package com.school.dao;


import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.marketbeans.GoodsOrder;
import com.school.utils.PageUtil;

@Repository
public class GoodsOrderDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //通过店铺id查询店铺的所有订单信息
	 public PageUtil queryShopAllGoodsOrderInfoByShop(int currentPage,int numPerPage,int shopId){
		 String sql="select orderId,goods_order.goodsId,goods_order.userId,receiveName,receiveTel," +
		 		"receiveAddress,receiveRemark,price,theGoodsNum,operateTime,orderMoney,orderState," +
		 		"goodsTitle,goodsImg,goodsStruct,shops.shopId,shopName,userName from goods_order," +
		 		"goods,user,shops where goods_order.goodsId=goods.goodsId and goods_order.userId=user.userId" +
		 		" and goods.shopId=shops.shopId and goods.shopId="+shopId+" order by operateTime desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //通过用户id查询该用户的订单信息
	 public PageUtil queryShopAllGoodsOrderInfoByUser(int currentPage,int numPerPage,int userId){
		 String sql="select orderId,goods_order.goodsId,goods_order.userId,receiveName,receiveTel," +
		 		"receiveAddress,receiveRemark,price,theGoodsNum,operateTime,orderMoney,orderState," +
		 		"goodsTitle,goodsImg,goodsStruct,shops.shopId,shopName,userName from goods_order," +
		 		"goods,user,shops where goods_order.goodsId=goods.goodsId and goods_order.userId=user.userId" +
		 		" and goods.shopId=shops.shopId and goods_order.userId="+userId+" order by operateTime desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //增加商品订单信息
	 public int addGoodsOrderInfo(GoodsOrder goodsOrder){
		 String state="0";//默认交易订单开始状态为0
		 String sql="insert into goods_order(goodsId,userId,receiveName,receiveTel,receiveAddress,receiveRemark," +
		 		"price,theGoodsNum,orderMoney,orderState) values(?,?,?,?,?,?,?,?,?,?)";
		 return jdbcTemplate.update(sql,goodsOrder.getGoodsId(),goodsOrder.getUserId(),
				 goodsOrder.getReceiveName(),goodsOrder.getReceiveTel(),goodsOrder.getReceiveAddress(),
				 goodsOrder.getReceiveRemark(),goodsOrder.getPrice(),goodsOrder.getTheGoodsNum(),
				 goodsOrder.getOrderMoney(),state);
	 }
	 //修改订单交易状态
	 public int updateGoodsOrderState(int orderId,String state){
		 String sql="update goods_order set orderState=? where orderId=?";
		 return jdbcTemplate.update(sql, state,orderId);
	 }
	 
}
