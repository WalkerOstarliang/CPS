function openXldryInfoWin(operType,xldlx,xldrbh)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/xldxx/toXldryInfoPage.action?t=" + new Date().getTime() + "&operType=" + operType + "&queryBean.xldlx=" + xldlx + "&xldRyxxBean.xldybh=" + xldrbh,
		width : 950,
		height : 700,
		scroll : false,
		callback : function()
		{
			jxQueryXldxx();
		}
	});
}

function openXldSelectWin(xldlx)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/xldxx/toXldxxSelectPage.action?t=" + new Date().getTime() + "&queryBean.xldlx=" + xldlx,
		width:950,
		height : 500,
		scroll : false,
		callback : function(xldxxBean)
		{
			if (xldxxBean)
			{
				$("#xldmc").val(xldxxBean["xldmc"]);
				$("#xldbh").val(xldxxBean["xldbh"]);
				jxQueryXldxx();
			}
			
		}
	})
}

function jxQueryXldxx()
{
	$("#xldyquerylist").query("F","xldqueryform");
}

//jxQueryXfryxx
function jxQueryXfryxx()
{
	$("#xldyquerylist").query("F","xfryqueryform");
}

function rowCallback(trObj, rowDataObj)
{
	var result = "";
	var xldlx = $("#xldlx").val();
	var dwdm = $("#dwdm").val();
	result += "&nbsp;<span style=\"color:green\" onclick=\"openXfryInfoWin('detail','" + rowDataObj["xldybh"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	if (dwdm==rowDataObj["djdwdm"])
	{
	   if (rowDataObj["zgzt"]=="1")
	   {
		result += "<span style=\"color:green\" onclick=\"openXfryInfoWin('update','" + rowDataObj["xldybh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"deleteXldryxx('" + rowDataObj["xldybh"] + "')\" class=\"cps_span_href\">注销</span>&nbsp;";
		}
	} 	
	return result;
}

function batchDeleteXldr()
{
	var selectes = $("#xldyquerylist").getSelected();
	if (selectes.length <= 0)
	{
		alert("请现在要删除的队员信息。");
		return false;
	}
	else
	{
		if (confirm("你确定要删除选中的队员？"))
		{
			var xldrybhs = [];
			$.each(selectes,function(i,obj){
				xldrybhs.push(obj["xldybh"]);
			});
			$.ajax({
				type : "post",
				dataType : "json",
				url : contextPath + "/afgl/xldxx/deleteXldyxx.action",
				data : "xldrybhs=" + xldrybhs.join(","),
				success : function()
				{
					jxQueryXldxx();
				}
			})
		}
	}
}

function deleteXldryxx(xldrybh)
{
	if (confirm("你确定要删除选中的队员？"))
	{
		$.ajax({
			type : "post",
			dataType : "json",
			url : contextPath + "/afgl/xldxx/deleteXfryxxByrybh.action",
			data : {"xldRyxxBean.xldybh":xldrybh},
			success : function(message)
			{ 
			if (message){
			  alert("删除成功！");
			}
				jxQueryXfryxx();
			}
		})
	}
}

function xldyresultSelectedRowData(){
	var datas = $("#xldyquerylist").getSelected();
	var selected = "";		
	if (datas && datas.length > 0)
	{
	//	if (datas && datas.length > 1)
	//	{
	//		alert('只能选择一条数据。');
	//		return false;
	//	}
		var arrDm = new Array();
		
		for(var i=0;i<datas.length;i++){	
			arrDm.push(datas[i].xldyxm);
		}
		var orgInfo = {
			xldyxm : arrDm
		};
		window.returnValue = orgInfo;
		window.close(); 
	}
	else
	{
		alert("温馨提示：您尚未选中数据项！");
		return false;
	}
}
// openXfryInfoWin
function openXfryInfoWin(operType,xldrbh)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/xldxx/toXfryInfoPage.action?t=" + new Date().getTime() + "&operType=" + operType+ "&xldRyxxBean.xldybh=" + xldrbh,
		width : 950,
		height : 500,
		scroll : false,
		callback : function()
		{
			jxQueryXfryxx();
		}
	});
}
