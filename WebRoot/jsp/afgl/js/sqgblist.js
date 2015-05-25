
function jxQuery()
{
	$("#xldquerylist").query("F","xldqueryform");
}


function czRowCallback(trObj,rowdataobj)
{
	var html = "";
	var showAddBtn = $("#showAddBtn").val();
	if(eval(showAddBtn)){
		html += "<span style=\"color:green\" onclick=\"openInfoWin('update','" + rowdataobj["gbbh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		html += "<span style=\"color:green\" onclick=\"simpleDeleteGbxx('" + rowdataobj["gbbh"] + "')\" class=\"cps_span_href\">删除</span>&nbsp;";
	}
	html += "<span style=\"color:green\" onclick=\"openInfoWin('detail','" + rowdataobj["gbbh"] + "')\" class=\"cps_span_href\">详情</span>";
	return html;
}

function openInfoWin(operType,gbbh)
{
	
	$.openWindow({
		url : contextPath + "/afgl/sqgbgl/toSqgbInfoPage.action",
		data : {operType : operType,gbbh : gbbh,t:new Date().getTime(),"queryBean.lx":$("#lx").val()},
		width : 980,
		height : 650
	})
}

function openSqgbDetailInfo(operType,gbbh)
{
	var sssqbh = $("#sqbh").val();
	var sssqmc =$("#jc").val();
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/toSqgbDetailPage.action",
		data : {
			operType : operType,
			"bean.gbbh" : gbbh,
			"bean.sssqbh":sssqbh,
			"bean.sssqmc":encodeURIComponent(sssqmc),
			t:new Date().getTime()
		},
		width : 980,
		height : 650,
		callback : function()
		{
			if(operType != "detail")
			{
				$("#xldquerylist").query("F","queryform");
			}
		}
	})
}

function deleteGbxx(gbbh)
{
	$.ajax({
		url : contextPath + "/afgl/sqgbgl/deleteSqgbxxBeanByGbbhs.action",
		data : "gbbhs=" + gbbh,
		dataType : "json",
		success : function(res)
		{
			if (res)
			{
				alert("成功删除干部信息.");
				jxQuery()
			}
		}
	})
}

function simpleDeleteGbxx(gbbh)
{
	if (confirm("你确定要删除该干部信息吗？"))
	{
		deleteGbxx(gbbh);
	}
}

function batchDeleteGbxx()
{
	var selectes = $("#xldquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要删除选中的记录？"))
		{
			var bhs = [];
			$.each(selectes,function(i,obj){
				bhs.push(obj["gbbh"]);
			});
			deleteGbxx(bhs.join(","));
			
		}
	}
	else
	{
		alert("请选择要删除的记录。");
	}
	
}

function setSqxxToPage(sqjbxxbean)
{
	if (sqjbxxbean)
	{
		$("#sssqbh").val(sqjbxxbean["sqbh"]);
		$("#sssqmc").val(sqjbxxbean["sqmc"]);
	}
}


function sqgbczRowCallback(tdObj, rowdata)
{
	var html = "";
	var gbbh = rowdata["gbbh"];
	html += "<span class=\"cps_span_href\" onclick=\"openSqgbDetailInfo('update','" + gbbh + "')\">修改</span>";
	return html;
}

function　exportSqgbxx()
{
	$("#xldqueryform").attr("target","_blank");
	$("#xldqueryform").attr("action",contextPath + "/afgl/sqgbgl/exportSqgbxx.action");
	$("#xldqueryform").submit();
	$("#xldqueryform").removeAttr("target");
	$("#xldqueryform").removeAttr("action");
}