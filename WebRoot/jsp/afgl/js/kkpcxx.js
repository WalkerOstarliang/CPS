/**
 * 卡口盘查信息
 */

/**
 * 查询卡口盘查信息
 */
function queryKkpcxx(){
	$("#kkpcxxList").query("F","searchform");
}

/**
 * 非卡口查询
 */
function notqueryKkpcxx(){
	$("#notkkpcxxList").query("F","notsearchform");
}


/**
 * 打开添加卡口信息窗口
 */
function openAddKkpcxx()
{
	$.openDialogWindow({
		url : contextPath + "/kkpcxx/toAddKkpcxx.action?kkpcxxQuery.czbs=1&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
	$("#kkpcxxList").query("F","searchform");
}

/**
 * 保存卡口盘查信息
 */
function addKkpcxx(){
	if($.validateform("add_kkpcxx_form")){
		$("#add_kkpcxx_form").ajaxSubmit({
			type : "post",
			success : function() {
				alert("操作成功");
			}
		});
	}
}

/**
 * 页面上点击新增按钮，将pcbh设为空，czbs设为1
 */
function pageAddKkpcxx(){
	$("#pcbh").val("");
	$("#czbs").val("1");
	$("#title_id").html("登记卡口盘查信息");
}

/**
 * 打开修改卡口信息窗口
 */
function openUpdateKkpcxxByPcbh(pcbh)
{
	$.openDialogWindow({
		url : contextPath + "/kkpcxx/toUpdateKkpcxxByPcbh.action?kkpcxxQuery.pcbh="
							+ pcbh + "&kkpcxxQuery.czbs=2&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
	$("#kkpcxxList").query("F","searchform");
}

/**
 * 打开卡口信息窗口
 */
function viewKkPcxxByPcbh(pcbh){
	$.openDialogWindow({
		url : contextPath + "/kkpcxx/viewKkpcxxByPcbh.action?kkpcxxQuery.pcbh="
							+ pcbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
}
//列表页面里的操作行
function kkpcxxlistCzRowCallback(trObj, rowdataObj)
{
	var result = "";
	
	result += "<span class=\"cps_span_href\" style=\"color:green\"  onclick=\"openUpdateKkpcxxByPcbh('"+ rowdataObj["pcbh"] +"')\" >修改</span>|";
	result += "<span class=\"cps_span_href\" style=\"color:green\"  onclick=\"viewKkPcxxByPcbh('"+ rowdataObj["pcbh"] +"')\" >详情</span>";

	return result;
}
//新增页面里的操作行
function updateKkpcxxCzRowCallback(trObj, rowdataObj){
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\"  onclick=\"setUpdateKkpcxxByPcbh('"+ rowdataObj["pcbh"] +"')\" >修改</span>|";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKkPcxxByPcbh('"+ rowdataObj["pcbh"] +"')\" >详情</span>|";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"addKywpxxByPcbh('"+ rowdataObj["pcbh"] +"')\">添加可疑物品</span>";
	return result;
}
//可疑物品的返回值
function hasKywpRowCallback(trObj, rowdataObj){
	var result = "";
	$.ajax({
		dataType : "json",
		async : false,
		type : "post", 
		url : contextPath + "/kywpxx/getKywpxxByPcbh.action?kywpxxQuery.pcbh=" 
		+ rowdataObj["pcbh"] + "&t=" + new Date().getTime(),
		success : function(wplist){
			if(wplist && wplist.length > 0){
				result = "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKywpxxListByPcbh('"+ rowdataObj["pcbh"] +"')\" >有</span>";
			}else{
				result = "无";
			}
		}
	});
	return result;
}
//查看可疑物品列表
function viewKywpxxListByPcbh(pcbh){
	$.openDialogWindow({
		url : contextPath + "/kywpxx/toKywpxxListByPcbh.action?kywpxxQuery.pcbh=" 
							+ pcbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
}
//添加可疑物品信息
function addKywpxxByPcbh(pcbh)
{
	$.openDialogWindow({
		url : contextPath + "/kywpxx/toAddKywpxx.action?kywpxxQuery.pcbh="
							+ pcbh +"&kywpxxQuery.czbs=1&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
	$("#kkpcxxList").query("F","searchform");
}
/**
*卡口盘查高级查询
**/
function toGjQueryKkpcxx(){
	$.openDialogWindow({
		url : contextPath + "/kkpcxx/toGjQueryKkpcxx.action?t=" + new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams)
		{
			if (queryParams)
			{
				$("#kkpcxxList").query("P",queryParams);
			}else {
				$("#kkpcxxList").query("F","searchform");
			}
		}
	});
}
function gjQueryKkpcxx(){
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}

/**
*非卡口盘查高级查询
**/
function toNotGjQueryKkpcxx(){
	$.openDialogWindow({
		url : contextPath + "/kkpcxx/toNotGjQueryKkpcxx.action?t=" + new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams)
		{
			if (queryParams)
			{
				$("#notkkpcxxList").query("P",queryParams);
			}else {
				$("#notkkpcxxList").query("F","notsearchform");
			}
		}
	});
}
function notgjQueryKkpcxx(){
	var params = $.getFormParams("notgjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}

/**
 * 在修改页面修改卡口盘查信息窗口
 */
function setUpdateKkpcxxByPcbh(pcbh)
{
	$.ajax({
		type : "post", 
		url : contextPath + "/kkpcxx/getKkpcxxByPcbh.action?kkpcxxQuery.pcbh=" 
							+ pcbh + "&t=" + new Date().getTime(),
		dataType : "json",
		success : function(kkpcxxBean){
			if(kkpcxxBean){
				$("#add_kkpcxx_form").find("input[name^=kkpcxxBean]").each(function(){
					$(this).val(eval($(this).attr("name")));
				});
				$("#czbs").val("2");
				$("#title_id").html("修改卡口盘查信息");
			}
		}
	});
}