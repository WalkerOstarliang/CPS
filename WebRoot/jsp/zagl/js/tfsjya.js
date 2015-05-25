//保存突发事件预案
function saveTfsjya(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("tfsjya_form")){
		eventSrcObj.attr("disabled","disabled");
		$("#tfsjya_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveTfsjya.action",
			dataType : "json",
			success : function(result){
				if(result){
					$("#yabh").val(result.tfsjya.yabh);
					$("#ylcx_yabh").val(result.tfsjya.yabh);
					$("#yl_yabh").val(result.tfsjya.yabh);
					alert("保存成功!");
				}else{
					alert("保存失败.");
				}
				eventSrcObj.removeAttr("disabled","disabled");
			}
		});
	}
}

//保存突发事件预案演练
function saveYayl(){
	if($("#yl_yabh").val() == ""){
		alert("请先保存突发事件预案!");
		return;
	}
	
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("yayl_form")){
		eventSrcObj.attr("disabled","disabled");
		$("#yayl_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveYayl.action",
			dataType : "json",
			success : function(result){
				$("#yayl_form").get(0).reset();
				alert("保存成功!");
				ylcx();
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}

//删除预案演练
function delYayl(bh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delYayl.action?dw.tfsjya.yayl.bh=" + bh,
			type:"post",
			success:function(){
				ylcx();
				alert("删除成功!");
			}
		});
	}
}

//加载演练信息
function loadYl(tr,data){
	$.each(data,function(key,value){
		if(key == "yabh"){
			$("#yl_yabh").val(value);
		}else{
			$("#" + key).val(value);
		}
	});
}

//查询预案演练
function ylcx(){
	$("#yaylList").query("F", "yaylcx");
}

$(function(){
	if($("#opertype").val() == 'detail'){
		$("#tfsjya_div").displayInputForText();
	}
});