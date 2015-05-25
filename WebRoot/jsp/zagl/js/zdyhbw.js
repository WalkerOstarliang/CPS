function zdyhbwCallback(tr,data){
	var html = "";
	if ($("#opertype").val() != 'detail') {
		html += "<span class=\"cps_span_href\" onclick=\"ajaxLoadZdyhbw('update','" + data.yhbwbh + "')\">修改</span>";
		html += "&nbsp;|&nbsp;";
	}
	html += "<span class=\"cps_span_href\" onclick=\"ajaxLoadZdyhbw('detail','" + data.yhbwbh + "',zdyhbwXq)\">详情</span>";
	return html;
}

function ajaxLoadZdyhbw(opertype,yhbwbh,callback)
{
	var url = contextPath + "/zagl/dw/toZdyhbw.action";
	var jgbh = $("#dwjbxx_jgbh").val();
	var data = {
		jgbh : jgbh,
		'dw.opertype':opertype,
		'dw.zdyhbw.yhbwbh':yhbwbh
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

function openAddZdyhbwzp(yhbwbh)
{
	var i = $.layer({
		title : "要害部位添加附件信息",
	    type : 2,
	    move : false,
	    iframe : {
	    	src : contextPath + "/zagl/dw/toZdryyhbwFjxxPage.action?dwcx.yhbwbh=" + yhbwbh
	    },
	    area : ['800px' , '500px'],
		offset : ['100px','']
	});
}

function openZdyhbwzp(yhbwbh)
{
	var i = $.layer({
		title : "要害部位添加附件信息",
	    type : 2,
	    move : false,
	    iframe : {
	    	src : contextPath + "/zagl/dw/toZdryyhbwFjxxPage.action?dwcx.yhbwbh=" + yhbwbh
	    },
	    area : ['800px' , '500px'],
		offset : ['100px','']
	});
}

function zdyhbwCzCallbacl(tdObj, rowdata)
{
	var html = "";
	html = "<span class=\"cps_span_href\" onclick=\"openAddZdyhbwzp('" + rowdata["yhbwbh"] + "')\">添加照片</span>&nbsp;";
	html += "<span class=\"cps_span_href\" onclick=\"openZdyhbwzp('" + rowdata["yhbwbh"] +"')\">照片明细</span>";
	return html;
}

function zdyhbwXq(){
	$("#zdyhbw_div").displayInputForText();
}