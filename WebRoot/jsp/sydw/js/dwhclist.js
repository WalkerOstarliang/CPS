//查询
function query(){
		$("#cxjgList").query("F", "dwcxform");
}

//打开单位核查窗口
function opernDwhcWin(){
	var selectDw =  $("#cxjgList").getSelected();
	var jgbh ;
	var glbm = $("#glbm").val();
	if(selectDw.length == 0){
		alert("请先选择一条单位记录后在操作.");
		return;
	}else{
		jgbh = selectDw[0].jgbh;
	}
	
	var path = contextPath + "/sydw/dwgl/toDwGlbmhcPage.action?dwBean.dwhs.jgbh=" + jgbh + "&dwBean.dwhs.glbm=" + glbm;
	$.openWindow({
			url : path,
			width : 1200,
			height : 600
	});
}