function queryTableGrid()
{
	$("#datagridList").query("F","searchform",function(){
		$("#executequerystr").val($("#stmc").val());
	});
}

function clickQuery()
{
	queryTableGrid();
		
}

function openXgStxxDetailInfoPage()
{
	var selectes = $("#datagridList").getSelected();
	if (selectes.length > 0)
	{
		openStxxDetailInfoPage("update",selectes[0]["id"]);
	}
	else
	{
		alert("请选择要修改的实体信息.");
	}
	
}


function openStxxDetailInfoPage(operType,stid)
{
	if (operType == "add")
	{
		var stmc = $("#stmc").val();
		if (!$.isBlank(stmc))
		{
			var querystr = $("#executequerystr").val();
			if (querystr == stmc)
			{
				var count = $("#datagridList").getTableGridRowCount();
				if (count <= 0)
				{
					
					$.openWindow({
						name : "stxxwin",
						url : contextPath + "/dzgl/dzxx/toStxxFwJgDetailPage.action",
						height:810,
						width : 1000,
						data : {
							operType : operType,
							"stxxBean.stmc":encodeURIComponent($("#stmc").val()),
							"stxxBean.sjxzqh":$("#citydm").val(),
							"stxxBean.xzqh":$("#countrydm").val(),
							"stxxBean.jlxdm":$("#jlxdm").val(),
							"stxxBean.jlxmc":encodeURIComponent($("#jlxmc").val()),
							"stxxBean.sqdm":$("#sqdm").val()
						}
					});
					/**
					$.openWindow({
						name : "stxxwin",
						url : contextPath + "/dzgl/dzxx/toStxxDetailPageInfo.action",
						height:680,
						width : 1000,
						data : {
							"operType":operType,
							"stxxBean.stmc":encodeURIComponent($("#stmc").val()),
							"stxxBean.sjxzqh":$("#citygajgjgdm").val(),
							"stxxBean.xzqh":$("#countrygajgjgdm").val(),
							"stxxBean.jlxdm":$("#jlxdm").val(),
							"stxxBean.jlxmc":encodeURIComponent($("#jlxmc").val()),
							"stxxBean.sqdm":$("#sqdm").val()
						}
					});
					*/
					$("#executequery").val("false");
				}
				else
				{
					if(window.confirm("实体可能已经存在，确定继续新增吗?"))
					{
						$.openWindow({
							name : "stxxwin",
							url : contextPath + "/dzgl/dzxx/toStxxFwJgDetailPage.action",
							height:765,
							width : 1000,
							data : {
								operType : operType,
								"stxxBean.stmc":encodeURIComponent($("#stmc").val()),
								"stxxBean.sjxzqh":$("#citygajgjgdm").val(),
								"stxxBean.xzqh":$("#countrygajgjgdm").val(),
								"stxxBean.jlxdm":$("#jlxdm").val(),
								"stxxBean.jlxmc":encodeURIComponent($("#jlxmc").val()),
								"stxxBean.sqdm":$("#sqdm").val()
							}
						});
						/**
						$.openWindow({
							name : "stxxwin",
							url : contextPath + "/dzgl/dzxx/toStxxDetailPageInfo.action",
							height:680,
							width : 1000,
							data : {
								"operType":operType,
								"stxxBean.stmc":encodeURIComponent($("#stmc").val()),
								"stxxBean.sjxzqh":$("#citydm").val(),
								"stxxBean.xzqh":$("#countrydm").val(),
								"stxxBean.jdxzdm":$("#jdxzdm").val(),
								"stxxBean.jlxdm":$("#jlxdm").val(),
								"stxxBean.jlxmc":encodeURIComponent($("#jlxmc").val()),
								"stxxBean.sqdm":$("#sqdm").val()
							}
						});
						*/
						$("#executequery").val("false");
					}
				}
			}
			else
			{
				alert("请先进行查询");
			}
		}
		else
		{
			alert("请输入正确的实体名称进行查询.");
		}
	}
	else if (operType == "detail")
	{
		$.openWindow({
			name : "updatestxxwin",
			url : contextPath + "/dzgl/dzxx/toStxxFwJgDetailPage.action",
			height:765,
			width : 1000,
			data : {
				operType : operType,
				"stxxBean.id" : stid
			}
		});
		/**
		$.openWindow({
			name : "updatestxxwin",
			url : contextPath + "/dzgl/dzxx/toStxxDetailPageInfo.action",
			height:680,
			width : 1000,
			data : {
				operType : operType,
				"stxxBean.id" : stid
			}
		});
		*/
	}
	else
	{
		$.openWindow({
			name : "updatestxxwin",
			url : contextPath + "/dzgl/dzxx/toStxxFwJgDetailPage.action",
			height:765,
			width : 1000,
			data : {
				operType : operType,
				"stxxBean.id" : stid
			}
		});
		/**
		$.openWindow({
			name : "updatestxxwin",
			url : contextPath + "/dzgl/dzxx/toStxxDetailPageInfo.action",
			height:680,
			width : 1000,
			data : {
				operType : operType,
				"stxxBean.id" : stid
			}
		});
		*/
	}
}


