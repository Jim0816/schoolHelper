package com.school.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.ejb.criteria.expression.function.LengthFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.context.Theme;
import org.springframework.web.multipart.MultipartFile;

import com.school.dao.AdvertisementDao;
import com.school.dao.GoodsAdvInfo;
import com.school.dao.GoodsCarDao;
import com.school.dao.GoodsDao;
import com.school.dao.GoodsOrderDao;
import com.school.dao.PartTimeJobDao;
import com.school.dao.ShopAdvInfo;
import com.school.dao.ShopApplyDao;
import com.school.dao.ShopDao;
import com.school.domain.marketbeans.Goods;
import com.school.domain.marketbeans.GoodsCar;
import com.school.domain.marketbeans.GoodsOrder;
import com.school.domain.marketbeans.ShopApplyInfo;
import com.school.domain.marketbeans.ShopInfo;
import com.school.utils.PageUtil;
import com.school.utils.TransformPrice;
import com.school.utils.uploadUtils;
@Service
public class MarketService {
	@Autowired
	private AdvertisementDao advertisementDao;
	@Autowired
	private PartTimeJobDao partTimeJobDao;
	@Autowired
	private ShopApplyDao shopApplyDao;
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private GoodsOrderDao goodsOrderDao;
	@Autowired
	private GoodsCarDao goodsCarDao;
	@Autowired
	private GoodsAdvInfo goodsAdvInfo;
	@Autowired
	private ShopAdvInfo shopAdvInfo;
	//�õ����¹����Ϣ
	public List<Map<String, Object>> getAdvertisement(){
		List<Map<String, Object>> advList = advertisementDao.getAdvInfo();
		return advList;
	}	
	
	//�õ����¼�ְ��Ϣ(������12������)
	public List<Map<String, Object>> ParttimeJob(){
		List<Map<String, Object>> jobList = partTimeJobDao.selectEndTwelve();
		return jobList;
	}	
	//�õ��̳���Ʒ�����Ϣ
	public PageUtil getGoodsAdvInfo(int currentPage,int numPerPage){
		return goodsAdvInfo.queryAllGoodsAdvInfo(currentPage, numPerPage);
	}
	//�õ��̳���Ʒ�����Ϣ
	public PageUtil getShopAdvInfo(int currentPage,int numPerPage){
		return shopAdvInfo.queryAllShopAdvInfo(currentPage, numPerPage);
	}
	//��ѯ���̵�������Ϣ
	public List<Map<String, Object>> queryShopApplyInfo(int applyUserId){
		return shopApplyDao.queryShopApplyInfo(applyUserId);
	}
	
