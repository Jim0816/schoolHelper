package com.school.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.school.domain.lifebeans.CheckGetOrderUserInfo;
import com.school.domain.lifebeans.DeliveryGetInfo;
import com.school.domain.lifebeans.HouseRentInfo;
import com.school.service.LifeService;
import com.school.utils.DivideImgSrc;

@Controller
@RequestMapping("/life")
public class LifeController {
	@Autowired
	private LifeService lifeService;
	 /*
	 * 首页为缴费大厅
	 */
	//缴费大厅入口
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String goFirst(HttpServletRequest request){
		return "/life/electronic";
	}
	//查询电费(ajax)
	@RequestMapping(value="/1/1",method=RequestMethod.POST)
	public void QueryElectronicRemain(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		String area = request.getParameter("area");
		String unit = request.getParameter("unit");
		String houseNumber = request.getParameter("houseNumber");
		String remain = lifeService.getElectronicRemain(area, unit, houseNumber);
		try {
			PrintWriter out = response.getWriter();
			out.print(remain);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//缴纳电费(ajax)
	@RequestMapping(value="/1/2",method=RequestMethod.POST)
	public void PayElectronic(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		String area = request.getParameter("area");
		String unit = request.getParameter("unit");
		String houseNumber = request.getParameter("houseNumber");
		String payMoney = request.getParameter("payMoney");
		String payUserId = request.getParameter("payUserId");
		int payResult = lifeService.payElectronicMoney(area, unit, houseNumber, payMoney,Integer.valueOf(payUserId));
		try {
			PrintWriter out = response.getWriter();
			out.print(payResult);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/*
	 * 送水中心
	 * 
	 */
	//进入送水中心
	@RequestMapping(value="/2",method=RequestMethod.GET)
	public String goWsterCenter(HttpServletRequest request){
		return "/life/orderWater";
	}
	//订水服务(ajax)
	@RequestMapping(value="/2/1",method=RequestMethod.POST)
	public void orderWater(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		String area = request.getParameter("area");
		if(area.equals("0")){
			area ="南区";
		}else{
			area ="北区";
		}
		String unit = request.getParameter("unit");
		String houseNumber = request.getParameter("houseNumber");
		String waterDept = request.getParameter("waterDept");
		String waterNum = request.getParameter("waterNum");
		String tel = request.getParameter("tel");
		String allPrice = request.getParameter("allPrice");
		String payUserId = request.getParameter("payUserId");
		int result = lifeService.orderWater(area, unit, houseNumber, waterDept, Integer.valueOf(waterNum), allPrice, tel,Integer.valueOf(payUserId));
		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/*
	 * 物业报修
	 */
	//物业报修入口
	@RequestMapping(value="/3",method=RequestMethod.GET)
	public String goRepair(HttpServletRequest request){
		//物业报修
		return "/life/applyRepair";
	}
	//物业报修信息添加
	@RequestMapping(value="/3/1",method=RequestMethod.POST)
	public void repairApply(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		String area = request.getParameter("area");
		if(area.equals("0")){
			area ="南区";
		}else{
			area ="北区";
		}
		String unit = request.getParameter("unit");
		String houseNumber = request.getParameter("houseNumber");
		String repairContent = request.getParameter("repairContent");
		String tel = request.getParameter("tel");
		String repairRemark = request.getParameter("repairRemark");//备注信息
		String applyUserId = request.getParameter("applyUserId");
		int result = lifeService.addRepairInfo(area, unit, houseNumber, repairContent, repairRemark, Integer.valueOf(applyUserId), tel);
		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/*
	 * 快递服务
	 */
	//快递服务(默认代领为首页)
	@RequestMapping(value="/4",method=RequestMethod.GET)
	public String goDeliverGet(HttpServletRequest request){
		return "/life/deliveryService";
	}
	//添加快递代领信息
	@RequestMapping(value="/4/1",method=RequestMethod.POST)
	public String addDeliveryGetInfo(HttpServletRequest request,DeliveryGetInfo deliveryGetInfo){
		//防止表单重复提交
		String reqdeliveryGetFlag = request.getParameter("deliveryGetFlag");
		HttpSession session = request.getSession();
		String sessdeliveryGetFlag = (String) session.getAttribute("deliveryGetFlag");
		session.removeAttribute("deliveryGetFlag");
		if(reqdeliveryGetFlag.equals(sessdeliveryGetFlag)){
			//合法提交
			int result = lifeService.addDeliveryGetInfo(deliveryGetInfo);
			if(result>0){
				request.setAttribute("result","下单成功!");
			}else{
				request.setAttribute("result","下单失败!");
			}
		}else{
			//重复提交
			System.out.println("重复提交表单！！！");
		}
		
		return "/life/deliveryService";
	} 
	
	/*//快递服务(快递代寄)
	@RequestMapping(value="/41",method=RequestMethod.GET)
	public String goDeliverSend(HttpServletRequest request){
		return "/life/deliverySendService";
	}
	//添加快递代寄信息
	@RequestMapping(value="/41/1",method=RequestMethod.POST)
	public String addDeliverySendInfo(HttpServletRequest request,DeliverySendInfo deliverySendInfo){
		//防止表单重复提交
		String reqdeliverySendFlag = request.getParameter("deliverySendFlag");
		HttpSession session = request.getSession();
		String sessdeliverySendFlag = (String) session.getAttribute("deliverySendFlag");
		session.removeAttribute("deliverySendFlag");
		if(reqdeliverySendFlag.equals(sessdeliverySendFlag)){
			//合法提交
			int result = lifeService.addDeliverySendInfo(deliverySendInfo);
			if(result>0){
				request.setAttribute("result","下单成功!");
			}else{
				request.setAttribute("result","下单失败!");
			}
		}else{
			//重复提交
			System.out.println("重复提交表单！！！");
		}
		
		return "/life/deliveryService";
	} */
	
	
	
	
	
	
	/*
	 * 房屋租赁
	 */
	//房屋租赁入口
	@RequestMapping(value="/5",method=RequestMethod.GET)
	public String goHouseRent(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			currentPage="1";
		}
		request.setAttribute("rentPage",lifeService.getRentInfo(Integer.valueOf(currentPage),10));
		return "/life/houseRent";
	}
	
	//房屋租赁详细信息
	@RequestMapping(value="/5/1",method=RequestMethod.GET)
	public String goHouseRentDetail(HttpServletRequest request){
		String rentId = request.getParameter("rentId");
		HouseRentInfo houseRentInfo = lifeService.getRentDetail(Integer.valueOf(rentId));
		request.setAttribute("houseRentInfo",houseRentInfo);
		try {
			request.setAttribute("imgs",DivideImgSrc.divideSrc(houseRentInfo.getRentPhoto()));//将图片组传过去
		} catch (Exception e) {
			System.out.println("租赁信息不含图片");
		}
		return "/life/houseInfoDetail";
	}
	//发布租赁信息入口
	@RequestMapping(value="/5/2",method=RequestMethod.GET)
	public String goWriteRentInfo(HttpServletRequest request){
		return "/life/sendRentInfo";
	}
	//添加租赁信息
	@RequestMapping(value="/5/3",method=RequestMethod.POST)
	public String addHouseRentInfo(@RequestParam("img") MultipartFile img[],HttpServletRequest request,HouseRentInfo houseRentInfo){
		//防止表单重复提交
		String reqrentFlag = request.getParameter("rentFlag");
		HttpSession session = request.getSession();
		String sessrentFlag = (String) session.getAttribute("rentFlag");
		session.removeAttribute("rentFlag");
		if(reqrentFlag.equals(sessrentFlag)){
			//提交合法
			int result = lifeService.addRentInfo(houseRentInfo,img);
			if(result>0){
				request.setAttribute("result","发布成功!");
			}else{
				request.setAttribute("result","发布失败!");
			}
		}else{
			//重复提交
			System.out.println("重复添加租赁信息!!!");
		}
		return "redirect:/life/5";
	}
	
	
	/*
	 * 我要接单
	 */
	@RequestMapping(value="/6",method=RequestMethod.GET)
	public String goTakeOrder(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			currentPage="1";
		}
		HttpSession session = request.getSession(true);
		session.setAttribute("deliveryOrderPage",lifeService.getAllDeliveryOrderInfo(Integer.valueOf(currentPage), 10));
		return "/life/receiveLifeOrder";
	}
	//验证接单者是否合法并且返回客户联系方式
	@RequestMapping(value="/6/1",method=RequestMethod.POST)
	public void checkGetOrderUser(HttpServletRequest request , HttpServletResponse response){
		String getOrderUserId = request.getParameter("getOrderUserId");
		String getDeliveryId = request.getParameter("getDeliveryId");
		String result = lifeService.checkGetOrderUser(Integer.valueOf(getOrderUserId), Integer.valueOf(getDeliveryId));
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//产生接单关系信息
	@RequestMapping(value="/6/2",method=RequestMethod.POST)
	public void makeOrderInfo(HttpServletRequest request , HttpServletResponse response){
		String getOrderUserId = request.getParameter("getOrderUserId");
		String getDeliveryId = request.getParameter("getDeliveryId");
		int result = lifeService.createOrderRelation(Integer.valueOf(getDeliveryId), Integer.valueOf(getOrderUserId));
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//接单用户信息授权入口
	@RequestMapping(value="/6/3",method=RequestMethod.GET)
	public String goCheckGetUserInfo(HttpServletRequest request){
		return "/life/getOrderUserCheck";
	}
		
	//添加接单用户身份审核信息
	@RequestMapping(value="/6/4",method=RequestMethod.POST)
	public String checkGetOrderUserInfo(@RequestParam("img") MultipartFile img,HttpServletRequest request ,CheckGetOrderUserInfo checkGetOrderUserInfo){
		String reqcheckFlag = request.getParameter("checkFlag");
		HttpSession session = request.getSession();
		String sesscheckFlag = (String) session.getAttribute("checkFlag");
		session.removeAttribute("checkFlag");
		if(reqcheckFlag.equals(sesscheckFlag)){
			//合法提交
			int result = lifeService.addCheckUserInfo(checkGetOrderUserInfo,img);
			request.setAttribute("result", result);
		}else{
			//重复提交
			System.out.println("接单用户审核信息重复提交");
		}
		return "/life/getOrderUserCheck";
	}
	
	
	
}
