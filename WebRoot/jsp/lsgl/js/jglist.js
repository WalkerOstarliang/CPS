//查询接管列表
function queryList(){
	$("#zdryjglist").query("F","queryForm");
}

//打开人员接管窗口
function openRyjgWin(rybh,tgxxId,opertype){
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryJgPage.action",
		data : {"zdryBean.tgxxId":tgxxId,"queryBean.rybh" : rybh,"operType":opertype,"t":new Date().getTime()},
		width : 1000,
		height : 760
	});
}
