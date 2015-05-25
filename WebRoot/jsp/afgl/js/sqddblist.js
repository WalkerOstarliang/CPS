function jxQuery(){
	$("#xldquerylist").query("F","xldqueryform");
}

function czRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<span style=\"color:green\" onclick=\"openInfoWin('detail','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	html += "<span style=\"color:green\" onclick=\"openInfoWin('update','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
	html += "<span style=\"color:green\" onclick=\"simpleDeleteDdbxx('" + rowdataobj["id"] + "')\" class=\"cps_span_href\">注销</span>";
	return html;
}
function zwsfmsRowCallback(trObj,rowdataobj){
	var _ddb = rowdataobj["sfrddb"];
	var _zxwy = rowdataobj["sfzxwy"];
	var html = "";
	if(_ddb=='1'){
		html += "市人大代表";
	}else if(_ddb =='2'){
		html +="省人大代表";
	}else if(_ddb =='3'){
		html += "全国人大代表";
	}else if(_ddb == '4'){
		html += "区人大代表";
	};
	
	if(_ddb == '0' && _zxwy == '1'){
		html += "市政协委员";
	}else if(_ddb == '0' && _zxwy =='2'){
		html += "省政协委员";
	}else if(_ddb == '0' && _zxwy =='3'){
		html += "全国政协委员";
	}else if(_ddb == '0' && _zxwy =='4'){
		html += "区政协委员";
	}
	
	if(_ddb != '0' && _zxwy == '1'){
		html += "、市政协委员";
	}else if(_ddb != '0' && _zxwy =='2'){
		html += "、省政协委员";
	}else if(_ddb != '0' && _zxwy =='3'){
		html += "、全国政协委员";
	}else if(_ddb != '0' && _zxwy =='4'){
		html += "、区政协委员";
	}
	return html;
}


function openInfoWin(operType,id){
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/toSqddbInfoPage.action",
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

function simpleDeleteDdbxx(id){
	if (confirm("你确定要注销该党代表信息吗？"))
	{
		deleteDdbxx(id);
	}
}

function deleteDdbxx(id){
	$.ajax({
		url : contextPath + "/afgl/sqgbgl/deleteSqddbxxBeanById.action?id="+id,
		dataType : "json",
		success : function(res)
		{
			if (res)
			{
				alert("成功注销党代表信息.");
				jxQuery()
			}
		}
	})
}