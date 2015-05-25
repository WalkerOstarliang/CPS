/*保存年审信息*/
function saveNsxx(){
	//获取事件源
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("jfdwns_form")){
		eventSrcObj.attr("disabled","disabled")
		$("#jfdwns_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveJfdwnsxx.action",
			dataType : "json",
			success : function(nsxx){
				if (nsxx != null){
					queryNsxx();
					resetNsxx();
					alert("信息保存成功!");
				}else{
					alert("单位信息保存失败.");
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}	
}

/**
 * 查询年审信息
 */
function queryNsxx(){
	$("#nsxxlist").query("F", "nscx");
}


/**
 * 重置年审表单
 */
function resetNsxx(){
	$("#jfdwns_form").get(0).reset();
}


/*点击行回填年审信息*/
function callBackRow(tr,rowdate){
	if(rowdate){
		$.each(rowdate,function(key,value){
			$("#" + key).val(value);
		});
	}
}