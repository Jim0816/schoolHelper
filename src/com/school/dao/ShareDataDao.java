package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.studybeans.DataShareInfo;
import com.school.utils.PageUtil;
@Repository
public class ShareDataDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //得到分享资料，每页10条，按时间排序
	 public PageUtil getShareDataPage(int currentPage,int numPerPage,String dataType,int QueryWay){
		 //默认查询所有中的十条记录
		 String sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
			 		"learningdatashareinfo as b where a.userId = b.shareUserId order by shareDate desc";
		 //按条件查询，每页十条
		 if(!dataType.equals("0")){
			 if(QueryWay==1){
				 //模糊查询，查询学科所属类型
				 sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
					 		"learningdatashareinfo as b where a.userId = b.shareUserId and dataType like '"+dataType+"%' order by shareDate desc";
			 }else{
				//直接查询学科
				 sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
					 		"learningdatashareinfo as b where a.userId = b.shareUserId and dataType='"+dataType+"' order by shareDate desc";
			 } 
		 }
		 System.out.println("sql:"+sql);
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //得到下载次数排前12条的记录
	 public  List<Map<String, Object>> getTwelveShareData(){
		 String sql = "select * from learningdatashareinfo order by loadNum desc";
		 PageUtil pageUtil = new PageUtil(sql, 1, 12, jdbcTemplate);
		 return pageUtil.getResultList();
	 }
	 //得到分享资料的详细信息,不含评论
	 public List<Map<String, Object>> getDataInfo(int dataId){
		 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
		 		"learningdatashareinfo as b where a.userId = b.shareUserId and b.dataShareInfoId=?";
		 List<Map<String, Object>> dataInfo = jdbcTemplate.queryForList(sql,dataId);
		 return dataInfo;
	 }
	//查询用户分享的资源
	public PageUtil getMyDataInfo(int shareUserId,int currentPage,int numPerPage){
		String sql="select *from learningdatashareinfo where shareUserId="+shareUserId;
		PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		return pageUtil;  
	 }
	 //得到分享资料的评论信息
	 public PageUtil getDataInfoComment(int dataId,int currentPage,int numPerPage){
		 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
			 		"datainfocomment as c where a.userId = c.dataInfoCommenterId and c.dataId="+dataId+" order by dataCommentTime desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //插入用户进行的评论
	 public int addDataComment(int dataId , int commenterId , String commentContent){
		 String sql = "insert into datainfocomment(dataId,dataInfoCommenterId,dataCommentContent) " +
		 		"values(?,?,?)";
		 return jdbcTemplate.update(sql,dataId,commenterId,commentContent);
	 }
	 //修改下载资源的次数
	 public int updateDataLoadNum(int dataId,int loadNum){
		 String sql = "update learningdatashareinfo set loadNum=? where dataShareInfoId=?";
		 return jdbcTemplate.update(sql,loadNum,dataId);
	 }
	 //添加上传的学习资源
	 public int addDataInfo(DataShareInfo dataShareInfo){
		 String sql = "insert into learningdatashareinfo(dataType,dataTypeName,shareUserId,dataTitle,linkText,linkPwd,shareDate,loadNum) " +
		 		"values(?,?,?,?,?,?,?,?)";
		 return jdbcTemplate.update(sql,dataShareInfo.getDataType(),dataShareInfo.getDataTypeName(),
				 dataShareInfo.getShareUserId(),dataShareInfo.getDataTitle(),
				 dataShareInfo.getLinkText(),dataShareInfo.getLinkPwd(),dataShareInfo.getShareTime(),dataShareInfo.getLoadNum());
	 }
	 //删除指定学习资源
	 public int deleteData(int dataShareInfoId){
		 String sql="delete from learningdatashareinfo where dataShareInfoId=?";
		 return jdbcTemplate.update(sql, dataShareInfoId);
	 }
}
