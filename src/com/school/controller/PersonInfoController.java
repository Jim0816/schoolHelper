package com.school.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.school.domain.personbeans.User;
import com.school.service.PersonService;
import com.school.service.StudyService;

@Controller
@RequestMapping("/person")
public class PersonInfoController {
	@Autowired
	private PersonService personService; 
	@Autowired
	private StudyService studyService; 
	/*
	 * 普通用户信息
	*/
	
	//登录页面
	@RequestMapping(value="/user/login",method=RequestMethod.GET)
	public String goLogin(HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		request.setAttribute("pageSource",pageSource);
		return "/userInfoManager/loginAndRegist";
	}
	
	@RequestMapping(value="/user/loginCheck")
	public String getAdvertisementFive(User user ,HttpServletRequest request){
		String page = request.getParameter("page");
		User findUser = personService.checkUser(user);
		if(findUser==null){
			//登录失败，转入登录失败页面
			request.setAttribute("page",page);
			return "/userInfoManager/loginFail";
		}else{
			//登录成功，转入首页，并且建立Session
			HttpSession session = request.getSession(true);
			session.setAttribute("user", findUser);
			String url ="";
			if(page.equals("a1")){
				//商城首页
				url = "/market/First";
			}else if(page.equals("a2")){
				//商品搜索
				url = "/market/showAllGoods";
			}else if(page.equals("a3")){
				//商品查看
				url = "/market/lookGoods";
			}else if(page.equals("a4")){
				//店铺搜索
				url = "/market/showAllShops";
			}else if(page.equals("a5")){
				//店铺查看
				url = "/market/lookShop";
			}else if(page.equals("a6")){
				//店铺所有商品
				url = "/market/shopAllGoods";
			}else if(page.equals("b1")){
				//缴费大厅
				url = "/life/electronic";
			}else if(page.equals("b2")){
				//送水中心
				url = "/life/orderWater";
			}else if(page.equals("b3")){
				//物业报修
				url = "/life/applyRepair";
			}else if(page.equals("b4")){
				//快递服务(默认首页为快递代领)
				url = "/life/deliveryService";
			}else if(page.equals("b5")){
				//房屋租赁
				url = "redirect:/life/5";
			}else if(page.equals("b6")){
				//我要接单
				url = "redirect:/life/6";
			}else if(page.equals("c1")){
				//学习大厅（学习交流首页）
				url = "/studyCenter/studyCenter";
			}else if(page.equals("c2")){
				//交流论坛
				url = "/studyCenter/discuss";
			}else if(page.equals("c21")){
				//交流论坛讨论区
				url = "/studyCenter/discussArea";
			}else if(page.equals("c3")){
				//资源共享
				url = "/studyCenter/shareData";
			}else if(page.equals("c31")){
				//资源评论区
				url = "/studyCenter/shareDataComment";
			}else if(page.equals("c4")){
				//成绩查询
				url = "/studyCenter/lookScore";
			}else if(page.equals("d1")){
				//校园资讯
				url = "/schoolState/schoolNews";
			}else if(page.equals("d2")){
				//待修改处
				url = "/schoolState/schoolVote";
			}else if(page.equals("d3")){
				//校园通知
				url = "/schoolState/schoolReform";
			}else if(page.equals("e1")){
				//关于我们
				url = "/market/First";
			}
			return url;
		}	
	}
	
	//注册页面
	@RequestMapping(value="/user/regist",method=RequestMethod.GET)
	public String goRegist(HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		request.setAttribute("pageSource",pageSource);
		return "/userInfoManager/regist";
	}
	//注册检验
	@RequestMapping(value="/user/registCheck",method=RequestMethod.POST)
	public String registCheck(User user ,HttpServletRequest request){
		int newId = personService.registUser(user);
		String page = request.getParameter("page");
		if(newId==0){
			//注册失败
			return "/userInfoManager/registFail";
		}else{
			//注册成功
			request.setAttribute("userNewId", newId);
			request.setAttribute("page",page);
			return "/userInfoManager/registSuccess";
		}
	}
		
