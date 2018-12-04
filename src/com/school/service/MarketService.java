package com.school.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.ejb.criteria.expression.function.LengthFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.context.Theme;
import org.springframework.web.multipart.MultipartFile;

import com.school.dao.AdvertisementDao;
import com.school.dao.GoodsAdvInfo;
import com.school.dao.GoodsCarDao;
import com.school.dao.GoodsDao;
import com.school.dao.GoodsOrderDao;
import com.school.dao.PartTimeJobDao;
import com.school.dao.ShopAdvInfo;
import com.school.dao.ShopApplyDao;
import com.school.dao.ShopDao;
import com.school.domain.marketbeans.Goods;
import com.school.domain.marketbeans.GoodsCar;
import com.school.domain.marketbeans.GoodsOrder;
import com.school.domain.marketbeans.ShopApplyInfo;
import com.school.domain.marketbeans.ShopInfo;
import com.school.utils.PageUtil;
import com.school.utils.TransformPrice;
import com.school.utils.uploadUtils;
@Service
public class MarketService {
	@Autowired
	private AdvertisementDao advertisementDao;
	@Autowired
	private PartTimeJobDao partTimeJobDao;
	@Autowired
	private ShopApplyDao shopApplyDao;
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private GoodsOrderDao goodsOrderDao;
	@Autowired
	private GoodsCarDao goodsCarDao;
	@Autowired
	private GoodsAdvInfo goodsAdvInfo;
	@Autowired
	private ShopAdvInfo shopAdvInfo;
	//得到最新广告信息
	public List<Map<String, Object>> getAdvertisement(){
		List<Map<String, Object>> advList = advertisementDao.getAdvInfo();
		return advList;
	}	
	
	//得到最新兼职信息(控制在12条以内)
	public List<Map<String, Object>> ParttimeJob(){
		List<Map<String, Object>> jobList = partTimeJobDao.selectEndTwelve();
		return jobList;
	}	
	//得到商城商品广告信息
	public PageUtil getGoodsAdvInfo(int currentPage,int numPerPage){
		return goodsAdvInfo.queryAllGoodsAdvInfo(currentPage, numPerPage);
	}
	//得到商城商品广告信息
	public PageUtil getShopAdvInfo(int currentPage,int numPerPage){
		return shopAdvInfo.queryAllShopAdvInfo(currentPage, numPerPage);
	}
	//查询店铺的申请信息
	public List<Map<String, Object>> queryShopApplyInfo(int applyUserId){
		return shopApplyDao.queryShopApplyInfo(applyUserId);
	}
	
