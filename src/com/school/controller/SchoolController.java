package com.school.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.school.service.SchoolService;
@Controller
@RequestMapping("/schoolState")
public class SchoolController {

	@Autowired
	private SchoolService schoolService;
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String toSchoolNews(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		session.setAttribute("schoolNews", schoolService.getAllNews());
		session.setAttribute("schoolReform", schoolService.getAllReform());
		session.setAttribute("schoolVideo", schoolService.getAllVedio());
		return "/schoolState/schoolNews";
	}
	
	@RequestMapping(value="/2",method=RequestMethod.GET)
	public String toSchoolVote(){
		return "/schoolState/schoolVote";
	}
	
	@RequestMapping(value="/3",method=RequestMethod.GET)
	public String toSchoolReform(HttpServletRequest request){
		//ÿҳ�ļ�¼���ʮ��
		//��һ�ν�����ҳʱ��Ĭ����ҳΪ������Ƹ��֪ͨ
		int type = 1,page = 1;
		String type1 = request.getParameter("type");
		String nowPage = request.getParameter("page");
		if(nowPage!=null){
			page = Integer.valueOf(nowPage);
		}
		if(type1!=null){
			type = Integer.valueOf(type1);
		}
		
		if(type == 1){
			//��ѯ������Ƹ��֪ͨ
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 1));
			request.setAttribute("reformType", "1");
		}else if(type == 2){
			//��ѯ�������֪ͨ
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 2));
			request.setAttribute("reformType", "2");
		}else if(type == 3){
			//��ѯУ��ѶϢ��֪ͨ
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 3));
			request.setAttribute("reformType", "3");
		}else if(type == 4){
			//��ѯע��������֪ͨ
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 4));
			request.setAttribute("reformType", "4");
		}else{
			//Ĭ�Ͻ�����ҳ����ѯ������Ƹ��֪ͨ
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 1));
			request.setAttribute("reformType", "1");
		}
		return "/schoolState/schoolReform";
	}
	
	//������Ƶ������
	@RequestMapping(value="/videoPlayer",method=RequestMethod.GET)
	public String toVideoPlayer(HttpServletRequest request){
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("src", request.getParameter("src"));
		return "/schoolState/videoPlayer";
	}
	
}
