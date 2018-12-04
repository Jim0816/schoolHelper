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
	 //ͨ������id��ѯ���̵����ж�����Ϣ
	 public PageUtil queryShopAllGoodsOrderInfoByShop(int currentPage,int numPerPage,int shopId){
		 String sql="select orderId,goods_order.goodsId,goods_order.userId,receiveName,receiveTel," +
		 		"receiveAddress,receiveRemark,price,theGoodsNum,operateTime,orderMoney,orderState," +
		 		"goodsTitle,goodsImg,goodsStruct,shops.shopId,shopName,userName from goods_order," +
		 		"goods,user,shops where goods_order.goodsId=goods.goodsId and goods_order.userId=user.userId" +
		 		" and goods.shopId=shops.shopId and goods.shopId="+shopId+" order by operateTime desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //ͨ���û�id��ѯ���û��Ķ�����Ϣ
	 public PageUtil queryShopAllGoodsOrderInfoByUser(int currentPage,int numPerPage,int userId){
		 String sql="select orderId,goods_order.goodsId,goods_order.userId,receiveName,receiveTel," +
		 		"receiveAddress,receiveRemark,price,theGoodsNum,operateTime,orderMoney,orderState," +
		 		"goodsTitle,goodsImg,goodsStruct,shops.shopId,shopName,userName from goods_order," +
		 		"goods,user,shops where goods_order.goodsId=goods.goodsId and goods_order.userId=user.userId" +
		 		" and goods.shopId=shops.shopId and goods_order.userId="+userId+" order by operateTime desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //������Ʒ������Ϣ
	 public int addGoodsOrderInfo(GoodsOrder goodsOrder){
		 String state="0";//Ĭ�Ͻ��׶�����ʼ״̬Ϊ0
		 String sql="insert into goods_order(goodsId,userId,receiveName,receiveTel,receiveAddress,receiveRemark," +
		 		"price,theGoodsNum,orderMoney,orderState) values(?,?,?,?,?,?,?,?,?,?)";
		 return jdbcTemplate.update(sql,goodsOrder.getGoodsId(),goodsOrder.getUserId(),
				 goodsOrder.getReceiveName(),goodsOrder.getReceiveTel(),goodsOrder.getReceiveAddress(),
				 goodsOrder.getReceiveRemark(),goodsOrder.getPrice(),goodsOrder.getTheGoodsNum(),
				 goodsOrder.getOrderMoney(),state);
	 }
	 //�޸Ķ�������״̬
	 public int updateGoodsOrderState(int orderId,String state){
		 String sql="update goods_order set orderState=? where orderId=?";
		 return jdbcTemplate.update(sql, state,orderId);
	 }
	 
}
