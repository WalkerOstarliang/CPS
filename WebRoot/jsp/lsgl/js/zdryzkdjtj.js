function queryList(){
    //<!--  alert(1);-->
	//<!--$("#gzdxbh").val("");-->
	$("#zdryzkdjtjList").query("F","queryForm");
	//$("#queryForm").attr("action",contextPath + "/lsgl/zdryzkdjtj/queryZdryZkdjTjListPage.action")
	//$("#queryForm").submit();
}
function openZdryxxWin(zdryzrdw){
	$.openWindow({
		url : contextPath + "/lsgl/zdryzkdjtj/toZdryZkDjTjInfoPage.action?"
				+ $("#queryForm").serialize() + "&queryBean.orgcode=" + zdryzrdw, 
		width:1200,
		height:600
	});
}
function openZdryzkdjxxWin(zdryzrdw){
	$.openWindow({
		url : contextPath + "/lsgl/zdryzkdjtj/toZdryZkDjTjDJSInfoPage.action?"
				+ $("#queryForm").serialize() + "&queryBean.orgcode=" + zdryzrdw, 
		width:1200,
		height:600
	});
}

function openZdryzkdjzksxxWin(zdryzrdw){
	$.openWindow({
		url : contextPath + "/lsgl/zdryzkdjtj/toZdryZkDjTjZKSInfoPage.action?"
				+ $("#queryForm").serialize() + "&queryBean.orgcode=" + zdryzrdw, 
		width:1200,
		height:600
	});
}

function openZdryzkdjsksxxWin(zdryzrdw){
	$.openWindow({
		url : contextPath + "/lsgl/zdryzkdjtj/toZdryZkDjTjSKSInfoPage.action?"
				+ $("#queryForm").serialize() + "&queryBean.orgcode=" + zdryzrdw, 
		width:1200,
		height:600
	});
}

function openZdryInfoPage(operType, sfzh,rybh,showMenu,zdrybh)
{
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryInfoPage.action",
		data : {"operType" : operType,
				"queryBean.sfzh" : sfzh,
				"queryBean.rybh" : rybh,
				t:new Date().getTime(),
				"queryBean.zdrybh":zdrybh,
				"showMenu":showMenu
		},
		width : 1000,
		height : 760
	});
}


function downloadExcel(){
	
	$("#queryForm").attr("action",contextPath + "/lsgl/zdryzkdjtj/downloadZdryZkDjTj.action?t=" + new Date().getTime());
	$("#queryForm").attr("method","post");
	$("#queryForm").get(0).submit();
	
}
