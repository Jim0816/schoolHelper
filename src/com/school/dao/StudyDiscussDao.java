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
         //得到学习讨论信息，每页10条，按时间排序
		 public PageUtil getStudyDiscussPage(int currentPage,int numPerPage){
			 //默认查询所有中的十条记录
			 String sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
				 		"studydiscussinfo as b where a.userId = b.writeDiscussId order by sendDiscussTime desc";
			 System.out.println(sql);
			 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);

			 return pageUtil;
		 }
		 //得到查看次数排前10条的记录
		 public  List<Map<String, Object>> getStudyDiscussTop(){
			 String sql = "select * from studydiscussinfo order by discussSearchNum desc";
			 PageUtil pageUtil = new PageUtil(sql, 1, 10, jdbcTemplate);
			 return pageUtil.getResultList();
		 }
		 //得到每条帖子详细信息,不含评论
		 public List<Map<String, Object>> getStudyDiscuss(int studyDiscussInfoId){
			 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
			 		"studydiscussinfo as b where a.userId = b.writeDiscussId and b.studyDiscussInfoId=?";
			 List<Map<String, Object>> discussInfo = jdbcTemplate.queryForList(sql,studyDiscussInfoId);
			 return discussInfo;
		 }
		 //得到用户的所有帖子信息
		 public PageUtil getStudyDiscussInfo(int writeDiscussId,int currentPage,int numPerPage){
			 String sql="select *from studydiscussinfo where writeDiscussId="+writeDiscussId;
			 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
             return pageUtil;
		 }
		 //得到帖子评论信息
		 public PageUtil getStudyDiscussComment(int studyDiscussInfoId,int currentPage,int numPerPage){
			 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
				 		"studydiscusscomment as c where a.userId = c.studyCommenterId and c.studyDiscussInfoId="+studyDiscussInfoId+" order by studyCommentTime desc";
			 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
             return pageUtil;
		 }
		 //插入用户进行的评论
		 public int addDiscussComment(int studyDiscussInfoId , int studyCommenterId , String studyCommentContent){
			 String sql = "insert into studydiscusscomment(studyDiscussInfoId,studyCommenterId,studyCommentContent) " +
			 		"values(?,?,?)";
			 return jdbcTemplate.update(sql,studyDiscussInfoId,studyCommenterId,studyCommentContent);
		 }
		 //修改帖子访问的次数
		 public int updateDiscussInfoSearchNum(int studyDiscussInfoId,int discussSearchNum){
			 String sql = "update studydiscussinfo set discussSearchNum=? where studyDiscussInfoId=?";
			 return jdbcTemplate.update(sql,discussSearchNum,studyDiscussInfoId);
		 }
		 //上传的学习讨论的帖子
		 public int addDiscussInfo(StudyDiscussInfo studyDiscussInfo){
			 String sql = "insert into studydiscussinfo(writeDiscussId,discussTitle,discussContent,discussPhoto,discussSearchNum) " +
			 		"values(?,?,?,?,?)";
			 return jdbcTemplate.update(sql,studyDiscussInfo.getWriteDiscussId(),studyDiscussInfo.getDiscussTitle(),
					 studyDiscussInfo.getDiscussContent(),studyDiscussInfo.getDiscussPhoto(),studyDiscussInfo.getDiscussSearchNum());
		 }
		 //删除帖子
		 public int deleteDiscuss(int studyDiscussInfoId){
			 String sql="delete from studydiscussinfo where studyDiscussInfoId=?";
			 return jdbcTemplate.update(sql, studyDiscussInfoId);
		 }
}
