//保存保卫建议书
function saveBwjys(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("bwjys_from")){
		eventSrcObj.attr("disabled","disabled");
		$("#bwjys_from").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveBwjys.action",
			dataType : "json",
			success : function(result){
				if(result){
					$("#jysbh").val(result.bwjys.jysbh);
					alert("保存成功!");
				}else{
					alert("保存失败.");
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}

function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect({
			rootOrgCode : orgcode,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}	

$(function(){
	if($("#opertype").val() == 'detail'){
		$("#bwjys_div").displayInputForText();
	}
});