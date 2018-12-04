window.onload = function(){
	//topView();
	//PartJobView();
	//changeTopAdvJob();
	changeTopGoodsImg();
};



//控制顶部商品广告图片
function changeTopGoodsImg(){
	//获取五张图片节点
	var img1 = document.getElementById('img1');
	var img2 = document.getElementById('img2');
	var img3 = document.getElementById('img3');
	var img4 = document.getElementById('img4');
	var img5 = document.getElementById('img5');
	//获取五个圆点节点
	var dot1 = document.getElementById('dot1');
	var dot2 = document.getElementById('dot2');
	var dot3 = document.getElementById('dot3');
	var dot4 = document.getElementById('dot4');
	var dot5 = document.getElementById('dot5');
	//获取图片移动按钮节点
	var pre = document.getElementById('pre');
	var next = document.getElementById('next');
	
	var index = 1;//默认开始显示第一张图片
	//var topGoodsImgsNum = document.getElementById('topGoodsImgsNum').value;//顶部商品广告数量
	var timer;//全局变量 ，保存返回的定时器
	timer = setInterval(autoChange,5000);
	//显示第几张图片
	function showTopGoodsImg(){
		if(index==1){
			img1.style.zIndex=5;
			img2.style.zIndex=4;
			img3.style.zIndex=3;
			img4.style.zIndex=2;
			img5.style.zIndex=1;
			dot1.style.background='red';
			dot2.style.background='gray';
			dot3.style.background='gray';
			dot4.style.background='gray';
			dot5.style.background='gray';
		}else if(index==2){
			img2.style.zIndex=5;
			img1.style.zIndex=1;
			img3.style.zIndex=4;
			img4.style.zIndex=3;
			img5.style.zIndex=2;
			dot1.style.background='gray';
			dot2.style.background='red';
			dot3.style.background='gray';
			dot4.style.background='gray';
			dot5.style.background='gray';
		}else if(index==3){
			img3.style.zIndex=5;
			img1.style.zIndex=2;
			img2.style.zIndex=1;
			img4.style.zIndex=4;
			img5.style.zIndex=3;
			dot1.style.background='gray';
			dot2.style.background='gray';
			dot3.style.background='red';
			dot4.style.background='gray';
			dot5.style.background='gray';
		}else if(index==4){
			img4.style.zIndex=5;
			img1.style.zIndex=3;
			img2.style.zIndex=2;
			img3.style.zIndex=1;
			img5.style.zIndex=4;
			dot1.style.background='gray';
			dot2.style.background='gray';
			dot3.style.background='gray';
			dot4.style.background='red';
			dot5.style.background='gray';
		}else if(index==5){
			img5.style.zIndex=5;
			img2.style.zIndex=4;
			img1.style.zIndex=3;
			img3.style.zIndex=2;
			img4.style.zIndex=1;
			dot1.style.background='gray';
			dot2.style.background='gray';
			dot3.style.background='gray';
			dot4.style.background='gray';
			dot5.style.background='red';
		}	
	}
	//定时器自动改变
	function autoChange(){
		showTopGoodsImg();
		if(index>0 && index<5){
			index+=1;
		}else{
			index = 1;
		}
	}
	//监听鼠标移动事件
	img1.addEventListener('mouseout', function () {
      timer = setInterval(autoChange,5000);
    },false);
	img1.addEventListener('mousemove', function () {
      clearInterval(timer);
    },false);
	
	img2.addEventListener('mouseout', function () {
      timer = setInterval(autoChange,5000);
    },false);
	img2.addEventListener('mousemove', function () {
      clearInterval(timer);
    },false);
	
	img3.addEventListener('mouseout', function () {
      timer = setInterval(autoChange,5000);
    },false);
	img3.addEventListener('mousemove', function () {
      clearInterval(timer);
    },false);
		
	img4.addEventListener('mouseout', function () {
      timer = setInterval(autoChange,5000);
    },false);
	img4.addEventListener('mousemove', function () {
      clearInterval(timer);
    },false);
			
	img5.addEventListener('mouseout', function () {
      timer = setInterval(autoChange,5000);
    },false);
	img5.addEventListener('mousemove', function () {
      clearInterval(timer);
    },false);
	
	pre.addEventListener('mouseout', function () {
      timer = setInterval(autoChange,5000);
    },false);
	pre.addEventListener('mousemove', function () {
      clearInterval(timer);
    },false);
	
	next.addEventListener('mouseout', function () {
      timer = setInterval(autoChange,5000);
    },false);
	next.addEventListener('mousemove', function () {
      clearInterval(timer);
    },false);
	
	pre.onclick= function(){
		if(index>1){
			index-=1;
		}
		showTopGoodsImg();
	};
	
    next.onclick= function(){
    	if(index<5){
			index+=1;
		}
    	showTopGoodsImg();
	};
}


/*function topView(){
	var flag=1;
	var photos = document.getElementById('photos');
	function move(){
  	  if(flag==0){
  		photos.style.left = '0%';
  		flag = 1;
  	  }else if(flag==1){
  		photos.style.left = '-100%'; 
  		flag = 0;
  	  }
    }
	var timer = setInterval(move,4000);//全局变量 ，保存返回的定时器
	photos.addEventListener('mouseout', function () {
      timer = setInterval(move,4000);
    },false);
	photos.addEventListener('mousemove', function () {
      clearInterval(timer);//鼠标移入清除定时器
    },false);
}*/

/*function PartJobView(){
	var flag1=1;
	var partJobImgs = document.getElementById('partJobImgs');
	function move1(){
	  	  if(flag1==0){
	  		partJobImgs.style.left = '0%';
	  		flag1 = 1;
	  	  }else if(flag1==1){
	  		partJobImgs.style.left = '-51.5%'; 
	  		flag1 = 2;
	  	  }else if(flag1==2){
		  		partJobImgs.style.left = '-103%'; 
		  		flag1 = 0;
		  	  }
	    }	
	var timer1 = setInterval(move1,3000);//全局变量 ，保存返回的定时器
	partJobImgs.addEventListener('mouseout', function () {
      timer1 = setInterval(move1,3000);
    },false);
	partJobImgs.addEventListener('mousemove', function () {
      clearInterval(timer1);//鼠标移入清除定时器
    },false);
}*/

/*function changeTopAdvJob(){
	var advs = document.getElementById('advs');
	var adv = document.getElementById('adv');
	var flag2=0;
	function move1(){
	  	  if(flag2==0){
	  		advs.style.top = '0px';
	  		flag2 = 1;
	  	  }else if(flag2==1){
	  		advs.style.top = '-40px';
	  		flag2 = 2;
	  	  }else if(flag2==2){
	  		advs.style.top = '-80px';
	  		flag2 = 3;
		  }else if(flag2==3){
		  		advs.style.top = '-120px';
		  		flag2 = 4;
		  }else if(flag2==4){
		  		advs.style.top = '-160px';
		  		flag2 = 0;
	      }
	    }	
	var timer2 = setInterval(move1,5000);//全局变量 ，保存返回的定时器
}*/

function enterTopBg(){
	document.getElementById("slideDiv").className="slideDiv1";
}

function leaveTopBg(){
	document.getElementById("slideDiv").className="slideDiv";
}

function enterCar(){
	document.getElementById("theCar").className="theCar1";
}

function leaveCar(){
	document.getElementById("theCar").className="theCar";
}