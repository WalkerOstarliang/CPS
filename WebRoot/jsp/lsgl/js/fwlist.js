function queryTableGrid()
{
	
}

function querySyrkdjfwList()
{
	var jwsqdm = $("#jwsselect").val();
	if (jwsqdm != null && jwsqdm != "")
	{
		$("#fwtablegrid").query("F","queryForm");
	}
	else
	{
		alert("查询条件必须选择到警务区进行查询.");
	}
}

function queryList()
{
	$("#fwtablegrid").query("F","queryForm");
}

function setSelectJlxValue(jlxBean)
{
	if( jlxBean != undefined && jlxBean != null)
	{
		$("#jlxdm").val(jlxBean["dm"]);
		$("#jlxmc").val((jlxBean["jc"]!=null && jlxBean["jc"]!="")?jlxBean["jc"]:jlxBean["mc"]);
	}
}


function openFwInfo(operType, fwid,sfczw)
{
	if (operType == "add")
	{
		$.openWindow({
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			height : 720,
			width : 1000,
			scroll : false,
			data : {
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				"queryBean.sfczw" : sfczw                                                                                  
			}
		});
	}
	else if (operType=="detail")
	{
		$.openWindow({
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			data : {
				operType : operType, 
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : sfczw, 
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				t : new Date().getTime()
			},
			height : 760,
			width : 1000
		});
	}
	else
	{
		$.openDialogWindow({
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			data : {
				operType : operType, 
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : sfczw, 
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				t : new Date().getTime()
			},
			height : 760,
			width : 1000,
			scroll : false,
			callback : function()
			{
				queryList();
			}
		})
	}
}

function openSelectFwWinJwrkDj()
{
	var selectes = $("#fwtablegrid").getSelected();
	
	if (selectes.length > 0)
	{	 
		var fwid = selectes[0]["fwid"];
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/lsgl/rk/toRkInfoPage.action",
			width:1000,
			height:700,
			data : 
			{
				"operType":"add",
				"queryBean.rylb" : "4",
				"queryBean.fwid" : fwid, 
				"queryBean.sfzh" : "", 
				t: new Date().getTime()
			}
		});
	}
	else
	{
		alert("请选择一条房屋地址信息.");
	}
}

function openSelectFwWinDwDj()
{
	var selectes = $("#fwtablegrid").getSelected();
	if (selectes.length > 0)
	{	 	 
		var fwid = selectes[0]["fwid"];
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/zagl/dw/toDwInfoPage.action",
			width:1000,
			height:700,
			data : 
			{
				"operType":"add",
				"dw.fwBean.fwid" : fwid, 
				t: new Date().getTime()
			}
		});
	}
	else
	{
		alert("请选择一条房屋地址信息.");
	}
}


function openNewFwInfo(operType, fwid,sfczw)
{
	if (operType == "add")
	{
		$.openWindow({
			name : "fwupdatewin",
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			height : 720,
			width : 1000,
			scroll : false,
			data : {
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				"queryBean.sfczw" : sfczw                                                                                  
			}
		});
	}
	else if (operType=="detail")
	{
		$.openWindow({
			name : "fwupdatewin",
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			data : {
				operType : operType, 
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : sfczw, 
				"queryBean.isczfdj" : "0",
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				t : new Date().getTime()
			},
			height : 760,
			width : 1000
		});
	}
	else
	{
		$.openWindow({
			name : "fwupdatewin",
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			data : {
				operType : operType, 
				"queryBean.stid" : $("#stid").val(),
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : sfczw, 
				"queryBean.isczfdj" : "0",
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():""
			},
			height : 760,
			width : 1000,
			scroll : false
		})
	}
}


