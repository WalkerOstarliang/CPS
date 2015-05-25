//保存安全隐患
function saveAqyh(){
	$("#aqyh_jgbh").val($("#jgbh").val());
	
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("aqyh_form")){
		eventSrcObj.attr("disabled","disabled");
		$("#aqyh_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveAqyh.action",
			dataType : "json",
			success : function(result){
				alert("保存成功!");
				ajaxLoadDwPageInfo("toAqyh");
			}
		});
	}
}

//删除安全隐患
function delAqyh(bh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delAqyh.action?dw.zhsg.bh=" + bh,
			type:"post",
			success:function(){
				alert("删除成功!");
				ajaxLoadDwPageInfo("toZhsg");
			}
		});
	}
}

//加载安全隐患
function loadAqyh(tr,data){
	$.each(data,function(key,value){
		if(key == "jgbh"){
			$("#aqyh_jgbh").val(value);
		}else{
			$("#" + key).val(value);
		}
	});
}