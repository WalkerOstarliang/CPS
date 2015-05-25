//保存灾害事故
function saveZhsg(){
	$("#zhsg_jgbh").val($("#jgbh").val());
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("zhsg_form")){
		eventSrcObj.attr("disabled","diaabled")
		$("#zhsg_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveZhsg.action",
			dataType : "json",
			success : function(result){
				alert("保存成功!");
				ajaxLoadDwPageInfo("toZhsg");
			}
		});
	}
}

//删除灾害事故
function delZhsg(bh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delZhsg.action?dw.zhsg.bh=" + bh,
			type:"post",
			success:function(){
				alert("删除成功!");
				ajaxLoadDwPageInfo("toZhsg");
			}
		});
	}
}

//加载灾害事故
function loadZhsg(tr,data){
	$.each(data,function(key,value){
		if(key == 'jgbh'){
			$("#zhsg_jgbh").val(value);
		}else{
			$("#" + key).val(value);
		}
	});
}