function openDjfwForCzfwInfo()
{
	var selectes = $("#fwtablegrid").getSelected();
	if (selectes.length == 1 )
	{
		if (selectes[0]["sfczw"]=="1")
		{
			alert("该房屋已经是出租房屋,无需重复登记。");
		}
		else
		{
			var fwid = selectes[0]["fwid"];
			$.openWindow({
				name : "fwupdatewin",
				url : contextPath + "/lsgl/fw/toFwInfoPage.action",
				data : {
					"operType" : "update", 
					"queryBean.stid" : $("#stid").val(),
					"queryBean.fwid" : fwid,
					"queryBean.isczfdj" : "1",
					"queryBean.sfczw" : "1", 
					"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():""
				},
				height : 760,
				width : 1000,
				scroll : false
			})
		}
		
	}
	else
	{
		alert("请选择且只能选择一条房屋后再登记出租房屋信息");
	}
}

function openFwxcInfo(operType, fwid,sfczw)
{
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toFwxcInfoPage.action",
		data : {operType : operType, "queryBean.fwid" : fwid,"queryBean.sfczw" : sfczw, t : new Date().getTime()},
		height : 760,
		width : 1000,
		scroll : false,
		callback : function()
		{
			queryList();
		}
	})
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

function rowdblClickReturn(trObj, rowdata)
{
	var resultObj = new Object();
	resultObj.fwxxBean = rowdata;
	$.setResultValue(resultObj);
	$.closeWindow();
}

/**
*实有人口查询条件时
*/
function rowdblClickReturnQuery(trObj, rowdata)
{
	$("#fwid",opener.document).val(rowdata.fwid);
	$("#dzmc",opener.document).val(rowdata.dzmc);
	$.closeWindow();
}


function zxbsCallback(tdObj, rowData)
{
	if (rowData["zxbs"] == "1")
	{
		return "<font color=\"red\">已注销</font>";
	}
	else
	{
		return "有效";
	}
}

function czCallback(tdObj, rowData)
{
	var result = "";
	if (rowData["sfczw"] == "1")
	{
		result += "<a href=\"javascript:openDjCzjlInfoWin('" +rowData["fwid"] + "\")\">登记出租记录</a>";
	}
	
	return result;
}

function openDjCzjlInfoWin(fwid)
{
	$.openWindow({
		url : contextPath + "/lsgl/fw/toFwInfoPage.action",
		data : {fwid : fwid,t : new Date().getTime()},
		height : 800,
		width : 1000,
		scroll : false,
		callback : function()
		{
			queryList();
		}
	})
}


function openSyrk()
{
	var selectData = $("#fwtablegrid").getSelected();
	if (selectData.length > 0)
	{
		$.openWindow({
			url : contextPath + "/lsgl/rk/toSyrkSelectPage.action",
			data : {"queryBean.fwid":selectData[0]["fwid"],t:new Date().getTime()},
			height : 500,
			width : 1000,
			scroll : false
		});
	}
	else
	{
		alert("请选择房屋!");
	}
}

function openSyrkRkInfoPage(operType)
{
	var rylb = $("#rylb").val();
	openSyrkRkInfo(operType,rylb);
}

function openSyrkRkInfo(operType, rylb)
{
	var selectData = $("#fwtablegrid").getSelected();
	if (selectData.length == 1)
	{
		var fwid = selectData[0]["fwid"];
		if (rylb != "4")
		{
			$.openWindow({
				name : "win",
				url : contextPath + "/lsgl/rk/toSyrkInfoPage.action",
				width : 1000,
				height : 760,
				data : {
					operType : operType,
					"queryBean.rylb":rylb,
					"queryBean.fwid":fwid,
					"queryBean.cyrybh" : $("#cyrybh").val(),
					"queryBean.sfzh":$("#sfzh").val() != undefined && $("#sfzh").val()!=null ? $("#sfzh").val() : "",
					t:new Date().getTime()
				}
			});
		}
		else
		{
			$.openWindow({
				name : "win",
				url : contextPath + "/lsgl/rk/toRkInfoPage.action",
				width : 1000,
				height : 760,
				data : {
					operType : operType,
					"queryBean.rylb":rylb,
					"queryBean.fwid":fwid,
					"queryBean.cyrybh" : $("#cyrybh").val(),
					t:new Date().getTime()
				}
			});
		}
	}
	else
	{
		alert("请选择且只能选择一条地址");
	}
}

