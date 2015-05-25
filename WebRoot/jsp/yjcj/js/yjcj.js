function queryList()
{
	$("#yjcjtablegrid").query("F","queryForm");
}

function toAddWtxxPage(wtid)
{
	$.openWindow({
		name : "xxxx",
		url : contextPath + "/yjcj/toAddWtyjPage.action",
		data : {"queryBean.wtid" : (wtid != undefined && wtid != null) ? wtid : ""},
		width:900,
		height:700
	})
}

function toWtyjDetailPage(wtid)
{
	document.location.href = contextPath + "/yjcj/toWtyjDetailPage.action?queryBean.wtid=" + wtid;
}

function czrowcallback(tdObj,rowdata)
{
	var html = "";
	var currentOrgCode = rowdata["currentOrgCode"];
	html += "<span class=\"cps_span_href\" onclick=\"toWtyjDetailPage('" +rowdata["wtid"] + "')\">追加发言</span>&nbsp;";
	if (currentOrgCode == rowdata["djdwdm"])
	{
		html += "<span class=\"cps_span_href\" onclick=\"toAddWtxxPage('" +rowdata["wtid"] + "')\">修改</span>";
	}
	return html;
}

function sffkrowcallback(tdObj,rowdata)
{
	var html = "";
	var sffk = rowdata["sffk"];
	if (sffk == "1")
	{
		html += "<font color='black'>是</font></span>";
	}
	else
	{
		html += "<font color='red'>否</font></span>";
	}
	return html;
}

function ckeditorUpdate()
{
	for (instance in CKEDITOR.instances)
	{
		CKEDITOR.instances[instance].updateElement();
	}
}

function saveWtxxBean()
{
	ckeditorUpdate();
	$("#queryForm").ajaxFormFire("/yjcj","saveWtxxBean",function(wtid){
		if (wtid != null)
		{
			$("#wtid").val(wtid);
			alert("保存问题意见信息成功。");
		}
		else
		{
			alert("保存问题已经信息失败.");
		}
	});
}
 
function showBigImage(fjid)
{
	var url = contextPath + "/yjcj/showWtfjPoto.action?queryBean.fjid=" + fjid
	window.open(url);
}
 
 
function saveWthfBean()
{
	ckeditorUpdate();
	var hdcontent = $("#hdcontent").val();
	var djrlxfs = $("#djrlxfs").val()
	if (hdcontent == null || hdcontent == "")
	{
		alert("内容不能为空.");
		return false;
	}
	if (djrlxfs == null || djrlxfs == "")
	{
		alert("联系电话不能为空.");
		return false;
	}
	$("#yjcjhfform").ajaxFormFire("/yjcj","saveWthdxx",function(result){
		if (result == true)
		{
			alert("意见发表保存成功");
			document.location.href = contextPath + "/yjcj/toWtyjDetailPage.action?queryBean.wtid=" + $("#wtid").val()
		}
		else
		{
			alert("发表失败，请稍后再试");
		}
	});
}


function openXxfbWin(operType,xxid)
{
	$.openWindow({
		name : "xxfbwin",
		url : contextPath + "/yjcj/toXxfbInfo.action",
		data : {"operType" : operType,"xxfbBean.xxid" : xxid},
		width:900,
		height:700
	});
}

function saveXxfbBean()
{
	ckeditorUpdate();
	$("#queryForm").ajaxFormFire("/yjcj","saveXxfbBean",function(xxid){
		if (xxid != null)
		{
			$("#xxid").val(xxid);
			alert("保存信息成功。");
		}
		else
		{
			alert("保存信息失败。");
		}
	});
}