function queryList(){
	$("#fwtablegrid").query("F","queryForm");
}
function djcxanniu(){
	
	document.getElementById("inputdqjzlkzlfw").value='0';
	$('#fwtablegrid').query('F','tzryqueryform');
}

function dqjzlkzlfw(){
	
    if($("#inputdqjzlkzlfw").val()=='0'){
   
    document.getElementById("inputdqjzlkzlfw").value='0inputdqjzlkzlfw';
    }
    if($("#inputdqjzlkzlfw").val()=='1'){
   
    document.getElementById("inputdqjzlkzlfw").value='1inputdqjzlkzlfw';
    
    }
    $("#fwtablegrid").query("F","tzryqueryform");
   
}

function saveCzrxx(){
	if($.validateform("czxxform")){
		$("#czxxform").ajaxSubmit({
				 url:      contextPath+"/lsgl/czfwczxx/saveCzxxBean.action",
				 dataType: "json",
				 data:     {t:new Date().getTime()},
				 success:  function(msg){
				 	if(msg){
				 		alert("保存成功");
				 		window.close();
				 	}else{
				 		alert("保存失败");
				 	}
				 }
		})
	}
}
function saveCzrxx1(){
	if($.validateform("queryForm")){
		var sfzh=$("#hzrsfzh").val();
		var czxxbh=$("#czxxbh").val();
		var czfwbh=$("#czfwbh").val();
		if(czxxbh!=""){
			$("#queryForm").ajaxSubmit({
				 url:      contextPath+"/lsgl/czfwczxx/saveCzxxBean.action",
				 dataType: "json",
				 data:     {t:new Date().getTime()},
				 success:  function(msg){
				 	if(msg){
				 		alert("保存成功");
				 		clearform();
				 		$("#fwtablegrid").query("F","queryForm");
				 	}else{
				 		alert("保存失败");
				 	}
				 }
			})
		}else{
			$.ajax({
				url:contextPath+"/lsgl/czfwczxx/isExistSfzh.action",
				data:{"czxxBean.hzrsfzh":sfzh,"czxxBean.czfwbh":czfwbh,t:new Date().getTime()},
				dataType:"json",
				success: function(msg){
					if(msg){
						alert("该身份证已经被登记为合租人");
					}else{
						$("#queryForm").ajaxSubmit({
							 url:      contextPath+"/lsgl/czfwczxx/saveCzxxBean.action",
							 dataType: "json",
							 data:     {t:new Date().getTime()},
							 success:  function(msg){
							 	if(msg){
							 		alert("保存成功");
							 		clearform();
							 		$("#fwtablegrid").query("F","queryForm");
							 	}else{
							 		alert("保存失败");
							 	}
							 }
						})
					}
				}
			})
		}
	}
}

function callbackHzrsfzxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#ryjgbh").val(rkxxBean["rybh"]);
		$("#hzrxm").val(rkxxBean["xm"]);
		$("#hzrlxdh").val(rkxxBean["lxdh"]);
		$("#hzrxb").val(rkxxBean["xb"]);
	}
	else
	{
		if (confirm("没有找到实有人口信息，是否进行实有人口登记？"))
		{
			var fwid = $("#fwid").val();
			$.openDialogWindow({
				url : contextPath + "/lsgl/rk/toSyrkInfoPage.action?operType=add&queryBean.fwid=" + fwid + "&queryBean.sfzh=" + $("#hzrsfzh").val(),
				width:1000,
				height:700,
				success : function()
				{
					
				}
			})
		}
	}
}

function rowcallbackCzxxdj(trObj,rowData)
{
	$("#czxxdiv").eachObjectSetValue(rowData);
	changeCzrlx(rowData["czrlx"]);
}

function clearform(){
	$("#queryForm").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}

function getRyxxBean(sfzh)
{ 
	queryRkBean(sfzh,callbackHzrsfzxx)
}

function changeCzrlx(value)
{
	//单位
	if (value == "1")
	{
		$("#clear_row1").hide();
		$("#clear_row_czdwxx").show();
	}
	else
	{
		$("#clear_row1").show();
		$("#clear_row_czdwxx").hide();
	}
}

function openDwSelect()
{
	$.openDialogWindow({
		url : contextPath + "/zagl/dw/toDwselect.action?isdblclick=true&t=" + new Date().getTime(),
		width : 1000,
		height : 700,
		callback : function(dwBean) 
		{
			if (dwBean != null)
			{
				$("#ryjgbh").val(dwBean["jgbh"]);
				$("#jgdwmc").val(dwBean["dwmc"]);
			}
		}
	});
}


