function addNum(obj){
	var index =  obj.id.split("#")[0];//当前原始序号
	var goodsId = document.getElementById(index).value;
	var nowNum = document.getElementById(index+'#N').innerHTML;//当前数量
	var newNum = Number(nowNum)+Number(1);//准备修改后的数量
	updateMySql(index,goodsId,newNum);
    //判断是否被选中，被选中则需要修改价格合计
	var checkBox = document.getElementById(index).checked;//是否被选中标志
	if(checkBox==true){
		//需要修改合计
		changeAllPrice();
	}
}

function lessNum(obj){
	var index =  obj.id.split("#")[0];//当前原始序号
	var goodsId = document.getElementById(index).value;
	var nowNum = document.getElementById(index+'#N').innerHTML;//当前数量
	var newNum = Number(nowNum)-Number(1);//准备修改后的数量
	if(nowNum>1){
		updateMySql(index,goodsId,newNum);
	} 
    //判断是否被选中，被选中则需要修改价格合计
	var checkBox = document.getElementById(index).checked;//是否被选中标志
	if(checkBox==true){
		//需要修改合计
		changeAllPrice();
	}  
}

//待添加直接修改数量
function updateMySql(index,goodsId,newNum){
	ajax(
			{
			    method:"POST",
				url:"http://localhost:8080/schoolHelper/market/1/18",
				type:"text",
				params:"goodsId="+goodsId+"&newNum="+newNum,
				callback:function(data) {
					if(data=="success"){
						//修改成功
						document.getElementById(index+'#N').innerHTML=newNum;//修改数量
					}else{
						alert(data);
					}
				}
			}
		);
}
/*function changeGoodsNum(obj){
    document.getElementById('theGoodsNum').value=obj.value;    
}*/

function changeAllPrice(){
	//每次执行时从新更新合计，不叠加 
	var goodsAllNum = document.getElementById("NowPageGoodsNum").value; //商品种类总数
	var allPrice="0.00";//默认价格为0
	var flag = false;//标志原价是否被修改
    for (i=0;i<goodsAllNum; i++){
    	    var theCheckBox = document.getElementById(i+1);//得到每个checkBox的所选参数值
            if(theCheckBox.checked){
            	//获取当前被选中checkBox的id ,得到该商品数量，单价。
            	var theCheckBoxId = theCheckBox.id;
            	var thePrice = document.getElementById(theCheckBoxId+'#P').innerHTML;//单价
            	var theNum = document.getElementById(theCheckBoxId+'#N').innerHTML;//数量
            	var theOneAllPrice = Number(theNum)*(thePrice);
            	allPrice = Number(allPrice)+Number(theOneAllPrice);
            	flag = true;
            } 
    }
    //更新合计价格
    if(flag==true){
    	document.getElementById("allPrice").innerHTML=allPrice.toFixed(2);
    	document.getElementById("allPriceHidden").value=allPrice.toFixed(2);
    }else{
    	document.getElementById("allPrice").innerHTML=allPrice;//一位0.00不能和上述一致转换
    }  
}

function changeAllCheckBox(obj){
	var goodsAllNum = document.getElementById("NowPageGoodsNum").value; //商品种类总数
	if(obj.checked==true){
		//全选
		for (i=0; i<goodsAllNum; i++){
			document.getElementById(i+1).checked=true;	
		}
	}else{
		//全不选
		for (i=0; i<goodsAllNum; i++){
			document.getElementById(i+1).checked=false;
		}
	}
	//更新合计价钱
	changeAllPrice();
}