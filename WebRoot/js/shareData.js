
function getChildSubject()
{   //用于上传资源时的学科选项联动
	var arr = new  Array();
	arr[1]="动物科学,动物药学,动物医学,动植物检疫,林学,农学,农业资源与环境,水产养殖学,园林,园艺,植物保护,种子科学与工程,茶学";
	arr[2]="地理信息科学,生物技术,生物科学,信息与计算科学,应用化学";
	arr[3]="城乡规划,电子信息工程,风景园林,环境工程,环境科学,机械设计制造及自动化,计算机科学与技术,林产化工,农业机械化及自动化,农业水利工程,软件工程,生物工程,食品科学与工程,食品质量与安全,土木工程,物联网工程,制药工程,车辆工程";
	arr[4]="国际经济与贸易,经济学,经融学";
	arr[5]="财务管理,电子商务,工商管理,公共事业管理,会计学,劳动与社会保障,旅游管理,农林经济管理,市场营销,土地资源管理";
	arr[6]="汉语言文学,日语,英语,商务英语";
	arr[7]="法学";
	arr[8]="教育技术学,农艺教育";
	arr[9]="环境设计,音乐学,数字媒体艺术";
	arr[10]="其他";
    var subjectType = document.getElementById("subjectType");
    var subject = document.getElementById("subjectArr");
    var index = subjectType.selectedIndex; //selectedIndex从0开始
    if(index>0){
    	var subjectList = arr[index].split(",");
    	subject.length=0;
    	for(var i=0;i<subjectList.length;i++)
        {
    		subject[i]=new Option(subjectList[i],i+1);//前者为内容,后者为value
        }
    }    
}

function Scroll(){
    var center_2_right = document.getElementById('center_2_right');
    var  center_2= document.getElementById('center_2');
    if(center_2.offsetTop-document.body.scrollTop<0){
        center_2_right.style.top="0px";
    }else{
        center_2_right.style.top=(430-document.body.scrollTop)+"px";
    }
}

function showSubject(obj){
		changeSubjectHtml(obj);
		obj.style.color="#F06F4B";
	    document.getElementById('subject').style.visibility="visible"; 
}

function hiddenSubject(obj){
    obj.style.color='black';
   /* if(obj.getAttribute("data-subject")=="j"){
    	document.getElementById('subject').style.visibility="hidden";  
    }*/
      
}

function changeSubjectHtml(obj){
	var subjectType = obj.getAttribute("data-subject"); //获取
	if(subjectType=="a"){
		//农学
		var subject = document.getElementById('subject');
		subject.innerHTML=['<span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a1" style="text-decoration:none;">动物科学</a></span>  ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a2" style="text-decoration:none;">动物药学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a3" style="text-decoration:none;">动物医学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a4" style="text-decoration:none;">动植物检疫</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a5" style="text-decoration:none;">林学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a6" style="text-decoration:none;">农学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a7" style="text-decoration:none;">农业资源与环境</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a8" style="text-decoration:none;">水产养殖学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a9" style="text-decoration:none;">园林</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a10" style="text-decoration:none;">园艺</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a11" style="text-decoration:none;">植物保护</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a12" style="text-decoration:none;">种子科学与工程</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=a13" style="text-decoration:none;">茶学</a></span>    '].join("");
	}else if(subjectType=="b"){
		//理学
		var subject = document.getElementById('subject');
		subject.innerHTML=[' <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=b1" style="text-decoration:none;">地理信息科学</a></span>  ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=b2" style="text-decoration:none;">生物技术</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=b3" style="text-decoration:none;">生物科学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=b4" style="text-decoration:none;">信息与计算科学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=b5" style="text-decoration:none;">应用化学</a></span>'].join("");
	}else if(subjectType=="c"){
		//工学
		var subject = document.getElementById('subject');
		subject.innerHTML=['  <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c1" style="text-decoration:none;">城乡规划</a></span>  ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c2" style="text-decoration:none;">电子信息工程</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c3" style="text-decoration:none;">风景园林</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c4" style="text-decoration:none;">环境工程</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c5" style="text-decoration:none;">环境科学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c6" style="text-decoration:none;">机械设计制造及自动化</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c7" style="text-decoration:none;">计算机科学与技术</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c8" style="text-decoration:none;">林产化工</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c9" style="text-decoration:none;">农业机械化及自动化</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c10" style="text-decoration:none;">农业水利工程</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c11" style="text-decoration:none;">软件工程</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c12" style="text-decoration:none;">生物工程</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c13" style="text-decoration:none;">食品科学与工程</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c14" style="text-decoration:none;">食品质量与安全</a></span>          ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c15" style="text-decoration:none;">土木工程</a></span>          ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c16" style="text-decoration:none;">物联网工程</a></span>          ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c17" style="text-decoration:none;">制药工程</a></span>          ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=c18" style="text-decoration:none;">车辆工程</a></span>        '].join("");
	}else if(subjectType=="d"){
		//经济学
		var subject = document.getElementById('subject');
		subject.innerHTML=[' <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=d1" style="text-decoration:none;">国际经济与贸易</a></span>  ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=d2" style="text-decoration:none;">经济学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=d3" style="text-decoration:none;">经融学</a></span>     '].join("");
	}else if(subjectType=="e"){
		//管理学
		var subject = document.getElementById('subject');
		subject.innerHTML=[' <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e1" style="text-decoration:none;">财务管理</a></span>  ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e2" style="text-decoration:none;">电子商务</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e3" style="text-decoration:none;">工商管理</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e4" style="text-decoration:none;">公共事业管理</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e5" style="text-decoration:none;">会计学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e6" style="text-decoration:none;">劳动与社会保障</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e7" style="text-decoration:none;">旅游管理</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e8" style="text-decoration:none;">农林经济管理</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e9" style="text-decoration:none;">市场营销</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=e10" style="text-decoration:none;">土地资源管理</a></span>  '].join("");
	}else if(subjectType=="f"){
		//文学
		var subject = document.getElementById('subject');
		subject.innerHTML=[' <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=f1" style="text-decoration:none;">汉语言文学</a></span>  ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=f2" style="text-decoration:none;">日语</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=f3" style="text-decoration:none;">英语</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=f4" style="text-decoration:none;">商务英语</a></span>'].join("");
	}else if(subjectType=="g"){
		//法学
		var subject = document.getElementById('subject');
		subject.innerHTML=['<span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=g1" style="text-decoration:none;">法学</a></span>'].join("");
	}else if(subjectType=="h"){
		//教育学
		var subject = document.getElementById('subject');
		subject.innerHTML=['<span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=h1" style="text-decoration:none;">教育技术学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=h2" style="text-decoration:none;">农艺教育</a></span>'].join("");
	}else if(subjectType=="i"){
		//艺术学
		var subject = document.getElementById('subject');
		subject.innerHTML=['   <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=i1" style="text-decoration:none;">环境设计</a></span>  ',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=i2" style="text-decoration:none;">音乐学</a></span>',
		                   '                        <span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=i3" style="text-decoration:none;">数字媒体艺术</a></span>'].join("");
	}else if(subjectType=="j"){
		var subject = document.getElementById('subject');
		subject.innerHTML=['<span style="float:left;margin-top:5px;margin-left:2%;font-size:80%;color:white"><a class="d" href="http://localhost:8080/schoolHelper/studyCenter/3?dataType=j1" style="text-decoration:none;">其他</a></span>'].join("");	
	}
}