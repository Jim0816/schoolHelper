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
	 * ��ͨ�û���Ϣ
	*/
	
	//��¼ҳ��
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
			//��¼ʧ�ܣ�ת���¼ʧ��ҳ��
			request.setAttribute("page",page);
			return "/userInfoManager/loginFail";
		}else{
			//��¼�ɹ���ת����ҳ�����ҽ���Session
			HttpSession session = request.getSession(true);
			session.setAttribute("user", findUser);
			String url ="";
			if(page.equals("a1")){
				//�̳���ҳ
				url = "/market/First";
			}else if(page.equals("a2")){
				//��Ʒ����
				url = "/market/showAllGoods";
			}else if(page.equals("a3")){
				//��Ʒ�鿴
				url = "/market/lookGoods";
			}else if(page.equals("a4")){
				//��������
				url = "/market/showAllShops";
			}else if(page.equals("a5")){
				//���̲鿴
				url = "/market/lookShop";
			}else if(page.equals("a6")){
				//����������Ʒ
				url = "/market/shopAllGoods";
			}else if(page.equals("b1")){
				//�ɷѴ���
				url = "/life/electronic";
			}else if(page.equals("b2")){
				//��ˮ����
				url = "/life/orderWater";
			}else if(page.equals("b3")){
				//��ҵ����
				url = "/life/applyRepair";
			}else if(page.equals("b4")){
				//��ݷ���(Ĭ����ҳΪ��ݴ���)
				url = "/life/deliveryService";
			}else if(page.equals("b5")){
				//��������
				url = "redirect:/life/5";
			}else if(page.equals("b6")){
				//��Ҫ�ӵ�
				url = "redirect:/life/6";
			}else if(page.equals("c1")){
				//ѧϰ������ѧϰ������ҳ��
				url = "/studyCenter/studyCenter";
			}else if(page.equals("c2")){
				//������̳
				url = "/studyCenter/discuss";
			}else if(page.equals("c21")){
				//������̳������
				url = "/studyCenter/discussArea";
			}else if(page.equals("c3")){
				//��Դ����
				url = "/studyCenter/shareData";
			}else if(page.equals("c31")){
				//��Դ������
				url = "/studyCenter/shareDataComment";
			}else if(page.equals("c4")){
				//�ɼ���ѯ
				url = "/studyCenter/lookScore";
			}else if(page.equals("d1")){
				//У԰��Ѷ
				url = "/schoolState/schoolNews";
			}else if(page.equals("d2")){
				//���޸Ĵ�
				url = "/schoolState/schoolVote";
			}else if(page.equals("d3")){
				//У԰֪ͨ
				url = "/schoolState/schoolReform";
			}else if(page.equals("e1")){
				//��������
				url = "/market/First";
			}
			return url;
		}	
	}
	
	//ע��ҳ��
	@RequestMapping(value="/user/regist",method=RequestMethod.GET)
	public String goRegist(HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		request.setAttribute("pageSource",pageSource);
		return "/userInfoManager/regist";
	}
	//ע�����
	@RequestMapping(value="/user/registCheck",method=RequestMethod.POST)
	public String registCheck(User user ,HttpServletRequest request){
		int newId = personService.registUser(user);
		String page = request.getParameter("page");
		if(newId==0){
			//ע��ʧ��
			return "/userInfoManager/registFail";
		}else{
			//ע��ɹ�
			request.setAttribute("userNewId", newId);
			request.setAttribute("page",page);
			return "/userInfoManager/registSuccess";
		}
	}
		
	//�һ�����ҳ��
	@RequestMapping(value="/user/findCode",method=RequestMethod.GET)
	public String findCode(HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		request.setAttribute("pageSource",pageSource);
		return "/userInfoManager/findCode";
	}
	//�޸�����(���޸�������Ϣ,�Ѿ���װ)
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
		
	//ע������
	@RequestMapping(value="/user/exit",method=RequestMethod.GET)
	public String goExit(HttpServletRequest request){
		String page = request.getParameter("pageSource");
		String url="";
		if(page.equals("a1")){
			//�̳���ҳ
			url = "/market/First";
		}else if(page.equals("a2")){
			//��Ʒ����
			url = "/market/showAllGoods";
		}else if(page.equals("a3")){
			//��Ʒ�鿴
			url = "/market/lookGoods";
		}else if(page.equals("a4")){
			//��������
			url = "/market/showAllShops";
		}else if(page.equals("a5")){
			//���̲鿴
			url = "/market/lookShop";
		}else if(page.equals("a6")){
			//����������Ʒ
			url = "/market/shopAllGoods";
		}else if(page.equals("b1")){
			//��������
			url = "/life/electronic";
		}else if(page.equals("b2")){
			//��ˮ����
			url = "/life/orderWater";
		}else if(page.equals("b3")){
			//��ҵ����
			url = "/life/applyRepair";
		}else if(page.equals("b4")){
			//��ݷ���(Ĭ����ҳΪ��ݴ���)
			url = "/life/deliveryService";
		}else if(page.equals("b5")){
			//��������
			url = "redirect:/life/5";
		}else if(page.equals("b6")){
			//��Ҫ�ӵ�
			url = "redirect:/life/6";
		}else if(page.equals("c1")){
			//ѧϰ����
			url = "/studyCenter/studyCenter";
		}else if(page.equals("c2")){
			//������̳
			url = "/studyCenter/discuss";
		}else if(page.equals("c21")){
			//������̳������
			url = "/studyCenter/discussArea";
		}else if(page.equals("c3")){
			//��Դ����
			url = "/studyCenter/shareData";
		}else if(page.equals("c31")){
			//��Դ����
			url = "/studyCenter/shareDataComment";
		}else if(page.equals("c4")){
			//�ɼ���ѯ
			url = "/studyCenter/lookScore";
		}else if(page.equals("d1")){
			//У԰��̬
			url = "/schoolState/schoolNews";
		}else if(page.equals("d2")){
			//У԰��̬
			url = "/schoolState/schoolVote";
		}else if(page.equals("d3")){
			//У԰��̬
			url = "/schoolState/schoolReform";
		}else if(page.equals("e1")){
			//��������
			url = "/market/First";
		}
		request.getSession().removeAttribute("user");
		return url;
	}
	//�����û���������(��ҳ)
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
	//�����û�����
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
				//��Ʒ����
				request.setAttribute("direct","goodsOrder");
				session.setAttribute("myGoodsOrder", personService.getUserOrder(currentPage, 10, user.getUserId()));
			}else{
				//���񶩵�
				request.setAttribute("direct","serviceOrder");
			}	
			Url="userInfoManager/myOrder";
		}
		return Url;
	}
	//�����û����ﳵ
	@RequestMapping(value="/1/3",method=RequestMethod.GET)
	public String goMyCar(HttpServletRequest request){
		String url = "market/First";
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null){
			//������ҳ
			String pageSource = request.getParameter("pageSource");
			url = "redirect:/person/user/login?pageSource="+pageSource;
		}else{
			url = "redirect:/market/1/15";
		}
		return url;
	}
	//�����û����ӹ�������
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
	//�����û���Դ�����������
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
	//�û������Լ�����
	@RequestMapping(value="/1/6",method=RequestMethod.GET)
	public String goMyShop(HttpServletRequest request){
		String pageSource = request.getParameter("pageSource");
		return "redirect:/market/1/2?pageSource="+pageSource;
	}
	
	//ɾ���û�����
	@RequestMapping(value="/2/1",method=RequestMethod.GET)
	public String deleteMyDiscuss(HttpServletRequest request){
		String studyDiscussInfoId = request.getParameter("d");
		studyService.deleteDiscussInfo(Integer.valueOf(studyDiscussInfoId));
		return "redirect:/person/1/4";
	}
	//ɾ���������Դ
	@RequestMapping(value="/2/2",method=RequestMethod.GET)
	public String deleteMyShareData(HttpServletRequest request){
		String dataShareInfoId = request.getParameter("d");
		studyService.deleteDataInfo(Integer.valueOf(dataShareInfoId));
		return "redirect:/person/1/5";
	}
	//�����������
	@RequestMapping(value="/us",method=RequestMethod.GET)
	public String goAboutUs(HttpServletRequest request){
		return "aboutUs/aboutUs";
	}
}
