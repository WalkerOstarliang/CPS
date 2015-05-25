/**
 * 小区技防物防设施信息
 */

function callbackSelectSqxx(sqjbxxBean)
{
	if (sqjbxxBean)
	{
		$("#sqbh").val(sqjbxxBean["sqbh"]);
		$("#sqmc").val(sqjbxxBean["sqmc"]);
		doubleXqxxListBySqbh(sqjbxxBean["sqbh"],'xqbhlist');
	}
}

/**
 * 查询小区技防物防设施信息
 */
function queryXqjfwfssxx() {
	$("#xqjfwfssxxList").query("F", "searchform");
}

/**
 * 打开添加小区技防物防设施信息窗口
 */
function openAddXqjfwfssxx(operType, ssbh) 
{
	var url = contextPath + "/xqjfwfssxx/toAddXqjfwfssxx.action?operType=" + operType + "&sbbh="+ ssbh + "&t=" + new Date().getTime() ;

	$.openDialogWindow({
		url : contextPath + "/xqjfwfssxx/toAddXqjfwfssxx.action",
		data : {operType : operType, sbbh:ssbh, t: new Date().getTime()},
		width : 900,
		height : 500,
		callback : function(res)
		{
			$("#xqjfwfssxxList").query("F", "searchform");
		}
	});
	
}

/**
 * 保存小区技防物防设施信息
 */
function addXqjfwfssxx() {
	if ($.validateform("add_xqjfwfssxx_form")) 
	{
		
		$("#add_xqjfwfssxx_form").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(res) 
			{
				if (res == true)
				{
					alert("数据保存成功.");
					$.closeWindow();
				}
				else
				{
					alert("数据保存失败.")
				}
			}
		});
	}
}
/**
 * 批量撤销小区技防物防设施
 * 
 * @returns {Boolean}
 */
function toBatchDeleteXqjfwfssxx() {
	var selecteds = $("#xqjfwfssxxList").getSelected();
	if (selecteds.length <= 0) {
		alert("请选择要注销的小区技防物防设施.");
		return false;
	} else {
		var ssbhs = "";
		$.each(selecteds, function(i, xqjfwfssxxBean) {
			ssbhs += "," + xqjfwfssxxBean.ssbh;
		});

		ssbhs = ssbhs.substring(1, ssbhs.length);
		$.ajax({
			url : contextPath + "/xqjfwfssxx/toBatchDeleteXqjfwfssxxBySsbhs.action?t="
					+ new Date().getTime() + "&xqjfwfssxxQuery.ssbh=" + ssbhs
		});
		$("#xqjfwfssxxList").query("F", "searchform");
	}
}

/**
 * 保存批量撤消
 */
function batchDeleteXqjfwfssxx() {

	if ($.validateform("batchdelete_xqjfwfssxx_form")) {
		$("#batchdelete_xqjfwfssxx_form").ajaxSubmit({
			success : function() {
				$.closeWindow();
			}
		});
	}
}

/**
 * 打开删除小区技防物防设施信息窗口
 */
function openDeleteXqjfwfssxxBySsbh(ssbh) {
	$.openDialogWindow({
		url : contextPath
						+ "/xqjfwfssxx/toDeleteXqjfwfssxxBySsbh.action?xqjfwfssxxQuery.czbs=3&xqjfwfssxxQuery.ssbh="
						+ ssbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#xqjfwfssxxList").query("F", "searchform");
}

/**
 * 查看小区技防物防设施信息
 * 
 */
function viewXqjfwfssxxBySsbh(ssbh) {
	$.openDialogWindow({
		url : contextPath + "/xqjfwfssxx/viewXqjfwfssxxBySsbh.action?xqjfwfssxxQuery.ssbh="
				+ ssbh + "&t=" + new Date().getTime(),
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
function xqjfwfssxxlistCzRowCallback(trObj, rowdataObj) {
	var result = "";
	
	result += "<span style=\"color:green\" onclick=\"openAddXqjfwfssxx('update','" + rowdataObj["ssbh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
	result += "<span style=\"color:green\" onclick=\"deleteWfxxById('" + rowdataObj["ssbh"] + "')\"  class=\"cps_span_href\">删除</span>&nbsp;";
	result += "<span style=\"color:green\" onclick=\"openAddXqjfwfssxx('detail','" + rowdataObj["ssbh"] + "')\"  class=\"cps_span_href\">详情</span>";

	return result;
}

function deleteWfxxById(ssbh)
{
	$.ajax({
		url : contextPath + "/xqjfwfssxx/deleteWfxxById.action",
		data : "ssbh=" + ssbh,
		dataType : "json",
		success : function(result)
		{
			if (result)
			{
				alert("成功删除设备");
				queryXqjfwfssxx();
			}
			else
			{
				alert("成功删除设备");
			}
		}
	})
}

/**
 * 高级查询
 */
function gjQueryXqjfwfssxx() {
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}
function toGjQueryXqjfwfssxx() {
	$.openDialogWindow({
		url : contextPath + "/xqjfwfssxx/toGjQueryXqjfwfssxx.action?t="
				+ new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams) {
			if (queryParams) {
				$("#xqjfwfssxxList").query("P", queryParams);
			} else {
				$("#xqjfwfssxxList").query("F", "searchform");
			}
		}
	});
}

function setSbmc(obj)
{
	var text = $(obj).find("option:selected").first().text();
	$("#ssmc").val(text);
}

function addFjTrObj()
{
	var trhtml = $("#trtempcontent").html();
	$("#fjtable").append("<tr></tr>");
	$("#fjtable").find("tr").last().append(trhtml);
}

function deleteTjTrObj(btnobj)
{
	$(btnobj).parent().parent().remove();	
}


function showFjxx(fjid,fjmc)
{
	var url = contextPath + "/xqjfwfssxx/downloadFjxx.action?fjid=" + fjid + "&fileName=" + fjmc;
	$("#imagedisplay").attr("src",url);
	$.layer( {
			v_title : fjmc,
			v_box : 1,
			v_dom : "#displayimg",
			v_area : ['68%', '86%'],
			v_btns : 0,
			v_offset : [ '8%', '' ],
			close : function()
			{
				top.layer_close();
			}
	});
}


