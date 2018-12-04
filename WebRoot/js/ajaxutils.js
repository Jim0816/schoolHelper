// ����request����
function createXMLHttpRequest() {
	try {
		return new XMLHttpRequest();//����������
	} catch (e) {
		try {
			return ActvieXObject("Msxml2.XMLHTTP");//IE6.0
		} catch (e) {
			try {
				return ActvieXObject("Microsoft.XMLHTTP");//IE5.5������汾	
			} catch (e) {
				alert("�����������");
				throw e;
			}
		}
	}
}
/*
 * option��������������
 */
 		/*����ʽmethod, /*�����Ҫ���������д�ֵ��ʹ��post��GET��ʽ��������Ϊ��*/
		/*�����url url, 
		/*�Ƿ��첽asyn, 
		/*������params, 
		/*�ص�����callback,
		/*��������Ӧ����ת����ʲô����*/

function ajax(option) {
	/*
	 * 1. �õ�xmlHttp
	 */
	var xmlHttp = createXMLHttpRequest();
	/*
	 * 2. ������
	 */
	if(!option.method) {//Ĭ��ΪGET����
		option.method = "GET";
	}
	if(option.asyn == undefined) {//Ĭ��Ϊ�첽����
		option.asyn = true;
	}
	xmlHttp.open(option.method, option.url, option.asyn);
	/*
	 * 3. �ж��Ƿ�ΪPOST
	 */
	if("POST" == option.method) {
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	}
	/*
	 * 4. ��������
	*/
	   xmlHttp.send(option.params);
	/*
	 * 5. ע�����
	 */
	xmlHttp.onreadystatechange = function() {
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {//˫���ж�
			var data;
			// ��ȡ����������Ӧ���ݣ�����ת����
			if(!option.type) {//���typeû�и�ֵ����ôĬ��Ϊ�ı�
				data = xmlHttp.responseText;
			} else if(option.type == "xml") {
				data = xmlHttp.responseXML;
			} else if(option.type == "text") {
				data = xmlHttp.responseText;
			} else if(option.type == "json") {
				var text = xmlHttp.responseText;
				data = eval("(" + text + ")");
			}
			// ���ûص�����
			option.callback(data);
		}
	};
};



