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
	 //查询购物车信息中某件商品
	 public List<Map<String, Object>> queryCarInfo(int goodsId){
		String sql="select *from goods_car where goodsId=?";
		return jdbcTemplate.queryForList(sql, goodsId);
	 }
	 //添加购物车信息
	 public int addGoods(GoodsCar goodsCar){
		String sql="insert into goods_car(userId,goodsId,theGoodsNum) values(?,?,?)";
		return jdbcTemplate.update(sql, goodsCar.getUserId(),goodsCar.getGoodsId(),goodsCar.getTheGoodsNum());
	 }
	 //修改购物车信息中的商品数量(在原来基础上修改)
	 public int updateCarInfo(int goodsId,int updateNum){
		 String sql="update goods_car set theGoodsNum=theGoodsNum+? where goodsId=?";
		 return jdbcTemplate.update(sql,updateNum,goodsId);
	 }
	 //修改购物车信息中的商品数量(直接覆盖)
	 public int updateCarInfoNowNum(int goodsId,int theNum){
		 String sql="update goods_car set theGoodsNum=? where goodsId=?";
		 return jdbcTemplate.update(sql,theNum,goodsId);
	 }
	 //删除购物车指定商品信息
	 public int deleteCarInfo(int goodsId){
		 String sql="delete from goods_car where goodsId=?";
		 return jdbcTemplate.update(sql,goodsId);
	 }
	 
	 //查询用户购物车所有商品信息
	 public PageUtil queryAllCarGoods(int currentPage,int numPerPage,int userId){
		 String sql="select goods_car.goodsId,theGoodsNum,goodsNum,goodsTitle,goodsImg,goodsStruct," +
		 		"goodsPrice,goods.shopId,shopName from goods_car,goods,shops where " +
		 		"goods_car.goodsId = goods.goodsId and goods.shopId = shops.shopId and goods_car.userId="+userId;
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 //核实库存是否满足购物车内数量
		 List<Map<String, Object>> list = pageUtil.getResultList();
		 for(int i=0;i<list.size();i++){
			 Map<String, Object> infoMap = list.get(i);
			 int theGoodsNumInCar = (Integer) infoMap.get("theGoodsNum");//购物车该商品数量
			 int goodsNum = (Integer) infoMap.get("goodsNum");//店铺该商品数量
			 int goodsId = (Integer) infoMap.get("goodsId");
			 //System.out.println("goodsNum:"+goodsNum+"  theGoodsNumInCar:"+theGoodsNumInCar);
			 if(theGoodsNumInCar>goodsNum){
				 //该商品在购物车内数量大于店铺库存
				 //取店商品最大数给购物车
				 infoMap.put("theGoodsNum", goodsNum);
				 //同时更新购物车中数据
				 updateCarInfoNowNum(goodsId,goodsNum);
			 }
		 }
		 return pageUtil;
	 }
	 
	 //查询购物车中选择下单商品的详细信息
	 public List<Map<String, Object>> querySelectGoods(int goodsId){
		 String sql = "select goods_car.goodsId,theGoodsNum,goodsNum,goodsTitle," +
					"goodsImg,goodsStruct,goodsPrice,goods.shopId,shopName from goods_car,goods,shops " +
					"where goods_car.goodsId = goods.goodsId and goods.shopId = shops.shopId and goods_car.goodsId=?";
		 return jdbcTemplate.queryForList(sql, goodsId);
	 }
}
