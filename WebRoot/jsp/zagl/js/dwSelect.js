/** 单位查询* */
function dwcx() {
	$("#cxjgList").query("F", "dwcx");
}

function toEditCyry(sfjwry){
	var selectDw = $("#cxjgList").getSelected();
	if(selectDw.length<1)
	{
		alert("请先选择单位,如果没有找到单位请先进入单位管理中进行单位登记后再进行从业人员登记。");
		return ;
	}
	else
	{
		var url = "";
		if(sfjwry){
			url = "&dw.cyry.sfjwry=" + sfjwry;
		}
		$.openWindow({
			url : contextPath
					+ "/zagl/dw/toCyryDetail.action?dw.cyry.jgbh="+ selectDw[0].jgbh +
						"&dw.cyry.dwmc=" + encodeURIComponent(selectDw[0].dwmc) +"&dw.opertype=add" + url,
			width : 1000,
			height : 700,
			callback : function() {
				return;
			}
		});
	}
}

function dblclickSetResult(trObj,rowdata)
{
	
	var isdblclick = $("#isdblclick").val();
	
	if (isdblclick == "true")
	{
		$.setResultValue(rowdata);
		$.closeWindow();
	}
}

function openDwDetailInfo(jgbh,hylb)
{
	var url = contextPath + "/sydw/dwgl/toDwInfoPage.action?operType=detail&queryBean.jgbh=" + jgbh;
	$.openWindow({
		name : "dwdetailwin",
		url : url,
		width : 1000,
		height : 760
	});
}

function dwSelectCzRowCallback(tdobj,rowdata)
{
	var html = "";
	html = "<span class=\"cps_span_href\" onclick=\"openDwDetailInfo('" + rowdata["jgbh"] + "','" + rowdata["hylb"] + "')\">详情</span>";
	return html;
}

function tpDwdjFwSelectPage(hylb)
{
	layer.load(0);
	document.location.href = contextPath + "/zagl/dw/toDwfw.action?dwfwzt=add&hylb" + hylb + "&queryBean.czType=sydw";
}

function openFwWin(hylb){
	$.openWindow({
		url : contextPath + "/zagl/dw/toDwfw.action?dwfwzt=add",
		width:900,
		height:650,
		data : 
		{
			"hylb":hylb,
			"queryBean.czType" :"sydw",
			t: new Date().getTime()
		}
	});
}


function toCyryDwQueryPage()
{
	var selectes = $("#cxjgList").getSelected();
	if (selectes.length == 1)
	{
		layer.load(0);
		document.location.href = contextPath + "/zagl/cyry/toCyryDjPage.action?cyrycx.jgbh=" + selectes[0]["jgbh"];
	}
	else
	{
		alert("请先选择单位");
	}
}