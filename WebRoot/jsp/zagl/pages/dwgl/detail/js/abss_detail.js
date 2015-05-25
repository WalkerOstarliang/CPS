//加载安防系统信息
function loadAfxt(tr,data){
	var array = ["","","","",""];
	$.each(data,function(key,value){
		if(value == null || value == ""){
			value = " ";
		}
		
		if(key == "ywrqbjzxt"){
			setValue(key,value);
		}else if(key == "ywspjkzxt"){
			setValue(key,value);
		}else if(key == "ywcrkjkzxt"){
			setValue(key,value);
		}else if(key == "ywdzxcxt"){
			setValue(key,value);
		}else if(key == "ywtckglzxt"){
			setValue(key,value);
		}else{
			$("#" + key).text(value);
		}
	});
}

function setValue(key,value){
	if(value == '0'){
		$("#" + key).text("无");
	}else if(value == '1'){
		$("#" + key).text("有");
	}else{
		$("#" + key).text(value);
	}
}