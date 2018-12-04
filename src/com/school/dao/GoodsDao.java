package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.marketbeans.Goods;
import com.school.utils.PageUtil;

@Repository
public class GoodsDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //�����Ʒ��Ϣ
	 public int addGoods(Goods goods){
		 String sql="insert into goods(goodsTitle,goodsName,goodsImg,goodsPrice,goodsStruct,goodsNum,goodsSaleNum,goodsDetail," +
		 		"shopId,classifyOne,classifyTwo) values(?,?,?,?,?,?,?,?,?,?,?)";
		 return jdbcTemplate.update(sql, goods.getGoodsTitle(),goods.getGoodsName(),goods.getGoodsImg(),
				 goods.getGoodsPrice(),goods.getGoodsStruct(),goods.getGoodsNum(),0,goods.getGoodsDetail(),goods.getShopId(),
				 goods.getClassifyOne(),goods.getClassifyTwo());
	 }
	 //ͨ������id��ѯ����������Ʒ
	 public PageUtil queryShopAllGoods(int currentPage,int numPerPage,int shopId){
		String sql="select *from goods as a,classify_map as b where a.classifyOne=b.classifyOneFlag" +
			 		" and a.classifyTwo=b.classifyTwoFlag and a.shopId="+shopId;
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //��ѯ��Ʒ��Ϣ
	 public List<Map<String, Object>> queryGoods(int goodsId){
		 String sql="select *from goods as a,classify_map as b,(select shopId,shopName,shopUserId,shopAdress from shops) as c where a.classifyOne=b.classifyOneFlag" +
				 	" and a.classifyTwo=b.classifyTwoFlag and a.shopId=c.shopId and a.goodsId=?";
		 return jdbcTemplate.queryForList(sql,goodsId);
	 }
	 //��ѯ��Ʒ��ǰ����
	 public int queryOneGoodsNum(int goodsId){
		 String sql="select goodsNum from goods where goodsId=?";
	     Map<String, Object> result = jdbcTemplate.queryForMap(sql,goodsId);
		 Integer theGoodsNum = (Integer) result.get("goodsNum");
		 return theGoodsNum;
	 }
	 //like��ѯ��Ʒ��Ϣ
	 public PageUtil queryGoods(String searchText,int currentPage,int numPerPage){
		 String sql="select goodsId,goodsTitle,goodsPrice,goodsImg,goodsSaleNum,goods.shopId,shopName from goods,shops " +
		 		"where shops.shopId = goods.shopId and goodsName like '%"+searchText+"%'"+" order by goodsSaleNum desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //ͨ����Ʒ�����ȡ������Ʒ
	 public PageUtil searchGoodsByClassify(String sql,int currentPage,int numPerPage){
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil; 
	 }
	 //��ѯ������Ʒ(������������)
	 public PageUtil searchAllGoods(int currentPage,int numPerPage){
		 String sql="select goodsId,goodsTitle,goodsPrice,goodsImg,goods.shopId,shopName,goodsSaleNum from goods,shops " +
			 		"where shops.shopId = goods.shopId order by goodsSaleNum desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil; 
	 }
	 //�޸���Ʒ��Ϣ
	 public int updateGoods(String sql){
		 return jdbcTemplate.update(sql);
	 }
	 
	 //ɾ����Ʒ��Ϣ
	 public int deleteGoods(int goodsId){
		 String sql="delete from goods where goodsId=?";
		 return jdbcTemplate.update(sql, goodsId);
	 }
	 //�޸���Ʒ������������
	 public int updateGoods(int goodsId,int updateNum){
		 //updateNumΪ�޸���
		 String sql="update goods set goodsNum=goodsNum-?,goodsSaleNum=goodsSaleNum+? where goodsId=?";
		 return jdbcTemplate.update(sql, updateNum,updateNum,goodsId);		 
	 }
}
