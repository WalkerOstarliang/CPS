/**
 * 可疑物品信息
 */

/**
 * 查询可疑物品信息
 */
function queryKywpxx(){
	$("#kywpxxList").query("F","searchform");
}


/**
 * 打开添加可疑物品窗口
 */
function openAddKywpxx()
{
	$.openDialogWindow({
		url : contextPath + "/kywpxx/toAddKywpxx.action?kywpxxQuery.czbs=1&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#kywpxxList").query("F","searchform");
}

/**
 * 保存可疑物品信息
 */
function addKywpxx(){
	if($.validateform("add_kywpxx_form")){
		$("#add_kywpxx_form").ajaxSubmit({
			type : "post",
			success : function() {
				alert("操作成功");
			}
		});
	}
}

/**
 * 打开修改可疑物品窗口
 */
function openUpdateKywpxxByKywpbh(kywpbh)
{
	$.openDialogWindow({
		url : contextPath + "/kywpxx/toUpdateKywpxxByKywpbh.action?kywpxxQuery.czbs=2&kywpxxQuery.kywpbh=" 
					+ kywpbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#kywpxxList").query("F","searchform");
}

/**
 * 查看可疑物品窗口
 */
function viewKywpxxByKywpbh(kywpbh)
{
	$.openDialogWindow({
		url : contextPath + "/kywpxx/viewKywpxxByKywpbh.action?kywpxxQuery.kywpbh="
								+ kywpbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
}

function kywpxxlistCzRowCallback(trObj, rowdataObj){
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openUpdateKywpxxByKywpbh('"+ rowdataObj["kywpbh"] +"')\">修改</span>&nbsp;";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKywpxxByKywpbh('"+ rowdataObj["kywpbh"] +"')\">详情</span>&nbsp;";
	return result;
}

/**
 * 可疑物品高级查询
 */
function toGjQueryKywpxx(){
	$.openDialogWindow({
		url : contextPath + "/kywpxx/toGjQueryKywpxx.action?t=" + new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams)
		{
			if (queryParams)
			{
				$("#kywpxxList").query("P",queryParams);
			}else {
				$("#kywpxxList").query("F","searchform");
			}
		}
	});
}
function gjQueryKywpxx(){
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}