function openDzxxDetailInfo(operType,dzid,stid)
{
	if (operType=="add")
	{
		var stSelecteds = $("#datagridList").getSelected();
		if (stSelecteds.length > 0)
		{
			$.openWindow({
				name : "dzxxwin",
				url : contextPath + "/dzgl/dzxx/toDzxxDetailPage.action",
				height:680,
				width : 1000,
				data : {
					operType : operType,
					"stxxBean.id" : stSelecteds[0]["id"]
				}
			});
		}
		else
		{
			alert("请选择一个实体");
		}
	}
	else
	{
		$.openWindow({
			name : "dzxxwin",
			url : contextPath + "/dzgl/dzxx/toDzxxDetailPage.action",
			height:680,
			width : 1000,
			data : {
				operType : operType,
				"dzxxBean.dzid" : dzid,
				"stxxBean.id" : stid
			}
		});
	}
}

function openStWinSelectWin()
{
	$.openWindow({
		name : "stselectwin",
		url : contextPath + "/dzgl/dzxx/toStxxListPage.action",
		width:1000,
		height : 500
	})
}

function setSelectSqValue(hnXzqhBean)
{
	if(hnXzqhBean)
	{
		$("#sqdm").val(hnXzqhBean["dm"]);
		$("#sqmc").val(hnXzqhBean["jc"]);
		queryTableGrid();
	}
}

function setSelectJlxValue(jlxBean)
{
	if( jlxBean != undefined && jlxBean != null)
	{
		$("#jlxdm").val(jlxBean["dm"]);
		$("#jlxmc").val((jlxBean["jc"]!=null && jlxBean["jc"]!="")?jlxBean["jc"]:jlxBean["mc"]);
	}
}


function openNewFwWin()
{
	
}


function openWinSelectWin(operType)
{
	var dzselectes = $("#datagridList").getSelected();
	if (dzselectes.length > 0)
	{
		$.ajax({
			url : contextPath +"/lsgl/fw/queryFwxxBeanByDzid.action",
			type:"post",
			dataType : "json",
			data:"queryBean.dzid=" + dzselectes[0]["dzid"],
			success :function(fwBean)
			{
				if (fwBean != null)
				{
					if(confirm("当前地址已经登记房屋信息无法再次登记，是否打开现有房屋信息窗口？"))
					{
						$.openWindow({
							name : "dzwinxx",
							url : contextPath + "/lsgl/fw/toFwInfoPage.action",
							width:1000,
							height:720,
							data : {
								operType : operType,
								"fwBean.fwid" : fwBean["fwid"],
								"queryBean.sfczw" : fwBean["sfczw"],
								"queryBean.stid" : dzselectes[0]["stid"],
								"queryBean.dzid" : dzselectes[0]["dzid"]
							}
						});
					}
				}
				else if (fwBean =="error")
				{
					alert("服务器认证错误，请重新再试.");
				}
				else if (fwBean == null)
				{
					$.openWindow({
						name : "dzwinxx",
						url : contextPath + "/lsgl/fw/toFwInfoPage.action",
						width:1000,
						height:720,
						data : {
							operType : operType,
							"queryBean.sfczw" : "0",
							"queryBean.stid" : dzselectes[0]["stid"],
							"queryBean.dzid" : dzselectes[0]["dzid"]
						}
					});
				}
			}
		})
		
		
	}
	else
	{
		alert("请选择地址.");
	}
}

