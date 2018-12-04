package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.Query;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.marketbeans.GoodsCar;
import com.school.utils.PageUtil;
@Repository
public class GoodsCarDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //��ѯ���ﳵ��Ϣ��ĳ����Ʒ
	 public List<Map<String, Object>> queryCarInfo(int goodsId){
		String sql="select *from goods_car where goodsId=?";
		return jdbcTemplate.queryForList(sql, goodsId);
	 }
	 //��ӹ��ﳵ��Ϣ
	 public int addGoods(GoodsCar goodsCar){
		String sql="insert into goods_car(userId,goodsId,theGoodsNum) values(?,?,?)";
		return jdbcTemplate.update(sql, goodsCar.getUserId(),goodsCar.getGoodsId(),goodsCar.getTheGoodsNum());
	 }
	 //�޸Ĺ��ﳵ��Ϣ�е���Ʒ����(��ԭ���������޸�)
	 public int updateCarInfo(int goodsId,int updateNum){
		 String sql="update goods_car set theGoodsNum=theGoodsNum+? where goodsId=?";
		 return jdbcTemplate.update(sql,updateNum,goodsId);
	 }
	 //�޸Ĺ��ﳵ��Ϣ�е���Ʒ����(ֱ�Ӹ���)
	 public int updateCarInfoNowNum(int goodsId,int theNum){
		 String sql="update goods_car set theGoodsNum=? where goodsId=?";
		 return jdbcTemplate.update(sql,theNum,goodsId);
	 }
	 //ɾ�����ﳵָ����Ʒ��Ϣ
	 public int deleteCarInfo(int goodsId){
		 String sql="delete from goods_car where goodsId=?";
		 return jdbcTemplate.update(sql,goodsId);
	 }
	 
	 //��ѯ�û����ﳵ������Ʒ��Ϣ
	 public PageUtil queryAllCarGoods(int currentPage,int numPerPage,int userId){
		 String sql="select goods_car.goodsId,theGoodsNum,goodsNum,goodsTitle,goodsImg,goodsStruct," +
		 		"goodsPrice,goods.shopId,shopName from goods_car,goods,shops where " +
		 		"goods_car.goodsId = goods.goodsId and goods.shopId = shops.shopId and goods_car.userId="+userId;
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 //��ʵ����Ƿ����㹺�ﳵ������
		 List<Map<String, Object>> list = pageUtil.getResultList();
		 for(int i=0;i<list.size();i++){
			 Map<String, Object> infoMap = list.get(i);
			 int theGoodsNumInCar = (Integer) infoMap.get("theGoodsNum");//���ﳵ����Ʒ����
			 int goodsNum = (Integer) infoMap.get("goodsNum");//���̸���Ʒ����
			 int goodsId = (Integer) infoMap.get("goodsId");
			 //System.out.println("goodsNum:"+goodsNum+"  theGoodsNumInCar:"+theGoodsNumInCar);
			 if(theGoodsNumInCar>goodsNum){
				 //����Ʒ�ڹ��ﳵ���������ڵ��̿��
				 //ȡ����Ʒ����������ﳵ
				 infoMap.put("theGoodsNum", goodsNum);
				 //ͬʱ���¹��ﳵ������
				 updateCarInfoNowNum(goodsId,goodsNum);
			 }
		 }
		 return pageUtil;
	 }
	 
	 //��ѯ���ﳵ��ѡ���µ���Ʒ����ϸ��Ϣ
	 public List<Map<String, Object>> querySelectGoods(int goodsId){
		 String sql = "select goods_car.goodsId,theGoodsNum,goodsNum,goodsTitle," +
					"goodsImg,goodsStruct,goodsPrice,goods.shopId,shopName from goods_car,goods,shops " +
					"where goods_car.goodsId = goods.goodsId and goods.shopId = shops.shopId and goods_car.goodsId=?";
		 return jdbcTemplate.queryForList(sql, goodsId);
	 }
}
