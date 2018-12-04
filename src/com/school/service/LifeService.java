package com.school.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.school.dao.CheckGetOrderUserDao;
import com.school.dao.CheckGetOrderUserInfoDao;
import com.school.dao.DeliveryGetInfoDao;
import com.school.dao.ElectronicInfoDao;
import com.school.dao.ElectronicOrderDao;
import com.school.dao.HouseRentInfoDao;
import com.school.dao.MakeOrderRelationDao;
import com.school.dao.OrderWaterDao;
import com.school.dao.RepairApplyInfoDao;
import com.school.domain.lifebeans.CheckGetOrderUserInfo;
import com.school.domain.lifebeans.DeliveryGetInfo;
import com.school.domain.lifebeans.HouseRentInfo;
import com.school.utils.PageUtil;
import com.school.utils.TransformPrice;
import com.school.utils.uploadUtils;

@Service
public class LifeService {
	@Autowired
	private ElectronicInfoDao electronicInfoDao;
	@Autowired
	private ElectronicOrderDao electronicOrderDao;
	@Autowired
	private OrderWaterDao orderWaterDao;
	@Autowired
	private RepairApplyInfoDao repairApplyInfoDao;
	@Autowired
	private DeliveryGetInfoDao deliveryGetInfoDao;
	@Autowired
	private HouseRentInfoDao houseRentInfoDao;
	@Autowired
	private CheckGetOrderUserDao checkGetOrderUserDao;
	@Autowired
	private MakeOrderRelationDao makeOrderRelationDao;
	@Autowired
	private CheckGetOrderUserInfoDao checkGetOrderUserInfoDao;
	//��ѯ��������Ϣ
	public String getElectronicRemain(String area,String unit,String houseNumber){
		String remain = "�÷�����Ϣ������";
		List<Map<String, Object>> electronicList = electronicInfoDao.queryElectronicRemain(area, unit, houseNumber);
		if(electronicList.size()>0){
			remain = (String) electronicList.get(0).get("remainMoney");
		}
		System.out.println(remain);
		return remain;
	}
	
	//���ɵ�Ѳ���
	@Transactional
	public int payElectronicMoney(String area,String unit,String houseNumber,String payMoney,int payUserId){
		//payMoneyΪ�����ɷ���
		int result = 0;//Ĭ��ʧ��
		try {
			String oldRemain = getElectronicRemain(area,unit,houseNumber);
	        if(oldRemain.equals("�÷�����Ϣ������")){
	        	//-1��ʾ���䲻����
	        	result = -1;
	        }else{
	        	String newRemain = TransformPrice.countPrice(oldRemain, payMoney);
	        	System.out.println("newRemain:"+newRemain);
	        	//�������ݿ�
	        	//���µ����Ϣ��
	        	int result1 = electronicInfoDao.payElectronic(area, unit, houseNumber, newRemain);
	        	//�����Ѷ�����Ϣ���¼�¼
	        	int result2 = electronicOrderDao.addElectronicOrder(area, unit, houseNumber,payMoney, payUserId);
	            if(result1>0 && result2>0){
	            	result = 1;
	            }
	        }
		} catch (Exception e) {
			result = 0;
			System.out.println("��ѽ���ʧ��");
		}
        return result;
	}
	
	//���ɶ�ˮ����
	@Transactional
	public int orderWater(String area,String unit,String houseNumber,String waterDept,
			int waterNum,String payMoney,String tel,int orderUserId){
		return orderWaterDao.addWaterOrder(area, unit, houseNumber, waterDept, waterNum, payMoney, tel,orderUserId);
	}
	
	//���ɱ��޶���
	@Transactional
	public int addRepairInfo(String area,String unit,String houseNumber,String repairContent,
			String remark,int repairUserId,String tel){
		return repairApplyInfoDao.addRepairInfo(area, unit, houseNumber, repairContent, remark, repairUserId, tel);
	}
	
	//���ɿ�ݴ��충����Ϣ
	@Transactional
	public int addDeliveryGetInfo(DeliveryGetInfo deliveryGetInfo){
		return deliveryGetInfoDao.addDeliveryGetInfo(deliveryGetInfo);
	}
	
	//��ѯ���п�ݶ�����Ϣ��ÿҳʮ��
	public PageUtil getAllDeliveryOrderInfo(int currentPage,int numPerPage){
		return deliveryGetInfoDao.getAllDeliveryOrderInfo(currentPage, numPerPage);
	}
	/*//���ɿ�ݴ��Ķ�����Ϣ
	@Transactional
	public int addDeliverySendInfo(DeliverySendInfo deliverySendInfo){
		return deliverySendInfoDao.addDeliverySendInfo(deliverySendInfo);
	}	*/
	
