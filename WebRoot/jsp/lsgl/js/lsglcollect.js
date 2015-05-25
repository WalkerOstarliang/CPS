function openSydw(){
	var selectData = $("#fwtablegrid").getSelected();
	if(selectData.length == 1){
		openDwInfo({
			"queryBean.fwid" : selectData[0].fwid,
			"operType" : "add"
		});
	}else{
		alert("请选择且只能选择一条记录!");
	}
}

function openDwInfo(params)
{
	var url = contextPath + "/sydw/dwgl/toDwInfoPage.action?t=" + new Date().getTime();
	$.openWindow({
		url : url,
		width : 1000,
		height : 700,
		data : params
	});
}

function czRowCallback(trObj,rowdata){
	var html = "<a href=\"javascript:openFwInfo('detail','" + rowdata["fwid"] +"')\">详情</a>";
	return html;
}
function openStxxDetailInfoPage(operType,stid)
{
	if (operType == "add")
	{
		var stmc = $("#stmc").val();
		if (!$.isBlank(stmc))
		{
			var count = $("#fwtablegrid").getTableGridRowCount();
			if (count <= 0)
			{
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
				$("#executequery").val("false");
			}
			else
			{
				if(window.confirm("实体可能已经存在，是否新增?")){
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
					$("#executequery").val("false");
				}
			}
			 
		}
		else
		{
			alert("请输入正确的实体名称进行查询.");
		}
	}
	else
	{
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
	}
}


function openAddFwInfoWin(operType)
{
	var stid = $("#stid").val();
	if(stid =='' || stid ==null){
		alert("请先保存实体基本信息");
		return;
	}
	$.openWindow({
		name : "fwwin",
		url : contextPath + "/lsgl/fw/toFwInfoPage.action",
		width:1000,
		height:720,
		data : {
			operType : operType,
			"queryBean.sfczw" : "0",
			"queryBean.stid" : stid
		},
		callback : function()
		{
			$("#fwtablegrid").query("F","stxxform");
		}
		
	});
}
//刷新列表
function queryList()
{	    
	$("#fwtablegrid").query("F","queryForm");
}

function openFwInfo(operType, fwid,sfczw)
{
	if (operType=="detail")
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
				queryFwList();
			}
		})
	}
}


function czCallbackfw(tdObj, rowData)
{
	var result = "";
	result +="<span onclick=\"openFwInfo('detail','" + rowData["fwid"] +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;";
	return result;
}
var MapServicesUrl="";