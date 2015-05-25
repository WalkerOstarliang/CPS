function loadZhsg(tr,data){
	$.each(data,function(key,value){
		if(value == null){
			value=" ";
		}
		$("#" + key).text(value);
	});
}