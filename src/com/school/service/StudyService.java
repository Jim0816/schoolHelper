package com.school.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.ScoreDao;
import com.school.dao.ShareDataDao;
import com.school.dao.StudyDiscussDao;
import com.school.domain.studybeans.DataShareInfo;
import com.school.domain.studybeans.StudyDiscussInfo;
import com.school.utils.PageUtil;

@Service
public class StudyService {
	@Autowired
	private ScoreDao scoreDao;
	@Autowired 
	private ShareDataDao shareDataDao;
	@Autowired 
	private StudyDiscussDao studyDiscussDao;
	/*
	 * 查询成绩
	 */
	//得到最近8条成绩查询入口记录，时间降序排序(不带分页)
	public List<Map<String, Object>> getScoreLink(){
		List<Map<String, Object>> partScore = scoreDao.getAllScore();
		return partScore;
	}
	
	
	 /*
	 * 分享资源
	 */
	//查看分享的资源
	public PageUtil getShareDataPage(int currentPage,int numPerPage,String dataType){
		int QueryWay = 2;//默认不是模糊查询，直接查询科目
		if(dataType.toCharArray().length==1){
			//模糊查询科目类型
			QueryWay = 1;
		}
		System.out.println("currentPage:"+currentPage+"-----------numPerPage:"+numPerPage);
		PageUtil result = shareDataDao.getShareDataPage(currentPage, numPerPage, dataType, QueryWay);
		System.out.println("result:"+result.getResultList().size());
		return result;
	}
	//得到下载次数排前12条的记录（不分页）
	public List<Map<String, Object>> getTwelveShareData(){
		List<Map<String, Object>> twelveShareData = shareDataDao.getTwelveShareData();
		return twelveShareData;
	}
	//获取所查看资源的信息：分享者基本信息、资源讨论信息
	public List<Map<String, Object>> getDataInfo(int dataId){
		return shareDataDao.getDataInfo(dataId);
	}
	//获取所查看资源的信息：分享者基本信息、资源讨论信息
	public PageUtil getDataComment(int dataId,int currentPage,int numPerPage){
		return shareDataDao.getDataInfoComment(dataId, currentPage, numPerPage);
	}
	@Transactional
	//用户评论操作
	public int userDataComment(int dataId , int commenterId , String commentContent){
		return shareDataDao.addDataComment(dataId, commenterId, commentContent);
	}
	@Transactional
	//更新下载次数
	public int updateDataLoadNum(int dataId,int loadNum){
		return shareDataDao.updateDataLoadNum(dataId, loadNum);
	}
	//得到用户分享的学习资源
	public PageUtil getMyDataInfo(int shareUserId,int currentPage,int numPerPage){
		return shareDataDao.getMyDataInfo(shareUserId, currentPage, numPerPage);
	}
	@Transactional
	//删除所分享资源
	public int deleteDataInfo(int dataShareInfoId){
		return shareDataDao.deleteData(dataShareInfoId);
	}
	@Transactional
	//添加上传的学习资源
	public int addDataInfo(DataShareInfo dataShareInfo){
		//加入日期
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
         dataShareInfo.setShareTime(df.format(new Date()));
		return shareDataDao.addDataInfo(dataShareInfo);
	}
	
	
	/*
	 * 学习讨论
	 * 
	 */
	//查看所有帖子（分页）
	public PageUtil getAllDisscuss(int currentPage,int numPerPage){
		PageUtil result = studyDiscussDao.getStudyDiscussPage(currentPage, numPerPage);
		return result;
	}
	//得到某用户的所有帖子
	public PageUtil  getStudyDiscussInfo(int writeDiscussId,int currentPage,int numPerPage){
		return studyDiscussDao.getStudyDiscussInfo(writeDiscussId, currentPage, numPerPage);
	}
	@Transactional
	//删除帖子
	public int deleteDiscussInfo(int studyDiscussInfoId){
		return studyDiscussDao.deleteDiscuss(studyDiscussInfoId);
	}
	//得到访问量排前10条的记录（不分页）
	public List<Map<String, Object>> getDisscussSearchTop(){
		List<Map<String, Object>> topTenDiscussSearch = studyDiscussDao.getStudyDiscussTop();
		return topTenDiscussSearch;
	}
	//获取所查看帖子的信息
	public List<Map<String, Object>> getDisscussInfo(int studyDiscussInfoId){
		return studyDiscussDao.getStudyDiscuss(studyDiscussInfoId);
	}
	//帖子的评论信息（分页）
	public PageUtil getDisscussComment(int studyDiscussInfoId,int currentPage,int numPerPage){
		return studyDiscussDao.getStudyDiscussComment(studyDiscussInfoId, currentPage, numPerPage);
	}
	@Transactional
	//用户发表帖子评论操作
	public int userWriteDisscussComment(int studyDiscussInfoId , int studyCommenterId , String studyCommentContent){
		return studyDiscussDao.addDiscussComment(studyDiscussInfoId, studyCommenterId, studyCommentContent);
	}
	@Transactional
	//更新帖子访问量
	public int updateDiscussInfoSearchNum(int studyDiscussInfoId,int discussSearchNum){
		return studyDiscussDao.updateDiscussInfoSearchNum(studyDiscussInfoId, discussSearchNum);
	}
	@Transactional
	//添加上传的学习资源
	public int addDiscussInfo(StudyDiscussInfo studyDiscussInfo){
		return studyDiscussDao.addDiscussInfo(studyDiscussInfo);
	}

}
