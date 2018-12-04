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
	 * ��ѯ�ɼ�
	 */
	//�õ����8���ɼ���ѯ��ڼ�¼��ʱ�併������(������ҳ)
	public List<Map<String, Object>> getScoreLink(){
		List<Map<String, Object>> partScore = scoreDao.getAllScore();
		return partScore;
	}
	
	
	 /*
	 * ������Դ
	 */
	//�鿴�������Դ
	public PageUtil getShareDataPage(int currentPage,int numPerPage,String dataType){
		int QueryWay = 2;//Ĭ�ϲ���ģ����ѯ��ֱ�Ӳ�ѯ��Ŀ
		if(dataType.toCharArray().length==1){
			//ģ����ѯ��Ŀ����
			QueryWay = 1;
		}
		System.out.println("currentPage:"+currentPage+"-----------numPerPage:"+numPerPage);
		PageUtil result = shareDataDao.getShareDataPage(currentPage, numPerPage, dataType, QueryWay);
		System.out.println("result:"+result.getResultList().size());
		return result;
	}
	//�õ����ش�����ǰ12���ļ�¼������ҳ��
	public List<Map<String, Object>> getTwelveShareData(){
		List<Map<String, Object>> twelveShareData = shareDataDao.getTwelveShareData();
		return twelveShareData;
	}
	//��ȡ���鿴��Դ����Ϣ�������߻�����Ϣ����Դ������Ϣ
	public List<Map<String, Object>> getDataInfo(int dataId){
		return shareDataDao.getDataInfo(dataId);
	}
	//��ȡ���鿴��Դ����Ϣ�������߻�����Ϣ����Դ������Ϣ
	public PageUtil getDataComment(int dataId,int currentPage,int numPerPage){
		return shareDataDao.getDataInfoComment(dataId, currentPage, numPerPage);
	}
	@Transactional
	//�û����۲���
	public int userDataComment(int dataId , int commenterId , String commentContent){
		return shareDataDao.addDataComment(dataId, commenterId, commentContent);
	}
	@Transactional
	//�������ش���
	public int updateDataLoadNum(int dataId,int loadNum){
		return shareDataDao.updateDataLoadNum(dataId, loadNum);
	}
	//�õ��û������ѧϰ��Դ
	public PageUtil getMyDataInfo(int shareUserId,int currentPage,int numPerPage){
		return shareDataDao.getMyDataInfo(shareUserId, currentPage, numPerPage);
	}
	@Transactional
	//ɾ����������Դ
	public int deleteDataInfo(int dataShareInfoId){
		return shareDataDao.deleteData(dataShareInfoId);
	}
	@Transactional
	//����ϴ���ѧϰ��Դ
	public int addDataInfo(DataShareInfo dataShareInfo){
		//��������
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//�������ڸ�ʽ
         dataShareInfo.setShareTime(df.format(new Date()));
		return shareDataDao.addDataInfo(dataShareInfo);
	}
	
	
	/*
	 * ѧϰ����
	 * 
	 */
	//�鿴�������ӣ���ҳ��
	public PageUtil getAllDisscuss(int currentPage,int numPerPage){
		PageUtil result = studyDiscussDao.getStudyDiscussPage(currentPage, numPerPage);
		return result;
	}
	//�õ�ĳ�û�����������
	public PageUtil  getStudyDiscussInfo(int writeDiscussId,int currentPage,int numPerPage){
		return studyDiscussDao.getStudyDiscussInfo(writeDiscussId, currentPage, numPerPage);
	}
	@Transactional
	//ɾ������
	public int deleteDiscussInfo(int studyDiscussInfoId){
		return studyDiscussDao.deleteDiscuss(studyDiscussInfoId);
	}
	//�õ���������ǰ10���ļ�¼������ҳ��
	public List<Map<String, Object>> getDisscussSearchTop(){
		List<Map<String, Object>> topTenDiscussSearch = studyDiscussDao.getStudyDiscussTop();
		return topTenDiscussSearch;
	}
	//��ȡ���鿴���ӵ���Ϣ
	public List<Map<String, Object>> getDisscussInfo(int studyDiscussInfoId){
		return studyDiscussDao.getStudyDiscuss(studyDiscussInfoId);
	}
	//���ӵ�������Ϣ����ҳ��
	public PageUtil getDisscussComment(int studyDiscussInfoId,int currentPage,int numPerPage){
		return studyDiscussDao.getStudyDiscussComment(studyDiscussInfoId, currentPage, numPerPage);
	}
	@Transactional
	//�û������������۲���
	public int userWriteDisscussComment(int studyDiscussInfoId , int studyCommenterId , String studyCommentContent){
		return studyDiscussDao.addDiscussComment(studyDiscussInfoId, studyCommenterId, studyCommentContent);
	}
	@Transactional
	//�������ӷ�����
	public int updateDiscussInfoSearchNum(int studyDiscussInfoId,int discussSearchNum){
		return studyDiscussDao.updateDiscussInfoSearchNum(studyDiscussInfoId, discussSearchNum);
	}
	@Transactional
	//����ϴ���ѧϰ��Դ
	public int addDiscussInfo(StudyDiscussInfo studyDiscussInfo){
		return studyDiscussDao.addDiscussInfo(studyDiscussInfo);
	}

}
