/**
 * 查询案件列表
 */
function queryAjlist(){
    $("#gjclist").query("F","searchForm");
}

/**
 * 打开案件详细信息
 */
function openAjxxInfoWin(ajbh,opertype,fasq){
	var url = contextPath + "/nbgl/ajhs/toAjDetailPage.action?query.ajbh=" + ajbh + "&operType=" + opertype;
	if(fasq){
		url += "&query.fasqdm=" + fasq;
	}
	$.openWindow({
		url:url,
		width:"900px",
		height:"600px"
	});
}

/**
 * 机构选择
 * @param {} orgcode
 */
function orgSelect(orgcode){
	openDwSelect2({
		rootOrgCode : orgcode,
		mutilSelect : false,
		nodeSelectedType : "ps",
		nodeNotSelectedType : "ps"
		}, 
		function(orgbeans) {
			if (orgbeans != null) {
				$("#ladwdm").val(orgbeans.id);
				$("#ladwmc").val(orgbeans.name);
			}
		});

}

/**
 * 清除立案单位
 */
function clearLadw(){
	$("#ladwdm").val("");
	$("#ladwmc").val("");
}

/**
 * 导出案件列表
 */
function expAjlist(){
	$("#searchForm").attr("action",contextPath + "/nbgl/ajhs/expAjList.action");
	$("#searchForm").submit();
}