function czztRowCallback(tdObj, rowdata)
{
	if (rowdata["czrlx"] == "1")
	{
		return "单位租凭";
	}
	else 
	{
		return "个人租凭";
	}
}

function openDzfwxxInfoWin(fwid)
{
	$.openWindow({
		url : contextPath + "/lsgl/fw/toFwInfoPage.action?operType=detail&queryBean.fwid=" + fwid,
		height:700,
		width:1000
	});
}

function tzryCzRowCallback(trObj, rowdataObj) {
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openSyrkInfoPage('rydaxx','"+ rowdataObj["rybh"] + "','"+rowdataObj["rylb"]+"')\">人员详情</span>&nbsp;";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openDzfwxxInfoWin('" + rowdataObj["fwid"] + "')\">地址详情</span>&nbsp;";
	
	return result;
}
function dwCzRowCallback(trObj , rowdataObj){
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openDwDetail('" + rowdataObj["jgbh"] + "','"+rowdataObj["hylb"]+"')\">单位详情</span>&nbsp;";
	return result;
}


function openSyrkSelectWin(){
	$.openDialogWindow({
		url : contextPath + "/lsgl/rk/toSyrkSelectListPage.action?t=" + new Date().getTime(),
		width : 1000,
		height : 700,
		callback : function(rkBean) 
		{
			if (rkBean != null)
			{
				$("#hzrxm").val(rkBean["xm"]);
				$("#hzrsfzh").val(rkBean["sfzh"]);
				$("#hzrxb").val(rkBean["xb"]);
			}
		}
	});
}

function rowcallbackCzfwJbxx(tdObj, rowdata){
	$("#czfwdivid").eachObjectSetValue(rowdata);
}


function saveCzjlInfo(){
	if($.validateform("czjlform")){
		$("#czjlform").ajaxSubmit({
			url:contextPath+"/lsgl/fw/savaCzjlInfo.action?t="+new Date().getTime(),
			type:"post",
			dataType:"json",
			success:function(fwBean){
				if(fwBean!=null){
					$("#id").val(fwBean["czfwBean"]["id"]);
					$("#czfwbh").val(fwBean["czfwBean"]["czfwbh"]);
					alert("保存成功.");
					if ($("#closeParentWin").val() == "true")
					{
						parent.close();
					}
					else
					{
						parent.loadFwjgPage();
						parent.layer.close(parent.layerObj);
					}
				}else{
					alert("操作失败.");
				}
			}		
		});	
	}
}


//打开出租记录
function openCzjlWin(operType,czfwbh){
	var fwid=$("#czfwfwbh").val();
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toAddCzjlPage.action?t=" + new Date().getTime(),
		data:{
			"fwBean.czfwBean.fwbh":fwid,
			"fwBean.czfwBean.czfwbh":czfwbh,
			"operType":operType
		},
		width : 1000,
		height : 700,
		callback : function() 
		{
			//刷新列表	
			$("#czfwtableid").query("F","queryForm");
		}
	})
}


//打开承租人
function openCzrPage(operType,czxxbh){
	var fwid =$("#czfwfwbh").val();
	var czfwbh=$("#czfwbh").val();
	if(czfwbh ==''){
		alert("请先保存出租记录");
		return ;
	}
	$.openDialogWindow({
		url : contextPath + "/lsgl/czfwczxx/toAddCzrPage.action?t=" + new Date().getTime(),
		data:{
			"czxxBean.czfwbh":czfwbh,
			"czxxBean.czxxbh":czxxbh,
			"operType":operType,
			"fwBean.fwid":fwid
		},
		width : 800,
		height : 500,
		callback : function() 
		{
			//刷新列表	
			$("#fwtablegrid").query("F","czjlform");
		}
	})
}


function loadFwfzInfo(value)
{
	if (value != null && value != "")
	{
		if (isSfzh(value))
		{
			queryRkBean(value,callbackHzsfzxx)
		}
		else
		{
			alert("不是有效的身份证号码.");
		}
	}
}

function callbackHzsfzxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#fzxm").val(rkxxBean["xm"]);
		$("#lxdh").val(rkxxBean["lxdh"])
	}
}

//治安
function callbackZazrrxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#dlr").val(rkxxBean["xm"]);
		$("#dlrlxfs").val(rkxxBean["lxdh"])
	}
}