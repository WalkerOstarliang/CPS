function queryList()
{
	$("#cxjgList").query("F","dwcxform");
}

function clickQueryBtn()
{
	var querydwmc = $("#dwmc").val();
	if (querydwmc != null && querydwmc != "")
	{
		$("#cxjgList").query("F","dwcxform",function(){
			$("#executequerydwmc").val(querydwmc);
		});
	}else
	{
		alert("请输入单位名称进行查询")
	}
}

function clickNextBtn()
{
	var exequerydwmc = $("#executequerydwmc").val();
	var querydwmc = $("#dwmc").val();
	var size = $("#cxjgList").getTotalSize();
	if (exequerydwmc == null || exequerydwmc == "" || exequerydwmc != querydwmc)
	{
		alert("请先进行查询后再进行下一步.");
	}
	else if (size > 0)
	{
		alert("辖区内已经存在查找的单位,无法进行下一步操作.")
	}
	else
	{
		$("#dwcxform").attr("action", contextPath + "/sydw/dwgl/toDwdjFwSelectPage.action");
		layer.load(0);
		$("#dwcxform").submit();
	}
}

//单位详情
function openDwDetail(jgbh,hylb)
{
	$.openWindow({
		name : "dwwin",
		url : contextPath + "/sydw/dwgl/toDwInfoPage.action",
		data : {
			"operType" : "detail",
			"queryBean.jgbh" :  jgbh
		},
		width:1000,
		height:700
	})
}

function dwdjczRowCallBack(tdObj,rowdata)
{
	var html = "<span class=\"cps_span_href\" onclick=\"openDwDetail('"+rowdata["jgbh"]+"','" + rowdata["hylb"]+"')\">详情</span>";
	return html;
}