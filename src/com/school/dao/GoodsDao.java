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
	 //添加商品信息
	 public int addGoods(Goods goods){
		 String sql="insert into goods(goodsTitle,goodsName,goodsImg,goodsPrice,goodsStruct,goodsNum,goodsSaleNum,goodsDetail," +
		 		"shopId,classifyOne,classifyTwo) values(?,?,?,?,?,?,?,?,?,?,?)";
		 return jdbcTemplate.update(sql, goods.getGoodsTitle(),goods.getGoodsName(),goods.getGoodsImg(),
				 goods.getGoodsPrice(),goods.getGoodsStruct(),goods.getGoodsNum(),0,goods.getGoodsDetail(),goods.getShopId(),
				 goods.getClassifyOne(),goods.getClassifyTwo());
	 }
	 //通过店铺id查询本店所有商品
	 public PageUtil queryShopAllGoods(int currentPage,int numPerPage,int shopId){
		String sql="select *from goods as a,classify_map as b where a.classifyOne=b.classifyOneFlag" +
			 		" and a.classifyTwo=b.classifyTwoFlag and a.shopId="+shopId;
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //查询商品信息
	 public List<Map<String, Object>> queryGoods(int goodsId){
		 String sql="select *from goods as a,classify_map as b,(select shopId,shopName,shopUserId,shopAdress from shops) as c where a.classifyOne=b.classifyOneFlag" +
				 	" and a.classifyTwo=b.classifyTwoFlag and a.shopId=c.shopId and a.goodsId=?";
		 return jdbcTemplate.queryForList(sql,goodsId);
	 }
	 //查询商品当前数量
	 public int queryOneGoodsNum(int goodsId){
		 String sql="select goodsNum from goods where goodsId=?";
	     Map<String, Object> result = jdbcTemplate.queryForMap(sql,goodsId);
		 Integer theGoodsNum = (Integer) result.get("goodsNum");
		 return theGoodsNum;
	 }
	 //like查询商品信息
	 public PageUtil queryGoods(String searchText,int currentPage,int numPerPage){
		 String sql="select goodsId,goodsTitle,goodsPrice,goodsImg,goodsSaleNum,goods.shopId,shopName from goods,shops " +
		 		"where shops.shopId = goods.shopId and goodsName like '%"+searchText+"%'"+" order by goodsSaleNum desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //通过商品分类获取所有商品
	 public PageUtil searchGoodsByClassify(String sql,int currentPage,int numPerPage){
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil; 
	 }
	 //查询所有商品(根据销量降序)
	 public PageUtil searchAllGoods(int currentPage,int numPerPage){
		 String sql="select goodsId,goodsTitle,goodsPrice,goodsImg,goods.shopId,shopName,goodsSaleNum from goods,shops " +
			 		"where shops.shopId = goods.shopId order by goodsSaleNum desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil; 
	 }
	 //修改商品信息
	 public int updateGoods(String sql){
		 return jdbcTemplate.update(sql);
	 }
	 
	 //删除商品信息
	 public int deleteGoods(int goodsId){
		 String sql="delete from goods where goodsId=?";
		 return jdbcTemplate.update(sql, goodsId);
	 }
	 //修改商品数量和销售量
	 public int updateGoods(int goodsId,int updateNum){
		 //updateNum为修改量
		 String sql="update goods set goodsNum=goodsNum-?,goodsSaleNum=goodsSaleNum+? where goodsId=?";
		 return jdbcTemplate.update(sql, updateNum,updateNum,goodsId);		 
	 }
}
