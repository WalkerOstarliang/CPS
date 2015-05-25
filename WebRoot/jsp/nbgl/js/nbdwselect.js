/**单位查询**/
function dwcx() {
	$("#cxjgList").query("F", "dwcx");
}

/**
 * 生成操、操作列
 * @param {} trObj
 * @param {} data
 * @return {}
 */
function czRowBack(trObj,data){
	var datas = "{'dwmc':'" + data.dwmc + "','jgbh':'" + data.jgbh + "'}";
	var html = "<span class=\'cps_span_href\' onclick=\"resultData(" + datas + ")\" style=\"color:green\">选择</span>"
	return html;
}

/**
 * 列表双击事件
 * @param {} trObj
 * @param {} data
 */
function dbRowBack(trObj,data){
	resultData(data);
}

/**
 * 返回结果
 * @param {} data
 */
function resultData(data){
	$.setResultValue(data);
	$.closeWindow();
}