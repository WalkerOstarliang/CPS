//是否点击实有单位查询
var SYDWCX_ISCLICK = false; 

//$(function(){
//	$("#sydwcx_div").displayInputForText();
//});

/** 实有单位查询* */
function sydwcx() {
	var dwmc = $("#dwcx").find("input[name='dwcx.dwmc']").val();
	var dwdm = $("#dwcx").find("input[name='dwcx.dwdm']").val();
	var frdb = $("#dwcx").find("input[name='dwcx.frdb']").val();
	var frsfzhm = $("#dwcx").find("input[name='dwcx.frsfzhm']").val();
	if(dwmc != "" || dwdm != "" || frdb != "" || frsfzhm != ""){
		$("#cxjgList").query("F", "dwcx");
		SYDWCX_ISCLICK = true;
	}else{
		alert("请输入查询条件!")
	}
}

/**
 * 实有单位列表行被单机
 * @param {} tr
 * @param {} data
 */
function rowClick(tr,data){
	$("#sydwcx_div").eachObjectSetValue(data);
	$("#sydwcx_div").displayInputForText();
	$("#sydwcx_div").show();
}

/**
 * 实有单位列表行被双击
 * @param {} tr
 * @param {} data
 */
function rowDoubleClick(tr,data){
	openEditWindow("toDw", data.jgbh, data.hylb, "update");
}

/**
 * 新增实有单位
 * @param {} dzid 地址id
 */
function addSydw(dzid){
	if(SYDWCX_ISCLICK){
		openDwInfo({
			"dwcx.dwmc" : $("#dwmc").val(),
			"dwcx.dwdm" : $("#dwdm").val(),
			"dwcx.frdb" : $("#frdb").val(),
			"dwcx.frsfzhm" : $("#frsfzhm").val(),
			"dw.fwBean.fwid" : $("#fwid").val(),
			"dw.fwBean.dzid" : $("#dzid").val(),
			"operType" : "add"
		});
	}
	else{
		alert("请先对单位进行查询!");
	}
}

function openDwInfo(params)
{
	var url = contextPath + "/zagl/dw/toDwInfoPage.action?t" + new Date().getTime();
	$.openDialogWindow({
		url : url,
		width : 1020,
		height : 900,
		data : params,
		callback : function() 
		{
		}
	});
}

function openUpldateDwInfo(jgbh)
{
	openDwInfo({
		"dw.dwjbxx.jgbh" : jgbh,
		"operType" : "update"
	})
}

function sydwRowCallback(tdObj,rowdata)
{
	var html = "";
	html += "<span class=\"cps_span_href\" onclick=\"openUpldateDwInfo('" + rowdata["jgbh"] + "')\">修改</span>&nbsp;";
	return html;
}

function dblclickRowCallback(trObj,rowdata)
{
	openUpldateDwInfo(rowdata["jgbh"]);
}