package com.school.utils;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

public class PageUtil{
	//һҳ��ʾ�ļ�¼��
	private int numPerPage;
	//��¼����
	private int totalRows;
	//��ҳ��
	private int totalPages;
	//��ǰҳ��
	private int currentPage;
	//��ʼ����
	private int startIndex;
	//��������
	private int lastIndex;
	//��������List
	private List<Map<String, Object>> resultList;
	
	
	/**��ҳ���캯��
	* @param sql ����ɸѡ������sql������������ҳ���Լ������mysql��limit
	* @param currentPage ��ǰҳ
	* @param numPerPage ÿҳ��¼��
	* @param jTemplate JdbcTemplateʵ��
	 * @return 
	*/
	public PageUtil(String sql,int currentPage,int numPerPage,JdbcTemplate jdbcTemplate){
		if(jdbcTemplate == null){
		throw new IllegalArgumentException("Page.jTemplate is null");
		}else if(sql == null || sql.equals("")){
		throw new IllegalArgumentException("Page.sql is empty");
		}
		//����ÿҳ��ʾ��¼��
		setNumPerPage(numPerPage);
		//����Ҫ��ʾ��ҳ��
		setCurrentPage(currentPage);
		//�����ܼ�¼��
		StringBuffer totalSQL = new StringBuffer(" SELECT count(*) FROM ( ");
		totalSQL.append(sql);
		totalSQL.append(" ) totalTable ");
		//System.out.println("��ѯ�ܼ�¼�����:"+totalSQL.toString());
		//�ܼ�¼��
		setTotalRows(jdbcTemplate.queryForInt(totalSQL.toString()));
		//System.out.println("�ܼ�¼��="+totalRows);
		//������ҳ��
		setTotalPages();
		//������ʼ����
		setStartIndex();
		//�����������
		setLastIndex();
		//System.out.println("lastIndex="+lastIndex);
		//ʹ��mysqlʱֱ��ʹ��limits
		StringBuffer paginationSQL = new StringBuffer();
		paginationSQL.append(sql);
		paginationSQL.append(" limit " + startIndex + "," + lastIndex);
		//System.out.println("��ҳ���:"+paginationSQL.toString());
		//װ������
		setResultList(jdbcTemplate.queryForList(paginationSQL.toString()));
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getNumPerPage() {
		return numPerPage;
	}
	
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	
	public List<Map<String, Object>> getResultList() {
		return resultList;
	}
	
	public void setResultList(List<Map<String, Object>> resultList) {
		this.resultList = resultList;
	}
	
	public int getTotalPages() {
		return totalPages;
	}
	
	//������ҳ��
	public void setTotalPages() {
		if(totalRows % numPerPage == 0){
			this.totalPages = totalRows / numPerPage;
		}else{
			this.totalPages = (totalRows / numPerPage) + 1;
		}
	}
	
	public int getTotalRows() {
		return totalRows;
	}
	
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	
	public int getStartIndex() {
		return startIndex;
	}
	
	public void setStartIndex() {
		this.startIndex = (currentPage - 1) * numPerPage;
	}
	
	public int getLastIndex() {
		return lastIndex;
	}


	//�������ʱ�������
	public void setLastIndex() {
		if( totalRows < numPerPage || totalRows == numPerPage){
			this.lastIndex = totalRows;
		}else{
			this.lastIndex = numPerPage;
		}
	}
}