function clickIconImage(xttxpzid)
{
	$("#xttxpzbeanid").val(xttxpzid);
	$("#mygztstablegrid").setFirstPageInex();
	$("#mygztstablegrid").query("F", "xttxpzform");
}

function openXqJbqktjlist(pzid,title)
{
	 $.openWindow({
		 name : "gztxwin",
		 url : contextPath + "/schedule/toGztxDataList.action?xttxpzBean.id=" + pzid,
		 width:900,
		 height:400
	 });
}

function callbackRowCsz(tdObj,rowdata)
{
	var html = "<span onclick=\"openXxBlPageWin('" + rowdata["blhref"] + "')\"  class=\"cps_span_href\">办理</span>";
	return html;
}

function openXxBlPageWin(blhref)
{
	
	$.openWindow({
		name : "blwin",
		url : contextPath + decodeURIComponent(blhref),
		width:1000,
		height:800,
		scroll : true
	})
}

//导出Excel
function download(){
	var id = $("#xttxpzbeanid").val();
	var url = contextPath + "/schedule/downloadExcel.action?xttxpzBean.id=" + id;
	$("#download").attr("action",url);
	$("#download").attr("method",'post');
	$("#download").get(0).submit();
}

function refreshGrid()
{
	$("#mygztstablegrid").query("F","xttxpzform");
}

$(function(){
	$.ajax({
		url : contextPath + "/schedule/loadGztxCount.action",
		type:"post",
		dataType : "json",
		success : function(jsonObjStr)
		{
			var jsonObj = eval("(" + jsonObjStr +")")
			$.each(jsonObj,function(key,value){
				if (value > 0)
				{
					$("#" + key).css("color","red");
				}
				else
				{
					$("#" + key).css("color","");
					$("#" + key).unbind("click");
				}
				$("#" + key).text("[" + value + "]");
			});
		}
	});
});