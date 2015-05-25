function queryTableGrid()
{
}
function queryList()
{
	$("#fwtablegrid").query("F","queryForm");
}
//新增房屋  地址：/lsgl/fw/toFwInfoPage.action
//新增实体  地址：/dzgl/dzxx/toStxxListPage.action
function openFwInfo(operType, fwid,sfczw)
{
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toFwInfoPage.action?perType=add&t=" + new Date().getTime(),
		height : 760,
		width : 1000,
		scroll : false,
		data : {
			"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():""
		},
		callback : function()
		{
			queryList();
		}
	})
}

function setSelectJlxValue(jlxBean)
{
	if( jlxBean != undefined && jlxBean != null)
	{
		$("#jlxdm").val(jlxBean["dm"]);
		$("#jlxmc").val((jlxBean["jc"]!=null && jlxBean["jc"]!="")?jlxBean["jc"]:jlxBean["mc"]);
	}
}

//单位房屋选择返回
function rowdblClickReturn(trObj, rowdata)
{
	var resultObj = new Object();
	resultObj.fwxxBean = rowdata;
	$.setResultValue(resultObj);
	$.closeWindow();
}

/**
 * 单击行事件
 * @param {Object} trObj
 * @param {Object} rowdate
 */
function rowdblClick(trObj,rowdata)
{
	openFwInfo("update",rowdata["fwid"]);
}

//新增单位
function addDw(hylb){
	var selecteds = $("#fwtablegrid").getSelected();
	if(selecteds.length<1){
		alert("请先选择房屋，如果没有找到房屋信息，请点击新增房屋按钮，添加房屋信息后在进行单位登记。");
		return false;
	}else{
		var params = {
			"operType" : "add",
			"dwcx.hylb" : hylb,
			"dw.fwBean.fwid":selecteds[0].fwid
		}
		
		var url = contextPath + "/zagl/dw/toDwInfoPage.action?t=" + new Date().getTime();
		$.openWindow({
			url : url,
			width : 1020,
			height : 750,
			data : params
		});
	}
}