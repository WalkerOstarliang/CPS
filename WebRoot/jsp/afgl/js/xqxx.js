/**
 * 小区信息
 */

/**
 * 查询小区信息
 */
function queryXqxx() {
	$("#xqxxList").query("F", "searchform");
}

/**
 * 打开添加小区信息窗口
 */
function openAddXqxx() {
	$.openDialogWindow({
		url : contextPath + "/xqxx/toAddXqxx.action",
		data : {operType : "add", t:new Date().getTime()},
		width : 900,
		height : 400,
		callback : function(result)
		{
			$("#xqxxList").query("F", "searchform");
		}
	});
}

/**
 * 保存小区信息
 */
function saveXqxxBean() 
{
	if ($.validateform("add_xqxx_form")) 
	{
		$("#add_xqxx_form").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(res) 
			{
				if (res == true)
				{
					alert("保存成功.");
					$.closeWindow();
				}
				else
				{
					alert("保存失败.");
				}
			},
			error : function()
			{
				alert("保存发生错误");
			}
		});
	}
}

/**
 * 打开修改小区信息窗口
 */
function openXqxxBeanInfoByXqbh(xqbh, operType) {
	$.openDialogWindow({
		url : contextPath + "/xqxx/toUpdateXqxxByXqbh.action",
		data : {"xqxxQuery.xqbh" : xqbh,operType : operType, t : new Date().getTime()},
		width : 900,
		height : 400
	});
	$("#xqxxList").query("F", "searchform");
}

/**
 * 批量撤销小区
 * 
 * @returns {Boolean}
 */
function toBatchDeleteXqxx() {
	var selecteds = $("#xqxxList").getSelected();
	if (selecteds.length <= 0) {
		alert("请选择要注销的小区.");
		return false;
	} else {
		var xqbhs = "";
		$.each(selecteds, function(i, xqxxBean) {
			xqbhs += "," + xqxxBean.xqbh;
		});

		xqbhs = xqbhs.substring(1, xqbhs.length);
		$.openDialogWindow({
			url : contextPath + "/xqxx/toBatchDeleteXqxxByXqbhs.action?t="
					+ new Date().getTime() + "&xqxxQuery.xqbh=" + xqbhs,
			width : 900,
			height : 400
		});
		$("#xqxxList").query("F", "searchform");
	}
}

/**
 * 保存批量撤消
 */
function batchDeleteXqxx() {

	if ($.validateform("batchdelete_xqxx_form")) {
		$("#batchdelete_xqxx_form").ajaxSubmit({
			type : "post",
			success : function() {
				$.closeWindow();
			}
		});
	}
}

/**
 * 打开删除小区信息窗口
 */
function openDeleteXqxxByXqbh(xqbh) {
	$.openDialogWindow({
		url : contextPath
						+ "/xqxx/toDeleteXqxxByXqbh.action?xqxxQuery.czbs=3&xqxxQuery.xqbh="
						+ xqbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#xqxxList").query("F", "searchform");
}

/**
 * 查看小区信息
 * 
 */
function viewXqxxByXqbh(xqbh) {
	$.openDialogWindow({
		url : contextPath + "/xqxx/viewXqxxByXqbh.action?xqxxQuery.xqbh="
				+ xqbh + "&t=" + new Date().getTime(),
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
function xqxxlistCzRowCallback(trObj, rowdataObj) {
	var result = "";
	if (rowdataObj["cxbs"] == "1") 
	{
		result += "<span style=\"color:green\" onclick=\"openXqxxBeanInfoByXqbh('" + rowdataObj["xqbh"] + "','update')\" class=\"cps_span_href\">修改</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"changeXqxxBeanStatus('" + rowdataObj["xqbh"] + "','" + rowdataObj["cxbs"] + "')\"  class=\"cps_span_href\">注销</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"openXqxxBeanInfoByXqbh('" + rowdataObj["xqbh"] + "','detail')\"  class=\"cps_span_href\">详情</span>";	
	}
	else
	{
		result += "<span style=\"color:green\" onclick=\"openXqxxBeanInfoByXqbh('" + rowdataObj["xqbh"] + "','update')\" class=\"cps_span_href\">修改</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"changeXqxxBeanStatus('" + rowdataObj["xqbh"] + "','" + rowdataObj["cxbs"] + "')\"  class=\"cps_span_href\">启用</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"openXqxxBeanInfoByXqbh('" + rowdataObj["xqbh"] + "','detail')\" class=\"cps_span_href\">详情</span>";
	}
	return result;
}

function changeXqxxBeanStatus(xqbh, cxbs)
{
	var msg = "";
	if (cxbs == "1")
	{
		msg = "你确定要注销该记录吗？";
	}
	else
	{
		msg = "你确定要启用该记录吗？";
	}
	if (confirm(msg))
	{
		$.ajax({
			type : "post",
			url : contextPath + "/xqxx/changeXqxxBeanSatusByXqbh.action",
			data : "xqbh=" + xqbh + "&cxbs=" + (cxbs == "1" ? "0" : 1),
			dataType : "json",
			success : function(res)
			{
				if (res == true)
				{
					queryXqxx();
				}
				else
				{
					alert("数据注销失败，请稍后再试.");
				}
			}
		});
	}
}

/**
 * 选择某个小区返回小区对象
 */
function rowClickEvent(trObj, rowDataObj) {
	$.setResultValue(rowDataObj);
	$.closeWindow();
}

function returnXqxx() {
	var selectes = $("#xqxxList").getSelected();
	if (selectes.length <= 0) {
		alert("请选择小区.");
	} else {
		$.setResultValue(selectes[0]);
		$.closeWindow();
	}
}
/**
 * 高级查询
 */
function gjQueryXqxx() {
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}
function toGjQueryXqxx() {
	$.openDialogWindow({
		url : contextPath + "/xqxx/toGjQueryXqxx.action?t="
				+ new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams) {
			if (queryParams) {
				$("#xqxxList").query("P", queryParams);
			} else {
				$("#xqxxList").query("F", "searchform");
			}
		}
	});
}

function callbackSqSelect(sqjbxxBean)
{
	if (sqjbxxBean)
	{
		$("#sssqbh").val(sqjbxxBean["sqbh"]);
		$("#sssqmc").val(sqjbxxBean["sqmc"]);
		$("#xqdz").val(sqjbxxBean["ssjdxzmc"] + sqjbxxBean["sqmc"]);
	}
}

function setZxsj(value)
{
	if (value == "1")
	{
		$("#cxrq").val("");
		$("#cxyy").val("");
	}
	else if (value == "0")
	{
		$("#cxrq").val(new Date().pattern("yyyy-MM-dd HH:mm:ss"));
	}
}
