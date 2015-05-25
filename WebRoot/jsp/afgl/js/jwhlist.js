function openJwhInfoWin(operType,jwhbh)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/jwhgl/toSqJwhInfoPage.action",
		data : {operType : operType,jwhbh : jwhbh,t:new Date().getTime()},
		width : 980,
		height : 500,
		callback : function()
		{
			$(operType != "detail")
			{
				jxQuery();
			}
		}
	})
}

function jxQuery()
{
	$("#xldquerylist").query("F","xldqueryform");
}
/**
 * 选择某个居委会返回对象
 */
function rowClickEvent(trObj, rowDataObj) {
	$.setResultValue(rowDataObj);
	$.closeWindow();
}

function returnJwhxx() {
	var selectes = $("#xldquerylist").getSelected();
	if (selectes.length <= 0) {
		alert("请选择居委会.");
	} else {
		$.setResultValue(selectes[0]);
		$.closeWindow();
	}
}

function czRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openJwhInfoWin('update','" + rowdataobj["jwhbh"] + "')\">修改</span>&nbsp;";
	html += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"deleteSimpleSqjwhxx('" + rowdataobj["jwhbh"] + "')\">删除</span>&nbsp;"
	html += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openJwhInfoWin('detail','" + rowdataobj["jwhbh"] + "')\">详情</span>";
	return html;
}

function zxbsRowCallback(trObj, rowdataobj)
{
	var html = "";
	if (rowdataobj["zxbs"] == "0")
	{
		html = "<font color=\"red\">已注销</font>";
	}
	else
	{
		html = "正常";
	}
	return html;
}

function jwhgbrsRowCallback(trObj,rowdataobj)
{
	var html = "";
	if (parseInt(rowdataobj["jwhgbrs"]) > 0)
	{
		html= "<span class=\"cps_span_href\" style=\"color:green\"  onclick=\"openSqshowList('" + rowdataobj["sssqbh"] + "')\"><font color=\"red\">" + rowdataobj["jwhgbrs"] +"</font></span>";
		
}
	else
	{
		html = "0";
	}
	return html;
}

function openSqshowList(sqbh)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/showSqgbxxList.action",
		data : {"queryBean.sssqbh" : sqbh,t:new Date().getTime()},
		width : 800,
		height : 400
	})
}

function deleteSqjwhxx(jwhbhs)
{
	$.ajax({
		type : "post",
		url : contextPath + "/afgl/jwhgl/deleteJwhxxBean.action",
		data : "jwhbhs=" + jwhbhs,
		success : function(result)
		{
			if (!result)
			{
				alert("删除居委会信息失败,请重新再试.");
			}
			else
			{
				jxQuery();
			}
		}
	})
}

function deleteSimpleSqjwhxx(jwhbh)
{
	if (confirm("当前操作将物理删除数据库记录，你确定要删除该记录吗？"))
	{
		deleteSqjwhxx(jwhbh);
	}
}

function batchDeleteSqjwhxx()
{
	var selectes = $("#xldquerylist").getSelected();
	if (selectes.length > 0)
	{
		if(confirm("当前操作将物理删除数据库记录，你确定要删除选中记录吗？"))
		{
			var selectesjwhbhs = [];
			$.each(selectes, function(i, obj){
				selectesjwhbhs.push(obj["jwhbh"]);
			});
			deleteSqjwhxx(selectesjwhbhs.join(","));
		}
	}
	else
	{
		alert("请选择要删除的记录.");
	}
}

$(function(){
	var jwsqdm = $("#jwsqdm").val();
	if (jwsqdm != null && jwsqdm != "")
	{
		doubleSelectSqxxByJwsdm(jwsqdm,"sqbhselect");
	}
})