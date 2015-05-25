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
		$.openDialogWindow({
			url : contextPath + "/xqjfwfssxx/toBatchDeleteXqjfwfssxxBySsbhs.action?t="
					+ new Date().getTime() + "&xqjfwfssxxQuery.ssbh=" + ssbhs,
			width : 900,
			height : 400
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
	result += "<span style=\"color:green\" onclick=\"openDeleteXqjfwfssxxBySsbh('" + rowdataObj["ssbh"] + "')\"  class=\"cps_span_href\">删除</span>&nbsp;";
	result += "<spanstyle=\"color:green\"  onclick=\"openAddXqjfwfssxx('detail','" + rowdataObj["ssbh"] + "')\"  class=\"cps_span_href\">详情</span>";

	return result;
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
	/*var trhtml = $("#trtempcontent").html();
	$("#fjtable").append("<tr></tr>");
	$("#fjtable").find("tr").last().append(trhtml);*/
	var trhtml ="";
	trhtml +="<tr>";
	trhtml +="<td width='40%'><input type='file' id='upload' name='upload' accept='image/*' class='validate[required] cps-file'> </td>";
	trhtml +="<td width='50%'><input type='text' name='zpms' class='cps-input' style='width:98%'></td>";
	trhtml +=" <td align='center' width='10%'><button value='button' onclick='deleteFjTrObj(this)' class='cps-btn'>&nbsp;删除&nbsp;</button> </td>";
	trhtml +="</tr>";
	$("#fjtable").append(trhtml);
}

function deleteTjTrObj(btnobj,fjid)
{
	var operType = $("#operType").val();
	if (operType == "add")
	{
		$(btnobj).parent().parent().remove();
	}
	else if ("update" == operType)
	{
		$.ajax({
			url : contextPath + "/xqjfwfssxx/deleteWffjByFjid.action",
			data : "fjid=" + fjid,
			dataType : "json",
			success : function(result)
			{
				if (result)
				{
					alert("附件删除成功.");
					$(btnobj).parent().parent().remove();
				}
				else
				{
					alert("附件删除失败.");
				}
			}
		});
	}
}

function deleteFjTrObj(btnobj){
	$(btnobj).parent().parent().remove();
}
function showFjxx(fjid,fjmc)
{
	var url = contextPath + "/xqjfwfssxx/downloadFjxx.action?fjid=" + fjid + "&fileName=" + fjmc;
	window.location =url;
	/*$("#imagedisplay").attr("src",url);
	$.openLayerWin({
		title : "下载",
		type : "div",
		source : "#displayimg"
	});*/
}
$(function(){
	var xqbh = $("#xqbhhidden").val();
	if (xqbh != null && xqbh != "")
	{
		doubleXqxxListBySqbh($("#sqbh").val(),'xqbhlist',function(){
		   setTimeout(function(){
		   	$("#xqbhlist").val(xqbh);
		   },1)
			
		});
	}
	
})