function openAddFwInfoWin(operType)
{
	var stselectes = $("#datagridList").getSelected();
	if (stselectes.length >0)
	{
		$.openWindow({
			name : "fwwin",
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			width:1000,
			height:720,
			data : {
				operType : operType,
				"queryBean.sfczw" : "0",
				"queryBean.stid" : stselectes[0]["id"]
			}
		});
	}
	else
	{
		alert("请选择实体");
	}
}

var MapServicesUrl="";
function clickRowCallback(trobj,rowdata)
{
	 var xy = rowdata["x"] + "," + rowdata["y"];
	var bzzdcj=
	{
		oid:'1',
		type:"Point",
		value:xy,
		data : {
			OBJECTID: '1'
		}
	};
	var feature={BZDZ:new Array()};
	feature.BZDZ.push(bzzdcj);
	document.getElementById('MainMap').contentWindow.MapServices.url = MapServicesUrl;
	document.getElementById('MainMap').contentWindow.Entity.bf_ftr={data:{DZMC:rowdata["stmc"]}};
    document.getElementById('MainMap').contentWindow.Entity.approvedEntity_call(feature);
}

function openStxxListAndMap(){
//	$.openWindow({
//		name : "stxxlistmap",
//		url : contextPath + "/dzgl/dzxx/toStxxListPageMap.action",
//		width:1000,
//		height:720
//	});
	$.openWindow({
		name : "stxxlistmap",
		url : contextPath + "/pgis/toIndex.action",
		width:1000,
		height:720
	});
}
function clickResultRowData(trobj, rowdata)
{
	$.setResultValue(rowdata);
	$.closeWindow();
}

//打开实体帮助
function openStxxHelp(){
	$.openWindow({
			name : "实体帮助",
			url : contextPath + "/jsp/dzgl/help/sthelp.jsp?t=" + new Date().getTime(),
			width:800,
			height:650,
			data:{}
	});
}

//打开地址帮助
function openDzxxHelp(){
	$.openWindow({
			name : "地址帮助",
			url : contextPath + "/jsp/dzgl/help/dzhelp.jsp?t=" + new Date().getTime(),
			width:800,
			height:650,
			data:{}
	});
}

function openSelectFwInfoWin()
{
	var selecteds = $("#datagridList").getSelected();
	if (selecteds.length > 0)
	{
		var stid = selecteds[0]["id"];
		var stmc = selecteds[0]["stmc"];
		$.openWindow({
				name : "地址帮助",
				url : contextPath + "/lsgl/fw/toSelectFwWin.action",
				width:800,
				height:650,
				data : {
					"queryBean.hideSfzh" :　true,
					"queryBean.stid" : stid,
					"queryBean.stmc" : encodeURIComponent(stmc)
				}
		});
	}
	else
	{
		alert("请选一个择实体.");
	}
}

function deleteStxx(id){
	var verify = confirm("确认注销该实体吗?");
	if(verify){
		$.ajax({
		type : "post",
		url :  contextPath + "/dzgl/dzxx/deleteStxx.action?stxxBean.id=" + id,
		success : function(result){
			if(result){
				alert("成功注销.");
				queryTableGrid();
			}else{
				alert("实体下面有房屋信息,不能注销！");
			}
		}
	});
	}	
}

function deleteStxxBean(stid)
{
	if (confirm("删除实体后将无法恢复，你确定要继续吗？"))
	{
		$.ajax({
			type : "post",
			url : contextPath + "/dzgl/dzxx/deleteStxxBean.action?stxxBean.id=" + stid,
			dataType : "json",
			success : function(result)
			{
				if (result == true)
				{
					alert("成功删除实体信息.");
					$("#datagridList").query("F","searchform");
				}
				else if (result == "exsitsfw")
				{
					alert("实体下面有房屋信息,不能删除！");
				}
				else
				{
					alert("删除实体信息失败.")
				}
			}
		});
	}
}


function recoveryStxx(id){
	if(confirm("确认恢复该实体吗?")){
		$.ajax({
			url:contextPath+"/dzgl/dzxx/recoveryStxx.action",
			type:"post",
			dataType:"json",
			data:{
				"stxxBean.id":id
			},
			success :function(msg){
				if(msg){
					alert("成功恢复,请查询.");
					queryTableGrid();
				}else{
					alert("操作失败,请重试.");
				}
			}
		});
	}
}
