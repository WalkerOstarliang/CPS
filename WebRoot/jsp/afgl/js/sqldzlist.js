function jxQuery(){
	$("#xldquerylist").query("F","xldqueryform");
}

function czRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<span style=\"color:green\" onclick=\"openInfoWin('detail','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	if(rowdataobj["zxbs"]=='0'){
		html += "<span style=\"color:green\" onclick=\"openInfoWin('update','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		html += "<span style=\"color:green\" onclick=\"simpleDeleteLdzxx('" + rowdataobj["id"] + "')\" class=\"cps_span_href\">注销</span>";
	}
	return html;
}
function openInfoWin(operType,id){
	$.openDialogWindow({
		url : contextPath + "/afgl/sqldzgl/toSqLdzInfoPage.action",
		data : {"operType" : operType,"id" : id,t:new Date().getTime()},
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

function simpleDeleteLdzxx(id){
	if (confirm("你确定要注销该楼栋长信息吗？"))
	{
		deleteLdzxx(id);
	}
}

function deleteLdzxx(id){
	$.ajax({
		url : contextPath + "/afgl/sqldzgl/deleteSqLdzxxBeanById.action?id="+id,
		dataType : "json",
		success : function(res)
		{
			if (res)
			{
				alert("成功注销楼栋长信息.");
				jxQuery()
			}
		}
	})
}