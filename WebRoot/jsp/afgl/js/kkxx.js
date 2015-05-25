/**
 * 卡口信息
 */

/**
 * 查询卡口信息
 */
function queryKkxx() {
	$("#kkxxList").query("F", "searchform");
}

/**
 * 打开添加卡口信息窗口
 */
function openAddKkxx() {
	$.openDialogWindow({
		url : contextPath + "/kkxx/toAddKkxx.action?kkxxQuery.czbs=1&t="
				+ new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#kkxxList").query("F", "searchform");
}

/**
 * 保存卡口信息
 */
function addKkxx() {
	if ($.validateform("add_kkxx_form")) {
		$("#add_kkxx_form").ajaxSubmit({
			type : "post",
			success : function() {
				alert("操作成功");
			}
		});
	}
}

/**
 * 打开修改卡口信息窗口
 */
function openUpdateKkxxByKkxx(kkbh) {
	$.openDialogWindow({
		url : contextPath
						+ "/kkxx/toUpdateKkxxByKkxx.action?kkxxQuery.czbs=2&kkxxQuery.kkbh="
						+ kkbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#kkxxList").query("F", "searchform");
}

/**
 * 批量撤销卡口
 * 
 * @returns {Boolean}
 */
function toBatchDeleteKkxx() {
	var selecteds = $("#kkxxList").getSelected();
	if (selecteds.length <= 0) {
		alert("请选择要注销的卡口.");
		return false;
	} else {
		var kkbhs = "";
		$.each(selecteds, function(i, kkxxBean) {
			kkbhs += "," + kkxxBean.kkbh;
		});

		kkbhs = kkbhs.substring(1, kkbhs.length);
		$.openDialogWindow({
			url : contextPath + "/kkxx/toBatchDeleteKkxxByKkbhs.action?t="
					+ new Date().getTime() + "&kkxxQuery.kkbh=" + kkbhs,
			width : 900,
			height : 400
		});
		$("#kkxxList").query("F", "searchform");
	}
}

/**
 * 保存批量撤消
 */
function batchDeleteKkxx() {

	if ($.validateform("batchdelete_kkxx_form")) {
		$("#batchdelete_kkxx_form").ajaxSubmit({
			success : function() {
				$.closeWindow();
			}
		});
	}
}

/**
 * 打开删除卡口信息窗口
 */
function openDeleteKkxxByKkxx(kkbh) {
	$.openDialogWindow({
		url : contextPath
						+ "/kkxx/toDeleteKkxxByKkxx.action?kkxxQuery.czbs=3&kkxxQuery.kkbh="
						+ kkbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#kkxxList").query("F", "searchform");
}

/**
 * 查看卡口信息
 * 
 * @param kkbh
 */
function viewKkxxByKkbh(kkbh) {
	$.openDialogWindow({
		url : contextPath + "/kkxx/viewKkxxByKkbh.action?kkxxQuery.kkbh="
				+ kkbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
}

/**
 * 查看卡口盘查信息
 * 
 * @param kkbh
 */
function viewPcxxByKkbh(kkbh,kkmc) {
	$.openDialogWindow({
		url : contextPath + "/kkpcxx/toPcxxListByKkbh.action?kkpcxxQuery.kkbh="
				+ kkbh + "&kkpcxxQuery.kkmc=" + encodeURIComponent(kkmc) + "&t=" + new Date().getTime(),
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
function kkxxlistCzRowCallback(trObj, rowdataObj) {
	var result = "";
	if ("1" != rowdataObj["zxbs"]) {
		result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openUpdateKkxxByKkxx('"+ rowdataObj["kkbh"] + "')\">修改</span>&nbsp;";
		result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openDeleteKkxxByKkxx('"+ rowdataObj["kkbh"] + "')\">注销</span>&nbsp;";
	
	}else if ("1" == rowdataObj["zxbs"]) {
		$(trObj).find("td input[type='checkbox']").attr("disabled",true);
	}
	
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKkxxByKkbh('" + rowdataObj["kkbh"]+ "')\">详情</span>&nbsp;";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewPcxxByKkbh('" + rowdataObj["kkbh"]+ "','" + rowdataObj["kkmc"] + "')\">盘查信息</span>&nbsp;";
	return result;
}

/**
 * 选择某个卡口返回卡口对象
 */
function rowClickEvent(trObj, rowDataObj) {
	$.setResultValue(rowDataObj);
	$.closeWindow();
}

function returnKkxx() {
	var selectes = $("#kkxxList").getSelected();
	if (selectes.length <= 0) {
		alert("请选择巡逻队.");
	} else {
		$.setResultValue(selectes[0]);
		$.closeWindow();
	}
}

/**
 * 高级查询
 */
function gjQueryKkxx() {
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}
function toGjQueryKkxx() {
	$.openDialogWindow({
		url : contextPath + "/kkxx/toGjQueryKkxx.action?t="
				+ new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams) {
			if (queryParams) {
				$("#kkxxList").query("P", queryParams);
			} else {
				$("#kkxxList").query("F", "searchform");
			}
		}
	});
}