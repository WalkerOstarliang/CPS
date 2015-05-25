function zdyhbwClickRowCallback(tr,data){
	var html = "<span class=\"cps_span_href\" onclick=\"openZdyhbw('" + data.yhbwbh + "')\">详情</span>";
	return html;
}


function openZdyhbw(param){
	$.openWindow({
		url : contextPath + "/zagl/dw/toZdyhbwDetail.action?dw.zdyhbw.yhbwbh=" + param,
		width : 800,
		height : 400,
		callback : function() 
		{
			return;
		}
	});
}