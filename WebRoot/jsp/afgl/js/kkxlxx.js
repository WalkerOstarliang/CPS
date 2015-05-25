/**
 * 卡口巡逻信息
 */

/**
 * 查询卡口巡逻信息
 */
function queryKkxlxx(){
	$("#kkxlxxList").query("F","searchform");
}


/**
 * 打开添加卡口巡逻信息窗口
 */
function openAddKkxlxx()
{
	$.openDialogWindow({
		url : contextPath + "/kkxlxx/toAddKkxlxx.action?kkxlxxQuery.czbs=1&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
	$("#kkxlxxList").query("F","searchform");
}

/**
 * 保存卡口巡逻信息
 */
function addKkxlxx(){
	if($.validateform("add_kkxlxx_form")){
		$("#add_kkxlxx_form").ajaxSubmit({
			type : "post",
			success : function() {
				alert("操作成功");
			}
		});
	}
}

/**
 * 页面点击新增按钮
 */
function pageAddKkxlxx(){
	$("#xlbh").val("");
	$("#czbs").val("1");
	$("#title_id").html("登记卡口巡逻信息");
}
/**
 * 打开修改卡口巡逻信息窗口
 */
function openUpdateKkxlxxByXlbh(xlbh)
{
	$.openDialogWindow({
		url : contextPath + "/kkxlxx/toUpdateKkxlxxByKkxx.action?kkxlxxQuery.czbs=2&kkxlxxQuery.xlbh=" 
							+ xlbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
	$("#kkxlxxList").query("F","searchform");
}
/**
 * 在修改页面修改卡口巡逻信息窗口
 */
function setUpdateKkxlxxByXlbh(xlbh)
{
	$.ajax({
		type : "post", 
		url : contextPath + "/kkxlxx/getKkxlxxByXlbh.action?kkxlxxQuery.xlbh=" 
							+ xlbh + "&t=" + new Date().getTime(),
		dataType : "json",
		success : function(kkxlxxBean){
			if(kkxlxxBean){
				$("#czbs").val("2");
				$("#title_id").html("修改卡口巡逻信息");
				$("#add_kkxlxx_form").find("input[name^=kkxlxxBean]").each(function(){
					$(this).val(eval($(this).attr("name")));
				});
			}
		}
	});
}
/**
 * 打开删除卡口巡逻信息窗口
 */
function openDeleteKkxlxxByXlbh(xlbh)
{
	$.openDialogWindow({
		url : contextPath + "/kkxlxx/toDeleteKkxlxxByKkxx.action?kkxlxxQuery.czbs=3&kkxlxxQuery.xlbh=" 
							+ xlbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
	$("#kkxlxxList").query("F","searchform");
}

/**
 * 查看卡口巡逻信息
 * @param kkbh
 */
function viewKkxlxxByXlbh(xlbh){
	$.openDialogWindow({
		url : contextPath + "/kkxlxx/viewKkxlxxByXlbh.action?kkxlxxQuery.xlbh=" 
							+ xlbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
}

function kkxlxxlistCzRowCallback(trObj, rowdataObj)
{
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\"  onclick=\"openUpdateKkxlxxByXlbh('"+ rowdataObj["xlbh"] +"')\">修改</span>|";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKkxlxxByXlbh('"+ rowdataObj["xlbh"] +"')\" >详情</span>";
	return result;
}

function updateKkxlxxCzRowCallback(trObj, rowdataObj)
{
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"setUpdateKkxlxxByXlbh('"+ rowdataObj["xlbh"] +"')\" >修改</span>|";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKkxlxxByXlbh('"+ rowdataObj["xlbh"] +"')\">详情</span>";
	return result;
}

/**
 * 卡口巡逻高级查询
 */
function toGjQueryKkxlxx(){
	$.openDialogWindow({
		url : contextPath + "/kkxlxx/toGjQueryKkxlxx.action?t=" + new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams)
		{
			if (queryParams)
			{
				$("#kkxlxxList").query("P",queryParams);
			}else {
				$("#kkxlxxList").query("F","searchform");
			}
		}
	});
}
function gjQueryKkxlxx(){
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}