/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode.substr(0,4) + "00000000",
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) 
				{
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
					//$("#wtdwleve").val(orgbeans.leve);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}
function queryList()
{	
	if($.validateform("queryForm")){
		var tjlx = $("#tjlx").val();
		$("#wtsjtablegrid" + tjlx).query("F","queryForm");
	}
}
function exportWtsjXls()
{
	var tjlx = $("#tjlx").val();
	if (tjlx=="1")
	{
		$("#queryForm").attr("action", contextPath + "/xtgl/khkp/exportWtsjtjPage.action");
	}
	else if (tjlx == "2")
	{
		$("#queryForm").attr("action", contextPath + "/xtgl/khkp/exportWtsjtjBakPage.action");
	}
	$("#queryForm").submit();
}

function openWtsjDetailWin(sjtype,orgcode,tjqssj,tjjzsj)
{
	$.openWindow({
		name : "wtsjtjwin",
		height:500,
		width:1000,
		url : contextPath + "/xtgl/khkp/toOpenWtsjInfoPage.action",
		data : {
			"queryBean.orgcode" : orgcode,
			"queryBean.sjtype" : sjtype,
			"queryBean.tjqssj" : tjqssj,
			"queryBean.tjjzsj" : tjjzsj,
			"queryBean.tjrq" : $("#tjrq").val()
		}
	});
}

function setValueAndQueryList(orgcode,orgname,orgleve)
{
	$("#wtdwdm").val(orgcode);
	$("#wtdwmc").val(orgname);
	$("#wtdwleve").val(orgleve);
	queryList();
}

function orgNameCallBack(tdObj, rowdata)
{
	var html = "";
	var orgcode = rowdata["orgcode"];
	var orgname = rowdata["orgname"]
	var orgleve = rowdata["orgleve"];
 	if (orgleve != "5")
 	{
 		html = "<span class=\"cps_span_href\" onclick=\"setValueAndQueryList('" + orgcode + "','" + orgname + "','" + orgleve + "')\">" + orgname + "</span>";
 	}
 	else
 	{
 		html = orgname;
 	}
 	return html;
}

function czrksCallback(tdObj,rowdata)
{
	var html = "";
	var czrks = parseInt(rowdata["czrks"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="czrk";
	}
	else
	{
		typecode="czrk_week";
	}
	if (czrks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">" + czrks + "</span>";
	}
	else
	{
		html = czrks;
	}
	return html;
}

function ldrkCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["ldrks"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="ldrk";
	}
	else
	{
		typecode="ldrk_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">" + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}


function jzrkCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["jzrks"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="jzrk";
	}
	else
	{
		typecode="jzrk_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">" + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}

function wlhrkCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["wlhrks"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="wlhrk";
	}
	else
	{
		typecode="wlhrk_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">" + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}

function stxxCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["stxxs"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="stxx";
	}
	else
	{
		typecode="stxx_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">"  + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}

function fwxxCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["fwxxs"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="fwxx";
	}
	else
	{
		typecode="fwxx_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">" + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}

function czfwxxCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["czfwxxs"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="czfwxx";
	}
	else
	{
		typecode="czfwxx_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">" + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}

function sydwsCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["sydws"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="sydw";
	}
	else
	{
		typecode="sydw_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html ="<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">" + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}

function cyrysCallBack(tdObj,rowdata)
{
	var html = "";
	var rks = parseInt(rowdata["cyrys"]);
	var orgcode = rowdata["orgcode"];
	var tjqssj = rowdata["tjqssj"];
	var tjjzsj = rowdata["tjjzsj"];
	var orgleve = rowdata["orgleve"];
	var tjlx = $("#tjlx").val();
	var typecode = "";
	if (tjlx == "1")
	{
		typecode="cyry";
	}
	else
	{
		typecode="cyry_week";
	}
	if (rks > 0 && orgleve =='5')
	{
		html = "<span class=\"cps_span_href\" onclick=\"openWtsjDetailWin('" + typecode + "','" + orgcode + "','" + tjqssj + "','" + tjjzsj + "')\">"  + rks + "</span>";
	}
	else
	{
		html = rks;
	}
	return html;
}

function openExportMjDetailWin(orgcode,orgleve,tjrq)
{
	$("#hiddenwtdwdm").val(orgcode);
	$("#hiddenwtdwleve").val(orgleve);
	$("#hiddentjrq").val($("#tjrq").val());
	$("#exporthiddenform").attr("action",contextPath + "/xtgl/khkp/toExportMjDetailWin.action");
	$("#exporthiddenform").submit();
}

function djmjdetailCallBack(tdObj, rowdata)
{
	var orgcode = rowdata["orgcode"];
	var tjrq = rowdata["tjrq"];
	var orgleve = rowdata["orgleve"]
	var html = "";
	html+= "<span class=\"cps_span_href\" onclick=\"openExportMjDetailWin('" + orgcode + "','" +orgleve + "','" + tjrq + "')\">导出</span>";
	return html;
}

function changeTjlx(value)
{
	$(document).find("span[id^=wtsjsmms_]").hide();
	$(document).find("div[id^=wtsjgrid_]").hide();
	$("#wtsjsmms_" + value).show();
	$("#wtsjgrid_" + value).show();
	queryList();
}