	//��ѯ�û��ĵ�����Ϣ(�����鿴)
	public List<Map<String, Object>> queryShopInfo(int shopUserId){
		return shopDao.queryShopInfoByUser(shopUserId);
	}
	//�鿴������Ϣ����Ҳ鿴��
	public Map<String,Object> queryShopInfoByShopIdForBuyer(int shopId){
		//��ѯ���̻�����Ϣ
		Map<String,Object> oneShopMap = new HashMap<String,Object>();
		
		Map<String, Object> shopInfoForBuyer = shopDao.queryShopInfoForbuyer(shopId).get(0);
		List<Map<String, Object>> shopTopSaleGoods = shopDao.getHeadSale(shopId);
		oneShopMap.put("shopInfoForBuyer",shopInfoForBuyer);
		oneShopMap.put("shopTopSaleGoods",shopTopSaleGoods);
		return oneShopMap;
	}
	//��ѯָ��ԺУ�����е���
	public PageUtil getAllShopInfoByAcademy(String belongsAcademy,int currentPage,int numPerPage){
		PageUtil pageUtil = shopDao.queryAllShopsByAcademy(belongsAcademy, currentPage, numPerPage);
		for(int i=0;i<pageUtil.getResultList().size();i++){
			Map<String,Object> oneMap = pageUtil.getResultList().get(i);
			int shopId = (Integer) oneMap.get("shopId");
			//������������Ϳ����Ϣ
			Map<String, Object> shopGoodsNumAndSaleNum = shopDao.getShopGoodsNumAndSaleNum(shopId).get(0);
			Object allGoodsNum = (Object) shopGoodsNumAndSaleNum.get("allGoodsNum");
			Object allGoodsSaleNum = (Object) shopGoodsNumAndSaleNum.get("allGoodsSaleNum");
			oneMap.put("allGoodsNum", allGoodsNum.toString());
			oneMap.put("allGoodsSaleNum", allGoodsSaleNum.toString());
			//����������Ʒ��Ϣ
			List<Map<String, Object>> goodsPartInfoList = shopDao.getHeadSale(shopId);
			oneMap.put("goodsPartInfoList",goodsPartInfoList);
		}
		return pageUtil;
	}
	//��ѯ���е�����Ϣ(����)
	public PageUtil getAllShopInfo(int currentPage,int numPerPage){
		return shopDao.queryAllShops(currentPage, numPerPage);
	}
	//��ӵ���������Ϣ
	@Transactional
	public int addShopApplyInfo(ShopApplyInfo shopApplyInfo,MultipartFile img){
		int result = 0;
		try {
			String imgUrl = uploadUtils.dealSimplePhoto("F:\\WebProject\\shopApply\\","shopApply",shopApplyInfo.getApplyUserId(), img);
			shopApplyInfo.setApplyImg(imgUrl);
			result = shopApplyDao.addShopApplyInfo(shopApplyInfo);
		} catch (Exception e) {
			System.out.println("���������Ϣ�ύʧ��");
		}
		return result;
	}
	//�����Ʒ��Ϣ
	@Transactional
	public int addGoods(Goods goods,MultipartFile img[]){
		String fileName = "F:\\WebProject\\shop\\"+goods.getShopId();//�Է�����Ϣ��id��ʶͼƬ
		File myFile = new File(fileName);
		if(!myFile.exists()){
			myFile.mkdir();
		}
		String allImgsUrl = uploadUtils.dealSomePhoto("F:\\WebProject\\shop\\"+goods.getShopId()+"\\", "shop/"+goods.getShopId(),goods.getShopId(),img);
		goods.setGoodsImg(allImgsUrl);
		return goodsDao.addGoods(goods);
	}
	//�޸���Ʒ��Ϣ
	@Transactional
	public int updateGoods(Goods goods,MultipartFile img[],Goods oldGoods){
		//����Goods���ͶԱȣ��ԱȺ�õ��޸�sql��� 
		int flag = 0;//Ĭ�ϲ��޸�
		int result = 0;//���ؽ��
		StringBuffer sql = new StringBuffer("update goods set");
		//��Ʒ����
		if(!goods.getGoodsTitle().equals(oldGoods.getGoodsTitle())){
			 sql.append(" goodsTitle='"+goods.getGoodsTitle()+"'");
			 flag = 1;
		 }
		//��Ʒ����
		 if(!goods.getGoodsName().equals(oldGoods.getGoodsName())){
			 if(flag==0){
				 sql.append(" goodsName='"+goods.getGoodsName()+"'");
			 }else{
				 sql.append(",goodsName='"+goods.getGoodsName()+"'"); 
			 }
			 flag = 1; 
		 }
		//��ƷͼƬ·��
		 if(!goods.getGoodsImg().equals(oldGoods.getGoodsImg())){
			//�õ��޸ĺ�ͼƬ������·��
			String fileName = "F:\\WebProject\\shop\\"+oldGoods.getShopId();//�Է�����Ϣ��id��ʶͼƬ
			File myFile = new File(fileName);
			if(!myFile.exists()){
			   myFile.mkdir();
			}
			String allImgsUrl = uploadUtils.dealSomePhoto("F:\\WebProject\\shop\\"+oldGoods.getShopId()+"\\", "shop/"+oldGoods.getShopId(),oldGoods.getShopId(),img);
			if(flag==0){
				sql.append(" goodsImg='"+allImgsUrl+"'");
			}else{
				sql.append(",goodsImg='"+allImgsUrl+"'");
			}
			flag = 1;
		  }
		//��Ʒ�۸�
		 if(!goods.getGoodsPrice().equals(oldGoods.getGoodsPrice())){
			 if(flag==0){
				 sql.append(" goodsPrice='"+goods.getGoodsPrice()+"'");
			 }else{
				 sql.append(",goodsPrice='"+goods.getGoodsPrice()+"'"); 
			 }
			 flag = 1; 
		 }
		//��Ʒ���
		 if(!goods.getGoodsStruct().equals(oldGoods.getGoodsStruct())){
			 if(flag==0){
				 sql.append(" goodsStruct='"+goods.getGoodsStruct()+"'");
			 }else{
				 sql.append(",goodsStruct='"+goods.getGoodsStruct()+"'");
			 }
		     flag = 1;
			 }
		//��Ʒ���� 
		 if(goods.getGoodsNum()!=oldGoods.getGoodsNum()){
			 if(flag==0){
				 sql.append(" goodsNum="+goods.getGoodsNum()); 
			 }else{
				 sql.append(",goodsNum="+goods.getGoodsNum()); 
			 }
			 flag = 1; 
		 }
		//��Ʒ����
		 if(oldGoods.getGoodsDetail()==null){
			 if(!goods.getGoodsDetail().equals("")){
				 if(flag==0){
					 sql.append(" goodsDetail='"+goods.getGoodsDetail()+"'");
				 }else{
					 sql.append(",goodsDetail='"+goods.getGoodsDetail()+"'");
				 }
				 flag = 1;
			 }
		 }else{
			 if(!goods.getGoodsDetail().equals(oldGoods.getGoodsDetail())){
				 if(flag==0){
					 sql.append(" goodsDetail='"+goods.getGoodsDetail()+"'");
				 }else{
					 sql.append(",goodsDetail='"+goods.getGoodsDetail()+"'");
				 }
				 flag = 1;
		    }
		 }
		//һ�����
		 if(!goods.getClassifyOne().equals(oldGoods.getClassifyOne())){
			 if(flag==0){
				 sql.append(" classifyOne='"+goods.getClassifyOne()+"'");
			 }else{
				 sql.append(",classifyOne='"+goods.getClassifyOne()+"'");
			 }
			 flag = 1;	 
		 }
		//�������
		 if(!goods.getClassifyTwo().equals(oldGoods.getClassifyTwo())){
			 if(flag==0){
				 sql.append(" classifyTwo='"+goods.getClassifyTwo()+"'");
			 }else{
				 sql.append(",classifyTwo='"+goods.getClassifyTwo()+"'"); 
			 }
			 flag = 1; 
		 }
		 sql.append(" where goodsId="+oldGoods.getGoodsId());
		 if(flag==0){
			 //���޸Ķ���
			 result = 0;
			 System.out.println("����δ�����޸�");
		 }else{
			 //�������ݿ��޸�
			 System.out.println("�����޸���Ʒ���:"+sql.toString());
			 result = goodsDao.updateGoods(sql.toString());
		 }
		 return result;
	}
	