	//��ѯ����������Ϣ
	public PageUtil getRentInfo(int currentPage,int numPerPage){
		return houseRentInfoDao.getAllRentInfo(currentPage, numPerPage);
	}
	//�鿴ָ�����޵���ϸ��Ϣ
	@Transactional
	public HouseRentInfo getRentDetail(int rentId){
		//�鿴ǰ����������ȸ���
		houseRentInfoDao.updateRentLookNum(rentId);
		List<Map<String, Object>> result = houseRentInfoDao.getRentDetail(rentId);
		HouseRentInfo houseRentInfo = new HouseRentInfo();
		houseRentInfo.setRentId(rentId);
		houseRentInfo.setRentTitle((String)result.get(0).get("rentTitle"));
		houseRentInfo.setRentPhoto((String)result.get(0).get("rentPhoto"));
		houseRentInfo.setRentDetail((String)result.get(0).get("rentDetail"));
		houseRentInfo.setRentWay((String)result.get(0).get("rentWay"));
		houseRentInfo.setHouseStruct((String)result.get(0).get("houseStruct"));
		houseRentInfo.setHouseArea((String)result.get(0).get("houseArea"));
		houseRentInfo.setRentPrice((String)result.get(0).get("rentPrice"));
		houseRentInfo.setAddress((String)result.get(0).get("address"));
		houseRentInfo.setSendDate((Timestamp)result.get(0).get("sendDate"));
		houseRentInfo.setOwnerName((String)result.get(0).get("ownerName"));
		houseRentInfo.setOwnerId((Integer)result.get(0).get("ownerId"));
		houseRentInfo.setOwnerTel((String)result.get(0).get("ownerTel"));
		houseRentInfo.setLookNum((Integer)result.get(0).get("lookNum"));
		return houseRentInfo;
	}
	//���������Ϣ
	@Transactional
	public int addRentInfo(HouseRentInfo houseRentInfo,MultipartFile img[]){
		String fileName = "F:\\WebProject\\houseRent\\"+houseRentInfo.getOwnerId();//�Է�����Ϣ��id��ʶͼƬ
		File myFile = new File(fileName);
		if(!myFile.exists()){
			myFile.mkdir();
		}
		String allImgsUrl = uploadUtils.dealSomePhoto("F:\\WebProject\\houseRent\\"+houseRentInfo.getOwnerId()+"\\", "houseRent/"+houseRentInfo.getOwnerId(),houseRentInfo.getOwnerId(), img);
		System.out.println(allImgsUrl);
		houseRentInfo.setRentPhoto(allImgsUrl);
		return houseRentInfoDao.addHouseRentInfo(houseRentInfo);
	}
	
	//���ӵ����Ƿ���Ȩ����Ȩ�򷵻���ϵ�绰
	public String checkGetOrderUser(int getOrderUserId , int getDeliveryId){
		//����ӵ����˺ţ��Լ��ö������˺�
		String result = "0";//Ĭ�ϸ��û���δ������Ȩ
		/* resultΪ0:��ʾ���û���δ������Ȩ
		 * 
		 * resultΪ-1:��ʾ���û�������Ȩ�ˣ�������Ȩʧ��
		 * 
		 *  resultΪ�绰����:��ʾ���û��Ѿ���Ȩ�ɹ������Եõ��ͻ�����ϵ��ʽ
		 * 
		 */
		List<Map<String, Object>> theUserList = checkGetOrderUserDao.getGetOrderUserInfo(getOrderUserId);
		//˵�����û�������֤���У�����Ȩ���
		if(theUserList.size()>0){
			if(theUserList.get(0).get("state").equals("1")){
				//��ʾ�ýӵ����Ѿ�����Ȩ
				List<Map<String, Object>> theOrderList = deliveryGetInfoDao.getDeliveryInfo(getDeliveryId);
				result = (String) theOrderList.get(0).get("clientUserTel");
			}else{
				//��ʾ�ýӵ�����Ȩʧ��
				result = "-1";
			}
		}else{
			//˵�����û���δ������Ȩ����������Ȩ����
			result = "0";
		}
		System.out.println("����ӵ��߽��:"+result);
		return result;
	}
	
	//���ɶ�����ϵ��˵��˭�����ĸ�����ͬʱ�޸Ķ���״̬(��ֹ����)
	@Transactional
	public synchronized int createOrderRelation(int deliveryOrderId,int getOrderUserId){
		int result = 0;//Ĭ��ʧ��
		//�ȼ��ö���״̬
		List<Map<String, Object>> theOrderList = deliveryGetInfoDao.getDeliveryInfo(deliveryOrderId);
		String state = (String)theOrderList.get(0).get("state");
		if(state.equals("0")){
			//�޸Ķ���״̬
			int result1 = deliveryGetInfoDao.updateDeliveryOrderInfo(deliveryOrderId);
			//���ɶ�����ϵ
			int result2 = makeOrderRelationDao.addOrderRelation(deliveryOrderId, getOrderUserId);
			if(result1>0 && result2>0){
				result = 1;
			}
		}else{
			//�����Ѿ������˽���
			result = 0;
		}
		return result;
	}
	
	//��ӽӵ��û��������Ϣ
	@Transactional
	public int addCheckUserInfo(CheckGetOrderUserInfo checkGetOrderUserInfo,MultipartFile img){
		//�Ȳ�ѯ���ݿ����Ƿ���ڸ������Ϣ
		/*
		 * ����0��ʾ����ʧ��
		 * ����1��ʾ�����ɹ�
		 * ����2��ʾ�û��Ѿ��ύ��
		 */
		int result = 0;
		List<Map<String, Object>> userList = checkGetOrderUserInfoDao.queryGetOrderUserInfo(checkGetOrderUserInfo.getCheckedUserId());
		if(userList.size()>0){
			//�������û����й���Ȩ��Ϣ�ύ
			result = 2;
		}else{
			//�������û�δ���й���Ȩ��Ϣ�ύ
			String imgUrl = "";
			imgUrl = uploadUtils.dealSimplePhoto("F:\\WebProject\\checkGetOrderUser\\","checkGetOrderUser", checkGetOrderUserInfo.getCheckedUserId(), img);
			System.out.println(imgUrl);
			checkGetOrderUserInfo.setStuCardAndPersonImg(imgUrl);
			result = checkGetOrderUserInfoDao.addCheckUserInfo(checkGetOrderUserInfo);//�����ɹ�����1
		}
		//System.out.println("result:"+result);
		return result;
	}
}
