function cyryCallback(tr, data) {
	var html = "";
	html += "<span class=\"cps_span_href\" onclick=\"openSyrkInfoPage('rydaxx','" + data.rybh + "','')\">人员详情</span>";
	return html;
}

function openSyrkInfoPage(operType, rybh, rylb)
{
	var rybh = rybh == undefined ? "" : rybh;
	$.openWindow({
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {"operType" : operType,"queryBean.rybh" : rybh,"queryBean.rylb" :rylb,  t:new Date().getTime()},
		width : 1000,
		height : 760,
		callback : function()
		{
			return;
		}
	})
}

function openCyryDetail(tr,data){
	$.openWindow({
		url : contextPath
				+ "/zagl/dw/toCyryDetail.action?t=" + new Date().getTime() + "&dw.cyry.cyrybh="
				+ data.cyrybh + "&dw.opertype=detail",
		width : 1000,
		height : 700,
		callback : function() {
			return;
		}
	});
}