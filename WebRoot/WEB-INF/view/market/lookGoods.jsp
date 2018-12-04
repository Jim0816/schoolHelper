<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript">
        var showPhotoFlag;
        var imgNum;
        window.onload=function (){
            showPhotoFlag = 1;
            imgNum = document.getElementById('imgNum').value;
            document.getElementById(showPhotoFlag).parentNode.style.opacity='1';
            checkAddGoodsToCarResult();
        };
         //检查加入购物车
		function checkAddGoodsToCarResult(){
		    var addResult='<%=request.getAttribute("addResult")%>';
		    if(addResult=="null"||addResult=="")
				{//不存在
				}else{
			      document.getElementById('addTips').style.visibility="visible";  
			      setTimeout(hiddenAddTip,1000);
		     }
		 }
		 
		function hiddenAddTip(){
		    document.getElementById('addTips').style.visibility="hidden"; 
		}
        function hiddenClassifyDiv(){
            document.getElementById('showClassify').style.visibility="hidden";
        }
        
        function showClassifyDiv(){
            document.getElementById('showClassify').style.visibility="visible";
        }
        
        function addNum(){
           var buyNum = document.getElementById('buyNum').value;
           var num = Number(buyNum)+Number(1);
           if(checkNum(num)){
               document.getElementById('buyNum').value=num;
               document.getElementById('theGoodsNum').value=num;
               changeAllPrice(num);    
           }
        }
        
        function lessNum(){
           var buyNum = document.getElementById('buyNum').value;
           var num = Number(buyNum)-Number(1);
           if(buyNum>1){
               document.getElementById('buyNum').value=num;
               document.getElementById('theGoodsNum').value=num; 
               changeAllPrice(num);       
           } 
        }
        
        function changeGoodsNum(){
            var num = document.getElementById('buyNum').value.replace(/\s/g, "");//输入的数量
            if(checkNum(num)){
                //库存足够
                document.getElementById('theGoodsNum').value=num; 
                changeAllPrice(num);         
            }  
        }
        //修改总价（隐藏传入后台）
        function changeAllPrice(num){
            var price = document.getElementById('price').innerHTML.replace(/\s/g, "");
            allPrice = (Number(num)*Number(price)).toFixed(2);
            document.getElementById('allPrice').value=allPrice;  
        }
        
        function checkNum(num){
            var goodsNum = document.getElementById('goodsNum').innerHTML.replace(/\s/g, "");
            if(Number(num)>Number(goodsNum)){
                alert("数量超出范围");
                return false;
            }else{
                return true;
            }
        }
        
        function changeShowPhoto(obj){
            showPhotoFlag = obj.id;
            document.getElementById('bigPhoto').src=obj.src;
            document.getElementById('bigPhotoASrc').href=obj.src;
            
            for(var i=1;i<imgNum+1;i++)
		    {
		        var img = document.getElementById(i);
		    	if(img==obj){
		    	     var father = img.parentNode;
                     father.style.opacity='1';
		    	}else{
		    	     var father = img.parentNode;
                     father.style.opacity='0.5';
		    	}
		    }
		    
        }
        function goPre(){
            if(showPhotoFlag>1 && Number(showPhotoFlag)<Number(imgNum+1)){
                 showPhotoFlag = Number(showPhotoFlag)-1;
                 var obj = document.getElementById(showPhotoFlag);
                 changeShowPhoto(obj);
            }
        }
        function goNext(){
            if(showPhotoFlag>0 && Number(showPhotoFlag)<Number(imgNum)){
                 showPhotoFlag = Number(showPhotoFlag)+1;
                 var obj = document.getElementById(showPhotoFlag);
                 changeShowPhoto(obj);
            }
        }
        
        //检查用户是否登录
		function checkUser(){
		    var user='<%=session.getAttribute("user")%>';
		    if(user=="null"||user=="")
				{
				  alert("您还未登陆，请先登录！");
				  return false;
				}else{
				   return true;
		     }
		 }
        
        //检查是否为商家自己购买自家商品
        function checkMyself(){
            var userId =document.getElementById('userId').value;
            var shopUserId =document.getElementById('shopUserId').value;
            if(userId==shopUserId){
                //无法购买自己店铺商品
                alert("亲，无法购买自家商品哦!");
                return false;
            }else{
                return true; 
            }
        }

        function checkSubmit(){
            var theGoodsNum = document.getElementById('theGoodsNum').value;
            if(checkUser()==true && checkMyself()==true && checkNum(theGoodsNum)==true){
                return true;
            }else{
                return false;
            }
        }
        
        
       function addToCar(){
            if(checkSubmit()==true){
                 document.myform.action="${pageContext.request.contextPath }/market/1/14";
		         document.myform.submit();
            }
		}
		
		function directBuy(){
            if(checkSubmit()==true){
                 document.myform.action="${pageContext.request.contextPath }/market/1/13";
		         document.myform.submit();
            }
		}
		
		function enterCar(){
		document.getElementById("theCar").className="theCar1";
		}
		
		function leaveCar(){
			document.getElementById("theCar").className="theCar";
		}

    </script>
    <style type="text/css">
       a:visited {color: gray;}
	   a:link{	color:gray;}
	   a:hover {color: black;}
	   a:active {color:black;}
	   
       .aaa:visited {color: white;}
	   .aaa:link{	color:white;}
	   .aaa:hover {color: red;}
	   .aaa:active {color: red;}
       
        .a1:visited {color: gray;}
		.a1:link{	color:gray;}
		.a1:hover {color: red;}
		.a1:active {color: red;}
		
		.a4:visited {color:#A999B5;}
		.a4:link{	color:#A999B5;}
		.a4:hover {color:black;}
		.a4:active {color:black;}
		
		
		.enlargePhoto{
		    position:absolute;
		    width:300px;
		    height:300px;
		    top:225px;
		    left:530px;
		}
		
		.bg_top_top{
			position:relative;
			width: 100%;
		    height: 30px;
		    background:#F8F8F8;
		    overflow:hidden;
		}
		
		.nevigationBar{
			position:absolute;
			top:40px;
			right:156px;
			width:1000px;
		    height:288px;
		    background:white;
		    visibility:hidden;
		    z-index:2;
		    border-left:2px solid #EEEEEE;
		    border-right:2px solid #EEEEEE;
		    border-bottom:2px solid #EEEEEE;
		}

        .bg{
            width:1500px;
            background:white;
        }
        
        .center{
           width:100%;
           height:600px;
           background:white;  
        }
        
         .center_1{
           width:100%;
           height:110px;
           background:white;
         }
         
         .logo{
           float:left;
           margin-top:20px;
           margin-left:10%;
           width:10%;;
           height:60px;
           background:white;
         }
         
         .center_1_search{
           float:left;
           margin-top:20px;
           margin-left:8%;
           width:44%;;
           height:70px;
           background:white;
         }
         
         @keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		@-moz-keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		@-webkit-keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		@-o-keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		.car{
			float:right;
			margin-top:20px;
			margin-right:150px;
			width:120px;
		    height: 50px;
		    cursor:pointer;
		    border-bottom:1px solid #EEEEEE;
		}
		
		.carRoad{
			position:relative;
			left:0px;
			top:5px;
			width:120px;
			height:40px;
		}
		
		.theCar{
			position:absolute;
			left:0px;
			width:40px;
			height:40px;
			background:white;
			animation-name:car;
		    animation-duration:5s;
		    animation-iteration-count:infinite;
		    animation-direction:alternate; 
		    animation-play-state:running; 
		}
		
		.theCar1{
			position:absolute;
			left:0px;
			width:40px;
			height:40px;
			background:white;
			animation-name:car;
		    animation-duration:5s;
		    animation-iteration-count:infinite;
		    animation-direction:alternate; 
		    animation-play-state:paused; 
		}
         
          .center_2{
           float:left;
           width:100%;
           height:38px;
           background:white;
           border-bottom: 2px solid red;
         }
         
         .showClassify{
           position:absolute;
           top:190px;
           left:10.5%;
           width:300px;
           height:538px;
           background:white;
           visibility:hidden;
           z-index:3; 
         }
         
         .bg_middle_1_select1,.bg_middle_1_select2,.bg_middle_1_select3,.bg_middle_1_select4,.bg_middle_1_select5,.bg_middle_1_select6{
		   width:95%;
		   height:60px;
		   float:left;
		   margin-left:5%;
		}

         .center_2_select{
           float:left;
           width:130px;
           height:38px;
           background:red;
           color:white;
           text-align:center;
           line-height:35px;
         }
         
          .center_3{
           float:left;
           width:100%;
           height:30px;
           background:#F0F0F0;
           font-size:85%;
         }
         
         .center_4{
           float:left;
           margin-top:10px;
           margin-left:10%;
           width:80%;
           height:500px;
           background:white;
         }
         
         .center_4_left{
           float:left;
           width:30%;
           height:500px;
           background:white; 
         }
         
         .imgs{
           position:relative;
           left:0px;
           top:15px;
           width:100%;
           height:75px;
           background:white;
           overflow:hidden;
        }
        
        .imgs_pre{
           position:absolute;
           left:0px;
           top:0px;
           width:25px;
           height:75px;
           line-height:65px;
           color:white;
           font-size:150%;
           cursor:pointer;
           background:black;
           opacity:0.5; 
           z-index:2;
        }
        
         .imgs_next{
           position:absolute;
           right:0px;
           top:0px;
           width:25px;
           height:75px;
           line-height:65px;
           color:white;
           cursor:pointer;
           font-size:150%;
           background:black;
           opacity:0.5;
            z-index:2; 
        }
        
        .imgs_show{
           position:absolute;
           left:0px;
           top:0px;
           width:680px;
           height:75px;
           background:white;
            z-index:1;
        }
        
        .img{
            float:left;
            width:75px;
            height:75px;
            margin-left:10px;
            background:white;
            cursor:pointer;
            opacity:0.5;
        }
        
          .center_4_right{
           float:left;
           margin-left:2%;
           width:68%;
           height:500px;
           background:white; 
         }
         
         .bottom{
			float:left;
			margin-left:10%;
			width:80%;
			height:130px;
			background:white;
		}
		
		.addGoodsToCar{
		   position:absolute;
		   left:45%;
		   top:400px;
		   width:10%;
		   height:50px;
		   background:black;
		   opacity:0.4;
		   border-radius:5px;
		   visibility:hidden;
		}
    </style>
  </head>
  <%
      String addGoods = UUID.randomUUID().toString();
      session.setAttribute("addGoods", addGoods);
   %>
  <body>
      <%-- <div class="enlargePhoto"><img src="${imgs.get(0)}" width="100%" height="100%"/></div> --%>
      <div class="addGoodsToCar" id="addTips">
          <center>
              <font style="color:white;font-size:120%;line-height:40px;">${addResult}</font>
          </center>
      </div>
      <center>
          <div id="nevigationBar" class="nevigationBar">
            <span style="float:left;margin-top:15px;margin-left:3.5%;width:17%;height:250px;">
                <span style="float:left;width:100%;height:30px;text-align:center;color:red">首页</span>
                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/market/First" style="text-decoration:none">校园商城</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/market/First" style="text-decoration:none">兼职信息</a></span>
            </span>
            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
                <span style="float:left;width:100%;height:30px;text-align:center;color:red">生活中心</span>
                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/1" style="text-decoration:none">缴费大厅</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/2" style="text-decoration:none">送水中心</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/3" style="text-decoration:none">物业报修</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/4" style="text-decoration:none">快递服务</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/5" style="text-decoration:none">房屋租赁</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/6" style="text-decoration:none">我要接单</a></span>
            </span>
            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
                <span style="float:left;width:100%;height:30px;text-align:center;color:red">学习交流</span>
                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/1" style="text-decoration:none">学习大厅</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/2" style="text-decoration:none">交流论坛</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/3" style="text-decoration:none">资源共享</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/4" style="text-decoration:none">成绩查询</a></span>
            </span>
            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
                <span style="float:left;width:100%;height:30px;text-align:center;color:red">校园动态</span>
                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/schoolState/1" style="text-decoration:none">校园资讯</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/schoolState/3" style="text-decoration:none">校园通知</a></span>
            </span>
            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
                <span style="float:left;width:100%;height:30px;text-align:center;color:red">关于我们</span>
                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="#" style="text-decoration:none">客户中心</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">联系我们</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">加入我们</a></span>
            </span>
        </div>
         <div class="bg_top_top" >
             <span style="float:left;margin-left:10%;width:20px;height:30px;"><img src="./images/First/dingwei.jpg" width="100%" height="100%"/></span>
             <span style="float:left;margin-left:5px;height:30px;line-height:28px;color:gray;font-size:80%;">[<font id="location">${sessionScope.location}</font>]</span>
             <c:choose>
                 <c:when test="${sessionScope.user==null}">
                     <font style="float:left;margin-left:30px;font-size:80%;color:red;line-height:28px;">Hi~</font>
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=a3" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=a3" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a3">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=a3" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=a3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
        </div>
          <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
              <div class="center">
                  <div id="showClassify" class="showClassify">
                      <div style="float:left;margin-top:5px; background:black;opacity:0.6;width:100%;height:533px;">
				           <span><a class="aaa"href="${pageContext.request.contextPath }/market/1/10?one=1" style="text-decoration:none;font-size:120%;float:left;margin-left:5%;">生活家具</a></span><br/>
				           <div class="bg_middle_1_select1">
				               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=1" style="text-decoration:none;float:left;font-size:90%;">家纺装饰</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=2" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">清洁工具</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=3" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">生活用品</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=4" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">生活保健</a></span><br/>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=5" style="text-decoration:none;font-size:90%;float:left;margin-left:0px;">食物用具</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=6" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">个人护理</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=7" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">美妆</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=0" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">更多</a></span>
				           </div>
				           
				           <span><a class="aaa"href="${pageContext.request.contextPath }/market/1/10?one=2" style="text-decoration:none;font-size:120%;float:left;margin-left:5%;">数码家电</a></span><br/>
					       <div class="bg_middle_1_select2">
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=1" style="text-decoration:none;font-size:90%;float:left;">相机</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=2" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">手机</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=3" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">平板电脑</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=4" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">笔记本电脑</a></span>   
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=5" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">&nbsp配件</a></span><br/>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=6" style="text-decoration:none;font-size:90%;float:left;margin-left:0px;">小家电</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=0" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">更多</a></span>
					       </div>
				           
				           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3" style="text-decoration:none;font-size:120%;float:left;margin-left:5%;">服饰配件</a></span><br/>
				           <div class="bg_middle_1_select3">
				               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=1" style="text-decoration:none;font-size:90%;float:left;">男装</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=2" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">女装</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=3" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">鞋子</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=4" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">箱包</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=5" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">&nbsp首饰挂饰</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=6" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">&nbsp礼服</a></span><br/>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=7" style="text-decoration:none;font-size:90%;float:left;margin-left:0px;">户外用品</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=0" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">更多</a></span>
				           </div>
				           
				           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4" style="text-decoration:none;font-size:120%;float:left;margin-left:5%;">食品水果</a></span><br/>
				           <div class="bg_middle_1_select4">
				               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=1" style="text-decoration:none;float:left;font-size:90%;">饮料饮品</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=2" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">休闲零食</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=3" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">糖果饼干</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=4" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">糕点面包</a></span><br/>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=5" style="text-decoration:none;font-size:90%;float:left;margin-left:0px;">新鲜水果</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=6" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">营养速食</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=7" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">坚果</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=8" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">辣条专区</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=0" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">更多</a></span>
				           </div>
				           
				           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5" style="text-decoration:none;font-size:120%;float:left;margin-left:5%;">学习办公</a></span><br/>
				           <div class="bg_middle_1_select5">
				               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=1" style="text-decoration:none;font-size:90%;float:left;">杂志报刊</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=2" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">课本教辅</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=3" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">专业书籍</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=4" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">试卷材料</a></span><br/>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=5" style="text-decoration:none;font-size:90%;float:left;margin-left:0px;">办公用品</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=6" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">工具书</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=0" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">更多</a></span>
				           </div>   
				           
				           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6" style="text-decoration:none;font-size:120%;float:left;margin-left:5%;">其他</a></span><br/>
				           <div class="bg_middle_1_select6">
				               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=1" style="text-decoration:none;font-size:90%;float:left;">乐器</a></span>
				               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=2" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">DIY手工</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=3" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">校园网络</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=4" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">上门维修</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=5" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">鲜花</a></span><br/>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=6" style="text-decoration:none;font-size:90%;float:left;margin-left:0px;">宠物</a></span>
					           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=0" style="text-decoration:none;font-size:90%;float:left;margin-left:5px;">更多</a></span>
				           </div>    
				       </div>
                  
                  </div>
                  <div class="center_1" onmouseover="hiddenClassifyDiv()">
                        <span class="logo"><img src="./images/First/tb1.jpg" width="100%" height="100%"/></span>
                        <div class="center_1_search">
                            <input style="float:left;width:80%;height:48px;border:1px solid red;" type="text" value=""/>
 		                    <input style="float:left;width:20%;height:48px;background:red;color:white;border:none;cursor:pointer;" type="button" value="搜索"/>
                             <!-- <span style="float:left;width:90%;height:30px;">
			                    <font style="float:left;color:gray;font-size:90%;">热门搜索:</font>
			                    <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">二手书籍</a>
			                    <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">宠物转让</a>
			                    <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">韩国代购</a>
			                    <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">网络转让</a>
			                    <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">二手交易</a>
			                 </span> -->
                        </div>
                        <div class="car" onmouseover="enterCar()" onmouseout="leaveCar()" onclick="javascript:location.href='${pageContext.request.contextPath }/person/1/3?pageSource=a3' ">
				            <div class="carRoad">
				                <div id="theCar" class="theCar" title="购物车"><img src="./images/First/car.jpg" width="100%" height="100%"/></div>
				            </div>
				        </div>
                  </div>
                  <div class="center_2">
                      <span style="float:left;width:10%;height:100%;"></span>
                      <span class="center_2_select" onmouseover="showClassifyDiv()">分类商品     ∨  </span>
                  </div>
                  <div class="center_3" onmouseover="hiddenClassifyDiv()">
                      <a href="${pageContext.request.contextPath }/market/1/10?one=${oneGoodsInfo.getClassifyOne()}"><span style="float:left;margin-left:10%;line-height:30px;">${oneGoodsInfo.getClassifyOneName()}</span></a>
                      <span style="float:left;margin-left:5px;line-height:30px;">&gt</span>
                      <a href="${pageContext.request.contextPath }/market/1/10?one=${oneGoodsInfo.getClassifyOne()}&two=${oneGoodsInfo.getClassifyTwo()}"><span style="float:left;margin-left:5px;line-height:30px;">${oneGoodsInfo.getClassifyTwoName()}</span></a>
                      <span style="float:left;margin-left:5px;line-height:30px;">&gt</span>
                      <a href="javascript:void(0)"><span style="float:left;margin-left:5px;line-height:30px;">${oneGoodsInfo.getGoodsName()} </span></a>
                  </div>
                  <div class="center_4">
                      <div class="center_4_left" onmouseover="hiddenClassifyDiv()">
                          <div style="float:left;width:100%;height:60%;background:white;">
                              <div style="position:relative;width:100%;height:100%;">
                                  <!-- <div style="position:absolute;top:0px;left:0px;width:90px;height:90px;background:black;opacity:0.3;z-index:2;cursor:pointer;"></div> -->
                                  <div style="position:absolute;top:0px;left:0px;width:100%;height:100%;z-index:1;"><a id="bigPhotoASrc" target="_blank" href="${imgs.get(0)}"><img id="bigPhoto" src="${imgs.get(0)}" width="100%" height="100%"/></a></div>
                              </div>
                          
                          
                          </div>
	                      <div style="float:left;width:100%;height:20%;background:white;">
	                          <div class="imgs">
	                              <span class="imgs_pre" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.5'" onclick="goPre()">&lt</span>
	                              <span class="imgs_next" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.5'" onclick="goNext()">&gt</span>
	                              <div class="imgs_show">
	                              <!-- 最多放6张图片 -->
	                                  <input type="hidden" id="imgNum" value="${imgs.size()}"/>
	                                  <c:forEach items="${imgs}" var="item" varStatus="order">
	                                      <span title="${order.index+1}" class="img"><img id="${order.index+1}" onclick="javascript:changeShowPhoto(this);"src="${item}" width="100%" height="100%"/></span>
	                                  </c:forEach>
	                              </div>
	                          </div>
	                      </div>
                      </div>
                      <div class="center_4_right" onmouseover="hiddenClassifyDiv()">
                          <span style="float:left;width:100%;height:60px;background:white;font-size:110%;font-weight:bold;text-align:left;">${oneGoodsInfo.getGoodsTitle()}</span>
                          <span style="float:left;margin-left:20px;width:100%;height:30px;background:white;font-size:90%;text-align:left;color:gray;">${oneGoodsInfo.getGoodsDetail()}</span>
                          <div style="float:left;width:100%;height:160px;background:#F0F0F0;">
                              <div style="float:left;width:79%;height:160px;background:#F0F0F0;border-right:1px solid white;">
                                  <span style="float:left;width:100%;height:30px;">
                                      <span style="float:left;margin-left:15px;line-height:40px;color:gray;">价&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp格</span>
                                      <span style="float:left;margin-left:20px;line-height:40px;color:red;font-size:120%;"><font style="float:left;">￥</font><font id="price" style="float:left;">${oneGoodsInfo.getGoodsPrice()}</font></span>
                                  </span>
                                  <span style="float:left;width:100%;height:30px;">
                                      <span style="float:left;margin-left:15px;line-height:40px;color:gray;">规&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp格</span>
                                      <span style="float:left;margin-left:20px;line-height:40px;color:gray;">${oneGoodsInfo.getGoodsStruct()} </span>
                                  </span>
                                  <span style="float:left;width:100%;height:30px;">
                                      <span style="float:left;margin-left:15px;line-height:40px;color:gray;">库&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</span>
                                      <span id="goodsNum" style="float:left;margin-left:20px;line-height:40px;color:gray;">${oneGoodsInfo.getGoodsNum()}</span>
                                      <span style="float:left;margin-left:5px;line-height:38px;color:gray;">(件)</span>
                                  </span>
                                  <span style="float:left;width:100%;height:30px;">
                                      <span style="float:left;margin-left:15px;line-height:40px;color:gray;">上架时间</span>
                                      <span style="float:left;margin-left:20px;line-height:40px;color:gray;"><fmt:formatDate value="${oneGoodsInfo.getGoodsSaleTime()}" pattern="yyyy-MM-dd"/></span>
                                  </span>
                                  <span style="float:left;width:100%;height:30px;">
                                      <span style="float:left;margin-left:15px;line-height:40px;color:gray;">商&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp家</span>
                                      <span style="float:left;margin-top:10px;margin-left:20px;width:20px;height:20px;"><img  src="./images/comm/shopDefault.jpg"  width="100%" height="100%"/></span>
                                      <span style="float:left;margin-left:10px;line-height:38px;color:gray;"><a href="${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${oneGoodsInfo.getShopId()}"><img  src="${item.get('shopImg')}">${oneGoodsInfo.getShopName()}</a></span>
                                  </span>
                              </div>
                              <div style="float:left;width:20%;height:160px;background:#F0F0F0;">
                                  <span style="float:left;margin-left:10%;margin-top:5%;width:80%;height:40%;">
                                      <span style="float:left;width:100%;height:50%;color:gray;">浏览量</span>
                                      <span style="float:left;width:100%;height:50%;font-size:85%;color:pink;">${oneGoodsInfo.getVisitNum()}</span>
                                  </span>
                                  <span style="float:left;margin-left:10%;margin-top:3%;width:80%;height:1%;background:white;"></span> 
                                  <span style="float:left;margin-left:10%;margin-top:3%;width:80%;height:40%;">
                                      <span style="float:left;width:100%;height:50%;color:gray;">销售量</span>
                                      <span style="float:left;width:100%;height:50%;font-size:85%;color:pink;">${oneGoodsInfo.getGoodsSaleNum()}</span>
                                  </span>
                              </div>
                          </div>
                          <span style="float:left;margin-top:5px;width:100%;height:94px;border-bottom:1px solid #F0F0F0;">
                              <span style="float:left;width:100%;height:30px;">
                                  <span style="float:left;margin-left:15px;line-height:40px;color:gray;">配&nbsp&nbsp送&nbsp&nbsp至</span>
                                  <span style="float:left;margin-left:20px;line-height:40px;color:black;">
                                      <span style="float:left;color:gray;">您的位置</span>
                                  </span>
                              </span>
                              <span style="float:left;margin-left:87px;height:60px;background:white;">
                                  <span style="float:left;margin-left:15px;line-height:40px;color:gray;">由</span>
                                  <span style="float:left;margin-left:10px;line-height:40px;color:red;">${oneGoodsInfo.getShopName()}</span>
                                  <span style="float:left;margin-left:10px;line-height:40px;color:gray;">从</span>
                                  <span style="float:left;margin-left:10px;line-height:40px;color:black;">${oneGoodsInfo.getShopAdress()}</span>
                                  <span style="float:left;margin-left:10px;line-height:40px;color:gray;">&nbsp发货，并提供优质的售后服务</span>
                              </span>
                            </span>
                          
	                          <div style="float:left;margin-top:5px;width:100%;height:94px;border-bottom:1px solid #F0F0F0;">
	                              <div style="float:left;margin-left:2%;margin-top:20px;width:80px;height:50px;border:1px solid gray;">
	                                  <span  style="float:left;width:75%;height:100%;background:white;text-align:center;line-height:55px;">
	                                      <input id="buyNum" name="buyTheGoodsNum" type="text" value="1" style="float:left;margin-top:30%;margin-left:15%;width:70%;height:40%;text-align:center;border:none;"/>
	                                  </span>
	                                  <div style="float:left;width:25%;height:100%;background:white;">
	                                      <table border="0"  width="100%" height="100%" style="border-collapse:collapse;">
	                                          <tr>
	                                              <td><span style="float:left;width:100%;height:100%;background:black;color:white;text-align:center;cursor:default;opacity:0.3;" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='0.3'" onclick="addNum()">+</span></td>
	                                          </tr>
	                                          <tr>
	                                              <td><span style="float:left;width:100%;height:100%;background:black;color:white;text-align:center;cursor:default;opacity:0.3;" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='0.3'" onclick="lessNum()">-</span></td>
	                                          </tr>
	                                      </table>
	                                  </div>
	                              </div>
	                              <input type="hidden" id="shopUserId" value="${oneGoodsInfo.getShopUserId()}"/>
	                              <form name="myform" action="" method="post">
	                                  <input type="hidden" name="goodsId" value="${oneGoodsInfo.getGoodsId()}"/>
	                                  <input type="hidden" id="userId" name="userId" value="${sessionScope.user.getUserId()}"/>
	                                  <input type="hidden" id="theGoodsNum" name="theGoodsNum" value="1"/>
	                                  <input type="hidden" name="addGoods" value="<%=addGoods%>"/>
	                                  <input type="button" style="float:left;margin-left:3%;margin-top:20px;width:15%;height:50px;background:red;color:white;text-align:center;line-height:45px;cursor:pointer;border:none;border:1px solid red;font-size:100%;" value="加入购物车" onclick="addToCar()" onmouseover="changeGoodsNum()"/>
	                                  <input type="hidden" id="allPrice" name="allPrice" value="${oneGoodsInfo.getGoodsPrice()}"/>
	                                  <input type="button" style="float:left;margin-left:3%;margin-top:20px;width:15%;height:50px;background:red;color:white;text-align:center;line-height:45px;cursor:pointer;border:none;border:1px solid red;font-size:100%;" value="购买" onclick="directBuy()" onmouseover="changeGoodsNum()"/>
	                              </form>
	                          </div>
                      </div>
                  </div>
              </div>
              <div class="bottom">
			     <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		         <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
	          </div>
          </div>
      </center>
  </body>
</html>
