package com.school.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.school.domain.marketbeans.Goods;
import com.school.domain.marketbeans.GoodsCar;
import com.school.domain.marketbeans.GoodsOrder;
import com.school.domain.marketbeans.ShopApplyInfo;
import com.school.domain.marketbeans.ShopInfo;
import com.school.domain.personbeans.User;
import com.school.service.GetLocationDBService;
import com.school.service.MarketService;
import com.school.utils.DivideImgSrc;
@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired
	private MarketService marketService;
	@Autowired
	private GetLocationDBService getLocationDBService;
	@RequestMapping(value="/location",method=RequestMethod.GET)
	public String getLocation(HttpServletRequest request){
		String schoolName = request.getParameter("schoolName");
		//System.out.println("����ѧУ:"+schoolName);
		HttpSession session = request.getSession(true);
		session.setAttribute("location",schoolName);
		//getLocationDBService.updateConfig(schoolName);
		return "redirect:/market/First";
	}
	@RequestMapping(value="/First",method=RequestMethod.GET)
	public String goFirst(HttpServletRequest request, HttpServletResponse response){
		List<Map<String, Object>> advListTop = marketService.getAdvertisement();
		List<Map<String, Object>> jobList = marketService.ParttimeJob();
		HttpSession session = request.getSession(true);
		session.setAttribute("advListTop", advListTop);
		session.setAttribute("jobList", jobList);
		session.setAttribute("topSixShop", marketService.getAllShopInfo(1, 6));//�ṩ��ҳ���ŵ���
		session.setAttribute("topGoods", marketService.searchGoods(1,12));//�ṩ��ҳ������Ʒ
		session.setAttribute("shopAdvInfo", marketService.getShopAdvInfo(1, 3));//�̳ǵ��̺������
		session.setAttribute("goodsAdvInfo", marketService.getGoodsAdvInfo(1, 5));//�̳���Ʒ�������
		return "/market/First";
	}
	
	/*
	 * ��������
	 */
	//�����������
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String goShopApply(HttpServletRequest request, HttpServletResponse response){
		/*
		 * ��һ����Ҫ�����Ѿ���������̵��˲��������ս���ǣ�ֻ�кϸ��û����ܽ����������
		 */
		String url="/market/First";
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if(user!=null){
			int applyUserId = user.getUserId();
			List<Map<String, Object>> result = marketService.queryShopApplyInfo(applyUserId);
			if(result.size()==0){
				//���û������������¼,��������ҳ��
				url="/market/shopApply";
			}else{
				url="/market/shopApplyStatus";
				//���û����������¼
				request.setAttribute("shopApplyInfo", result);
				String applyStatus = (String) result.get(0).get("applyStatus");
				if("0".equals(applyStatus)){
					//������
					request.setAttribute("applyStatus","0");
				}else if("1".equals(applyStatus)){
					//����ɹ�
					request.setAttribute("applyStatus","1");
				}else{
					//����ʧ��
					request.setAttribute("applyStatus","-1");
				}
			}
		}
		return url;
	}
	//���������ύ
	@RequestMapping(value="/1/1",method=RequestMethod.POST)
	public String submitShopApply(HttpServletRequest request,@RequestParam("img") MultipartFile img,ShopApplyInfo shopApplyInfo){
		//��ֹ���ظ��ύ
		String reqapplyFlag = request.getParameter("applyFlag");
		HttpSession session = request.getSession();
		String sessapplyFlag = (String) session.getAttribute("applyFlag");
		session.removeAttribute("applyFlag");
		if(reqapplyFlag.equals(sessapplyFlag)){
			//�Ϸ��ύ
			int result = marketService.addShopApplyInfo(shopApplyInfo, img);
			request.setAttribute("result", result);
		}else{
			//�ظ��ύ
			System.out.println("�ظ��ύ����������Ϣ!");
		}
		return "/market/First";
	}
	//�����ҵĵ���
	@RequestMapping(value="/1/2",method=RequestMethod.GET)
	public String goMyShop(HttpServletRequest request){
		String url ="/userInfoManager/myShop";
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if(user==null){
			//����idΪ�գ����Ϸ�
			String pageSource = request.getParameter("pageSource");
			url = "redirect:/person/user/login?pageSource="+pageSource;
		}else{
			//�Ϸ�
			//��ѯ���û��ĵ���
			int shopUserId = user.getUserId();
			List<Map<String, Object>> result = marketService.queryShopInfo(Integer.valueOf(shopUserId));
			if(result.size()>0){
				String target = request.getParameter("target");
				//��ȡ�õ��̵�id
				int shopId = (Integer) result.get(0).get("shopId");
				int currentPage = 1;
				String page = request.getParameter("currentPage");
				if(page!=null && !"0".equals(page)){
					currentPage = Integer.valueOf(page);
				}
				/*
				 * target��ʾ������̵�ҳ��ѡ��(Ĭ�Ͻ��������Ʒҳ��)
				 * 1:��ʾ���������Ʒҳ��
				 * 2:��ʾ������Ʒ�ϴ�ҳ��
				 * 3:��ʾ���뽻�׶���ҳ��
				 * 4:��ʾ����Ӫҵ��Ϣҳ��
				 */
				
				if(target==null || target.equals("1")){
					//������ҳ(������Ʒҳ��)
					session.setAttribute("goods",marketService.getShopGoods(currentPage, 10, shopId));
					//���̵���Ϣ�ڵ�һ�ν������ʱ�ͱ�����session��(��֤��һ�ν��������Ʒ��ҳ)
					session.setAttribute("shopInfo",marketService.getShopBasicInfo(shopId));
					request.setAttribute("target", "1");
				}else if(target.equals("2")){
					//������Ʒ�ϴ�ҳ��
					request.setAttribute("target", "2");
				}else if(target.equals("3")){
					//���뽻�׶���ҳ��
					session.setAttribute("goodsOrder",marketService.getShopGoodsOrder(currentPage, 10, shopId));
					request.setAttribute("target", "3");
				}else if(target.equals("4")){
					//����Ӫҵ��Ϣҳ��
					request.setAttribute("target", "4");
				}else{
					//������ҳ(������Ʒҳ��)
					session.setAttribute("goods",marketService.getShopGoods(currentPage, 10, shopId));
					//���̵���Ϣ�ڵ�һ�ν������ʱ�ͱ�����session��(��֤��һ�ν��������Ʒ��ҳ)
					session.setAttribute("shopInfo",marketService.getShopBasicInfo(shopId));
					request.setAttribute("target", "1");
				}
			}else{
				//���û����̲�����,ת������ҳ��
				url="redirect:/market/1";
			}
		}
		return url;
	}
	
	//�����ϴ���Ʒ
	@RequestMapping(value="/1/3",method=RequestMethod.POST)
	public String submitGoods(@RequestParam("img") MultipartFile img[],HttpServletRequest request,Goods goods){
		//��ֹ���ظ��ύ
		String reqshopFlag = request.getParameter("shopFlag");
		HttpSession session = request.getSession();
		String sessshopFlag = (String) session.getAttribute("shopFlag");
		session.removeAttribute("shopFlag");
		if(reqshopFlag.equals(sessshopFlag)){
			//�Ϸ��ύ
			int result = marketService.addGoods(goods, img);
			request.setAttribute("result", result);
			request.setAttribute("target", "2");
		}else{
			//�ظ��ύ
			System.out.println("�ظ��ύ��Ʒ��Ϣ!");
		}
		return "/userInfoManager/myShop";
	}
	//�޸���Ʒ��Ϣ���
	@RequestMapping(value="/1/4",method=RequestMethod.GET)
	public String goUpdateGoods(HttpServletRequest request){
		String goodsId = request.getParameter("goodsId");
		Goods goods = marketService.getOneGoodsInfo(Integer.valueOf(goodsId));
		HttpSession session = request.getSession();
		session.setAttribute("theGoods",goods);//����Goods����
		String allImgUrl = goods.getGoodsImg();
		if(!allImgUrl.trim().equals("")){
			List<String> imgUrl = DivideImgSrc.divideSrc(allImgUrl);
			request.setAttribute("imgs",imgUrl);
		}
		return "/market/updateGoods";
	}
	//�޸���Ʒ��Ϣ�ύ
	@RequestMapping(value="/1/5",method=RequestMethod.POST)
	public String updateGoods(@RequestParam("img") MultipartFile img[],HttpServletRequest request,Goods goods){
		//��ֹ���ظ��ύ
		String requpdateGoodsFlag = request.getParameter("updateGoodsFlag");
		HttpSession session = request.getSession();
		String sessupdateGoodsFlag = (String) session.getAttribute("updateGoodsFlag");
		session.removeAttribute("updateGoodsFlag");
		if(requpdateGoodsFlag.equals(sessupdateGoodsFlag)){
			//�Ϸ��ύ
			Goods oldGoods= (Goods) session.getAttribute("theGoods");
			marketService.updateGoods(goods, img,oldGoods);
			request.setAttribute("target", "1");
		}else{
			//�ظ��ύ
			System.out.println("�ظ��ύ�޸���Ʒ��Ϣ!");
		}
		return "redirect:/market/1/2";
	}
	//ɾ����ѡ��Ʒ(����ɾ��������Ʒ)
	@RequestMapping(value="/1/6",method=RequestMethod.POST)
	public String deleteSelectedGoods(@RequestParam("goodsId") int goodsId[],HttpServletRequest request){
	    marketService.deleteSomeGoods(goodsId);
		return "redirect:/market/1/2";
	}
	//�޸ĵ��̻�����Ϣ
	@RequestMapping(value="/1/7",method=RequestMethod.POST)
	public String updateShopBasicInfo(@RequestParam("img") MultipartFile img,HttpServletRequest request,ShopInfo newShopInfo){
		//δ����ֹ���ظ��ύ����
		HttpSession session = request.getSession();
		ShopInfo oldShopInfo = (ShopInfo) session.getAttribute("shopInfo");
		request.setAttribute("result",marketService.updateShopBasicInfo(oldShopInfo, newShopInfo, img));
		//���µ�����Ϣ��session
		session.setAttribute("shopInfo",marketService.getShopBasicInfo(oldShopInfo.getShopId()));
		request.setAttribute("target", "4");
		return "/userInfoManager/myShop";
	}
	//�鿴��Ʒ���
	@RequestMapping(value="/1/8",method=RequestMethod.GET)
	public String goGoodsInfo(HttpServletRequest request){
		int goodsId = Integer.valueOf(request.getParameter("goodsId"));
		Goods oneGoodsInfo = marketService.getOneGoodsInfo(goodsId);
		HttpSession session = request.getSession();
		session.setAttribute("imgs",DivideImgSrc.divideSrc(oneGoodsInfo.getGoodsImg()));
		session.setAttribute("oneGoodsInfo", oneGoodsInfo);
		return "/market/lookGoods";
	}
	//������Ʒ
	@RequestMapping(value="/1/9",method=RequestMethod.POST)
	public String searchGoods(HttpServletRequest request,HttpServletResponse response){
		String page = request.getParameter("currentPage");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		String searchText = request.getParameter("searchText");
		HttpSession session = request.getSession();
		session.setAttribute("searchResult",marketService.searchGoods(searchText,currentPage,24));
		return "/market/showAllGoods";
	}
	//�������ѯ��Ʒ
	@RequestMapping(value="/1/10",method=RequestMethod.GET)
	public String searchGoodsByClassify(HttpServletRequest request,HttpServletResponse response){
		String page = request.getParameter("currentPage");
		String one = request.getParameter("one");
		String two = request.getParameter("two");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		HttpSession session = request.getSession();
		session.setAttribute("one", one);
		session.setAttribute("two", two);
		session.setAttribute("searchResult",marketService.getClassifyGoodsInfo(one, two, currentPage,24));
		return "/market/showAllGoods";
	}
	//��ѧԺ�����ѯ����
	@RequestMapping(value="/1/11",method=RequestMethod.GET)
	public String searchShopsByLocation(HttpServletRequest request,HttpServletResponse response){
		String page = request.getParameter("currentPage");
		String academy = request.getParameter("a");
		int currentPage = 1;
		if(page!=null){
			currentPage = Integer.valueOf(page);
		}
		HttpSession session = request.getSession();
		session.setAttribute("shopsResult",marketService.getAllShopInfoByAcademy(academy, currentPage, 10));
		return "/market/showAllShops";
	}
	//�û��������
	@RequestMapping(value="/1/12",method=RequestMethod.GET)
	public String enterShop(HttpServletRequest request,HttpServletResponse response){
		String returnUrl = "/market/lookShop";
		HttpSession session = request.getSession();
		String direct = request.getParameter("direct");
		String shopId = request.getParameter("shopId");
		//���������ҳ
		if(direct==null || direct.equals("") || direct.equals("1")){
			session.setAttribute("shopForBuyerLookInfo", marketService.queryShopInfoByShopIdForBuyer(Integer.valueOf(shopId)));
		}else{
			returnUrl = "/market/shopAllGoods";
			//���������Ʒҳ
			//�ж��Ƿ��ڱ��������������
			String page = request.getParameter("currentPage");
			int currentPage = 1;
			if(page!=null){
				currentPage = Integer.valueOf(page);
			}
			String searchText = request.getParameter("searchText");
			if(searchText==null){
				//Ĭ�Ͻ�����Ʒҳ��������
				session.setAttribute("searchResult",marketService.getShopGoods(currentPage, 24, Integer.valueOf(shopId)));
			}else{
				//�û�ͨ������������Ʒҳ
				session.setAttribute("searchResult",marketService.searchGoods(searchText,currentPage,24));
			}
			
		}
		return returnUrl;
	}
	//��ת���µ�ȷ��ҳ��(ֱ�ӹ���)
	@RequestMapping(value="/1/13",method=RequestMethod.POST)
	public String goOrder(HttpServletRequest request){
		//�õ���������Ʒ������
		String theGoodsNum = request.getParameter("theGoodsNum");
		//�õ���������Ʒ���ܷ���
		String allPrice = request.getParameter("allPrice");
		//�õ���������Ʒ�Ļ�����Ϣ
		HttpSession session = request.getSession();
		Goods oneGoodsInfo = (Goods) session.getAttribute("oneGoodsInfo");
		request.setAttribute("direct", "one");
		session.setAttribute("allPrice",allPrice);
		session.setAttribute("theGoodsNum", theGoodsNum);
		session.setAttribute("waitOrder",oneGoodsInfo);
		return "/market/confirmOrder";
	}
	//������Ʒ�����ﳵ
	@RequestMapping(value="/1/14",method=RequestMethod.POST)
	public String addGoodsToCar(HttpServletRequest request,GoodsCar goodsCar){
		//��ֹ���ظ��ύ
		String reqaddGoods = request.getParameter("addGoods").replace("/","");//�������ݴ��ݺ󷴱������"/"
		HttpSession session = request.getSession();
		String sessaddGoods = (String) session.getAttribute("addGoods");
		session.removeAttribute("addGoods");
		if(reqaddGoods.equals(sessaddGoods)){
			//�Ϸ��ύ
			int addResult = marketService.addGoodsToCar(goodsCar);
			if(addResult==1){
				//��ӳɹ�
				request.setAttribute("addResult","��ӳɹ�");
			}else{
				//���ʧ��
				request.setAttribute("addResult","���ʧ��");
			}
		}else{
			//�ظ��ύ
			request.setAttribute("addResult","�޷��ظ��ύ");
			System.out.println("�ظ��ύ��ӹ��ﳵ��");
		}
		return "/market/lookGoods";
	}
	//�����ҵĹ��ﳵ
	@RequestMapping(value="/1/15",method=RequestMethod.GET)
	public String goMyCar(HttpServletRequest request){
		String Url = "/userInfoManager/myCar";
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null){
			//û�е�¼����ʾ�û���¼
			Url = "/market/First";
		}else{
			//�Ϸ����빺�ﳵ
			String page = request.getParameter("currentPage");
			int currentPage = 1;
			if(page!=null){
				currentPage = Integer.valueOf(page);
			}
			session.setAttribute("myCarAllGoods",marketService.getMyCarAllGoods(currentPage, 50, user.getUserId()));
		}
		return Url;
	}
	//ɾ�����ﳵ�е���Ʒ
	@RequestMapping(value="/1/16",method=RequestMethod.POST)
	public String deleteCarGoods(@RequestParam("goodsId") int goodsId[],HttpServletRequest request){
		//��ֹ���ظ��ύ
		String reqmyCarFlag = request.getParameter("myCarFlag").replace("/","");//�������ݴ��ݺ󷴱������"/"
		HttpSession session = request.getSession();
		String sessmyCarFlag = (String) session.getAttribute("myCarFlag");
		session.removeAttribute("myCarFlag");
		if(reqmyCarFlag.equals(sessmyCarFlag)){
			//�Ϸ��ύ
			int deleteResult = marketService.deleteCarGoods(goodsId);
			if(deleteResult==1){
				//ɾ���ɹ�
				request.setAttribute("deleteResult","ɾ���ɹ�");
			}else{
				//ɾ��ʧ��
				request.setAttribute("deleteResult","ɾ��ʧ��");
			}
		}else{
			//�ظ��ύ
			request.setAttribute("deleteResult","�޷��ظ��ύ");
			System.out.println("�ظ��ύɾ�����ﳵ��Ʒ");
		}
		User user = (User) session.getAttribute("user");
		session.setAttribute("myCarAllGoods",marketService.getMyCarAllGoods(1, 50, user.getUserId()));
		return "/userInfoManager/myCar";
	}
	
	//ȷ�϶���ҵ��(��ת����д�ջ���Ϣ)
	@RequestMapping(value="/1/17",method=RequestMethod.POST)
	public String confirmOrder(@RequestParam("goodsId") int goodsId[],HttpServletRequest request){
		String allPrice = request.getParameter("allPrice");
		HttpSession session = request.getSession();
		request.setAttribute("direct", "two");
		session.setAttribute("allPrice",allPrice);
		session.setAttribute("waitOrder",marketService.querySelectGoods(goodsId));
		return "/market/confirmOrder";
	}
	//�޸Ĺ��ﳵ��ĳ����Ʒ������
	@RequestMapping(value="/1/18",method=RequestMethod.POST)
	public void updateCarOneGoodsNum(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/text;charset=UTF-8");
		//��Ҫ�ж���Ʒ����Ƿ�����
		String goodsId = request.getParameter("goodsId");
		String newNum = request.getParameter("newNum");
		int result = marketService.updateCarGoodsNum(Integer.valueOf(goodsId), Integer.valueOf(newNum));
		String returnText = "����ʧ��";
		if(result == 0){
			//����ʧ��
			returnText = "����ʧ��";
		}else if(result == 1){
			//��Ʒ��治��
			returnText = "��治��";
		}else if(result == 2){
			//�����ɹ�
			returnText = "success";
		}
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(returnText);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//�����ύ
	@Transactional
	@RequestMapping(value="/1/19",method=RequestMethod.POST)
	public String buyGoods(HttpServletRequest request,GoodsOrder goodsOrder){
        String type = request.getParameter("type");
        synchronized(this){
            if(type.trim().equals("one")){
    			try{
    				//ֱ�ӹ��򶩵��ύ
    				int updateResult = marketService.updateGoods(goodsOrder.getGoodsId(), goodsOrder.getTheGoodsNum());
    				if(updateResult==1){
    					//���ݿ���³ɹ�,��ʼ��Ӷ�����Ϣ
    					int addResult = marketService.addGoodsOrder(null, goodsOrder, 1);
    					if(addResult==1){
    						request.setAttribute("buyResult", "1");
    					}else{
    						request.setAttribute("buyResult", "0");
    					}
    				}else{
    					request.setAttribute("buyResult", "0");
    				}
    			}catch(RuntimeException e){
    				//e.printStackTrace();
    				request.setAttribute("buyResult", "0");
    			}	
    		}else{
    			//�ӹ��ﳵ�����ύ
    			try {
    				HttpSession session = request.getSession();
					List<Map<String, Object>> waitOrder = (List<Map<String, Object>>) session.getAttribute("waitOrder");
    				int updateResult = marketService.updateGoods(waitOrder);//�޸���Ʒ�Ŀ�������
    				if(updateResult==1){
    					int addResult = marketService.addGoodsOrder(waitOrder, goodsOrder,2);//��Ӷ�����Ϣ
    				    if(addResult==1){
    				    	int deleteResult = marketService.deleteCarGoods(waitOrder);//ɾ�����ﳵ��¼
    				        if(deleteResult==1){
    				        	request.setAttribute("buyResult","1");
    				        }else{
    				        	request.setAttribute("buyResult","0");
    				        }
    				    }else{
    				    	request.setAttribute("buyResult","0");
    				    }
    				}else{
    					request.setAttribute("buyResult","0");
    				}
    			} catch (RuntimeException e) {
    				e.printStackTrace();
    				request.setAttribute("buyResult","0");
    			}	
    		}
        }
		return "/market/buyResult";
	}
	//ȷ���ջ�
	@RequestMapping(value="/1/20",method=RequestMethod.GET)
	public String successGetGoods(HttpServletRequest request){
		//��Ҫ�ж���Ʒ����Ƿ�����
		int result = 0;
		String orderId = request.getParameter("orderId");
		//ȷ���ջ�
		result = marketService.updateGoodsOrderState(Integer.valueOf(orderId), "1");
		return "redirect:/person/1/2?result="+result;
	}
}