	//�޸���Ʒ�Ŀ���������(������Ʒ)
	@Transactional
	public synchronized int updateGoods(int goodsId,int buyNum){
		//buyNumΪ������ʾ���������ʾ�˻�
		int result = 1;//Ĭ�ϳɹ�
		//�޸�ǰ�������ж���Ʒ�����Ƿ�����
		int nowTheGoodsNum = goodsDao.queryOneGoodsNum(goodsId);//�õ�ǰ��Ʒ���
		if(buyNum>nowTheGoodsNum){
			//��Ʒ����
			result = 0;
			System.out.println("��Ʒ���㣬�޷�����");
		}else{
			//���й����޸���Ʒ����
			goodsDao.updateGoods(goodsId,buyNum);
		}
		return result;	
	}
	//�޸���Ʒ�Ŀ���������(�����Ʒ)
	@Transactional
	public synchronized int updateGoods(List<Map<String, Object>> waitOrder){
		int result = 1;//Ĭ���޸ĳɹ�
		//�޸�ǰ�������ж���Ʒ�����Ƿ�����
		for(int i=0;i<waitOrder.size();i++){
			//��ӵ�������
			Map<String, Object> map = waitOrder.get(i);
			int goodsId = (Integer)map.get("goodsId");
			int nowTheGoodsNum = goodsDao.queryOneGoodsNum(goodsId);//�õ�ǰ��Ʒ���
			int theGoodsNum = (Integer) map.get("theGoodsNum");
			if(theGoodsNum>nowTheGoodsNum){
				//��治�㣬�޷�����
				result = 0;
				System.out.println("��Ʒ���㣬�޷�����");
				try {
					int error = 10/0;//�����쳣����������ع�
				} catch (RuntimeException e) {
					//e.printStackTrace();
				}
				break;//����ѭ��
			}else{
				//���й����޸���Ʒ����
				goodsDao.updateGoods(goodsId,theGoodsNum);
			}	
		}
		return result;
	}
	//ɾ�����ָ����Ʒ(��������Ʒ)
	@Transactional
	public int deleteSomeGoods(int goodsId[]){
		int result = 1;//Ĭ�ϲ����ɹ�
		try{
			for(int i=0;i<goodsId.length;i++){
				goodsDao.deleteGoods(goodsId[i]);
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//ɾ�����ָ����Ʒ(���ﳵ����Ʒ)
	@Transactional
	public int deleteCarGoods(int goodsId[]){
		int result = 1;//Ĭ�ϲ����ɹ�
		try{
			for(int i=0;i<goodsId.length;i++){
				goodsCarDao.deleteCarInfo(goodsId[i]);
			}
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//ɾ�����ָ����Ʒ(���ﳵ����Ʒ)
	@Transactional
	public int deleteCarGoods(List<Map<String, Object>> waitOrder){
		int result = 1;//Ĭ�ϲ����ɹ�
		try{
			for(int i=0;i<waitOrder.size();i++){
				goodsCarDao.deleteCarInfo((Integer)waitOrder.get(i).get("goodsId"));
			}
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//������Ʒ(ͨ���������ֶ�)
	public PageUtil searchGoods(String searchText,int currentPage,int numPerPage){
		return goodsDao.queryGoods(searchText,currentPage,numPerPage);
	}
	//��ѯ������Ʒ(������������)
	public PageUtil searchGoods(int currentPage,int numPerPage){
		return goodsDao.searchAllGoods(currentPage, numPerPage);
	}
	//ͨ����Ʒ�����ȡ������Ʒ
	public PageUtil getClassifyGoodsInfo(String classifyOne,String classifyTwo,int currentPage,int numPerPage){
		int flag=0;
		PageUtil pageUtil = null;
		StringBuffer sql = new StringBuffer("select goodsId,goodsTitle,goodsPrice,goodsImg,goodsSaleNum,classifyOne," +
				"classifyTwo,goods.shopId,shopName from goods,shops where shops.shopId = goods.shopId and ");
		//����ķ��������֤��ȫΪ��
		//һ������
		if(classifyOne!=null){
			if(!classifyOne.equals("")){
				sql.append("classifyOne='"+classifyOne+"' ");
				flag = 1;
			}
		}
		//��������
        if(classifyTwo!=null){
            if(!classifyTwo.equals("")){
				if(flag==0){
					sql.append("classifyTwo='"+classifyTwo+"'");
				}else{
					sql.append("and classifyTwo='"+classifyTwo+"'");
				}
				flag = 1;
			}
		}
       
        if(flag==1){
        	//��ѯ������Ʒ���Ϸ�
        	sql.append(" order by goodsSaleNum desc");
        	System.out.println("��ѯ������Ʒ���"+sql.toString());
        	pageUtil = goodsDao.searchGoodsByClassify(sql.toString(), currentPage, numPerPage);
        }else{
        	//��ѯ������Ʒ��䲻�Ϸ�
        	System.out.println("��ѯ������Ʒ��䲻�Ϸ�");
        }
        return pageUtil;
	}
	//��ѯĳ����Ʒ��Ϣ
	public Goods getOneGoodsInfo(int goodsId){
		Goods goods = new Goods();
		List<Map<String, Object>> goodsList = goodsDao.queryGoods(goodsId);//ֻ��һ��
		goods.setGoodsId((Integer)goodsList.get(0).get("goodsId"));
		goods.setGoodsTitle((String)goodsList.get(0).get("goodsTitle"));
		goods.setGoodsName((String)goodsList.get(0).get("goodsName"));
		goods.setGoodsImg((String)goodsList.get(0).get("goodsImg"));
		goods.setGoodsPrice((String)goodsList.get(0).get("goodsPrice"));
		goods.setGoodsStruct((String)goodsList.get(0).get("goodsStruct"));
		goods.setGoodsNum((Integer)goodsList.get(0).get("goodsNum"));
		goods.setGoodsSaleNum((Integer)goodsList.get(0).get("goodsSaleNum"));
		goods.setGoodsDetail((String)goodsList.get(0).get("goodsDetail"));
		goods.setGoodsSaleTime((Timestamp)goodsList.get(0).get("goodsSaleTime"));
		goods.setVisitNum((Integer)goodsList.get(0).get("visitNum"));
		goods.setShopId((Integer)goodsList.get(0).get("shopId"));
		goods.setShopName((String)goodsList.get(0).get("shopName"));
		goods.setShopUserId((Integer)goodsList.get(0).get("shopUserId"));
		goods.setShopAdress((String)goodsList.get(0).get("shopAdress"));
		goods.setClassifyOne((String)goodsList.get(0).get("classifyOne"));
		goods.setClassifyTwo((String)goodsList.get(0).get("classifyTwo"));
		goods.setClassifyOneName((String)goodsList.get(0).get("classifyOneName"));
		goods.setClassifyTwoName((String)goodsList.get(0).get("classifyTwoName"));
		return goods;
	}
	//ͨ������id��ѯ����������Ϣ
	/*
	 * ������Ϣ��1���õ��������Ʒ��Ϣ    2���õ����Ʒ������Ϣ  3���õ�ĵ�����Ϣ
	 * 
	 */
	//��ȡ����������Ʒ��Ϣ
	public  PageUtil getShopGoods(int currentPage,int numPerPage,int shopId){
		return goodsDao.queryShopAllGoods(currentPage, numPerPage, shopId);
	}
	//��ȡ�õ��������Ʒ������Ϣ
	public  PageUtil getShopGoodsOrder(int currentPage,int numPerPage,int shopId){
		return goodsOrderDao.queryShopAllGoodsOrderInfoByShop(currentPage, numPerPage, shopId);
	}
	//��ȡ�õ�ĵ�����Ϣ 
	public ShopInfo getShopBasicInfo(int shopId){
		ShopInfo shopInfo = new ShopInfo();
		Map<String, Object> shopInfoMap= shopDao.queryShopInfo(shopId).get(0);
		shopInfo.setShopId(shopId);
		shopInfo.setBelongsAcademy((String)shopInfoMap.get("belongsAcademy"));
		shopInfo.setAcademyName((String)shopInfoMap.get("academyName"));
		shopInfo.setShopUserId((Integer)shopInfoMap.get("shopUserId"));
		shopInfo.setShopUserName((String)shopInfoMap.get("shopUserName"));
		shopInfo.setShopName((String)shopInfoMap.get("shopName"));
		shopInfo.setShopAdress((String)shopInfoMap.get("shopAdress"));
		shopInfo.setShopDesc((String)shopInfoMap.get("shopDesc"));
		shopInfo.setShopReform((String)shopInfoMap.get("shopReform"));
		shopInfo.setShopImg((String)shopInfoMap.get("shopImg"));
		shopInfo.setShopTel((String)shopInfoMap.get("shopTel"));
		shopInfo.setShopCreateTime((Timestamp)shopInfoMap.get("shopCreateTime"));
		shopInfo.setShopState((String)shopInfoMap.get("shopState"));
		shopInfo.setShopStatus((String)shopInfoMap.get("shopStatus"));
		return shopInfo;
	}
	//�޸ĵ�����Ϣ
	@Transactional
	public int updateShopBasicInfo(ShopInfo oldShopInfo,ShopInfo newShopInfo,MultipartFile img){
		//����Goods���ͶԱȣ��ԱȺ�õ��޸�sql��� 
		int flag = 0;//Ĭ�ϲ��޸�
		int result = 0;//���ؽ��
		StringBuffer sql = new StringBuffer("update shops set");
		//����ͷ��
		if(!oldShopInfo.getShopImg().equals(newShopInfo.getShopImg())){
			//��ͼƬ���浽����
			File myFile = new File("F:\\WebProject\\shopHeadImg");
			if(!myFile.exists()){
			   myFile.mkdir();
			}
			String imgUrl = uploadUtils.dealSimplePhoto("F:\\WebProject\\shopHeadImg\\","shopHeadImg",oldShopInfo.getShopId(), img);
			sql.append(" shopImg='"+imgUrl+"'");
			flag = 1;
		}
		//������ϵ�绰
		if(!oldShopInfo.getShopTel().equals(newShopInfo.getShopTel())){
			if(flag==0){
				sql.append(" shopTel='"+newShopInfo.getShopTel()+"'");
			}else{
				sql.append(",shopTel='"+newShopInfo.getShopTel()+"'");
			} 
			flag = 1;
		}
		//��������
		if(!oldShopInfo.getShopName().equals(newShopInfo.getShopName())){
			if(flag==0){
			  sql.append(" shopName='"+newShopInfo.getShopName()+"'");
			}else{
			  sql.append(",shopName='"+newShopInfo.getShopName()+"'");
			}	
			flag = 1;
		}
		//���̵�ַ
		if(!oldShopInfo.getShopAdress().equals(newShopInfo.getShopAdress())){
			if(flag==0){
				sql.append(" shopAdress='"+newShopInfo.getShopAdress()+"'");
			}else{
				sql.append(",shopAdress='"+newShopInfo.getShopAdress()+"'");
			} 
			flag = 1;
		} 
		//���̼��
		if(oldShopInfo.getShopDesc()==null){
			if(newShopInfo.getShopDesc().equals("")){
				 if(flag==0){
					sql.append(" shopDesc='"+newShopInfo.getShopDesc()+"'");
				 }else{
					 sql.append(",shopDesc='"+newShopInfo.getShopDesc()+"'"); 
				 }	 
				 flag = 1;
			}
		}else{
			if(!oldShopInfo.getShopDesc().equals(newShopInfo.getShopDesc())){
				 if(flag==0){
					sql.append(" shopDesc='"+newShopInfo.getShopDesc()+"'");
				 }else{
					 sql.append(",shopDesc='"+newShopInfo.getShopDesc()+"'"); 
				 }	 
				 flag = 1;
			} 
		}
		//���̹���
		if(oldShopInfo.getShopReform()==null){
			if(!newShopInfo.getShopReform().equals("")){
				if(flag==0){ 
				  sql.append(" shopReform='"+newShopInfo.getShopReform()+"'");
				}else{
					sql.append(",shopReform='"+newShopInfo.getShopReform()+"'");
				}	 
				flag = 1;
			}
		}else{
			if(!oldShopInfo.getShopReform().equals(newShopInfo.getShopReform())){
				if(flag==0){ 
				  sql.append(" shopReform='"+newShopInfo.getShopReform()+"'");
				}else{
					sql.append(",shopReform='"+newShopInfo.getShopReform()+"'");
				}	
				flag = 1;
			} 
		}
		//����Ӫҵ״̬
		if(!oldShopInfo.getShopState().equals(newShopInfo.getShopState())){
			if(flag==0){ 
				sql.append(" shopState='"+newShopInfo.getShopState()+"'");
			}else{
				sql.append(",shopState='"+newShopInfo.getShopState()+"'");
			} 
			flag = 1;
		} 
		/*//������Ȩ״̬
		if(!oldShopInfo.getShopStatus().equals(newShopInfo.getShopStatus())){
			 flag = 1;
			 sql.append(",shopStatus='"+newShopInfo.getShopStatus()+"'");
		} */
		sql.append(" where shopId="+oldShopInfo.getShopId());
		 if(flag==0){
			 //���޸Ķ���
			 result = 0;
			 System.out.println("δ�����޸ĵ��̻�����Ϣ");
		 }else{
			 //�������ݿ��޸�
			 System.out.println("�޸ĵ��̻�����Ϣ���:"+sql.toString());
			 result = shopDao.updateShopBasicInfo(sql.toString());
		 }
		return result;
	}
	/*//�������߼�
	@Transactional
	public synchronized int dealBuyGoods(GoodsOrder goodsOrder){
		int flag = 0;//Ĭ�Ϲ���ʧ��
		//�õ���������
		int buyNum =  goodsOrder.getTheGoodsNum();
		int goodsId = goodsOrder.getGoodsId();
		//������Ʒ�Ƿ����㹺��Ҫ��
		int nowTheGoodsNum = goodsDao.queryOneGoodsNum(goodsId);
		if(buyNum>nowTheGoodsNum){
			//��Ʒ���㹺��
			System.out.println("��Ʒ���㣬�޷�����!");
		}else{
			try {
				//���й���
				//�޸���Ʒ��Ϣ
				goodsDao.updateGoods(goodsId, -buyNum, +buyNum);//�����٣���������
				//������Ʒ����
				goodsOrderDao.addGoodsOrderInfo(goodsOrder);
				flag = 1;
			} catch (Exception e) {
				System.out.println("����ʧ��");
				e.printStackTrace();
			}
			
		}
		return flag;
	}*/
	
	//�����Ʒ�����ﳵ
	@Transactional
	public int addGoodsToCar(GoodsCar goodsCar){
		int result = 0;//Ĭ�����ʧ��
		//�Ȳ�ѯ�Ƿ��и���Ʒ������ֱ��������������������¼�¼
		try{
			List<Map<String, Object>> theGoods = goodsCarDao.queryCarInfo(goodsCar.getGoodsId());
			if(theGoods.size()>0){
				//��ʾ����Ʒ���ڹ��ﳵ
				goodsCarDao.updateCarInfo(goodsCar.getGoodsId(), goodsCar.getTheGoodsNum());
			}else{
				//����Ʒ���ڹ��ﳵ
				goodsCarDao.addGoods(goodsCar);
			}
			result = 1;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("���빺�ﳵʧ��");
		}
		return result;
	}
	//����ajax��̬�޸Ĺ��ﳵ����Ʒ�������޸�ǰ����Ƿ�Ϸ�
	@Transactional
	public int updateCarGoodsNum(int goodsId,int newNum){
		//����newNum��Ϊ��ǰ�޸��������Ǹ��ǵ�ǰ����ֵ
		int result = 0;//Ĭ�ϲ���ʧ��
		try{
			//�ȼ�����Ʒ�Ŀ��
			int theGoodsNum = goodsDao.queryOneGoodsNum(goodsId);
			if(theGoodsNum>0){
				//�ж��Ƿ���������
				if(newNum>theGoodsNum){
					//����
					result = 1;
				}else{
					//�㹻
					goodsCarDao.updateCarInfoNowNum(goodsId, newNum);//ֱ�Ӹ���ԭ����ֵ
					result = 2;//�����ɹ�
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//�鿴���ﳵ������Ʒ
	public PageUtil getMyCarAllGoods(int currentPage,int numPerPage,int userId){
		//�õ����ﳵ��Ʒʱ���ܴ��ڵ�����Ʒ�������󣬴�ʱȡ������Ʒ���ֵ�����ﳵ
		return goodsCarDao.queryAllCarGoods(currentPage, numPerPage, userId);
	}
	//��ȡѡ���µ�����Ʒ��Ϣ(���ﳵ����Ʒ)
	public List<Map<String, Object>> querySelectGoods(int goodsId[]){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		int length = goodsId.length;
		if(length>0){
			for(int i=0;i<length;i++){
				Map<String, Object> map = goodsCarDao.querySelectGoods(goodsId[i]).get(0);
				int theGoodsNum =  (Integer) map.get("theGoodsNum");
				if(theGoodsNum!=0){
					result.add(map);
				}	
			}
		}else{
			result = null;
		}
		return result;	
	}
	//����󶩵��ύ,�����ύ�ɹ���(��Դ���ﳵ����)
	@Transactional
	public int addGoodsOrder(List<Map<String, Object>> waitOrder,GoodsOrder goodsOrder,int type){
		//typeΪ1��ʾֱ�ӹ���typeΪ2��ʾ���ﳵѡ���µ�����
		int result = 1;//Ĭ����ӳɹ�
		try{
			if(type==1){
				//ֱ�ӹ���
				goodsOrderDao.addGoodsOrderInfo(goodsOrder);
			}else{
				//���ﳵѡ����
				for(int i=0;i<waitOrder.size();i++){
					//��ӵ�������
					Map<String, Object> map = waitOrder.get(i);
					int goodsId = (Integer)map.get("goodsId");
					String price = (String) map.get("goodsPrice");
					int theGoodsNum = (Integer) map.get("theGoodsNum");
					String orderMoney = TransformPrice.multiply(price, String.valueOf(theGoodsNum));
					goodsOrder.setGoodsId(goodsId);
					goodsOrder.setPrice(price);
					goodsOrder.setTheGoodsNum(theGoodsNum);
					goodsOrder.setOrderMoney(orderMoney);
					goodsOrderDao.addGoodsOrderInfo(goodsOrder);
				}
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//�޸Ķ�������״̬
	@Transactional
	public int updateGoodsOrderState(int orderId,String state){
		return goodsOrderDao.updateGoodsOrderState(orderId, state);
	}
}
