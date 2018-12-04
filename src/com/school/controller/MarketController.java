package com.school.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.school.domain.marketbeans.Goods;
import com.school.domain.marketbeans.GoodsCar;
import com.school.domain.marketbeans.GoodsOrder;
import com.school.domain.marketbeans.ShopApplyInfo;
import com.school.domain.marketbeans.ShopInfo;
import com.school.domain.personbeans.User;
import com.school.service.GetLocationDBService;
import com.school.service.MarketService;
import com.school.utils.DivideImgSrc;
@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired
	private MarketService marketService;
	@Autowired
	private GetLocationDBService getLocationDBService;
	@RequestMapping(value="/location",method=RequestMethod.GET)
	public String getLocation(HttpServletRequest request){
		String schoolName = request.getParameter("schoolName");
		//System.out.println("所在学校:"+schoolName);
		HttpSession session = request.getSession(true);
		session.setAttribute("location",schoolName);
		//getLocationDBService.updateConfig(schoolName);
		return "redirect:/market/First";
	}
	@RequestMapping(value="/First",method=RequestMethod.GET)
	public String goFirst(HttpServletRequest request, HttpServletResponse response){
		List<Map<String, Object>> advListTop = marketService.getAdvertisement();
		List<Map<String, Object>> jobList = marketService.ParttimeJob();
		HttpSession session = request.getSession(true);
		session.setAttribute("advListTop", advListTop);
		session.setAttribute("jobList", jobList);
		session.setAttribute("topSixShop", marketService.getAllShopInfo(1, 6));//提供首页热门店铺
		session.setAttribute("topGoods", marketService.searchGoods(1,12));//提供首页热卖商品
		session.setAttribute("shopAdvInfo", marketService.getShopAdvInfo(1, 3));//商城店铺海报广告
		session.setAttribute("goodsAdvInfo", marketService.getGoodsAdvInfo(1, 5));//商城商品海报广告
		return "/market/First";
	}
	
	/*
	 * 店铺申请
	 */
	//进入店铺申请
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String goShopApply(HttpServletRequest request, HttpServletResponse response){
		/*
		 * 这一步需要处理已经申请过店铺的人操作，最终结果是：只有合格用户才能进入店铺申请
		 */
		String url="/market/First";
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if(user!=null){
			int applyUserId = user.getUserId();
			List<Map<String, Object>> result = marketService.queryShopApplyInfo(applyUserId);
			if(result.size()==0){
				//该用户不存在申请记录,跳入申请页面
				url="/market/shopApply";
			}else{
				url="/market/shopApplyStatus";
				//该用户存在申请记录
				request.setAttribute("shopApplyInfo", result);
				String applyStatus = (String) result.get(0).get("applyStatus");
				if("0".equals(applyStatus)){
					//申请中
					request.setAttribute("applyStatus","0");
				}else if("1".equals(applyStatus)){
					//申请成功
					request.setAttribute("applyStatus","1");
				}else{
					//申请失败
					request.setAttribute("applyStatus","-1");
				}
			}
		}
		return url;
	}
	//店铺申请提交
	@RequestMapping(value="/1/1",method=RequestMethod.POST)
	public String submitShopApply(HttpServletRequest request,@RequestParam("img") MultipartFile img,ShopApplyInfo shopApplyInfo){
		//防止表单重复提交
		String reqapplyFlag = request.getParameter("applyFlag");
		HttpSession session = request.getSession();
		String sessapplyFlag = (String) session.getAttribute("applyFlag");
		session.removeAttribute("applyFlag");
		if(reqapplyFlag.equals(sessapplyFlag)){
			//合法提交
			int result = marketService.addShopApplyInfo(shopApplyInfo, img);
			request.setAttribute("result", result);
		}else{
			//重复提交
			System.out.println("重复提交店铺申请信息!");
		}
		return "/market/First";
	}
	//进入我的店铺
	@RequestMapping(value="/1/2",method=RequestMethod.GET)
	public String goMyShop(HttpServletRequest request){
		String url ="/userInfoManager/myShop";
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if(user==null){
			//店主id为空，不合法
			String pageSource = request.getParameter("pageSource");
			url = "redirect:/person/user/login?pageSource="+pageSource;
		}else{
			//合法
			//查询该用户的店铺
			int shopUserId = user.getUserId();
			List<Map<String, Object>> result = marketService.queryShopInfo(Integer.valueOf(shopUserId));
			if(result.size()>0){
				String target = request.getParameter("target");
				//获取该店铺的id
				int shopId = (Integer) result.get(0).get("shopId");
				int currentPage = 1;
				String page = request.getParameter("currentPage");
				if(page!=null && !"0".equals(page)){
					currentPage = Integer.valueOf(page);
				}
				/*
				 * target表示进入店铺的页面选择(默认进入店铺商品页面)
				 * 1:表示进入店铺商品页面
				 * 2:表示进入商品上传页面
				 * 3:表示进入交易订单页面
				 * 4:表示进入营业信息页面
				 */
				
				if(target==null || target.equals("1")){
					//进入首页(店铺商品页面)
					session.setAttribute("goods",marketService.getShopGoods(currentPage, 10, shopId));
					//店铺的信息在第一次进入店铺时就保存在session中(保证第一次进入店铺商品首页)
					session.setAttribute("shopInfo",marketService.getShopBasicInfo(shopId));
					request.setAttribute("target", "1");
				}else if(target.equals("2")){
					//进入商品上传页面
					request.setAttribute("target", "2");
				}else if(target.equals("3")){
					//进入交易订单页面
					session.setAttribute("goodsOrder",marketService.getShopGoodsOrder(currentPage, 10, shopId));
					request.setAttribute("target", "3");
				}else if(target.equals("4")){
					//进入营业信息页面
					request.setAttribute("target", "4");
				}else{
					//进入首页(店铺商品页面)
					session.setAttribute("goods",marketService.getShopGoods(currentPage, 10, shopId));
					//店铺的信息在第一次进入店铺时就保存在session中(保证第一次进入店铺商品首页)
					session.setAttribute("shopInfo",marketService.getShopBasicInfo(shopId));
					request.setAttribute("target", "1");
				}
			}else{
				//该用户店铺不存在,转入申请页面
				url="redirect:/market/1";
			}
		}
		return url;
	}
	
	//店铺上传商品
	@RequestMapping(value="/1/3",method=RequestMethod.POST)
	public String submitGoods(@RequestParam("img") MultipartFile img[],HttpServletRequest request,Goods goods){
		//防止表单重复提交
		String reqshopFlag = request.getParameter("shopFlag");
		HttpSession session = request.getSession();
		String sessshopFlag = (String) session.getAttribute("shopFlag");
		session.removeAttribute("shopFlag");
		if(reqshopFlag.equals(sessshopFlag)){
			//合法提交
			int result = marketService.addGoods(goods, img);
			request.setAttribute("result", result);
			request.setAttribute("target", "2");
		}else{
			//重复提交
			System.out.println("重复提交商品信息!");
		}
		return "/userInfoManager/myShop";
	}
	//修改商品信息入口
	@RequestMapping(value="/1/4",method=RequestMethod.GET)
	public String goUpdateGoods(HttpServletRequest request){
		String goodsId = request.getParameter("goodsId");
		Goods goods = marketService.getOneGoodsInfo(Integer.valueOf(goodsId));
		HttpSession session = request.getSession();
		session.setAttribute("theGoods",goods);//传入Goods类型
		String allImgUrl = goods.getGoodsImg();
		if(!allImgUrl.trim().equals("")){
			List<String> imgUrl = DivideImgSrc.divideSrc(allImgUrl);
			request.setAttribute("imgs",imgUrl);
		}
		return "/market/updateGoods";
	}
	//修改商品信息提交
	@RequestMapping(value="/1/5",method=RequestMethod.POST)
	public String updateGoods(@RequestParam("img") MultipartFile img[],HttpServletRequest request,Goods goods){
		//防止表单重复提交
		String requpdateGoodsFlag = request.getParameter("updateGoodsFlag");
		HttpSession session = request.getSession();
		String sessupdateGoodsFlag = (String) session.getAttribute("updateGoodsFlag");
		session.removeAttribute("updateGoodsFlag");
		if(requpdateGoodsFlag.equals(sessupdateGoodsFlag)){
			//合法提交
			Goods oldGoods= (Goods) session.getAttribute("theGoods");
			marketService.updateGoods(goods, img,oldGoods);
			request.setAttribute("target", "1");
		}else{
			//重复提交
			System.out.println("重复提交修改商品信息!");
		}
		return "redirect:/market/1/2";
	}
	//删除所选商品(店主删除店铺商品)
	@RequestMapping(value="/1/6",method=RequestMethod.POST)
	public String deleteSelectedGoods(@RequestParam("goodsId") int goodsId[],HttpServletRequest request){
	    marketService.deleteSomeGoods(goodsId);
		return "redirect:/market/1/2";
	}
	//修改店铺基本信息
	@RequestMapping(value="/1/7",method=RequestMethod.POST)
	public String updateShopBasicInfo(@RequestParam("img") MultipartFile img,HttpServletRequest request,ShopInfo newShopInfo){
		//未做防止表单重复提交操作
		HttpSession session = request.getSession();
		ShopInfo oldShopInfo = (ShopInfo) session.getAttribute("shopInfo");
		request.setAttribute("result",marketService.updateShopBasicInfo(oldShopInfo, newShopInfo, img));
		//更新店铺信息的session
		session.setAttribute("shopInfo",marketService.getShopBasicInfo(oldShopInfo.getShopId()));
		request.setAttribute("target", "4");
		return "/userInfoManager/myShop";
	}
	//查看商品入口
	@RequestMapping(value="/1/8",method=RequestMethod.GET)
	public String goGoodsInfo(HttpServletRequest request){
		int goodsId = Integer.valueOf(request.getParameter("goodsId"));
		Goods oneGoodsInfo = marketService.getOneGoodsInfo(goodsId);
		HttpSession session = request.getSession();
		session.setAttribute("imgs",DivideImgSrc.divideSrc(oneGoodsInfo.getGoodsImg()));
		session.setAttribute("oneGoodsInfo", oneGoodsInfo);
		return "/market/lookGoods";
	}
	//搜索商品
	@RequestMapping(value="/1/9",method=RequestMethod.POST)
	public String searchGoods(HttpServletRequest request,HttpServletResponse response){
		String page = request.getParameter("currentPage");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		String searchText = request.getParameter("searchText");
		HttpSession session = request.getSession();
		session.setAttribute("searchResult",marketService.searchGoods(searchText,currentPage,24));
		return "/market/showAllGoods";
	}
	//按分类查询商品
	@RequestMapping(value="/1/10",method=RequestMethod.GET)
	public String searchGoodsByClassify(HttpServletRequest request,HttpServletResponse response){
		String page = request.getParameter("currentPage");
		String one = request.getParameter("one");
		String two = request.getParameter("two");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		HttpSession session = request.getSession();
		session.setAttribute("one", one);
		session.setAttribute("two", two);
		session.setAttribute("searchResult",marketService.getClassifyGoodsInfo(one, two, currentPage,24));
		return "/market/showAllGoods";
	}
	//按学院区域查询店铺
	@RequestMapping(value="/1/11",method=RequestMethod.GET)
	public String searchShopsByLocation(HttpServletRequest request,HttpServletResponse response){
		String page = request.getParameter("currentPage");
		String academy = request.getParameter("a");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		HttpSession session = request.getSession();
		session.setAttribute("shopsResult",marketService.getAllShopInfoByAcademy(academy, currentPage, 10));
		return "/market/showAllShops";
	}
	//用户进入店铺
	@RequestMapping(value="/1/12",method=RequestMethod.GET)
	public String enterShop(HttpServletRequest request,HttpServletResponse response){
		String returnUrl = "/market/lookShop";
		HttpSession session = request.getSession();
		String direct = request.getParameter("direct");
		String shopId = request.getParameter("shopId");
		//进入店铺首页
		if(direct==null || direct.equals("") || direct.equals("1")){
			session.setAttribute("shopForBuyerLookInfo", marketService.queryShopInfoByShopIdForBuyer(Integer.valueOf(shopId)));
		}else{
			returnUrl = "/market/shopAllGoods";
			//进入店铺商品页
			//判断是否在本店进行输入搜索
			String page = request.getParameter("currentPage");
			int currentPage = 1;
			if(page!=null){
				currentPage = Integer.valueOf(page);
			}
			String searchText = request.getParameter("searchText");
			if(searchText==null){
				//默认进入商品页，无搜索
				session.setAttribute("searchResult",marketService.getShopGoods(currentPage, 24, Integer.valueOf(shopId)));
			}else{
				//用户通过搜索进入商品页
				session.setAttribute("searchResult",marketService.searchGoods(searchText,currentPage,24));
			}
			
		}
		return returnUrl;
	}
	//跳转到下单确认页面(直接购买)
	@RequestMapping(value="/1/13",method=RequestMethod.POST)
	public String goOrder(HttpServletRequest request){
		//得到所购买商品的数量
		String theGoodsNum = request.getParameter("theGoodsNum");
		//得到所购买商品的总费用
		String allPrice = request.getParameter("allPrice");
		//得到所购买商品的基本信息
		HttpSession session = request.getSession();
		Goods oneGoodsInfo = (Goods) session.getAttribute("oneGoodsInfo");
		request.setAttribute("direct", "one");
		session.setAttribute("allPrice",allPrice);
		session.setAttribute("theGoodsNum", theGoodsNum);
		session.setAttribute("waitOrder",oneGoodsInfo);
		return "/market/confirmOrder";
	}
	//加入商品到购物车
	@RequestMapping(value="/1/14",method=RequestMethod.POST)
	public String addGoodsToCar(HttpServletRequest request,GoodsCar goodsCar){
		//防止表单重复提交
		String reqaddGoods = request.getParameter("addGoods").replace("/","");//表单中数据传递后反编译多了"/"
		HttpSession session = request.getSession();
		String sessaddGoods = (String) session.getAttribute("addGoods");
		session.removeAttribute("addGoods");
		if(reqaddGoods.equals(sessaddGoods)){
			//合法提交
			int addResult = marketService.addGoodsToCar(goodsCar);
			if(addResult==1){
				//添加成功
				request.setAttribute("addResult","添加成功");
			}else{
				//添加失败
				request.setAttribute("addResult","添加失败");
			}
		}else{
			//重复提交
			request.setAttribute("addResult","无法重复提交");
			System.out.println("重复提交添加购物车表单");
		}
		return "/market/lookGoods";
	}
	//进入我的购物车
	@RequestMapping(value="/1/15",method=RequestMethod.GET)
	public String goMyCar(HttpServletRequest request){
		String Url = "/userInfoManager/myCar";
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null){
			//没有登录，提示用户登录
			Url = "/market/First";
		}else{
			//合法进入购物车
			String page = request.getParameter("currentPage");
			int currentPage = 1;
			if(page!=null){
				currentPage = Integer.valueOf(page);
			}
			session.setAttribute("myCarAllGoods",marketService.getMyCarAllGoods(currentPage, 50, user.getUserId()));
		}
		return Url;
	}
	//删除购物车中的商品
	@RequestMapping(value="/1/16",method=RequestMethod.POST)
	public String deleteCarGoods(@RequestParam("goodsId") int goodsId[],HttpServletRequest request){
		//防止表单重复提交
		String reqmyCarFlag = request.getParameter("myCarFlag").replace("/","");//表单中数据传递后反编译多了"/"
		HttpSession session = request.getSession();
		String sessmyCarFlag = (String) session.getAttribute("myCarFlag");
		session.removeAttribute("myCarFlag");
		if(reqmyCarFlag.equals(sessmyCarFlag)){
			//合法提交
			int deleteResult = marketService.deleteCarGoods(goodsId);
			if(deleteResult==1){
				//删除成功
				request.setAttribute("deleteResult","删除成功");
			}else{
				//删除失败
				request.setAttribute("deleteResult","删除失败");
			}
		}else{
			//重复提交
			request.setAttribute("deleteResult","无法重复提交");
			System.out.println("重复提交删除购物车商品");
		}
		User user = (User) session.getAttribute("user");
		session.setAttribute("myCarAllGoods",marketService.getMyCarAllGoods(1, 50, user.getUserId()));
		return "/userInfoManager/myCar";
	}
	
	//确认订单业务(跳转到填写收货信息)
	@RequestMapping(value="/1/17",method=RequestMethod.POST)
	public String confirmOrder(@RequestParam("goodsId") int goodsId[],HttpServletRequest request){
		String allPrice = request.getParameter("allPrice");
		HttpSession session = request.getSession();
		request.setAttribute("direct", "two");
		session.setAttribute("allPrice",allPrice);
		session.setAttribute("waitOrder",marketService.querySelectGoods(goodsId));
		return "/market/confirmOrder";
	}
	//修改购物车中某件商品的数量
	@RequestMapping(value="/1/18",method=RequestMethod.POST)
	public void updateCarOneGoodsNum(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		//需要判断商品库存是否满足
		String goodsId = request.getParameter("goodsId");
		String newNum = request.getParameter("newNum");
		int result = marketService.updateCarGoodsNum(Integer.valueOf(goodsId), Integer.valueOf(newNum));
		String returnText = "操作失败";
		if(result == 0){
			//操作失败
			returnText = "操作失败";
		}else if(result == 1){
			//商品库存不足
			returnText = "库存不足";
		}else if(result == 2){
			//操作成功
			returnText = "success";
		}
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(returnText);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//订单提交
	@Transactional
	@RequestMapping(value="/1/19",method=RequestMethod.POST)
	public String buyGoods(HttpServletRequest request,GoodsOrder goodsOrder){
        String type = request.getParameter("type");
        synchronized(this){
            if(type.trim().equals("one")){
    			try{
    				//直接购买订单提交
    				int updateResult = marketService.updateGoods(goodsOrder.getGoodsId(), goodsOrder.getTheGoodsNum());
    				if(updateResult==1){
    					//数据库更新成功,开始添加订单信息
    					int addResult = marketService.addGoodsOrder(null, goodsOrder, 1);
    					if(addResult==1){
    						request.setAttribute("buyResult", "1");
    					}else{
    						request.setAttribute("buyResult", "0");
    					}
    				}else{
    					request.setAttribute("buyResult", "0");
    				}
    			}catch(RuntimeException e){
    				//e.printStackTrace();
    				request.setAttribute("buyResult", "0");
    			}	
    		}else{
    			//从购物车订单提交
    			try {
    				HttpSession session = request.getSession();
					List<Map<String, Object>> waitOrder = (List<Map<String, Object>>) session.getAttribute("waitOrder");
    				int updateResult = marketService.updateGoods(waitOrder);//修改商品的库存和销量
    				if(updateResult==1){
    					int addResult = marketService.addGoodsOrder(waitOrder, goodsOrder,2);//添加订单信息
    				    if(addResult==1){
    				    	int deleteResult = marketService.deleteCarGoods(waitOrder);//删除购物车记录
    				        if(deleteResult==1){
    				        	request.setAttribute("buyResult","1");
    				        }else{
    				        	request.setAttribute("buyResult","0");
    				        }
    				    }else{
    				    	request.setAttribute("buyResult","0");
    				    }
    				}else{
    					request.setAttribute("buyResult","0");
    				}
    			} catch (RuntimeException e) {
    				e.printStackTrace();
    				request.setAttribute("buyResult","0");
    			}	
    		}
        }
		return "/market/buyResult";
	}
	//确认收货
	@RequestMapping(value="/1/20",method=RequestMethod.GET)
	public String successGetGoods(HttpServletRequest request){
		//需要判断商品库存是否满足
		int result = 0;
		String orderId = request.getParameter("orderId");
		//确认收货
		result = marketService.updateGoodsOrderState(Integer.valueOf(orderId), "1");
		return "redirect:/person/1/2?result="+result;
	}
}
