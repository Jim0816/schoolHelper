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
	//ѧϰ��������ҳ��
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String goStudyCenter(HttpServletRequest request){
		
		HttpSession session = request.getSession(true);
		session.setAttribute("scoreLink",studyCenter.getScoreLink());
		session.setAttribute("twelveShareData",studyCenter.getTwelveShareData());
		return "/studyCenter/studyCenter";
	}
	
	/*
	 * ѧϰ������̳
	 * 
	 */
	//������̳
	@RequestMapping(value="/2",method=RequestMethod.GET)
	public String goDiscuss(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataTypeΪ0��ʾ��ѯ���м�¼�е�ʮ��
			currentPage = "1";
		}
		HttpSession session = request.getSession();
		//��������ǰʮ��
		session.setAttribute("tenTopDiscuss",studyCenter.getDisscussSearchTop());
		//�������ӷ�ҳ����
		session.setAttribute("discussPage",studyCenter.getAllDisscuss(Integer.valueOf(currentPage),10));
		return "/studyCenter/discuss";
	}
	//������������ҳ��
	@RequestMapping(value="/2/1",method=RequestMethod.GET)
	public String discussComment(HttpServletRequest request){
		//��ȡ�鿴�ĸ�����Դid
		String disscussId = request.getParameter("disscussId");
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataTypeΪ0��ʾ��ѯ���м�¼�е�ʮ��
			currentPage = "1";
		}
		//��ǰ̨����ķ�����Դ���û���Ϣ���û����۵�
		HttpSession session = request.getSession(true);
		session.setAttribute("oneDisscussInfo",studyCenter.getDisscussInfo(Integer.valueOf(disscussId)));
		session.setAttribute("oneDisscussCommentPage",studyCenter.getDisscussComment(Integer.valueOf(disscussId), Integer.valueOf(currentPage),10));
		return "/studyCenter/discussArea";
	}
	//�û������ӽ�������
	@RequestMapping(value="/2/2",method=RequestMethod.POST)
	public String UserDisscussComment(HttpServletRequest request){
		//��ֹ���ظ��ύ
		String reqdisscussCommentFlag = request.getParameter("disscussCommentFlag");
		HttpSession session = request.getSession();
		String sessdisscussCommentFlag = (String) session.getAttribute("disscussCommentFlag");
		session.removeAttribute("disscussCommentFlag");
		     
		if(reqdisscussCommentFlag.equals(sessdisscussCommentFlag)){
			//��ȡ�鿴�ĸ�����Դid
			String studyDiscussInfoId = request.getParameter("studyDiscussInfoId");
			String studyCommenterId = request.getParameter("studyCommenterId");
			String studyCommentContent = request.getParameter("studyCommentContent");
			int result = studyCenter.userWriteDisscussComment(Integer.valueOf(studyDiscussInfoId), Integer.valueOf(studyCommenterId), studyCommentContent);
			if(result>0){
				//���۳ɹ�
				//��ǰ̨����ķ�����Դ���û���Ϣ���û����۵�
				session.setAttribute("oneDisscussInfo",studyCenter.getDisscussInfo(Integer.valueOf(studyDiscussInfoId)));
				session.setAttribute("oneDisscussCommentPage",studyCenter.getDisscussComment(Integer.valueOf(studyDiscussInfoId), 1,10));
				System.out.println("���������Ѿ�����");
			}else{
				//����ʧ��,������
				System.out.println("�������۲���ʧ��");
			}   
		}else{
			System.out.println("���������ظ�����");
		}	
		return "/studyCenter/discussArea";
	}
	
	//�û���������
	@RequestMapping(value="/2/3",method=RequestMethod.POST)
	public String writeNewDisscuss(HttpServletRequest request,StudyDiscussInfo studyDiscussInfo){
		//��ֹ���ظ��ύ
		String reqSubmitFlag= request.getParameter("submitFlag");
		HttpSession session = request.getSession();
		String sessSubmitFlag = (String) session.getAttribute("submitFlag");
		session.removeAttribute("submitFlag");
		
		if(reqSubmitFlag.equals(sessSubmitFlag)){
			//׼���ύ����
			int result = studyCenter.addDiscussInfo(studyDiscussInfo);
			if(result>0){
				//��ӳɹ�
				System.out.println("���������ɹ��ɹ�");
				session.setAttribute("discussPage",studyCenter.getAllDisscuss(1,10));
				request.setAttribute("writeDisResult", "����ɹ�");
			}else{
				//���ʧ��
				System.out.println("��������ʧ��");
				request.setAttribute("writeDisResult", "����ʧ��");
			}
		}else{
			//�ظ��ύ
			System.out.println("�ظ��ύ�������룡");
		}
		return "/studyCenter/discuss";	
	}
	/*
	 * ��Դ����
	 * 
	*/
	//������Դչʾҳ��
	@RequestMapping(value="/3",method=RequestMethod.GET)
	public String goShareData(HttpServletRequest request){
		String dataType = request.getParameter("dataType");
		if(dataType==null || dataType.equals("")){
			//dataTypeΪ0��ʾ��ѯ���м�¼�е�ʮ��
			dataType = "0";
		}
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataTypeΪ0��ʾ��ѯ���м�¼�е�ʮ��
			currentPage = "1";
		}
		HttpSession session = request.getSession();
		session.setAttribute("dataType", dataType);
		session.setAttribute("twelveShareData",studyCenter.getTwelveShareData());
		session.setAttribute("dataPage",studyCenter.getShareDataPage(Integer.valueOf(currentPage), 10, dataType));
		return "/studyCenter/shareData";
	}
	//������Դ����ҳ��
	@RequestMapping(value="/3/1",method=RequestMethod.GET)
	public String ShareDataComment(HttpServletRequest request){
		//��ȡ�鿴�ĸ�����Դid
		String dataId = request.getParameter("dataId");
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null || currentPage.equals("")){
			//dataTypeΪ0��ʾ��ѯ���м�¼�е�ʮ��
			currentPage = "1";
		}
		//��ǰ̨����ķ�����Դ���û���Ϣ���û����۵�
		HttpSession session = request.getSession(true);
		session.setAttribute("oneDataInfo",studyCenter.getDataInfo(Integer.valueOf(dataId)));
		session.setAttribute("oneDataInfoCommentPage",studyCenter.getDataComment(Integer.valueOf(dataId), Integer.valueOf(currentPage),10));
		return "/studyCenter/shareDataComment";
	}
	//�û���������
	@RequestMapping(value="/3/2",method=RequestMethod.POST)
	public String UserDataComment(HttpServletRequest request){
		//��ֹ���ظ��ύ
		String reqUUID = request.getParameter("uuid");
		HttpSession session = request.getSession();
		String sessUUID = (String) session.getAttribute("uuid");
		session.removeAttribute("uuid");
		     
		if(reqUUID.equals(sessUUID)){
			//��ȡ�鿴�ĸ�����Դid
			String dataId = request.getParameter("dataId");
			String commenterId = request.getParameter("commenterId");
			String commentContent = request.getParameter("commentContent");
			int result = studyCenter.userDataComment(Integer.valueOf(dataId), Integer.valueOf(commenterId), commentContent);
			if(result>0){
				//���۳ɹ�
				//��ǰ̨����ķ�����Դ���û���Ϣ���û����۵�
				session.setAttribute("oneDataInfo",studyCenter.getDataInfo(Integer.valueOf(dataId)));
				session.setAttribute("oneDataInfoCommentPage",studyCenter.getDataComment(Integer.valueOf(dataId), 1,10));
			}else{
				//����ʧ��,������
			}
		    System.out.println("�Ѿ�����");
		}else{
			System.out.println("�ظ�����");
		}	
		return "/studyCenter/shareDataComment";
	}
	
	//�û��������أ��޸���������
	@RequestMapping(value="/3/3",method=RequestMethod.GET)
	public String DataLoad(HttpServletRequest request,HttpServletResponse response){
		//��ֹ���ظ��ύ
		String dataUrl = request.getParameter("dataUrl");
		int loadNums = 1;
		String dataId = request.getParameter("dataId");
		String loadNum = request.getParameter("loadNum");
		if(!loadNum.equals("0")){
			loadNums = Integer.valueOf(loadNum)+1;//���ڽ��������޸ģ���ʾ�޸ĺ������
		}
		int result = studyCenter.updateDataLoadNum(Integer.valueOf(dataId), loadNums);
		if(result>0){
			//��ʾ�޸ĳɹ�
			System.out.println("���ش������³ɹ���");
			PrintWriter printWriter = null;
			try {
				printWriter = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
		    printWriter.print(loadNums);
		}else{
			//��ʾ�޸�ʧ��
			System.out.println("���ش�������ʧ�ܣ�");
		}
	
	return "redirect:"+dataUrl;	
	}
	//�û�������Դ�����ϴ�
	@RequestMapping(value="/3/4",method=RequestMethod.POST)
	public String uploadData(HttpServletRequest request,DataShareInfo dataShareInfo){
		//��ֹ���ظ��ύ
		String reqUpload = request.getParameter("upload");
		HttpSession session = request.getSession();
		String sessUpload = (String) session.getAttribute("upload");
		session.removeAttribute("upload");
		if(reqUpload.equals(sessUpload)){
			//׼���ύ����
			int result = studyCenter.addDataInfo(dataShareInfo);
			if(result>0){
				//��ӳɹ�
				System.out.println("�ϴ���Դ�ɹ�");
				request.setAttribute("uploadResult", "�ϴ��ɹ�");
			}else{
				//���ʧ��
				System.out.println("�ϴ���Դʧ��");
				request.setAttribute("uploadResult", "�ϴ�ʧ��");
			}
		}else{
			//�ظ��ύ
			System.out.println("�ظ��ύ��");
		}
		return "/studyCenter/shareData";	
	}
	
	
		
		
		
		
		
	//�ɼ���ѯ
	@RequestMapping(value="/4",method=RequestMethod.GET)
	public String goQueryScore(){
		
		return "/studyCenter/lookScore";
	}
}
