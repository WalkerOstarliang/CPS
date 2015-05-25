//查询
function query(){
	$("#zdryList").query("F", "queryForm");
}
/**
 * 打开重点人员签收窗口
 * @param {} rybh
 */
function openZdryQsWin(rybh,opertype){
	$.openWindow({
		url:contextPath + "/zdry/zdryqs/toZdryQsPage.action?operType=" + opertype + 
					"&zdry.jbxx.renyuanbianhao=" + rybh,
		width:"800px",
		height:"600px"
	});
}