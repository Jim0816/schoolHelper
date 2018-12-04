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
    //将原来所有图片的地址改为空
    document.getElementById("goodsImg").value='';  
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
	changeShowSpanValue();
	var r=confirm("是否确认修改商品信息?");
	if(r==true){
		if(checkInputIsNull()==false || getHouseStruct()==false){
	        return false;
	    }else{
	    	return true;
	    } 
	}else{
		return false;
	}
}

function checkInputIsNull(){
    var imgResult = document.getElementById("result");
    var goodsTitle = document.getElementById('goodsTitle').value.replace(/\s/g, "");
    var goodsName = document.getElementById('goodsName').value.replace(/\s/g, "");
    var goodsPrice = document.getElementById('goodsPrice').value.replace(/\s/g, "");
    var goodsStruct= document.getElementById('goodsStruct').value.replace(/\s/g, "");
    var goodsNum = document.getElementById('goodsNum').value.replace(/\s/g, "");
    var classifyOne = document.getElementById('classifyOne').value.replace(/\s/g, "");
    var classifyTwo = document.getElementById('classifyTwo').value.replace(/\s/g, "");
    
    if(goodsTitle=="" || goodsName=="" || goodsPrice=="" || goodsStruct==""|| goodsNum=="" || classifyOne=="" || classifyTwo=="" || imgResult.children.length==0){
        if(goodsTitle==""){document.getElementById('tips1').style.color='red';}
        if(goodsName==""){document.getElementById('tips2').style.color='red';}
        if(goodsPrice==""){document.getElementById('tips3').style.color='red';}
        if(goodsNum==""){document.getElementById('tips4').style.color='red';}
        if(classifyOne=="" || classifyTwo==""){document.getElementById('tips5').style.color='red';}
        if(goodsStruct==""){document.getElementById('tips6').style.color='red';}
        if(imgResult.children.length==0){alert("请上传图片信息");}
        return false;
    }else{
        return true;
    }
}

function changeShowSpanValue(){
	var classifyOne = document.getElementById('classifyOne').value;
	var classifyTwo = document.getElementById('classifyTwo').value;
	if(classifyOne=="" || classifyTwo==""){
		var classify1 = document.getElementById('classify1').value.replace(/\s/g, "");
	    var classify2 = document.getElementById('classify2').value.replace(/\s/g, "");
	    if(classify1!="-1"){
	    	document.getElementById('classifyOne').value=classify1;
	    }
	    if(classify2!="-1"){
	    	document.getElementById('classifyTwo').value=classify2;
	    }
	}
}

function openUpdateClassify(){
	document.getElementById('classify1').disabled=false;
	document.getElementById('classify2').disabled=false;
	document.getElementById('selectDiv').style.opacity='1';
	document.getElementById('showDiv').style.opacity='0';
	document.getElementById('classifyOne').value='';
	document.getElementById('classifyTwo').value='';	
}