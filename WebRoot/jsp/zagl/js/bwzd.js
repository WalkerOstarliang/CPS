//保存保卫制度
function saveBwzd(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("bwzd_from")){
		eventSrcObj.attr("disabled","disabled");
		$("#bwzd_from").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveBwzd.action",
			dataType : "json",
			success : function(result){
				if(result){
					$("#zdbh").val(result.bwzd.zdbh);
					alert("保存成功!");
				}else{
					alert("保存失败.")
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}

$(function(){
	if($("#opertype").val() == 'detail'){
		$("#bwzd_div").displayInputForText();
	}
});