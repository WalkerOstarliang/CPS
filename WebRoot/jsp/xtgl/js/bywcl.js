function query() {
	$("#bywclList").query("F", "bywcl_form");
}
/**
 * 重置表单
 */
function resetForm(){
	$("#bywcl_form").get(0).reset();
}

/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode.substr(0,4) + "00000000",
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


/*统计级别改变*/
function tjjbChange(value){
	if(value=='5'){
		$("#text").text("警务区分类：");
		$("#jwqfl").show();
		$("#jwqfl").val("");
		$("#jwqfl").removeAttr("disabled");
		
		$("#pcsdj").hide();
		$("#pcsdj").val("");
		$("#pcsdj").attr("disabled","disabled");
	}else if(value=='4'){
		$("#text").text("派出所级别：");
		$("#pcsdj").show();
		$("#pcsdj").val("");
		$("#pcsdj").removeAttr("disabled");
		
		$("#jwqfl").hide();
		$("#jwqfl").val("");
		$("#jwqfl").attr("disabled","disabled");
	}else{
		$("#text").text(" ");
		
		$("#jwqfl").hide();
		$("#jwqfl").val("");
		$("#jwqfl").attr("disabled","disabled");
		
		$("#pcsdj").hide();
		$("#pcsdj").val("");
		$("#pcsdj").attr("disabled","disabled");
	}
}

/*导出*/
function downloadExcel(){
	$("#bywcl_form").attr("action",contextPath + "/xtgl/khkp/downlaodBywcltj.action");
	$("#bywcl_form").submit();
}