function jxQuery(){
	$("#xldquerylist").query("F","xldqueryform");
}
function czywhRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<span style=\"color:green\" onclick=\"openywhInfoWin('detail','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	if(rowdataobj["zxbs"]=='0'){
		html += "<span style=\"color:green\" onclick=\"openywhInfoWin('update','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		html += "<span style=\"color:green\" onclick=\"openywhcyInfoWin('add','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">增加成员</span>&nbsp;";
		html += "<span style=\"color:green\" onclick=\"simpleDeleteYwhxx('" + rowdataobj["id"] + "')\" class=\"cps_span_href\">注销</span>";
	}
	return html;
}

function openywhInfoWin(operType,id){
	$.openDialogWindow({
		url : contextPath + "/afgl/sqldzgl/toSqYwhInfoPage.action",
		data : {operType : operType,id : id,t:new Date().getTime()},
		width : 980,
		height : 650,
		callback : function()
		{
			if(operType != "detail")
			{
				jxQuery();
			}
		}
	})
}
//增加成员
function openywhcyInfoWin(operType,id){
	$.openWindow({
		url : contextPath + "/afgl/sqldzgl/toOpenWyhcyxxInfo.action?wyhid="+id,
		width : 980,
		height : 650,
		data : {
			"operType":operType,
			t: new Date().getTime()
		}
	});
}

function simpleDeleteYwhxx(id){
	if (confirm("你确定要注销该业委会信息吗？"))
	{
		deleteYwhxx(id);
	}
}

function deleteYwhxx(id){
	$.ajax({
		url : contextPath + "/afgl/sqldzgl/deleteSqYwhBeanById.action?id="+id,
		dataType : "json",
		success : function(res)
		{
			if (res)
			{
				alert("成功注销业委会信息.");
				jxQuery();
			}
		}
	})
}