	//查询用户的店铺信息(店主查看)
	public List<Map<String, Object>> queryShopInfo(int shopUserId){
		return shopDao.queryShopInfoByUser(shopUserId);
	}
	//查看店铺信息（买家查看）
	public Map<String,Object> queryShopInfoByShopIdForBuyer(int shopId){
		//查询店铺基本信息
		Map<String,Object> oneShopMap = new HashMap<String,Object>();
		
		Map<String, Object> shopInfoForBuyer = shopDao.queryShopInfoForbuyer(shopId).get(0);
		List<Map<String, Object>> shopTopSaleGoods = shopDao.getHeadSale(shopId);
		oneShopMap.put("shopInfoForBuyer",shopInfoForBuyer);
		oneShopMap.put("shopTopSaleGoods",shopTopSaleGoods);
		return oneShopMap;
	}
	//查询指定院校的所有店铺
	public PageUtil getAllShopInfoByAcademy(String belongsAcademy,int currentPage,int numPerPage){
		PageUtil pageUtil = shopDao.queryAllShopsByAcademy(belongsAcademy, currentPage, numPerPage);
		for(int i=0;i<pageUtil.getResultList().size();i++){
			Map<String,Object> oneMap = pageUtil.getResultList().get(i);
			int shopId = (Integer) oneMap.get("shopId");
			//放入店铺销量和库存信息
			Map<String, Object> shopGoodsNumAndSaleNum = shopDao.getShopGoodsNumAndSaleNum(shopId).get(0);
			Object allGoodsNum = (Object) shopGoodsNumAndSaleNum.get("allGoodsNum");
			Object allGoodsSaleNum = (Object) shopGoodsNumAndSaleNum.get("allGoodsSaleNum");
			oneMap.put("allGoodsNum", allGoodsNum.toString());
			oneMap.put("allGoodsSaleNum", allGoodsSaleNum.toString());
			//放入热销商品信息
			List<Map<String, Object>> goodsPartInfoList = shopDao.getHeadSale(shopId);
			oneMap.put("goodsPartInfoList",goodsPartInfoList);
		}
		return pageUtil;
	}
	//查询所有店铺信息(降序)
	public PageUtil getAllShopInfo(int currentPage,int numPerPage){
		return shopDao.queryAllShops(currentPage, numPerPage);
	}
	//添加店铺申请信息
	@Transactional
	public int addShopApplyInfo(ShopApplyInfo shopApplyInfo,MultipartFile img){
		int result = 0;
		try {
			String imgUrl = uploadUtils.dealSimplePhoto("F:\\WebProject\\shopApply\\","shopApply",shopApplyInfo.getApplyUserId(), img);
			shopApplyInfo.setApplyImg(imgUrl);
			result = shopApplyDao.addShopApplyInfo(shopApplyInfo);
		} catch (Exception e) {
			System.out.println("申请店铺信息提交失败");
		}
		return result;
	}
	//添加商品信息
	@Transactional
	public int addGoods(Goods goods,MultipartFile img[]){
		String fileName = "F:\\WebProject\\shop\\"+goods.getShopId();//以发布信息者id标识图片
		File myFile = new File(fileName);
		if(!myFile.exists()){
			myFile.mkdir();
		}
		String allImgsUrl = uploadUtils.dealSomePhoto("F:\\WebProject\\shop\\"+goods.getShopId()+"\\", "shop/"+goods.getShopId(),goods.getShopId(),img);
		goods.setGoodsImg(allImgsUrl);
		return goodsDao.addGoods(goods);
	}
	//修改商品信息
	@Transactional
	public int updateGoods(Goods goods,MultipartFile img[],Goods oldGoods){
		//两个Goods类型对比，对比后得到修改sql语句 
		int flag = 0;//默认不修改
		int result = 0;//返回结果
		StringBuffer sql = new StringBuffer("update goods set");
		//商品标题
		if(!goods.getGoodsTitle().equals(oldGoods.getGoodsTitle())){
			 sql.append(" goodsTitle='"+goods.getGoodsTitle()+"'");
			 flag = 1;
		 }
		//商品名字
		 if(!goods.getGoodsName().equals(oldGoods.getGoodsName())){
			 if(flag==0){
				 sql.append(" goodsName='"+goods.getGoodsName()+"'");
			 }else{
				 sql.append(",goodsName='"+goods.getGoodsName()+"'"); 
			 }
			 flag = 1; 
		 }
		//商品图片路径
		 if(!goods.getGoodsImg().equals(oldGoods.getGoodsImg())){
			//得到修改后图片的所有路径
			String fileName = "F:\\WebProject\\shop\\"+oldGoods.getShopId();//以发布信息者id标识图片
			File myFile = new File(fileName);
			if(!myFile.exists()){
			   myFile.mkdir();
			}
			String allImgsUrl = uploadUtils.dealSomePhoto("F:\\WebProject\\shop\\"+oldGoods.getShopId()+"\\", "shop/"+oldGoods.getShopId(),oldGoods.getShopId(),img);
			if(flag==0){
				sql.append(" goodsImg='"+allImgsUrl+"'");
			}else{
				sql.append(",goodsImg='"+allImgsUrl+"'");
			}
			flag = 1;
		  }
		//商品价格
		 if(!goods.getGoodsPrice().equals(oldGoods.getGoodsPrice())){
			 if(flag==0){
				 sql.append(" goodsPrice='"+goods.getGoodsPrice()+"'");
			 }else{
				 sql.append(",goodsPrice='"+goods.getGoodsPrice()+"'"); 
			 }
			 flag = 1; 
		 }
		//商品规格
		 if(!goods.getGoodsStruct().equals(oldGoods.getGoodsStruct())){
			 if(flag==0){
				 sql.append(" goodsStruct='"+goods.getGoodsStruct()+"'");
			 }else{
				 sql.append(",goodsStruct='"+goods.getGoodsStruct()+"'");
			 }
		     flag = 1;
			 }
		//商品数量 
		 if(goods.getGoodsNum()!=oldGoods.getGoodsNum()){
			 if(flag==0){
				 sql.append(" goodsNum="+goods.getGoodsNum()); 
			 }else{
				 sql.append(",goodsNum="+goods.getGoodsNum()); 
			 }
			 flag = 1; 
		 }
		//商品描述
		 if(oldGoods.getGoodsDetail()==null){
			 if(!goods.getGoodsDetail().equals("")){
				 if(flag==0){
					 sql.append(" goodsDetail='"+goods.getGoodsDetail()+"'");
				 }else{
					 sql.append(",goodsDetail='"+goods.getGoodsDetail()+"'");
				 }
				 flag = 1;
			 }
		 }else{
			 if(!goods.getGoodsDetail().equals(oldGoods.getGoodsDetail())){
				 if(flag==0){
					 sql.append(" goodsDetail='"+goods.getGoodsDetail()+"'");
				 }else{
					 sql.append(",goodsDetail='"+goods.getGoodsDetail()+"'");
				 }
				 flag = 1;
		    }
		 }
		//一级类别
		 if(!goods.getClassifyOne().equals(oldGoods.getClassifyOne())){
			 if(flag==0){
				 sql.append(" classifyOne='"+goods.getClassifyOne()+"'");
			 }else{
				 sql.append(",classifyOne='"+goods.getClassifyOne()+"'");
			 }
			 flag = 1;	 
		 }
		//二级类别
		 if(!goods.getClassifyTwo().equals(oldGoods.getClassifyTwo())){
			 if(flag==0){
				 sql.append(" classifyTwo='"+goods.getClassifyTwo()+"'");
			 }else{
				 sql.append(",classifyTwo='"+goods.getClassifyTwo()+"'"); 
			 }
			 flag = 1; 
		 }
		 sql.append(" where goodsId="+oldGoods.getGoodsId());
		 if(flag==0){
			 //无修改动作
			 result = 0;
			 System.out.println("店主未进行修改");
		 }else{
			 //进行数据库修改
			 System.out.println("店主修改商品语句:"+sql.toString());
			 result = goodsDao.updateGoods(sql.toString());
		 }
		 return result;
	}
	
