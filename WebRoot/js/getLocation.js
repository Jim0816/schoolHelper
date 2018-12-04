/***************************************
		高德地图定位    由于Chrome、IOS10等已不再支持非安全域的浏览器定位请求，为保证定位成功率和精度，请尽快升级您的站点到HTTPS。
		***************************************/
		    window.onload=function(){
		        var longitude,latitude;//经度，纬度
		        var map, geolocation;
		        var mapObj;
				var geocoder; 
		        //加载地图，调用浏览器定位服务
			    map = new AMap.Map('container', {
			        resizeEnable: true
			    });
			    map.plugin('AMap.Geolocation', function() {
			        geolocation = new AMap.Geolocation({
			            enableHighAccuracy: true,//是否使用高精度定位，默认:true
			            timeout: 10000,          //超过10秒后停止定位，默认：无穷大
			            buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
			            zoomToAccuracy: true,      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
			            buttonPosition:'RB'
			        });
			        map.addControl(geolocation);
			        geolocation.getCurrentPosition();
			        AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
			        AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
			    });
			    //解析定位结果
			    function onComplete(data) {
			        longitude = data.position.getLng();
			        latitude = data.position.getLat();
			        //alert('经度'+longitude+'纬度：' +latitude );
			    }
			    //解析定位错误信息
			    function onError(data) {
			        //alert('定位失败');
			    }
			    //逆解析经纬度得到地理信息
				mapObj = new AMap.Map('allmap');
				var lnglatXY=new AMap.LngLat(115.83814,28.7573); 
				//加载地理编码插件 
				mapObj.plugin(["AMap.Geocoder"],function(){  
				geocoder=new AMap.Geocoder({ 
				radius:1, //以已知坐标为中心点，radius为半径，返回范围内兴趣点和道路信息 
				extensions: "all"//返回地址描述以及附近兴趣点和道路信息，默认"base" 
				}); 
				//判断结果是否解析成功
				geocoder.getAddress(lnglatXY, function(status, result) {
		            if (status === 'complete' && result.info === 'OK') {
		                geocoder_CallBack(result);
		            }
		        });        
	            //返回地址描述
	            function geocoder_CallBack(data) {
			        var schoolName = data.regeocode.aois[0].name;//校园名字
			        //var allAddress = data.regeocode.formattedAddress; //详细位置
			        //alert("校园名称:"+schoolName);
			        //alert("详细地址:"+allAddress);
			        document.getElementById('schoolName').value=schoolName;
			        //document.getElementById('allAddress').value=allAddress;
			        document.myform.action=document.getElementById('url').value;
		            document.myform.submit();
			    }
				});
			 };