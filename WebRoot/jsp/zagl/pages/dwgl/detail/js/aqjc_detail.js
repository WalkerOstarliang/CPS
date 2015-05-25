function aqjcDetail(tr,data){
	var html = "<span class=\"cps_span_href\" onclick=\"openAqjc('" + data.jlbh + "')\">详情</span>";
	return html;
}

function openAqjc(param){
	$.openWindow({
		url : contextPath + "/zagl/dw/toAqjcDetail.action?dw.aqjc.jlbh=" + param,
		width : 800,
		height : 400,
		callback : function() 
		{
			return;
		}
	});
}