	//修改商品的库存和销售量(单件商品)
	@Transactional
	public synchronized int updateGoods(int goodsId,int buyNum){
		//buyNum为正数表示购物，负数表示退货
		int result = 1;//默认成功
		//修改前必须先判断商品数量是否满足
		int nowTheGoodsNum = goodsDao.queryOneGoodsNum(goodsId);//该当前商品库存
		if(buyNum>nowTheGoodsNum){
			//商品不足
			result = 0;
			System.out.println("商品不足，无法购买");
		}else{
			//进行购买，修改商品数量
			goodsDao.updateGoods(goodsId,buyNum);
		}
		return result;	
	}
	//修改商品的库存和销售量(多件商品)
	@Transactional
	public synchronized int updateGoods(List<Map<String, Object>> waitOrder){
		int result = 1;//默认修改成功
		//修改前必须先判断商品数量是否满足
		for(int i=0;i<waitOrder.size();i++){
			//添加到订单表
			Map<String, Object> map = waitOrder.get(i);
			int goodsId = (Integer)map.get("goodsId");
			int nowTheGoodsNum = goodsDao.queryOneGoodsNum(goodsId);//该当前商品库存
			int theGoodsNum = (Integer) map.get("theGoodsNum");
			if(theGoodsNum>nowTheGoodsNum){
				//库存不足，无法购买
				result = 0;
				System.out.println("商品不足，无法购买");
				try {
					int error = 10/0;//产生异常，导致事务回滚
				} catch (RuntimeException e) {
					//e.printStackTrace();
				}
				break;//跳出循环
			}else{
				//进行购买，修改商品数量
				goodsDao.updateGoods(goodsId,theGoodsNum);
			}	
		}
		return result;
	}
	//删除多个指定商品(店铺中商品)
	@Transactional
	public int deleteSomeGoods(int goodsId[]){
		int result = 1;//默认操作成功
		try{
			for(int i=0;i<goodsId.length;i++){
				goodsDao.deleteGoods(goodsId[i]);
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//删除多个指定商品(购物车中商品)
	@Transactional
	public int deleteCarGoods(int goodsId[]){
		int result = 1;//默认操作成功
		try{
			for(int i=0;i<goodsId.length;i++){
				goodsCarDao.deleteCarInfo(goodsId[i]);
			}
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//删除多个指定商品(购物车中商品)
	@Transactional
	public int deleteCarGoods(List<Map<String, Object>> waitOrder){
		int result = 1;//默认操作成功
		try{
			for(int i=0;i<waitOrder.size();i++){
				goodsCarDao.deleteCarInfo((Integer)waitOrder.get(i).get("goodsId"));
			}
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//搜索商品(通过搜索栏字段)
	public PageUtil searchGoods(String searchText,int currentPage,int numPerPage){
		return goodsDao.queryGoods(searchText,currentPage,numPerPage);
	}
	//查询所有商品(销量降序排列)
	public PageUtil searchGoods(int currentPage,int numPerPage){
		return goodsDao.searchAllGoods(currentPage, numPerPage);
	}
	//通过商品分类获取所有商品
	public PageUtil getClassifyGoodsInfo(String classifyOne,String classifyTwo,int currentPage,int numPerPage){
		int flag=0;
		PageUtil pageUtil = null;
		StringBuffer sql = new StringBuffer("select goodsId,goodsTitle,goodsPrice,goodsImg,goodsSaleNum,classifyOne," +
				"classifyTwo,goods.shopId,shopName from goods,shops where shops.shopId = goods.shopId and ");
		//这里的分类参数保证不全为空
		//一级分类
		if(classifyOne!=null){
			if(!classifyOne.equals("")){
				sql.append("classifyOne='"+classifyOne+"' ");
				flag = 1;
			}
		}
		//二级分类
        if(classifyTwo!=null){
            if(!classifyTwo.equals("")){
				if(flag==0){
					sql.append("classifyTwo='"+classifyTwo+"'");
				}else{
					sql.append("and classifyTwo='"+classifyTwo+"'");
				}
				flag = 1;
			}
		}
       
        if(flag==1){
        	//查询分类商品语句合法
        	sql.append(" order by goodsSaleNum desc");
        	System.out.println("查询分类商品语句"+sql.toString());
        	pageUtil = goodsDao.searchGoodsByClassify(sql.toString(), currentPage, numPerPage);
        }else{
        	//查询分类商品语句不合法
        	System.out.println("查询分类商品语句不合法");
        }
        return pageUtil;
	}
	//查询某件商品信息
	public Goods getOneGoodsInfo(int goodsId){
		Goods goods = new Goods();
		List<Map<String, Object>> goodsList = goodsDao.queryGoods(goodsId);//只有一行
		goods.setGoodsId((Integer)goodsList.get(0).get("goodsId"));
		goods.setGoodsTitle((String)goodsList.get(0).get("goodsTitle"));
		goods.setGoodsName((String)goodsList.get(0).get("goodsName"));
		goods.setGoodsImg((String)goodsList.get(0).get("goodsImg"));
		goods.setGoodsPrice((String)goodsList.get(0).get("goodsPrice"));
		goods.setGoodsStruct((String)goodsList.get(0).get("goodsStruct"));
		goods.setGoodsNum((Integer)goodsList.get(0).get("goodsNum"));
		goods.setGoodsSaleNum((Integer)goodsList.get(0).get("goodsSaleNum"));
		goods.setGoodsDetail((String)goodsList.get(0).get("goodsDetail"));
		goods.setGoodsSaleTime((Timestamp)goodsList.get(0).get("goodsSaleTime"));
		goods.setVisitNum((Integer)goodsList.get(0).get("visitNum"));
		goods.setShopId((Integer)goodsList.get(0).get("shopId"));
		goods.setShopName((String)goodsList.get(0).get("shopName"));
		goods.setShopUserId((Integer)goodsList.get(0).get("shopUserId"));
		goods.setShopAdress((String)goodsList.get(0).get("shopAdress"));
		goods.setClassifyOne((String)goodsList.get(0).get("classifyOne"));
		goods.setClassifyTwo((String)goodsList.get(0).get("classifyTwo"));
		goods.setClassifyOneName((String)goodsList.get(0).get("classifyOneName"));
		goods.setClassifyTwoName((String)goodsList.get(0).get("classifyTwoName"));
		return goods;
	}
	//通过店铺id查询店铺所有信息
	/*
	 * 店铺信息：1、该店的所有商品信息    2、该店的商品订单信息  3、该店的店铺信息
	 * 
	 */
	//获取店铺所有商品信息
	public  PageUtil getShopGoods(int currentPage,int numPerPage,int shopId){
		return goodsDao.queryShopAllGoods(currentPage, numPerPage, shopId);
	}
	//获取该店的所有商品订单信息
	public  PageUtil getShopGoodsOrder(int currentPage,int numPerPage,int shopId){
		return goodsOrderDao.queryShopAllGoodsOrderInfoByShop(currentPage, numPerPage, shopId);
	}
	//获取该店的店铺信息 
	public ShopInfo getShopBasicInfo(int shopId){
		ShopInfo shopInfo = new ShopInfo();
		Map<String, Object> shopInfoMap= shopDao.queryShopInfo(shopId).get(0);
		shopInfo.setShopId(shopId);
		shopInfo.setBelongsAcademy((String)shopInfoMap.get("belongsAcademy"));
		shopInfo.setAcademyName((String)shopInfoMap.get("academyName"));
		shopInfo.setShopUserId((Integer)shopInfoMap.get("shopUserId"));
		shopInfo.setShopUserName((String)shopInfoMap.get("shopUserName"));
		shopInfo.setShopName((String)shopInfoMap.get("shopName"));
		shopInfo.setShopAdress((String)shopInfoMap.get("shopAdress"));
		shopInfo.setShopDesc((String)shopInfoMap.get("shopDesc"));
		shopInfo.setShopReform((String)shopInfoMap.get("shopReform"));
		shopInfo.setShopImg((String)shopInfoMap.get("shopImg"));
		shopInfo.setShopTel((String)shopInfoMap.get("shopTel"));
		shopInfo.setShopCreateTime((Timestamp)shopInfoMap.get("shopCreateTime"));
		shopInfo.setShopState((String)shopInfoMap.get("shopState"));
		shopInfo.setShopStatus((String)shopInfoMap.get("shopStatus"));
		return shopInfo;
	}
	//修改店铺信息
	@Transactional
	public int updateShopBasicInfo(ShopInfo oldShopInfo,ShopInfo newShopInfo,MultipartFile img){
		//两个Goods类型对比，对比后得到修改sql语句 
		int flag = 0;//默认不修改
		int result = 0;//返回结果
		StringBuffer sql = new StringBuffer("update shops set");
		//店铺头像
		if(!oldShopInfo.getShopImg().equals(newShopInfo.getShopImg())){
			//将图片保存到本地
			File myFile = new File("F:\\WebProject\\shopHeadImg");
			if(!myFile.exists()){
			   myFile.mkdir();
			}
			String imgUrl = uploadUtils.dealSimplePhoto("F:\\WebProject\\shopHeadImg\\","shopHeadImg",oldShopInfo.getShopId(), img);
			sql.append(" shopImg='"+imgUrl+"'");
			flag = 1;
		}
		//店铺联系电话
		if(!oldShopInfo.getShopTel().equals(newShopInfo.getShopTel())){
			if(flag==0){
				sql.append(" shopTel='"+newShopInfo.getShopTel()+"'");
			}else{
				sql.append(",shopTel='"+newShopInfo.getShopTel()+"'");
			} 
			flag = 1;
		}
		//店铺名字
		if(!oldShopInfo.getShopName().equals(newShopInfo.getShopName())){
			if(flag==0){
			  sql.append(" shopName='"+newShopInfo.getShopName()+"'");
			}else{
			  sql.append(",shopName='"+newShopInfo.getShopName()+"'");
			}	
			flag = 1;
		}
		//店铺地址
		if(!oldShopInfo.getShopAdress().equals(newShopInfo.getShopAdress())){
			if(flag==0){
				sql.append(" shopAdress='"+newShopInfo.getShopAdress()+"'");
			}else{
				sql.append(",shopAdress='"+newShopInfo.getShopAdress()+"'");
			} 
			flag = 1;
		} 
		//店铺简介
		if(oldShopInfo.getShopDesc()==null){
			if(newShopInfo.getShopDesc().equals("")){
				 if(flag==0){
					sql.append(" shopDesc='"+newShopInfo.getShopDesc()+"'");
				 }else{
					 sql.append(",shopDesc='"+newShopInfo.getShopDesc()+"'"); 
				 }	 
				 flag = 1;
			}
		}else{
			if(!oldShopInfo.getShopDesc().equals(newShopInfo.getShopDesc())){
				 if(flag==0){
					sql.append(" shopDesc='"+newShopInfo.getShopDesc()+"'");
				 }else{
					 sql.append(",shopDesc='"+newShopInfo.getShopDesc()+"'"); 
				 }	 
				 flag = 1;
			} 
		}
		//店铺公告
		if(oldShopInfo.getShopReform()==null){
			if(!newShopInfo.getShopReform().equals("")){
				if(flag==0){ 
				  sql.append(" shopReform='"+newShopInfo.getShopReform()+"'");
				}else{
					sql.append(",shopReform='"+newShopInfo.getShopReform()+"'");
				}	 
				flag = 1;
			}
		}else{
			if(!oldShopInfo.getShopReform().equals(newShopInfo.getShopReform())){
				if(flag==0){ 
				  sql.append(" shopReform='"+newShopInfo.getShopReform()+"'");
				}else{
					sql.append(",shopReform='"+newShopInfo.getShopReform()+"'");
				}	
				flag = 1;
			} 
		}
		//店铺营业状态
		if(!oldShopInfo.getShopState().equals(newShopInfo.getShopState())){
			if(flag==0){ 
				sql.append(" shopState='"+newShopInfo.getShopState()+"'");
			}else{
				sql.append(",shopState='"+newShopInfo.getShopState()+"'");
			} 
			flag = 1;
		} 
		/*//店铺授权状态
		if(!oldShopInfo.getShopStatus().equals(newShopInfo.getShopStatus())){
			 flag = 1;
			 sql.append(",shopStatus='"+newShopInfo.getShopStatus()+"'");
		} */
		sql.append(" where shopId="+oldShopInfo.getShopId());
		 if(flag==0){
			 //无修改动作
			 result = 0;
			 System.out.println("未进行修改店铺基本信息");
		 }else{
			 //进行数据库修改
			 System.out.println("修改店铺基本信息语句:"+sql.toString());
			 result = shopDao.updateShopBasicInfo(sql.toString());
		 }
		return result;
	}
	/*//处理购物逻辑
	@Transactional
	public synchronized int dealBuyGoods(GoodsOrder goodsOrder){
		int flag = 0;//默认购买失败
		//得到购买数量
		int buyNum =  goodsOrder.getTheGoodsNum();
		int goodsId = goodsOrder.getGoodsId();
		//铲鲟商品是否满足购买要求
		int nowTheGoodsNum = goodsDao.queryOneGoodsNum(goodsId);
		if(buyNum>nowTheGoodsNum){
			//商品不足购买
			System.out.println("商品不足，无法购买!");
		}else{
			try {
				//进行购买
				//修改商品信息
				goodsDao.updateGoods(goodsId, -buyNum, +buyNum);//库存减少，销量增加
				//产生商品订单
				goodsOrderDao.addGoodsOrderInfo(goodsOrder);
				flag = 1;
			} catch (Exception e) {
				System.out.println("购买失败");
				e.printStackTrace();
			}
			
		}
		return flag;
	}*/
	
	//添加商品到购物车
	@Transactional
	public int addGoodsToCar(GoodsCar goodsCar){
		int result = 0;//默认添加失败
		//先查询是否有该商品，有则直接增加数量，否则添加新纪录
		try{
			List<Map<String, Object>> theGoods = goodsCarDao.queryCarInfo(goodsCar.getGoodsId());
			if(theGoods.size()>0){
				//表示该商品存在购物车
				goodsCarDao.updateCarInfo(goodsCar.getGoodsId(), goodsCar.getTheGoodsNum());
			}else{
				//该商品不在购物车
				goodsCarDao.addGoods(goodsCar);
			}
			result = 1;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("加入购物车失败");
		}
		return result;
	}
	//利用ajax动态修改购物车中商品数量，修改前检查是否合法
	@Transactional
	public int updateCarGoodsNum(int goodsId,int newNum){
		//参数newNum不为当前修改数量，是覆盖当前数量值
		int result = 0;//默认操作失败
		try{
			//先检查该商品的库存
			int theGoodsNum = goodsDao.queryOneGoodsNum(goodsId);
			if(theGoodsNum>0){
				//判断是否数量充足
				if(newNum>theGoodsNum){
					//不足
					result = 1;
				}else{
					//足够
					goodsCarDao.updateCarInfoNowNum(goodsId, newNum);//直接覆盖原来的值
					result = 2;//操作成功
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//查看购物车所有商品
	public PageUtil getMyCarAllGoods(int currentPage,int numPerPage,int userId){
		//得到购物车商品时可能存在店铺商品不足现象，此时取店铺商品最大值到购物车
		return goodsCarDao.queryAllCarGoods(currentPage, numPerPage, userId);
	}
	//获取选中下单的商品信息(购物车中商品)
	public List<Map<String, Object>> querySelectGoods(int goodsId[]){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		int length = goodsId.length;
		if(length>0){
			for(int i=0;i<length;i++){
				Map<String, Object> map = goodsCarDao.querySelectGoods(goodsId[i]).get(0);
				int theGoodsNum =  (Integer) map.get("theGoodsNum");
				if(theGoodsNum!=0){
					result.add(map);
				}	
			}
		}else{
			result = null;
		}
		return result;	
	}
	//付款后订单提交,并且提交成功后(来源购物车订单)
	@Transactional
	public int addGoodsOrder(List<Map<String, Object>> waitOrder,GoodsOrder goodsOrder,int type){
		//type为1表示直接购买，type为2表示购物车选择下单购买
		int result = 1;//默认添加成功
		try{
			if(type==1){
				//直接购买
				goodsOrderDao.addGoodsOrderInfo(goodsOrder);
			}else{
				//购物车选择购买
				for(int i=0;i<waitOrder.size();i++){
					//添加到订单表
					Map<String, Object> map = waitOrder.get(i);
					int goodsId = (Integer)map.get("goodsId");
					String price = (String) map.get("goodsPrice");
					int theGoodsNum = (Integer) map.get("theGoodsNum");
					String orderMoney = TransformPrice.multiply(price, String.valueOf(theGoodsNum));
					goodsOrder.setGoodsId(goodsId);
					goodsOrder.setPrice(price);
					goodsOrder.setTheGoodsNum(theGoodsNum);
					goodsOrder.setOrderMoney(orderMoney);
					goodsOrderDao.addGoodsOrderInfo(goodsOrder);
				}
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//修改订单交易状态
	@Transactional
	public int updateGoodsOrderState(int orderId,String state){
		return goodsOrderDao.updateGoodsOrderState(orderId, state);
	}
}
