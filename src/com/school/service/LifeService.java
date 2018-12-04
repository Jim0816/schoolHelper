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
	//查询房间电费信息
	public String getElectronicRemain(String area,String unit,String houseNumber){
		String remain = "该房间信息不存在";
		List<Map<String, Object>> electronicList = electronicInfoDao.queryElectronicRemain(area, unit, houseNumber);
		if(electronicList.size()>0){
			remain = (String) electronicList.get(0).get("remainMoney");
		}
		System.out.println(remain);
		return remain;
	}
	
	//缴纳电费操作
	@Transactional
	public int payElectronicMoney(String area,String unit,String houseNumber,String payMoney,int payUserId){
		//payMoney为所缴纳费用
		int result = 0;//默认失败
		try {
			String oldRemain = getElectronicRemain(area,unit,houseNumber);
	        if(oldRemain.equals("该房间信息不存在")){
	        	//-1表示房间不存在
	        	result = -1;
	        }else{
	        	String newRemain = TransformPrice.countPrice(oldRemain, payMoney);
	        	System.out.println("newRemain:"+newRemain);
	        	//更新数据库
	        	//更新电费信息表
	        	int result1 = electronicInfoDao.payElectronic(area, unit, houseNumber, newRemain);
	        	//插入电费订单信息表新纪录
	        	int result2 = electronicOrderDao.addElectronicOrder(area, unit, houseNumber,payMoney, payUserId);
	            if(result1>0 && result2>0){
	            	result = 1;
	            }
	        }
		} catch (Exception e) {
			result = 0;
			System.out.println("电费缴纳失败");
		}
        return result;
	}
	
	//生成订水订单
	@Transactional
	public int orderWater(String area,String unit,String houseNumber,String waterDept,
			int waterNum,String payMoney,String tel,int orderUserId){
		return orderWaterDao.addWaterOrder(area, unit, houseNumber, waterDept, waterNum, payMoney, tel,orderUserId);
	}
	
	//生成报修订单
	@Transactional
	public int addRepairInfo(String area,String unit,String houseNumber,String repairContent,
			String remark,int repairUserId,String tel){
		return repairApplyInfoDao.addRepairInfo(area, unit, houseNumber, repairContent, remark, repairUserId, tel);
	}
	
	//生成快递代领订单信息
	@Transactional
	public int addDeliveryGetInfo(DeliveryGetInfo deliveryGetInfo){
		return deliveryGetInfoDao.addDeliveryGetInfo(deliveryGetInfo);
	}
	
	//查询所有快递订单信息，每页十条
	public PageUtil getAllDeliveryOrderInfo(int currentPage,int numPerPage){
		return deliveryGetInfoDao.getAllDeliveryOrderInfo(currentPage, numPerPage);
	}
	/*//生成快递代寄订单信息
	@Transactional
	public int addDeliverySendInfo(DeliverySendInfo deliverySendInfo){
		return deliverySendInfoDao.addDeliverySendInfo(deliverySendInfo);
	}	*/
	
	//查询所有租赁信息
	public PageUtil getRentInfo(int currentPage,int numPerPage){
		return houseRentInfoDao.getAllRentInfo(currentPage, numPerPage);
	}
	//查看指定租赁的详细信息
	@Transactional
	public HouseRentInfo getRentDetail(int rentId){
		//查看前把浏览数量先更新
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
	//添加租赁信息
	@Transactional
	public int addRentInfo(HouseRentInfo houseRentInfo,MultipartFile img[]){
		String fileName = "F:\\WebProject\\houseRent\\"+houseRentInfo.getOwnerId();//以发布信息者id标识图片
		File myFile = new File(fileName);
		if(!myFile.exists()){
			myFile.mkdir();
		}
		String allImgsUrl = uploadUtils.dealSomePhoto("F:\\WebProject\\houseRent\\"+houseRentInfo.getOwnerId()+"\\", "houseRent/"+houseRentInfo.getOwnerId(),houseRentInfo.getOwnerId(), img);
		System.out.println(allImgsUrl);
		houseRentInfo.setRentPhoto(allImgsUrl);
		return houseRentInfoDao.addHouseRentInfo(houseRentInfo);
	}
	
	//检查接单者是否授权，授权则返回联系电话
	public String checkGetOrderUser(int getOrderUserId , int getDeliveryId){
		//传入接单者账号，以及该订单的账号
		String result = "0";//默认该用户从未进行授权
		/* result为0:表示该用户从未进行授权
		 * 
		 * result为-1:表示该用户进行授权了，但是授权失败
		 * 
		 *  result为电话号码:表示该用户已经授权成功，可以得到客户的联系方式
		 * 
		 */
		List<Map<String, Object>> theUserList = checkGetOrderUserDao.getGetOrderUserInfo(getOrderUserId);
		//说明该用户存在验证表中，看授权结果
		if(theUserList.size()>0){
			if(theUserList.get(0).get("state").equals("1")){
				//表示该接单者已经被授权
				List<Map<String, Object>> theOrderList = deliveryGetInfoDao.getDeliveryInfo(getDeliveryId);
				result = (String) theOrderList.get(0).get("clientUserTel");
			}else{
				//表示该接单者授权失败
				result = "-1";
			}
		}else{
			//说明该用户从未进行授权，不存在授权表中
			result = "0";
		}
		System.out.println("检验接单者结果:"+result);
		return result;
	}
	
	//生成订单关系，说明谁接了哪个单，同时修改订单状态(防止并发)
	@Transactional
	public synchronized int createOrderRelation(int deliveryOrderId,int getOrderUserId){
		int result = 0;//默认失败
		//先检查该订单状态
		List<Map<String, Object>> theOrderList = deliveryGetInfoDao.getDeliveryInfo(deliveryOrderId);
		String state = (String)theOrderList.get(0).get("state");
		if(state.equals("0")){
			//修改订单状态
			int result1 = deliveryGetInfoDao.updateDeliveryOrderInfo(deliveryOrderId);
			//生成订单关系
			int result2 = makeOrderRelationDao.addOrderRelation(deliveryOrderId, getOrderUserId);
			if(result1>0 && result2>0){
				result = 1;
			}
		}else{
			//订单已经被他人接了
			result = 0;
		}
		return result;
	}
	
	//添加接单用户的审核信息
	@Transactional
	public int addCheckUserInfo(CheckGetOrderUserInfo checkGetOrderUserInfo,MultipartFile img){
		//先查询数据库中是否存在该审核信息
		/*
		 * 返回0表示操作失败
		 * 返回1表示操作成功
		 * 返回2表示用户已经提交过
		 */
		int result = 0;
		List<Map<String, Object>> userList = checkGetOrderUserInfoDao.queryGetOrderUserInfo(checkGetOrderUserInfo.getCheckedUserId());
		if(userList.size()>0){
			//表明该用户进行过授权信息提交
			result = 2;
		}else{
			//表明该用户未进行过授权信息提交
			String imgUrl = "";
			imgUrl = uploadUtils.dealSimplePhoto("F:\\WebProject\\checkGetOrderUser\\","checkGetOrderUser", checkGetOrderUserInfo.getCheckedUserId(), img);
			System.out.println(imgUrl);
			checkGetOrderUserInfo.setStuCardAndPersonImg(imgUrl);
			result = checkGetOrderUserInfoDao.addCheckUserInfo(checkGetOrderUserInfo);//操作成功返回1
		}
		//System.out.println("result:"+result);
		return result;
	}
}