function deleteFwInfo(operType,fwid){
	if(confirm("确认要注销该房屋信息吗?")){
		$.ajax({
			url:contextPath +"/lsgl/fw/deleteFwjbxx.action",
			type:"post",
			dataType:"json",
			data:{
				"fwBean.fwid":fwid
			},
			success:function(msg){
				if(msg){
					alert("房屋注销成功.")
					queryList();
				}else{
					alert("该房屋下面有人员存在，不能注销.");
				}
			}
		})
	}
}
function deleteCzFwInfo(operType,fwid){
	if(confirm("确认要注销该出租房屋信息吗?"))
	{
		$.ajax({
			url:contextPath +"/lsgl/fw/deleteCzFwInfo.action",
			type:"post",
			dataType:"json",
			data:{
				"fwBean.fwid":fwid
			},
			success:function(msg){
				if(msg){
					alert("出租房屋注销成功.")
					queryList();
				}else{
					alert("该出租房屋下面有人员存在，不能注销.");
				}
			}
		})
	}
	
}


function  exportFwJbxxExcel(){
	var fwlistSelects = $("#fwtablegrid").getSelected();
	if(fwlistSelects.length > 0){
		if (confirm("你确定导出选择的记录吗?")){
			$("#exportform").attr("action",contextPath + "/lsgl/fw/toExportExcelFwxxInfoPage.action");
			var fwids = [];
			$.each(fwlistSelects,function(i){
				var fwBean = fwlistSelects[i];
				fwids.push(fwBean["fwid"]);
			});
			
			var fwidsStr = fwids.join(",");
			$("#fwids").val(fwidsStr);
			$("#exportform").attr("target","exportiframe");
			$("#exportform").submit();
		}	
	}else{
		if (confirm("你确定导出满足条件的所有数据吗?"))
		{
			$("#queryForm").attr("target","exportiframe");
			$("#queryForm").attr("action",contextPath + "/lsgl/fw/toExportExcelFwxxInfoPage.action");
			$("#queryForm").submit();
		}
	}
}


/**
*打开登记承租人的界面
*
**/
function  addCzrxxInfo(operType,id){
	var selects = $("#fwtablegrid").getSelected();
	if(selects.length >0){
		$.openWindow({
			url:contextPath+"/lsgl/czfwczxx/toAddCzrInfoPage.action",
			data:{
				"operType":operType,
				"czrxxBean.id":id,
				"czrxxBean.fwid":selects[0]["fwid"],
				"czrxxBean.sssqdm":selects[0]["sssq"]
			},
			width:900,
			height:600
		});
	}else{
		alert("请选择一条数据.");
		
	}
	
}


function openCzfwxcdjWin()
{
	var selects = $("#fwtablegrid").getSelected();
	if(selects.length >0)
	{
		var fwid = selects[0]["fwid"];
		$.openWindow({
			url : contextPath + "/lsgl/fw/toFwxcInfoPage.action",
			data : {
				operType : "update", 
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : "1"
			},
			height : 760,
			width : 1000,
			scroll : false
		})
	}else{
		alert("请选择巡查房屋.");
		
	}
}

function openSyrkImportWin()
{
	var selects = $("#fwtablegrid").getSelected();
	if(selects.length==1)
	{
		var fwid = selects[0]["fwid"];
		 $.openWindow({
			name : "pldrsyrkwin",
			url : contextPath + "/lsgl/rkdr/toSyrkImportPage.action?fwid=" + fwid,
			width:1000,
			height:700
		});
	}
	else if (selects.length > 1)
	{
		alert("只能选择一条房屋地址")
	}
	else
	{
		alert("请选择一条房屋地址.");
	}
}