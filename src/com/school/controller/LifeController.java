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
	 * ��ҳΪ�ɷѴ���
	 */
	//�ɷѴ������
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String goFirst(HttpServletRequest request){
		return "/life/electronic";
	}
	//��ѯ���(ajax)
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
	
	//���ɵ��(ajax)
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
	 * ��ˮ����
	 * 
	 */
	//������ˮ����
	@RequestMapping(value="/2",method=RequestMethod.GET)
	public String goWsterCenter(HttpServletRequest request){
		return "/life/orderWater";
	}
	//��ˮ����(ajax)
	@RequestMapping(value="/2/1",method=RequestMethod.POST)
	public void orderWater(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		String area = request.getParameter("area");
		if(area.equals("0")){
			area ="����";
		}else{
			area ="����";
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
	 * ��ҵ����
	 */
	//��ҵ�������
	@RequestMapping(value="/3",method=RequestMethod.GET)
	public String goRepair(HttpServletRequest request){
		//��ҵ����
		return "/life/applyRepair";
	}
	//��ҵ������Ϣ���
	@RequestMapping(value="/3/1",method=RequestMethod.POST)
	public void repairApply(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		String area = request.getParameter("area");
		if(area.equals("0")){
			area ="����";
		}else{
			area ="����";
		}
		String unit = request.getParameter("unit");
		String houseNumber = request.getParameter("houseNumber");
		String repairContent = request.getParameter("repairContent");
		String tel = request.getParameter("tel");
		String repairRemark = request.getParameter("repairRemark");//��ע��Ϣ
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
	 * ��ݷ���
	 */
	//��ݷ���(Ĭ�ϴ���Ϊ��ҳ)
	@RequestMapping(value="/4",method=RequestMethod.GET)
	public String goDeliverGet(HttpServletRequest request){
		return "/life/deliveryService";
	}
	//��ӿ�ݴ�����Ϣ
	@RequestMapping(value="/4/1",method=RequestMethod.POST)
	public String addDeliveryGetInfo(HttpServletRequest request,DeliveryGetInfo deliveryGetInfo){
		//��ֹ���ظ��ύ
		String reqdeliveryGetFlag = request.getParameter("deliveryGetFlag");
		HttpSession session = request.getSession();
		String sessdeliveryGetFlag = (String) session.getAttribute("deliveryGetFlag");
		session.removeAttribute("deliveryGetFlag");
		if(reqdeliveryGetFlag.equals(sessdeliveryGetFlag)){
			//�Ϸ��ύ
			int result = lifeService.addDeliveryGetInfo(deliveryGetInfo);
			if(result>0){
				request.setAttribute("result","�µ��ɹ�!");
			}else{
				request.setAttribute("result","�µ�ʧ��!");
			}
		}else{
			//�ظ��ύ
			System.out.println("�ظ��ύ��������");
		}
		
		return "/life/deliveryService";
	} 
	
	/*//��ݷ���(��ݴ���)
	@RequestMapping(value="/41",method=RequestMethod.GET)
	public String goDeliverSend(HttpServletRequest request){
		return "/life/deliverySendService";
	}
	//��ӿ�ݴ�����Ϣ
	@RequestMapping(value="/41/1",method=RequestMethod.POST)
	public String addDeliverySendInfo(HttpServletRequest request,DeliverySendInfo deliverySendInfo){
		//��ֹ���ظ��ύ
		String reqdeliverySendFlag = request.getParameter("deliverySendFlag");
		HttpSession session = request.getSession();
		String sessdeliverySendFlag = (String) session.getAttribute("deliverySendFlag");
		session.removeAttribute("deliverySendFlag");
		if(reqdeliverySendFlag.equals(sessdeliverySendFlag)){
			//�Ϸ��ύ
			int result = lifeService.addDeliverySendInfo(deliverySendInfo);
			if(result>0){
				request.setAttribute("result","�µ��ɹ�!");
			}else{
				request.setAttribute("result","�µ�ʧ��!");
			}
		}else{
			//�ظ��ύ
			System.out.println("�ظ��ύ��������");
		}
		
		return "/life/deliveryService";
	} */
	
	
	
	
	
	
	/*
	 * ��������
	 */
	//�����������
	@RequestMapping(value="/5",method=RequestMethod.GET)
	public String goHouseRent(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			currentPage="1";
		}
		request.setAttribute("rentPage",lifeService.getRentInfo(Integer.valueOf(currentPage),10));
		return "/life/houseRent";
	}
	
	//����������ϸ��Ϣ
	@RequestMapping(value="/5/1",method=RequestMethod.GET)
	public String goHouseRentDetail(HttpServletRequest request){
		String rentId = request.getParameter("rentId");
		HouseRentInfo houseRentInfo = lifeService.getRentDetail(Integer.valueOf(rentId));
		request.setAttribute("houseRentInfo",houseRentInfo);
		try {
			request.setAttribute("imgs",DivideImgSrc.divideSrc(houseRentInfo.getRentPhoto()));//��ͼƬ�鴫��ȥ
		} catch (Exception e) {
			System.out.println("������Ϣ����ͼƬ");
		}
		return "/life/houseInfoDetail";
	}
	//����������Ϣ���
	@RequestMapping(value="/5/2",method=RequestMethod.GET)
	public String goWriteRentInfo(HttpServletRequest request){
		return "/life/sendRentInfo";
	}
	//���������Ϣ
	@RequestMapping(value="/5/3",method=RequestMethod.POST)
	public String addHouseRentInfo(@RequestParam("img") MultipartFile img[],HttpServletRequest request,HouseRentInfo houseRentInfo){
		//��ֹ���ظ��ύ
		String reqrentFlag = request.getParameter("rentFlag");
		HttpSession session = request.getSession();
		String sessrentFlag = (String) session.getAttribute("rentFlag");
		session.removeAttribute("rentFlag");
		if(reqrentFlag.equals(sessrentFlag)){
			//�ύ�Ϸ�
			int result = lifeService.addRentInfo(houseRentInfo,img);
			if(result>0){
				request.setAttribute("result","�����ɹ�!");
			}else{
				request.setAttribute("result","����ʧ��!");
			}
		}else{
			//�ظ��ύ
			System.out.println("�ظ����������Ϣ!!!");
		}
		return "redirect:/life/5";
	}
	
	
	/*
	 * ��Ҫ�ӵ�
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
	//��֤�ӵ����Ƿ�Ϸ����ҷ��ؿͻ���ϵ��ʽ
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
	
	//�����ӵ���ϵ��Ϣ
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
	
	//�ӵ��û���Ϣ��Ȩ���
	@RequestMapping(value="/6/3",method=RequestMethod.GET)
	public String goCheckGetUserInfo(HttpServletRequest request){
		return "/life/getOrderUserCheck";
	}
		
	//��ӽӵ��û���������Ϣ
	@RequestMapping(value="/6/4",method=RequestMethod.POST)
	public String checkGetOrderUserInfo(@RequestParam("img") MultipartFile img,HttpServletRequest request ,CheckGetOrderUserInfo checkGetOrderUserInfo){
		String reqcheckFlag = request.getParameter("checkFlag");
		HttpSession session = request.getSession();
		String sesscheckFlag = (String) session.getAttribute("checkFlag");
		session.removeAttribute("checkFlag");
		if(reqcheckFlag.equals(sesscheckFlag)){
			//�Ϸ��ύ
			int result = lifeService.addCheckUserInfo(checkGetOrderUserInfo,img);
			request.setAttribute("result", result);
		}else{
			//�ظ��ύ
			System.out.println("�ӵ��û������Ϣ�ظ��ύ");
		}
		return "/life/getOrderUserCheck";
	}
	
	
	
}
