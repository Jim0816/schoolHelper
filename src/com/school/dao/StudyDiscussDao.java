package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.studybeans.StudyDiscussInfo;
import com.school.utils.PageUtil;

@Repository
public class StudyDiscussDao {

	    @Resource  
	     private JdbcTemplate jdbcTemplate;  
         //�õ�ѧϰ������Ϣ��ÿҳ10������ʱ������
		 public PageUtil getStudyDiscussPage(int currentPage,int numPerPage){
			 //Ĭ�ϲ�ѯ�����е�ʮ����¼
			 String sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
				 		"studydiscussinfo as b where a.userId = b.writeDiscussId order by sendDiscussTime desc";
			 System.out.println(sql);
			 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);

			 return pageUtil;
		 }
		 //�õ��鿴������ǰ10���ļ�¼
		 public  List<Map<String, Object>> getStudyDiscussTop(){
			 String sql = "select * from studydiscussinfo order by discussSearchNum desc";
			 PageUtil pageUtil = new PageUtil(sql, 1, 10, jdbcTemplate);
			 return pageUtil.getResultList();
		 }
		 //�õ�ÿ��������ϸ��Ϣ,��������
		 public List<Map<String, Object>> getStudyDiscuss(int studyDiscussInfoId){
			 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
			 		"studydiscussinfo as b where a.userId = b.writeDiscussId and b.studyDiscussInfoId=?";
			 List<Map<String, Object>> discussInfo = jdbcTemplate.queryForList(sql,studyDiscussInfoId);
			 return discussInfo;
		 }
		 //�õ��û�������������Ϣ
		 public PageUtil getStudyDiscussInfo(int writeDiscussId,int currentPage,int numPerPage){
			 String sql="select *from studydiscussinfo where writeDiscussId="+writeDiscussId;
			 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
             return pageUtil;
		 }
		 //�õ�����������Ϣ
		 public PageUtil getStudyDiscussComment(int studyDiscussInfoId,int currentPage,int numPerPage){
			 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
				 		"studydiscusscomment as c where a.userId = c.studyCommenterId and c.studyDiscussInfoId="+studyDiscussInfoId+" order by studyCommentTime desc";
			 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
             return pageUtil;
		 }
		 //�����û����е�����
		 public int addDiscussComment(int studyDiscussInfoId , int studyCommenterId , String studyCommentContent){
			 String sql = "insert into studydiscusscomment(studyDiscussInfoId,studyCommenterId,studyCommentContent) " +
			 		"values(?,?,?)";
			 return jdbcTemplate.update(sql,studyDiscussInfoId,studyCommenterId,studyCommentContent);
		 }
		 //�޸����ӷ��ʵĴ���
		 public int updateDiscussInfoSearchNum(int studyDiscussInfoId,int discussSearchNum){
			 String sql = "update studydiscussinfo set discussSearchNum=? where studyDiscussInfoId=?";
			 return jdbcTemplate.update(sql,discussSearchNum,studyDiscussInfoId);
		 }
		 //�ϴ���ѧϰ���۵�����
		 public int addDiscussInfo(StudyDiscussInfo studyDiscussInfo){
			 String sql = "insert into studydiscussinfo(writeDiscussId,discussTitle,discussContent,discussPhoto,discussSearchNum) " +
			 		"values(?,?,?,?,?)";
			 return jdbcTemplate.update(sql,studyDiscussInfo.getWriteDiscussId(),studyDiscussInfo.getDiscussTitle(),
					 studyDiscussInfo.getDiscussContent(),studyDiscussInfo.getDiscussPhoto(),studyDiscussInfo.getDiscussSearchNum());
		 }
		 //ɾ������
		 public int deleteDiscuss(int studyDiscussInfoId){
			 String sql="delete from studydiscussinfo where studyDiscussInfoId=?";
			 return jdbcTemplate.update(sql, studyDiscussInfoId);
		 }
}
