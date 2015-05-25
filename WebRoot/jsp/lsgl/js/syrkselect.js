function queryTableGrid()
{
	if ($.validateform("queryForm"))
	{
		$("#syrktablegrid").query("F","queryForm",function(){
			$("#czselect").val("true");
			$("#rkjbxxdiv").hide();
		});
	}
}

function rowCallbackRkJbxx(trObj,datas)
{
	$("#rkjbxxdiv").eachObjectSetValue(datas);
	$("#rkjbxxdiv").show();
	$("#rkjbxxdiv").displayInputForText();
	$("#rkzpxx").attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + datas["sfzh"]);
}

function openRkInfo(operType,sfzh,fwid,rybh)
{
	var rybh = rybh == undefined ? "" : rybh;
	$.openDialogWindow({
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {
			"operType" : operType,
			"queryBean.rybh":rybh,
			"queryBean.sfzh":sfzh,
			"queryBean.fwid" : fwid,
			t:new Date().getTime()
		},
		width : 1000,
		height : 760
	});
}


function openNewRkInfoPage()
{
	var isselected = $("#czselect").val();
	if (isselected != "true")
	{
		alert("请先进行查询.");
	}
	else
	{
		var size = $("#syrktablegrid").getDataSize();
		if (size > 0)
		{
			alert("人员已经存在,无法新增。");
		}
		else
		{
			var sfzh = $("#sfzh").val();
			var fwid = $("#fwid").val();
			var rybh = "";
			 openRkInfo('add',sfzh,fwid,rybh)
		}
	}
}

function openSelectedRkInfoPage()
{
	var selected = $("#syrktablegrid").getSelected();
	var size = $("#syrktablegrid").getDataSize();
	if (selected.length > 0)
	{
		var fwid = $("#fwid").val();
		var sfzh = selected[0]["sfzh"];
		var rybh = selected[0]["rybh"];
		openRkInfo('update',sfzh,fwid,rybh);
	}
	else
	{
		alert("请先选择人员");
	}
}

function changeRylb(rylb)
{
	// 是境外人口
	if (rylb == "4")
	{
		$("#rylb_other").hide();
		$("#rylb_jwrk").show();
		$("#jwrkdiv").show();
		$("#syrkdiv").hide();
	}
	else
	{
		$("#rylb_other").show();
		$("#rylb_jwrk").hide();
		$("#syrkdiv").show();
		$("#jwrkdiv").hide();
	}
	$("#rkjbxxdiv").hide();
}