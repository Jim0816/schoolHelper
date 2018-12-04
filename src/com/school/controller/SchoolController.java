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
		//每页的记录最多十条
		//第一次进入首页时，默认首页为考试招聘类通知
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
			//查询考试招聘类通知
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 1));
			request.setAttribute("reformType", "1");
		}else if(type == 2){
			//查询活动竞赛类通知
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 2));
			request.setAttribute("reformType", "2");
		}else if(type == 3){
			//查询校历讯息类通知
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 3));
			request.setAttribute("reformType", "3");
		}else if(type == 4){
			//查询注意事项类通知
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 4));
			request.setAttribute("reformType", "4");
		}else{
			//默认进入首页，查询考试招聘类通知
			HttpSession session = request.getSession(true);
			session.setAttribute("schoolPartReform", schoolService.getReformByType(page, 10, 1));
			request.setAttribute("reformType", "1");
		}
		return "/schoolState/schoolReform";
	}
	
	//跳入视频播放器
	@RequestMapping(value="/videoPlayer",method=RequestMethod.GET)
	public String toVideoPlayer(HttpServletRequest request){
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("src", request.getParameter("src"));
		return "/schoolState/videoPlayer";
	}
	
}
