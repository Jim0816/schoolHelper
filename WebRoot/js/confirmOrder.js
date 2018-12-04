   function inputCheck(obj){
       if(obj.id=="name"){
           if(obj.value.replace(/\s/g, "")=='请输入收货人姓名'){
               obj.value='';
               obj.style.color='black';
               document.getElementById("tips1").style.color='white';
           } 
       }else if(obj.id=="receiveTel"){
           if(obj.value.replace(/\s/g, "")=='请输入收货人电话'){
               obj.value='';
               obj.style.color='black';
               document.getElementById("tips2").style.color='white';
           }
       }else if(obj.id=="receiveAddress"){
           if(obj.value.replace(/\s/g, "")=='请输入收货地址'){
               obj.value='';
               obj.style.color='black';
               document.getElementById("tips3").style.color='white';
           }
       }else if(obj.id=="receiveRemark"){
            if(obj.value.replace(/\s/g, "")=='备注您的建议'){
               obj.value='';
               obj.style.color='black';
            }
       }
   }
	   
   function leaveInput(obj){
       if(obj.id=="name"){
           if(obj.value.replace(/\s/g, "")==''){
               obj.style.color='#DDDDDD';
               obj.value="请输入收货人姓名";
           }  
       }else if(obj.id=="receiveTel"){
           if(obj.value.replace(/\s/g, "")==''){
               obj.style.color='#DDDDDD';
               obj.value="请输入收货人电话";
           }  
       }else if(obj.id=="receiveAddress"){
           if(obj.value.replace(/\s/g, "")==''){
               obj.style.color='#DDDDDD';
               obj.value="请输入收货地址";
           }  
       }else if(obj.id=="receiveRemark"){
           if(obj.value.replace(/\s/g, "")==''){
               obj.style.color='#DDDDDD';
               obj.value="备注您的建议";
           }  
       }
   }
   
   function changeShow(obj){
       if(obj.id=="name"){
           if(obj.value.replace(/\s/g, "")=="" || obj.value.replace(/\s/g, "")=="请输入收货人姓名"){
           }else{
              document.getElementById("showName").innerHTML=obj.value; 
           }  
       }else if(obj.id=="receiveTel"){
           if(obj.value.replace(/\s/g, "")=="" || obj.value.replace(/\s/g, "")=="请输入收货人姓名"){
           }else{
              document.getElementById("showTel").innerHTML=obj.value;
           }  
       }else if(obj.id=="receiveAddress"){
           if(obj.value.replace(/\s/g, "")=="" || obj.value.replace(/\s/g, "")=="请输入收货人姓名"){
           }else{
              document.getElementById("showAddress").innerHTML=obj.value;
           }  
       }
   }
   
   function checkSubmit(){
       var receiveName = document.getElementById("name").value.replace(/\s/g, "");
       var receiveTel = document.getElementById("receiveTel").value.replace(/\s/g, "");
       var receiveAddress = document.getElementById("receiveAddress").value.replace(/\s/g, "");
       if(receiveName=="" || receiveName=="请输入收货人姓名" || receiveTel=="" ||receiveTel=="请输入收货人电话" || receiveAddress=="请输入收货地址" ||receiveAddress==""){
           if(receiveName=="" || receiveName=="请输入收货人姓名"){
               document.getElementById("tips1").style.color='red';
           }
           if(receiveTel=="" ||receiveTel=="请输入收货人电话"){
               document.getElementById("tips2").style.color='red';
           }
           if(receiveAddress=="请输入收货地址" ||receiveAddress==""){
               document.getElementById("tips3").style.color='red';
           }
           return false;
       }else{
           var receiveRemark = document.getElementById("receiveRemark").value;
           if(receiveRemark.replace(/\s/g, "")=="备注您的建议"){
               document.getElementById("receiveRemark").value="";
           }
           return true;
       }
   }