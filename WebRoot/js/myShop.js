var result=document.getElementById("result");  
var file=document.getElementById("file");   
function readAsDataURL(){
	var max = 6;
    var file = document.getElementById("file").files;
    var result=document.getElementById("result");  
    result.innerHTML ='';
    if(file.length<7){
    	max = file.length;
    }else{
    	max = 0;
    	alert("请重新选择图片，最多上传6张");
    }
    for(i = 0; i<max; i ++) {
        var reader    = new FileReader();    
        reader.readAsDataURL(file[i]);  
        reader.onload=function(e){  
            result.innerHTML = result.innerHTML +['<div style="float:left;margin-top:10px;margin-left:30px;width:78px;height:68px;background:gray;border:1px solid gray;">',
'                                          <div style="position:relative;width:78px;height:68px;background:white;">',
'	                                          <span style="position:absolute;right:0px;top:0px;width:15px;height:15px;line-height:10px;text-align:center;background:black;opacity:0.5;cursor:pointer;color:white;">x</span>',
'	                                          <img src="' + this.result +'" width="100%" height="100%"/>',
'                                          </div>',
'                                      </div>'].join("");    
        };

    }
}  

function showShopImg(){
	 var result=document.getElementById("result");  
	 result.innerHTML ='';
	 var file = document.getElementById("file").files;
	 var reader    = new FileReader();    
     reader.readAsDataURL(file[0]);  
     reader.onload=function(e){  
         result.innerHTML = result.innerHTML +['<img src="' + this.result +'" style="width:100%;height:100%;border-radius:30px;"/>'].join("");    
     };
     document.getElementById("isUpdateFlag").value="true"; 
     document.getElementById("shopImg").value="null";  
}
function changeClassify(obj){
    if(obj.value=='-1'){
    }else{
        getClassify();
    }
}
function getClassify()
{   
	var arr = new  Array();
	//生活家居
	arr[0]="家纺装饰,清洁工具,生活用品,生活保健,食物用具,个人护理,美妆,其他";
	//数码家电
	arr[1]="相机,手机,平板电脑,笔记本电脑,配件,小家电,其他";
	//服饰配件
	arr[2]="男装,女装,鞋子,箱包,首饰挂饰,礼服,其他";
	//食品水果
	arr[3]="饮料饮品,休闲零食,糖果饼干,糕点面包,新鲜水果,营养速食,坚果,辣条专区,其他";
	//学习办公
	arr[4]="杂志报刊,课本教辅,专业书籍,试卷材料,办公用品,工具书,其他";
	//其他
	arr[5]="乐器,DIY手工,校园网络,上门维修,鲜花,宠物,其他";
    var classify1 = document.getElementById("classify1");
    var classify2 = document.getElementById("classify2");
    var index = classify1.selectedIndex;
    var unitArr = arr[index-1].split(",");   
    classify2.length = 0;
    for(var i=0;i<unitArr.length;i++)
    {
        if(i==(unitArr.length-1)){
            //最后一个其他
            classify2[i]=new Option(unitArr[i],0);
        }else{
            classify2[i]=new Option(unitArr[i],i+1);
        }	
    }
}

function checkSubmit(){
    if(checkInputIsNull()==false || getHouseStruct()==false){
        return false;
    }else{
        return true;
    } 
}

function checkInputIsNull(){
    var file = document.getElementById("file").files;
    var goodsTitle = document.getElementById('goodsTitle').value.replace(/\s/g, "");
    var goodsName = document.getElementById('goodsName').value.replace(/\s/g, "");
    var goodsPrice = document.getElementById('goodsPrice').value.replace(/\s/g, "");
    var goodsStruct= document.getElementById('goodsStruct').value.replace(/\s/g, "");
    var goodsNum = document.getElementById('goodsNum').value.replace(/\s/g, "");
    var classify1 = document.getElementById('classify1').value.replace(/\s/g, "");
    var classify2 = document.getElementById('classify2').value.replace(/\s/g, "");
    
    if(goodsTitle=="" || goodsName=="" || goodsPrice=="" || goodsStruct=="" || goodsNum=="" || classify1=="-1" || classify2=="-1" || file.length==0){
        if(goodsTitle==""){document.getElementById('tips1').style.color='red';}
        if(goodsName==""){document.getElementById('tips2').style.color='red';}
        if(goodsPrice==""){document.getElementById('tips3').style.color='red';}
        if(goodsNum==""){document.getElementById('tips4').style.color='red';}
        if(goodsStruct==""){document.getElementById('tips6').style.color='red';}
        if(classify1=="-1" || classify2=="-1"){document.getElementById('tips5').style.color='red';}
        if(file.length==0){alert("请上传图片信息");}
        return false;
    }else{
        return true;
    }
}

function changeAllCheckBox(obj){
	//当前页商品总数
	var NowPageGoodsNum = document.getElementById('NowPageGoodsNum').value;
	if(obj.checked==true){
		//全选
		for(var i=0;i<NowPageGoodsNum;i++){
			document.getElementById(i).checked=true;
		}
	}else{
		//全不选
		for(var i=0;i<NowPageGoodsNum;i++){
			document.getElementById(i).checked=false;
		}
	}
}

function checkBoxSelect(){
	var flag=false;
	var NowPageGoodsNum = document.getElementById('NowPageGoodsNum').value;
	for(var i=0;i<NowPageGoodsNum;i++){
		if(document.getElementById(i).checked==true){
			flag = true;
		}
	}
	
	if(flag == true){
		return true;
	}else{
		alert("当前无选中项");
		return false;
	}
}

