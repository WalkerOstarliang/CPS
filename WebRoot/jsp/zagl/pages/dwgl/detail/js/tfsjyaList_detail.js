//加载突发事件预案
function openTfsjya(tr,data){
	$.openWindow({
		url : contextPath + "/zagl/dw/toTfsjyaDetail.action",
		width:900,
		height:500,
		data : {"jgbh":data.jgbh,"operType":"detail","dw.tfsjya.yabh":data.yabh,"t": new Date().getTime()},
		callback : function(result){
			ajaxLoadDwPageInfo("toTfsjyaList");
		}
	});
}

//加载预案演练
function loadYl(tr,data){
	$.each(data,function(key,value){
		$("#" + key).text(value);
	});
}