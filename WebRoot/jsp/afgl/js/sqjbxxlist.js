function jxQuery()
{
	$("#xldquerylist").query("F","xldqueryform");
}

function openSqJbxxInfo(operType,sqbh)
{
	$.openWindow({
		url : contextPath + "/afgl/sqjbgl/toXtglSqJbxxInfoPage.action",
		data : 
		{
			t : new Date().getTime(),
			operType : operType,
			sqdm : sqbh
		},
		width : 900,
		height : 700
	});
}

function zxSqxx(sqbhs)
{
	$.ajax({
		type : "post",
		url : contextPath + "/afgl/sqjbgl/deleteSqJbxx.action",
		data : "sqbhs=" + sqbhs,
		dataType : "json",
		success : function(result)
		{
			if (result)
			{
				alert("注销成功.");
				jxQuery();
			}
			else
			{
				alert("注销失败，请重新再试.");
			}
		}
	});
}

function batchZxSqxx()
{
	var selectes = $("#xldquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要注销选中的社区吗？"))
		{
			var sqbhs = [];
			$.each(selectes,function(i, obj){
				sqbhs.push(obj["sqbh"]);
			});
			zxSqxx(sqbhs.join(","));
		}
	}
	else
	{
		alert("请选择要注销的社区。");
	}
}

function smplieZxSqxx(sqbh)
{
	if (confirm("你确定要注销该社区吗？"))
	{
		zxSqxx(sqbh);
	}
}

function zxztRowCallback(trObj, rowDataObj)
{
	var result = "";
	if (rowDataObj["zxbs"] == "0")
	{
		result = "<font color=\"red\">已注销</font>"; 
	}
	else
	{
		result = "正常";
	}
	return result;
}

function czRowCallback(trObj, rowDataObj)
{
	var result = "";
	result += "<span style=\"color:green\" onclick=\"openSqJbxxInfo('detail','" + rowDataObj["sqbh"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	result += "<span style=\"color:green\" onclick=\"openSqJbxxInfo('update','" + rowDataObj["sqbh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
	result += "<span style=\"color:green\" onclick=\"openSqJbxxInfo('update','" + rowDataObj["sqbh"] + "')\" class=\"cps_span_href\">社区干部</span>";	
	return result;
}


function openInfoWin(operType,sqbh,sqmc)
{
	var sq =encodeURI(sqmc);
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/toSqgbInfoPage.action",
		data : {operType: operType,sqbh: sqbh,sqmc : sq, t:new Date().getTime()},
		width : 980,
		height : 650,
		callback : function()
		{
			if(operType != "detail")
			{
				jxQuery();
			}
		}
	});
}
