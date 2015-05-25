//打开突发事件页面
function openTfsjya(yabh,opertype){
	var jgbh = $("#jgbh").val();
	if(opertype != "detail"){
		$.openDialogWindow({
			url : contextPath + "/zagl/dw/toTfsjya.action",
			width:900,
			height:700,
			data : {"jgbh":jgbh,"operType":opertype,"dw.tfsjya.yabh":yabh,"t": new Date().getTime()},
			callback : function(result){
				ajaxLoadDwPageInfo("toTfsjyaList");
			}
		});
	}else{
		$.openWindow({
			url : contextPath + "/zagl/dw/toTfsjya.action",
			width:900,
			height:700,
			data : {"jgbh":jgbh,"operType":opertype,"dw.tfsjya.yabh":yabh,"t": new Date().getTime()},
			callback : function(result){
				ajaxLoadDwPageInfo("toTfsjyaList");
			}
		});
	}
}

//删除突发事件
function delTfsjya(yabh){
	$.ajax({
		url : contextPath + "/zagl/dw/delTfsjya.action?dw.tfsjya.yabh=" + yabh,
		type :  "post",
		success : function(){
			ajaxLoadDwPageInfo("toTfsjyaList");
			alert("删除成功!");
		}
	});
}