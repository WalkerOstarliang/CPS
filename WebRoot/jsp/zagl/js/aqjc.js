function aqjcCallback(tr,data){
	var html = "";
	if ($("#opertype").val() != 'detail') {
		html += "<span class=\"cps_span_href\" onclick=\"ajaxLoadAqjc('update','" + data.jlbh + "')\">修改</span>";
		html += "&nbsp;|&nbsp;";
	}
	html += "<span class=\"cps_span_href\" onclick=\"ajaxLoadAqjc('detail','" + data.jlbh + "',aqjcXq)\">详情</span>";
	return html;
}

function ajaxLoadAqjc(opertype,jlbh,callback)
{
	var url = contextPath + "/zagl/dw/toAqjc.action";
	var jgbh = $("#dwjbxx_jgbh").val();
	var data = {
		jgbh : jgbh,
		'dw.opertype':opertype,
		'dw.aqjc.jlbh':jlbh
	}
	$.post(url,data,function(htmldata){
		$("#dwjbxx").hide();
		$("#dwtxxx").hide()
		$("#contentpanel").html(htmldata);
		$("#contentpanel").show();

		if($.isFunction(callback)){
			callback();
		}
	});
}

function aqjcXq(){
	$("#aqjc_div").displayInputForText();
}