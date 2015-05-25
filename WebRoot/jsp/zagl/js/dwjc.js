function dwjcCallback(tr, data) {
	var html = "";
	if ($("#opertype").val() != 'detail') {
		html += "<span class=\"cps_span_href\" onclick=\"ajaxLoadDwjc('update','" + data.bh + "')\">修改</span>";
		html += "&nbsp;|&nbsp;";
	}
	html += "<span class=\"cps_span_href\" onclick=\"ajaxLoadDwjc('detail','" + data.bh
			+ "',dwjcXq)\">详情</span>";
	return html;
}

function ajaxLoadDwjc(opertype, bh, callback) {
	var url = contextPath + "/zagl/dw/toDwjc.action";
	var jgbh = $("#dwjbxx_jgbh").val();
	var data = {
		jgbh : jgbh,
		'dw.opertype' : opertype,
		'dw.dwjc.bh' : bh
	}
	$.post(url, data, function(htmldata) {
				$("#dwjbxx").hide();
				$("#dwtxxx").hide()
				$("#contentpanel").html(htmldata);
				$("#contentpanel").show();

				if ($.isFunction(callback)) {
					callback();
				}
			});
}

function dwjcXq() {
	$("#dwjc_div").displayInputForText();
}