//店主修改联系电话
function changeInputTelStyle(obj){
	if(obj.id=="1"){
		//进行编辑电话号码
		var tel = document.getElementById("tel");
		tel.readOnly=false;
		tel.style.borderColor='black';
		obj.style.display='none';
		document.getElementById("true1").style.display='inline';
		document.getElementById("false1").style.display='inline';
	}else if(obj.id=="true1"){
		//确认修改
		//修改   修改标志
	    document.getElementById("isUpdateFlag").value="true"; 
		var tel = document.getElementById("tel");
		tel.readOnly=true;
		tel.style.borderColor='white';
		document.getElementById("1").style.display='inline';
		obj.style.display='none';
		document.getElementById("false1").style.display='none';
	}else{
		//取消修改
		var tel = document.getElementById("tel");
		var value1 = document.getElementById("value1").value;
		tel.readOnly=true;
		tel.style.borderColor='white';
		tel.value=value1;
		document.getElementById("1").style.display='inline';
		document.getElementById("true1").style.display='none';
		obj.style.display='none';
	}
}
//修改店铺地址
function changeInputAddressStyle(obj){
	if(obj.id=="2"){
		//进行编辑
		var address = document.getElementById("address");
		address.readOnly=false;
		address.style.borderColor='black';
		obj.style.display='none';
		document.getElementById("true2").style.display='inline';
		document.getElementById("false2").style.display='inline';
	}else if(obj.id=="true2"){
		//确认修改
		//修改   修改标志
	    document.getElementById("isUpdateFlag").value="true"; 
		var address = document.getElementById("address");
		address.readOnly=true;
		address.style.borderColor='white';
		document.getElementById("2").style.display='inline';
		obj.style.display='none';
		document.getElementById("false2").style.display='none';
	}else{
		//取消修改
		var value2 = document.getElementById("value2").value;
		var address = document.getElementById("address");
		address.readOnly=true;
		address.style.borderColor='white';
		address.value=value2;
		document.getElementById("2").style.display='inline';
		document.getElementById("true2").style.display='none';
		obj.style.display='none';
	}
}
//修改店铺名称
function changeInputShopNameStyle(obj){
	if(obj.id=="3"){
		//进行编辑
		var shopName = document.getElementById("shopName");
		shopName.readOnly=false;
		shopName.style.borderColor='black';
		obj.style.display='none';
		document.getElementById("true3").style.display='inline';
		document.getElementById("false3").style.display='inline';
	}else if(obj.id=="true3"){
		//确认修改
		//修改   修改标志
	    document.getElementById("isUpdateFlag").value="true"; 
		var shopName = document.getElementById("shopName");
		shopName.readOnly=true;
		shopName.style.borderColor='white';
		document.getElementById("3").style.display='inline';
		obj.style.display='none';
		document.getElementById("false3").style.display='none';
	}else{
		//取消修改
		var value3 = document.getElementById("value3").value;
		var shopName = document.getElementById("shopName");
		shopName.readOnly=true;
		shopName.style.borderColor='white';
		shopName.value=value3;
		document.getElementById("3").style.display='inline';
		document.getElementById("true3").style.display='none';
		obj.style.display='none';
	}
}
//修改店铺简介
function changeInputIntroduceStyle(obj){
	if(obj.id=="4"){
		//进行编辑
		var introduce = document.getElementById("introduce");
		introduce.readOnly=false;
		obj.style.display='none';
		document.getElementById("true4").style.display='inline';
		document.getElementById("false4").style.display='inline';
	}else if(obj.id=="true4"){
		//确认修改
		//修改   修改标志
	    document.getElementById("isUpdateFlag").value="true"; 
		var introduce = document.getElementById("introduce");
		introduce.readOnly=true;
		document.getElementById("4").style.display='inline';
		obj.style.display='none';
		document.getElementById("false4").style.display='none';
	}else{
		//取消修改
		var value4 = document.getElementById("value4").value;
		var introduce = document.getElementById("introduce");
		introduce.readOnly=true;
		introduce.value=value4;
		document.getElementById("4").style.display='inline';
		document.getElementById("true4").style.display='none';
		obj.style.display='none';
	}
}

//修改店铺公告
function changeInputReformStyle(obj){
	if(obj.id=="5"){
		//进行编辑
		var reform = document.getElementById("reform");
		reform.readOnly=false;
		obj.style.display='none';
		document.getElementById("true5").style.display='inline';
		document.getElementById("false5").style.display='inline';
	}else if(obj.id=="true5"){
		//确认修改
		//修改   修改标志
	    document.getElementById("isUpdateFlag").value="true"; 
		var reform = document.getElementById("reform");
		reform.readOnly=true;
		document.getElementById("5").style.display='inline';
		obj.style.display='none';
		document.getElementById("false5").style.display='none';
	}else{
		//取消修改
		var value5 = document.getElementById("value5").value;
		var reform = document.getElementById("reform");
		reform.readOnly=true;
		reform.value=value5;
		document.getElementById("5").style.display='inline';
		document.getElementById("true5").style.display='none';
		obj.style.display='none';
	}
}

//暂停营业
function closeShop(){
	document.getElementById("showTips").style.color='gray'; 
	document.getElementById("isUpdateFlag").value="true"; 
	document.getElementById("shopState").value='0';
}
//开始营业
function openShop(){
	document.getElementById("showTips").style.color='gray';
	document.getElementById("isUpdateFlag").value="true"; 
	document.getElementById("shopState").value='1';
}

function checkSubmitUpdateShopInfo(){
    var isUpdateFlag = document.getElementById("isUpdateFlag").value; 
    if(isUpdateFlag=="false"){
    	//表示无修改
    	alert("您未进行信息修改");
    	return false;
    }else{
    	//表示需要修改
    	 var msg = "是否确认修改?"; 
    	 if (confirm(msg)==true){ 
    	  return true; 
    	 }else{ 
    	  return false; 
    	 } 
    }
}