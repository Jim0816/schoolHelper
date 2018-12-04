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

import com.school.domain.studybeans.DataShareInfo;
import com.school.domain.studybeans.StudyDiscussInfo;
import com.school.service.StudyService;

@Controller
@RequestMapping("/studyCenter")

public class StudyController {
	@Autowired
	private StudyService studyCenter;
	//学习大厅（首页）
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String goStudyCenter(HttpServletRequest request){
		
		HttpSession session = request.getSession(true);
		session.setAttribute("scoreLink",studyCenter.getScoreLink());
		session.setAttribute("twelveShareData",studyCenter.getTwelveShareData());
		return "/studyCenter/studyCenter";
	}
	
	/*
	 * 学习交流论坛
	 * 
	 */
	//交流论坛
	@RequestMapping(value="/2",method=RequestMethod.GET)
	public String goDiscuss(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataType为0表示查询所有记录中的十条
			currentPage = "1";
		}
		HttpSession session = request.getSession();
		//热搜帖子前十条
		session.setAttribute("tenTopDiscuss",studyCenter.getDisscussSearchTop());
		//所有帖子分页操作
		session.setAttribute("discussPage",studyCenter.getAllDisscuss(Integer.valueOf(currentPage),10));
		return "/studyCenter/discuss";
	}
	//进入帖子评论页面
	@RequestMapping(value="/2/1",method=RequestMethod.GET)
	public String discussComment(HttpServletRequest request){
		//获取查看的该条资源id
		String disscussId = request.getParameter("disscussId");
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataType为0表示查询所有记录中的十条
			currentPage = "1";
		}
		//向前台传入改分享资源的用户信息、用户评论等
		HttpSession session = request.getSession(true);
		session.setAttribute("oneDisscussInfo",studyCenter.getDisscussInfo(Integer.valueOf(disscussId)));
		session.setAttribute("oneDisscussCommentPage",studyCenter.getDisscussComment(Integer.valueOf(disscussId), Integer.valueOf(currentPage),10));
		return "/studyCenter/discussArea";
	}
	//用户对帖子进行评论
	@RequestMapping(value="/2/2",method=RequestMethod.POST)
	public String UserDisscussComment(HttpServletRequest request){
		//防止表单重复提交
		String reqdisscussCommentFlag = request.getParameter("disscussCommentFlag");
		HttpSession session = request.getSession();
		String sessdisscussCommentFlag = (String) session.getAttribute("disscussCommentFlag");
		session.removeAttribute("disscussCommentFlag");
		     
		if(reqdisscussCommentFlag.equals(sessdisscussCommentFlag)){
			//获取查看的该条资源id
			String studyDiscussInfoId = request.getParameter("studyDiscussInfoId");
			String studyCommenterId = request.getParameter("studyCommenterId");
			String studyCommentContent = request.getParameter("studyCommentContent");
			int result = studyCenter.userWriteDisscussComment(Integer.valueOf(studyDiscussInfoId), Integer.valueOf(studyCommenterId), studyCommentContent);
			if(result>0){
				//评论成功
				//向前台传入改分享资源的用户信息、用户评论等
				session.setAttribute("oneDisscussInfo",studyCenter.getDisscussInfo(Integer.valueOf(studyDiscussInfoId)));
				session.setAttribute("oneDisscussCommentPage",studyCenter.getDisscussComment(Integer.valueOf(studyDiscussInfoId), 1,10));
				System.out.println("帖子评论已经插入");
			}else{
				//评论失败,待处理
				System.out.println("帖子评论插入失败");
			}   
		}else{
			System.out.println("帖子评论重复插入");
		}	
		return "/studyCenter/discussArea";
	}
	
	//用户发帖操作
	@RequestMapping(value="/2/3",method=RequestMethod.POST)
	public String writeNewDisscuss(HttpServletRequest request,StudyDiscussInfo studyDiscussInfo){
		//防止表单重复提交
		String reqSubmitFlag= request.getParameter("submitFlag");
		HttpSession session = request.getSession();
		String sessSubmitFlag = (String) session.getAttribute("submitFlag");
		session.removeAttribute("submitFlag");
		
		if(reqSubmitFlag.equals(sessSubmitFlag)){
			//准备提交操作
			int result = studyCenter.addDiscussInfo(studyDiscussInfo);
			if(result>0){
				//添加成功
				System.out.println("发表新帖成功成功");
				session.setAttribute("discussPage",studyCenter.getAllDisscuss(1,10));
				request.setAttribute("writeDisResult", "发表成功");
			}else{
				//添加失败
				System.out.println("发表新帖失败");
				request.setAttribute("writeDisResult", "发表失败");
			}
		}else{
			//重复提交
			System.out.println("重复提交发表申请！");
		}
		return "/studyCenter/discuss";	
	}
	/*
	 * 资源共享
	 * 
	*/
	//进入资源展示页面
	@RequestMapping(value="/3",method=RequestMethod.GET)
	public String goShareData(HttpServletRequest request){
		String dataType = request.getParameter("dataType");
		if(dataType==null || dataType.equals("")){
			//dataType为0表示查询所有记录中的十条
			dataType = "0";
		}
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataType为0表示查询所有记录中的十条
			currentPage = "1";
		}
		HttpSession session = request.getSession();
		session.setAttribute("dataType", dataType);
		session.setAttribute("twelveShareData",studyCenter.getTwelveShareData());
		session.setAttribute("dataPage",studyCenter.getShareDataPage(Integer.valueOf(currentPage), 10, dataType));
		return "/studyCenter/shareData";
	}
	//进入资源评论页面
	@RequestMapping(value="/3/1",method=RequestMethod.GET)
	public String ShareDataComment(HttpServletRequest request){
		//获取查看的该条资源id
		String dataId = request.getParameter("dataId");
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataType为0表示查询所有记录中的十条
			currentPage = "1";
		}
		//向前台传入改分享资源的用户信息、用户评论等
		HttpSession session = request.getSession(true);
		session.setAttribute("oneDataInfo",studyCenter.getDataInfo(Integer.valueOf(dataId)));
		session.setAttribute("oneDataInfoCommentPage",studyCenter.getDataComment(Integer.valueOf(dataId), Integer.valueOf(currentPage),10));
		return "/studyCenter/shareDataComment";
	}
	//用户进行评论
	@RequestMapping(value="/3/2",method=RequestMethod.POST)
	public String UserDataComment(HttpServletRequest request){
		//防止表单重复提交
		String reqUUID = request.getParameter("uuid");
		HttpSession session = request.getSession();
		String sessUUID = (String) session.getAttribute("uuid");
		session.removeAttribute("uuid");
		     
		if(reqUUID.equals(sessUUID)){
			//获取查看的该条资源id
			String dataId = request.getParameter("dataId");
			String commenterId = request.getParameter("commenterId");
			String commentContent = request.getParameter("commentContent");
			int result = studyCenter.userDataComment(Integer.valueOf(dataId), Integer.valueOf(commenterId), commentContent);
			if(result>0){
				//评论成功
				//向前台传入改分享资源的用户信息、用户评论等
				session.setAttribute("oneDataInfo",studyCenter.getDataInfo(Integer.valueOf(dataId)));
				session.setAttribute("oneDataInfoCommentPage",studyCenter.getDataComment(Integer.valueOf(dataId), 1,10));
			}else{
				//评论失败,待处理
			}
		    System.out.println("已经插入");
		}else{
			System.out.println("重复插入");
		}	
		return "/studyCenter/shareDataComment";
	}
	
	//用户进行下载，修改下载数量
	@RequestMapping(value="/3/3",method=RequestMethod.GET)
	public String DataLoad(HttpServletRequest request,HttpServletResponse response){
		//防止表单重复提交
		String dataUrl = request.getParameter("dataUrl");
		int loadNums = 1;
		String dataId = request.getParameter("dataId");
		String loadNum = request.getParameter("loadNum");
		if(!loadNum.equals("0")){
			loadNums = Integer.valueOf(loadNum)+1;//现在进行数量修改，表示修改后的数量
		}
		int result = studyCenter.updateDataLoadNum(Integer.valueOf(dataId), loadNums);
		if(result>0){
			//表示修改成功
			System.out.println("下载次数更新成功！");
			PrintWriter printWriter = null;
			try {
				printWriter = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
		    printWriter.print(loadNums);
		}else{
			//表示修改失败
			System.out.println("下载次数更新失败！");
		}
	
	return "redirect:"+dataUrl;	
	}
	//用户进行资源分享上传
	@RequestMapping(value="/3/4",method=RequestMethod.POST)
	public String uploadData(HttpServletRequest request,DataShareInfo dataShareInfo){
		//防止表单重复提交
		String reqUpload = request.getParameter("upload");
		HttpSession session = request.getSession();
		String sessUpload = (String) session.getAttribute("upload");
		session.removeAttribute("upload");
		if(reqUpload.equals(sessUpload)){
			//准备提交操作
			int result = studyCenter.addDataInfo(dataShareInfo);
			if(result>0){
				//添加成功
				System.out.println("上传资源成功");
				request.setAttribute("uploadResult", "上传成功");
			}else{
				//添加失败
				System.out.println("上传资源失败");
				request.setAttribute("uploadResult", "上传失败");
			}
		}else{
			//重复提交
			System.out.println("重复提交！");
		}
		return "/studyCenter/shareData";	
	}
	
	
		
		
		
		
		
	//成绩查询
	@RequestMapping(value="/4",method=RequestMethod.GET)
	public String goQueryScore(){
		
		return "/studyCenter/lookScore";
	}
}
