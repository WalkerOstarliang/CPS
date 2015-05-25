function openXldInfoWin(operType,xldlx,xldbh)
{
	$.openWindow({
		url : contextPath + "/afgl/xldxx/toXldInfoPage.action",
		width : 1000,
		height : 600,
		data : {
			operType : operType,
			"xldBean.xldlx" : xldlx,
			xldbh : xldbh,
			t : new Date().getTime()
		},
		callback : function(result)
		{
			if(operType != "detail")
			{
				$("#xldquerylist").query("F","xldqueryform");
			}
		}
	});
}


function jxQueryXldxx()
{
	$("#xldquerylist").query("F","xldqueryform");
}

function openGjQueryXldxx()
{
	$.openDialogWindow({
		url : contextPath + "/afgl/xldxx/toXldxxGjQueryPage.action?t=" + new Date().getTime(),
		width : 800,
		height : 200,
		scroll : false,
		callback : function(queryParams)
		{
			if (queryParams)
			{
				var currentparams = $.getFormParams("xldqueryform");
				var params = currentparams + "&" + queryParams;
				$("#xldquerylist").query("P",params);
			}
			
		}
	})
}

function batchCxXldxx()
{
	var selecteds = $("#xldquerylist").getSelected();
	if (selecteds.length <= 0)
	{
		alert("请选择要注销的巡逻队.");
		return false;
	}
	else
	{
		if (confirm("你确定要注销该巡逻队吗？"))
		{
			var xldbhs = [];
			$.each(selecteds,function(i,xldxxBean){
				xldbhs.push(xldxxBean.xldbh);
			});
			$.ajax({
				type : "post",
				url : contextPath + "/afgl/xldxx/deleteXldxx.action",
				data : "xldbhs=" + xldbhs.join(","),
				success : function()
				{
					alert("注销成功");
					jxQueryXldxx();
				}
			});
		}
	}
}

function deleteXldxx(xldbh,cxbs)
{
	if (cxbs != "0")
	{
		if (confirm("你确定要注销该巡逻队吗？"))
		{
			$.ajax({
				type : "post",
				url : contextPath + "/afgl/xldxx/deleteXldxx.action",
				data : "xldbhs=" + xldbh,
				success : function()
				{
					jxQueryXldxx();
				}
			});
		}
	}
	else
	{
		alert("该巡逻队已经被注销。");
	}
	
}


function xldquerylistCzRowCallback(trObj, rowdataObj)
{
	var result = "";
	result += "<span style=\"color:green\" onclick=\"openXldInfoWin('detail','" + rowdataObj["xldlx"] + "','" + rowdataObj["xldbh"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";	
	if(rowdataObj["cxbs"]!="0")
	{
		result += "<span style=\"color:green\" onclick=\"openXldInfoWin('update','" + rowdataObj["xldlx"] + "','" + rowdataObj["xldbh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"deleteXldxx('" +rowdataObj["xldbh"] + "','" + rowdataObj["cxbs"] + "')\" class=\"cps_span_href\">注销</span>&nbsp;";
		//result += "<span style=\"color:green\" onclick=\"openXldryInfoWin('add','" + rowdataObj["xldlx"] + "','" + rowdataObj["xldbh"] + "')\" class=\"cps_span_href\">添加队员</span>&nbsp;";
	}	
	
	return result;
}


function addTjxldy()
{
	var selectes = $("#xldquerylist").getSelected();
	if (selectes.length == 1)
	{
		var bean = selectes[0];
		var xldlx = bean["xldlx"];
		var xldbh = bean["xldbh"];
		openXldryInfoWin('add',xldlx,xldbh);
	}
	else if(selectes.length >1)
	{
		alert("只能选择一条记录")
	}
	else if (selectes.length == 0)
	{
		alert("请选择一条记录");
	}
}


/**
 * 添加巡逻队员
 * @param {Object} operType
 * @param {Object} xldlx
 * @param {Object} xldbh
 */
function openXldryInfoWin(operType,xldlx,xldbh)
{
	$.openWindow({
		url : contextPath + "/gzgl/gzjwsgl/toFjPageInfo.action?t=" + new Date().getTime() + "&operType=" + operType + "&fjBean.fjlb=2&fjBean.xldbh=" + xldbh,
		width : 950,
		height : 700,
		scroll : false,
		callback : function()
		{
			
		}
	});
}


function xldquerylistCxbsRowCallback(trObj, rowdataObj)
{
	var result = "";
	if ("0"== rowdataObj["cxbs"])
	{
		result = "已撤销";
	}
	else
	{
		result = "正常";
	}
	return result;
}
