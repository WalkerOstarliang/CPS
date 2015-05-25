/**
 * 社区警务室信息
 */

/**
 * 查询社区警务室信息
 */
function querySqjwsxx() {
	$("#sqjwsxxList").query("F", "searchform");
}

/**
 * 保存社区警务室信息
 */
function addsqjwsxx() {
	if ($.validateform("add_sqjwsxx_form")) {
		$("#add_sqjwsxx_form").ajaxSubmit({
			type : "post",
			success : function() {
				alert("操作成功");
			}
		});
	}
}

/**
 * 查看社区警务室信息
 * 
 */
function viewSqjwsxxByOrgid(orgid) {
	$.openDialogWindow({
		url : contextPath + "/sqjwsxx/viewSqjwsxxByJwsdm.action?sqjwsxxQuery.orgid="
				+ orgid + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
}

/**
 * 设置操作栏
 * 
 * @param trObj
 * @param rowdataObj
 * @returns {String}
 */
function sqjwsxxlistCzRowCallback(trObj, rowdataObj) {
	var result = "";
	result += "<span style=\"color:green\" onclick=\"openUpdateSqjwsxxByOrgid('update','"+ rowdataObj["orgid"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
	result += "<span style=\"color:green\" onclick=\"viewSqjwsxxByOrgid('" + rowdataObj["orgid"]+ "')\" class=\"cps_span_href\">详情</span>";
	return result;
}

/**
 * 选择某个社区警务室返回社区警务室对象
 */
function rowClickEvent(trObj, rowDataObj) {
	$.setResultValue(rowDataObj);
	$.closeWindow();
}

function returnSqjwsxx() {
	var selectes = $("#sqjwsxxList").getSelected();
	if (selectes.length <= 0) {
		alert("请选择社区警务室.");
	} else {
		$.setResultValue(selectes[0]);
		$.closeWindow();
	}
}

/**
 * 高级查询
 */
function gjQuerySqjwsxx() {
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}
function toGjQuerySqjwsxx() {
	$.openDialogWindow({
		url : contextPath + "/sqjwsxx/toGjQuerySqjwsxx.action?t="
				+ new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams) {
			if (queryParams) {
				$("#sqjwsxxList").query("P", queryParams);
			} else {
				$("#sqjwsxxList").query("F", "searchform");
			}
		}
	});
}
function closeTest(w){
	w.close();
}
/**
 * 打开修改社区警务室信息窗口
 */
function openUpdateSqjwsxxByOrgid(operType,orgid) {
	$.openDialogWindow({
		url : contextPath+ "/sqjwsxx/toAddSqjwsxx.action?sqjwsxxQuery.orgid=" + orgid + "&operType="+operType+"&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#sqjwsxxList").query("F", "searchform");
}

function openAddSqjwsxx(operType, orgid) {
	$.openDialogWindow({
		url : contextPath + "/sqjwsxx/toAddSqjwsxx.action?operType="+operType+"&sqjwsxxQuery.orgid=" + orgid + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#sqjwsxxList").query("F", "searchform");
}