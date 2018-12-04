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
            //��ͼԤ��
            result.innerHTML = result.innerHTML +['<div style="float:left;margin-top:10px;margin-left:15px;width:78px;height:68px;background:gray;border:1px solid gray;">',
'                                          <div style="position:relative;width:78px;height:68px;background:white;">',
'	                                          <span style="position:absolute;right:0px;top:0px;width:15px;height:15px;line-height:10px;text-align:center;background:black;opacity:0.5;cursor:pointer;color:white;">x</span>',
'	                                          <img src="' + this.result +'" width="100%" height="100%"/>',
'                                          </div>',
'                                      </div>'].join("");    
        };

    }
}  

function preview(file)  
 {  
 var prevDiv = document.getElementById('preview');  
 if (file.files && file.files[0])  
 {  
 var reader = new FileReader();  
 reader.onload = function(evt){  
 prevDiv.innerHTML = '<img src="' + evt.target.result + '" style="width:100%;height:100%;"/>';  
};  
 reader.readAsDataURL(file.files[0]);  
}  
 else    
 {  
 prevDiv.innerHTML = '<div class="img" style="width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';  
 }  
 }  