	//找回密码页面
	@RequestMapping(value="/user/findCode",method=RequestMethod.GET)
	public String findCode(HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		request.setAttribute("pageSource",pageSource);
		return "/userInfoManager/findCode";
	}
	//修改密码(可修改所有信息,已经封装)
	@RequestMapping(value="/user/updateCode",method=RequestMethod.POST)
	public String updateCode(User user ,HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		request.setAttribute("pageSource",pageSource);
		User user2 = personService.updateUser(user);
		if(user2==null){
			return "/userInfoManager/updateCodeFail";
		}else{
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user2);
			return "/userInfoManager/updateCodeSuccess";
		}	
	}
		
	//注销操作
	@RequestMapping(value="/user/exit",method=RequestMethod.GET)
	public String goExit(HttpServletRequest request){
		String page = request.getParameter("pageSource");
		String url="";
		if(page.equals("a1")){
			//商城首页
			url = "/market/First";
		}else if(page.equals("a2")){
			//商品搜索
			url = "/market/showAllGoods";
		}else if(page.equals("a3")){
			//商品查看
			url = "/market/lookGoods";
		}else if(page.equals("a4")){
			//店铺搜索
			url = "/market/showAllShops";
		}else if(page.equals("a5")){
			//店铺查看
			url = "/market/lookShop";
		}else if(page.equals("a6")){
			//店铺所有商品
			url = "/market/shopAllGoods";
		}else if(page.equals("b1")){
			//生活中心
			url = "/life/electronic";
		}else if(page.equals("b2")){
			//送水中心
			url = "/life/orderWater";
		}else if(page.equals("b3")){
			//物业报修
			url = "/life/applyRepair";
		}else if(page.equals("b4")){
			//快递服务(默认首页为快递代领)
			url = "/life/deliveryService";
		}else if(page.equals("b5")){
			//房屋租赁
			url = "redirect:/life/5";
		}else if(page.equals("b6")){
			//我要接单
			url = "redirect:/life/6";
		}else if(page.equals("c1")){
			//学习交流
			url = "/studyCenter/studyCenter";
		}else if(page.equals("c2")){
			//交流论坛
			url = "/studyCenter/discuss";
		}else if(page.equals("c21")){
			//交流论坛讨论区
			url = "/studyCenter/discussArea";
		}else if(page.equals("c3")){
			//资源共享
			url = "/studyCenter/shareData";
		}else if(page.equals("c31")){
			//资源共享
			url = "/studyCenter/shareDataComment";
		}else if(page.equals("c4")){
			//成绩查询
			url = "/studyCenter/lookScore";
		}else if(page.equals("d1")){
			//校园动态
			url = "/schoolState/schoolNews";
		}else if(page.equals("d2")){
			//校园动态
			url = "/schoolState/schoolVote";
		}else if(page.equals("d3")){
			//校园动态
			url = "/schoolState/schoolReform";
		}else if(page.equals("e1")){
			//关于我们
			url = "/market/First";
		}
		request.getSession().removeAttribute("user");
		return url;
	}
	//进入用户个人中心(首页)
	@RequestMapping(value="/1/1",method=RequestMethod.GET)
	public String goManagerMyself(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String pageSource = request.getParameter("pageSource");
		String Url = "redirect:/person/user/login?pageSource="+pageSource;
		if(user!=null){
			Url="userInfoManager/manageMyInfo";
		}
		return Url;
	}
	//进入用户订单
	@RequestMapping(value="/1/2",method=RequestMethod.GET)
	public String go(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String page = request.getParameter("currentPage");
		String direct = request.getParameter("direct");
		String Url = "redirect:/person/user/loginCheck";
		if(user!=null){
			int currentPage = 1;
			if(page!=null){
				currentPage = Integer.valueOf(page);
			}
			if(direct==null || direct.equals("") || direct.equals("goodsOrder")){
				//商品订单
				request.setAttribute("direct","goodsOrder");
				session.setAttribute("myGoodsOrder", personService.getUserOrder(currentPage, 10, user.getUserId()));
			}else{
				//服务订单
				request.setAttribute("direct","serviceOrder");
			}	
			Url="userInfoManager/myOrder";
		}
		return Url;
	}
	//进入用户购物车
	@RequestMapping(value="/1/3",method=RequestMethod.GET)
	public String goMyCar(HttpServletRequest request){
		String url = "market/First";
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null){
			//跳入首页
			String pageSource = request.getParameter("pageSource");
			url = "redirect:/person/user/login?pageSource="+pageSource;
		}else{
			url = "redirect:/market/1/15";
		}
		return url;
	}
	//进入用户帖子管理中心
	@RequestMapping(value="/1/4",method=RequestMethod.GET)
	public String goMyDiscuss(HttpServletRequest request){
		String page = request.getParameter("page");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		session.setAttribute("myDiscuss",studyService.getStudyDiscussInfo(user.getUserId(), currentPage, 10));		
		return "userInfoManager/myDiscuss";
	}
	//进入用户资源分享管理中心
	@RequestMapping(value="/1/5",method=RequestMethod.GET)
	public String goMyShare(HttpServletRequest request){
		String page = request.getParameter("page");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		session.setAttribute("myShareData",studyService.getMyDataInfo(user.getUserId(), currentPage, 10));		
		return "userInfoManager/myShareData";
	}
	//用户进入自己店铺
	@RequestMapping(value="/1/6",method=RequestMethod.GET)
	public String goMyShop(HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		return "redirect:/market/1/2?pageSource="+pageSource;
	}
	
	//删除用户帖子
	@RequestMapping(value="/2/1",method=RequestMethod.GET)
	public String deleteMyDiscuss(HttpServletRequest request){
		String studyDiscussInfoId = request.getParameter("d");
		studyService.deleteDiscussInfo(Integer.valueOf(studyDiscussInfoId));
		return "redirect:/person/1/4";
	}
	//删除分享的资源
	@RequestMapping(value="/2/2",method=RequestMethod.GET)
	public String deleteMyShareData(HttpServletRequest request){
		String dataShareInfoId = request.getParameter("d");
		studyService.deleteDataInfo(Integer.valueOf(dataShareInfoId));
		return "redirect:/person/1/5";
	}
	//进入关于我们
	@RequestMapping(value="/us",method=RequestMethod.GET)
	public String goAboutUs(HttpServletRequest request){
		return "aboutUs/aboutUs";
	}
}
