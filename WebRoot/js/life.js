window.onload=function(){
	getUnit();
	document.getElementById('company').value=0;
	document.getElementById('province').value=0;
	document.getElementById('servicePrice').value=2;
};


//处理首页按钮,实现内容更换
function responseBtn(obj){
	//按钮样式变化
	changeBtn(obj);
}
//处理按钮样式方法
function changeBtn(obj){
	var payment = document.getElementById('select1');
	var waterCenter = document.getElementById('select2');
	var delivery = document.getElementById('select3');
	var helpDo = document.getElementById('select4');
	var takeOrder = document.getElementById('select5');
    if(obj==payment){

    	payment.style.background='white';
    	payment.style.color='#1077CC';
    	waterCenter.style.background='#1077CC';
    	waterCenter.style.color='white';
    	delivery.style.background='#1077CC';
    	delivery.style.color='white';
    	helpDo.style.background='#1077CC';
    	helpDo.style.color='white';
    }else if(obj==waterCenter){

    	payment.style.background='#1077CC';
    	payment.style.color='white';
    	waterCenter.style.background='white';
    	waterCenter.style.color='#1077CC';
    	delivery.style.background='#1077CC';
    	delivery.style.color='white';
    	helpDo.style.background='#1077CC';
    	helpDo.style.color='white';
    }else if(obj==delivery){

    	payment.style.background='#1077CC';
    	payment.style.color='white';
    	waterCenter.style.background='#1077CC';
    	waterCenter.style.color='white';
    	delivery.style.background='white';
    	delivery.style.color='#1077CC';
    	helpDo.style.background='#1077CC';
    	helpDo.style.color='white';
    }else if(obj==helpDo){
    	payment.style.background='#1077CC';
    	payment.style.color='white';
    	waterCenter.style.background='#1077CC';
    	waterCenter.style.color='white';
    	delivery.style.background='#1077CC';
    	delivery.style.color='white';
    	helpDo.style.background='white';
    	helpDo.style.color='#1077CC';
    }else if(obj==takeOrder){
    	payment.style.background='#1077CC';
    	payment.style.color='white';
    	waterCenter.style.background='#1077CC';
    	waterCenter.style.color='white';
    	delivery.style.background='#1077CC';
    	delivery.style.color='white';
    	helpDo.style.background='white';
    	helpDo.style.color='#1077CC';
    	takeOrder.style.background='#1077CC';
    	takeOrder.style.color='white';
    }
}

//hex转换rgb的函数
function rgbToHex(liElement){
	var rgb = liElement.style.backgroundColor;
	rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
	return rgb= "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}
//rgb转换hex的函数
function hex(x) {
	return ("0" + parseInt(x).toString(16)).slice(-2);
}
//鼠标悬停改变背景色
function changeBg(obj){
	if(rgbToHex(obj)=='#1077cc'){
		obj.style.backgroundColor='#0c5799';
	}else if(rgbToHex(obj)=='#0c5799'){
		obj.style.backgroundColor='#1077cc';
	}
}
//修改代领快递服务费
function changePrice(obj){
	var price = obj.value;
	var priceSpan = document.getElementById('DeliveryPrice');
	if(price=='2.00'){
		priceSpan.innerHTML=price;
	}else if(price=='3.00'){
		priceSpan.innerHTML=price;
	}else if(price=='5.00'){
		priceSpan.innerHTML=price;
	}
}
//处理寄快递费用
function getAllPriceSend(){
	var allPrice = 0.00;
	var company = document.getElementById('company').value;
	var province = document.getElementById('province').value;
	var servicePrice = document.getElementById('servicePrice').value;
	if(company!='0' && province!='0'){
		//省份和快递公司都已经选好,准备定价:快递费
		allPrice = company*province;
		if(allPrice=='0'){
			allPrice='0.00';
		}else{
			allPrice = Number(allPrice)+Number(servicePrice)+'.00'; //快递费加服务费
			document.getElementById('servicePriceSpan').innerHTML = '¥'+servicePrice+'.00';
			document.getElementById('allPrice').innerHTML = allPrice;
		}
	}else{
		allPrice='0.00';
		document.getElementById('servicePriceSpan').innerHTML = '¥0.00';
		document.getElementById('allPrice').innerHTML = allPrice;
	}		
}

/*
* 送水中心
*/
function getUnit()
{   
	var arr = new  Array();
	//南区共30栋
	arr[0]="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋,15栋,16栋,17栋,18栋,19栋,20栋,21栋,22栋,23栋,24栋,25栋,26栋,27栋,28栋,29栋,30栋";
	//北区共14栋
	arr[1]="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋";
    var location = document.getElementById("location");
    var unit = document.getElementById("unit");
    var index = location.selectedIndex;
    var unitArr = arr[index].split(",");   
    
    unit.length = 0;
    //将楼栋数组中的值填充到楼栋下拉框中
    for(var i=0;i<unitArr.length;i++)
    {
    	unit[i]=new Option(unitArr[i],i+1);
    }
}
//通过所在区域确定配送部门
function changeDistributor(){
	var location = document.getElementById("location").value;
    var unit = document.getElementById("unit").value;
    if(location==0){
    	//南区
    	if(unit>17){
    		//南区一部配送
    		document.getElementById("distributor").innerHTML='南区一部';
    	}else{
    		//南区二部配送
    		document.getElementById("distributor").innerHTML='南区二部';
    	}
    }else{
    	//北区一部
    	document.getElementById("distributor").innerHTML='北区一部';
    }
}

/*
* 代办服务
*/
//两个费用文本框失去焦点时，计算总服务费，并且修改样式
function countAllPay(){
	var helpDoTip = document.getElementById("helpDoTip").value;
	var helpDoCost = document.getElementById("helpDoCost").value;
	
	if(helpDoTip!=null && helpDoCost!=null){
		if(helpDoTip=="请输入小费金额" || helpDoCost=="请输入代办费用"){
			
		}else{
			var all = (Number(helpDoTip)+Number(helpDoCost)).toFixed(2);;
			document.getElementById("helpDoAllCost").innerHTML = all;
		}	
	}
}
