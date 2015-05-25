function dwjcClickRowcallback(tr,data){
	var html = "<span class=\"cps_span_href\" onclick=\"openDwjc('" + data.bh + "')\">详情</span>";
	return html;
}


function openDwjc(param){
	$.openWindow({
		url : contextPath + "/zagl/dw/toDwjcDetail.action?dw.dwjc.bh=" + param,
		width : 800,
		height : 400,
		callback : function() 
		{
			return;
		}
	});
}