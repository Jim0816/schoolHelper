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
	 //�õ��������ϣ�ÿҳ10������ʱ������
	 public PageUtil getShareDataPage(int currentPage,int numPerPage,String dataType,int QueryWay){
		 //Ĭ�ϲ�ѯ�����е�ʮ����¼
		 String sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
			 		"learningdatashareinfo as b where a.userId = b.shareUserId order by shareDate desc";
		 //��������ѯ��ÿҳʮ��
		 if(!dataType.equals("0")){
			 if(QueryWay==1){
				 //ģ����ѯ����ѯѧ����������
				 sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
					 		"learningdatashareinfo as b where a.userId = b.shareUserId and dataType like '"+dataType+"%' order by shareDate desc";
			 }else{
				//ֱ�Ӳ�ѯѧ��
				 sql = "select * from (select userId,userPhoto,userName,userEmail from user) as a," +
					 		"learningdatashareinfo as b where a.userId = b.shareUserId and dataType='"+dataType+"' order by shareDate desc";
			 } 
		 }
		 System.out.println("sql:"+sql);
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //�õ����ش�����ǰ12���ļ�¼
	 public  List<Map<String, Object>> getTwelveShareData(){
		 String sql = "select * from learningdatashareinfo order by loadNum desc";
		 PageUtil pageUtil = new PageUtil(sql, 1, 12, jdbcTemplate);
		 return pageUtil.getResultList();
	 }
	 //�õ��������ϵ���ϸ��Ϣ,��������
	 public List<Map<String, Object>> getDataInfo(int dataId){
		 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
		 		"learningdatashareinfo as b where a.userId = b.shareUserId and b.dataShareInfoId=?";
		 List<Map<String, Object>> dataInfo = jdbcTemplate.queryForList(sql,dataId);
		 return dataInfo;
	 }
	//��ѯ�û��������Դ
	public PageUtil getMyDataInfo(int shareUserId,int currentPage,int numPerPage){
		String sql="select *from learningdatashareinfo where shareUserId="+shareUserId;
		PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		return pageUtil;  
	 }
	 //�õ��������ϵ�������Ϣ
	 public PageUtil getDataInfoComment(int dataId,int currentPage,int numPerPage){
		 String sql ="select * from (select userId,userPhoto,userName,userEmail from user) as a," +
			 		"datainfocomment as c where a.userId = c.dataInfoCommenterId and c.dataId="+dataId+" order by dataCommentTime desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //�����û����е�����
	 public int addDataComment(int dataId , int commenterId , String commentContent){
		 String sql = "insert into datainfocomment(dataId,dataInfoCommenterId,dataCommentContent) " +
		 		"values(?,?,?)";
		 return jdbcTemplate.update(sql,dataId,commenterId,commentContent);
	 }
	 //�޸�������Դ�Ĵ���
	 public int updateDataLoadNum(int dataId,int loadNum){
		 String sql = "update learningdatashareinfo set loadNum=? where dataShareInfoId=?";
		 return jdbcTemplate.update(sql,loadNum,dataId);
	 }
	 //����ϴ���ѧϰ��Դ
	 public int addDataInfo(DataShareInfo dataShareInfo){
		 String sql = "insert into learningdatashareinfo(dataType,dataTypeName,shareUserId,dataTitle,linkText,linkPwd,shareDate,loadNum) " +
		 		"values(?,?,?,?,?,?,?,?)";
		 return jdbcTemplate.update(sql,dataShareInfo.getDataType(),dataShareInfo.getDataTypeName(),
				 dataShareInfo.getShareUserId(),dataShareInfo.getDataTitle(),
				 dataShareInfo.getLinkText(),dataShareInfo.getLinkPwd(),dataShareInfo.getShareTime(),dataShareInfo.getLoadNum());
	 }
	 //ɾ��ָ��ѧϰ��Դ
	 public int deleteData(int dataShareInfoId){
		 String sql="delete from learningdatashareinfo where dataShareInfoId=?";
		 return jdbcTemplate.update(sql, dataShareInfoId);
	 }
}
