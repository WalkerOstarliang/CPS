/**
 * 重置表单
 */
function resetForm(){
	$("#lssjtj_from").get(0).reset();
}

/**
 * 查询
 */
function queryLssjtj(){
	$("#lssjtjList").query("F", "lssjtj_from");
}

/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield,dwleve) {
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
					$("#" + dwleve).val(orgbeans.leve);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}