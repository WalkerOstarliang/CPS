
function openInfoWin(operType,bh){
	$.openWindow({
		url : contextPath + "/qzgl/jftjgl/tojftjInfo.action",
		data : {operType : operType,bh : bh,t:new Date().getTime()},
		width : 900,
		height : 550,
		callback : function()
		{
			if ($(operType != "detail"))
			{
				jxquery();
				clearQuery();
			}
		}
	});
}

function jxquery(){
	$("#jftjquerylist").query("F","jftjform");
}
function clearQuery(){
	if($("#citydm").attr("disabled")!="disabled"){
		$("#citydm").val("");
	}
	if($("#countrydmselect").attr("disabled")!="disabled"){
		$("#countrydmselect").val("");
	}
	if($("#pcsdm").attr("disabled")!="disabled"){
		$("#pcsdm").val("");
	}
	if($("#jwsselect").attr("disabled")!="disabled"){
		$("#jwsselect").val("");
	}
    $("#jflxlist").val("");
    $("#tjsj_from").val("");
    $("#tjsj_to").val("");
    jxquery();
}
function deleteInfoByBh(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/jftjgl/deleteJftj.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该纠纷调解相关信息.");
					jxquery();
				}
			}
		});
	}
}

function zxSqxx(bhs)
{
	$.ajax({
		type : "post",
		url : contextPath + "/qzgl/jftjgl/deleteJftjxx.action",
		data : "bhs=" + bhs,
		dataType : "json",
		success : function(result)
		{
			if (result)
			{
				alert("删除成功.");
				jxquery();
			}
			else
			{
				alert("删除失败，请重新再试.");
			}
		}
	});
}
function bacthScJftjxx(){
   var selectes = $("#jftjquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要删除这些数据吗？"))
		{
			var bhs = [];
			$.each(selectes,function(i, obj){
				bhs.push(obj["bh"]);
			});
			zxSqxx(bhs.join(","));
		}
	}
	else
	{
		alert("请选择需要删除的数据。");
	}
}
function czRowCallback(trObj, rowDataObj)
{
	var result = "";
	result += "<a href=\"javascript:openInfoWin('update','" + rowDataObj["bh"] + "')\">修改</a>&nbsp;";
	result += "<a href=\"javascript:deleteInfoByBh('" + rowDataObj["bh"] + "')\">删除</a>&nbsp;";
	result += "<a href=\"javascript:openInfoWin('detail','" + rowDataObj["bh"] + "')\">详情</a>";
	return result;
}

function savefjtj()
{
   if ($.validateform("jftjForm"))
	{
		$("#jftjForm").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(bh)
			{
				if (bh != null && bh != "")
				{
					alert("信息保存成功.");
					$("#bh").val(bh);
					window.close();
				}
				else
				{
					alert("信息保存失败");
				}
			}
		});
	}
   
}
/*function deleteJf(obj){
$("#zcTable tr:eq("+obj+")").remove(); 
}
function deleteJfxx(obj,bh){
		if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/jftjgl/deleteJf.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					deleteJf(obj);
				}
			}
		});
	}
}
*/

function queryRkbean(sfzh, callback)
{
	if (!$.isBlank(sfzh))
	{
		$.ajax({
			url : contextPath + "/czrkcommon/queryRyxxBean.action",
			data:"sfzh=" + sfzh,
			dataType : "json",
			success : function(czrkBean)
			{
				if ($.isFunction(callback))
				{
					callback(czrkBean);
				}
			}
		});
	}
}

function setGbryxx(czrkBean)
{	
	if (czrkBean)
	{
		$("#dsrxm").val(czrkBean["xm"]);
		$("#mz").val(czrkBean["mz"]);
		$("#lxdh").val(czrkBean["lxdh"]);
		$("#xzdz").val(czrkBean["zzxz"]);
	}
}

function add(operType,bh,dsrbh){
	$.openDialogWindow({
		url : contextPath + "/qzgl/jftjgl/toAddDsrxx.action",
		data : {"operType":operType,"bh" : bh ,"dsrbh":dsrbh,t:new Date().getTime()},
		width : 800,
		height : 300,
		callback : function()
		{
				jxqueryjftj();
		}
	});
}
function jxqueryjftj(){
	$("#dsrlist").query("F","jftjForm");
}
function czRowCallbackdsr(trObj, rowDataObj){
    var jfbh =$("#jfbh").val();
	var result = "";
	result += "<span onclick=\"add('update','"+jfbh+"','" + rowDataObj["bh"] + "')\" style=\"cursor: pointer;\" class=\"cps_span_href\">修改</span>&nbsp";
	result += "<span  onclick=\"deleteJf('" + rowDataObj["bh"] + "')\" style=\"cursor: pointer;\" class=\"cps_span_href\">删除</span>&nbsp;";
	return result;
}
function deleteJf(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/jftjgl/deleteJf.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该纠纷当事人相关信息.");
					jxqueryjftj();
				}
			}
		});
	}
}

function save(){
	if ($.validateform("jftjInfoform"))
	{
		$("#jftjInfoform").ajaxSubmit({
			type : "post",
			success : function()
			{
			     if($("#operType").val()=="add"){
					alert("新增成功！");
					window.close();
				}
				else if($("#operType").val()=="update"){
					alert("修改成功！");
					window.close(); 
				}	
			}
		});
	}
	}
	function reset(){
		$("#dsrxm").val("");
		$("#sfzh").val("");
		$("#mz").val("");
		$("#lxdh").val("");
		$("#xzdz").val("");
	}
	
	<!--

//-->
/**
var i = ${size};
function add(operType){
 	$.openDialogWindow({
		url : contextPath + "/qzgl/jftjgl/toAddDsrxx.action",
		data : {"operType":operType,t:new Date().getTime()},
		width : 700,
		height : 300,
		callback : function(dsrxx)
		{
			if(dsrxx) 
			{
				var json = eval(dsrxx);
				var zcTableHtml = "<tr>";
				zcTableHtml += "<td align='center'>"+dsrxx.dsrxm+"<input type='hidden' value='"+dsrxx.dsrxm+"' name='jftjBean.jfcyList["+i+"].xm'/></td>";
				zcTableHtml += "<td align='center'>"+dsrxx.sfzh+"<input type='hidden' value='"+dsrxx.sfzh+"' name='jftjBean.jfcyList["+i+"].sfzh'/></td>";
				zcTableHtml += "<td align='center'>"+dsrxx.mz+"<input type='hidden' value='"+dsrxx.mz+"' name='jftjBean.jfcyList["+i+"].mz'/></td>";
				zcTableHtml += "<td align='center'>"+dsrxx.lxdh+"<input type='hidden' value='"+dsrxx.lxdh+"' name='jftjBean.jfcyList["+i+"].lxdh'/></td>";
				zcTableHtml += "<td align='center'>"+dsrxx.xzdz+"<input type='hidden' value='"+dsrxx.xzdz+"' name='jftjBean.jfcyList["+i+"].xzdz'/></td>";
				zcTableHtml += "<td align='center'><a href='javascript:void(0);' onclick='deleteJf(this.parentElement.parentElement.rowIndex)'>删除</a><input type='hidden' value='"+dsrxx.operType+"' name='jftjBean.jfcyList["+i+"].operType' /></td>";
				zcTableHtml += "</tr>";
				$("#zcListTh").append(zcTableHtml);
				i = i+1;
			}
		}
	});	
}**/

function resetjftj(){
	$("#jflx").val("");
	$("#jfwtms").val("");
	$("#tjmjxm").val("");
	$("#tjjg").val("");
	$("#tjsj").val("");
	$("#tjdd").val("");
	$("#tjdwmc").val("");
	$("#issfjd").val("");
	$("#dcxy").val("");
}

function  loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null){
		$("#dsrxm").val(rkJbxxBean["xm"]);
		$("#mz").val(rkJbxxBean["mz"]);
		$("#lxdh").val(rkJbxxBean["lxdh"]);
		$("#xzdz").val(rkJbxxBean["hjdxz"]);
		
		}
	});
}

function selectOrg(orgcode, hiddenfield, showfield){
	openDwSelect({
		rootOrgCode : orgcode,
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(orgbeans){
		if(orgbeans != null){
			$("#"+hiddenfield).val(orgbeans.id);
			$("#"+showfield).val(orgbeans.name);
		}
	});
}


function isExistSfzh(sfzh){
	var jfbh = $("#jfbh").val();
	$.ajax({
		url : contextPath + "/qzgl/jftjgl/isExistSfzhInSameJf.action",
		type :"post",
		dataType: "json",
		data:{
			"jfcyrxxBean.sfzh":sfzh,
			"jftjBean.bh":jfbh
		},
		success: function(msg){
			if(msg){
				alert("该身份证号已登记，请重新输入.");
				$("#sfzh").val("");
			}else{
				loadRkxxBean(sfzh);
			}		
		}
	
	})
}

function openSelectzrmjxx(rootOrgCode){

	openDwRySelect({
		rootOrgCode : rootOrgCode,
		mutilSelect : false
	},function(userBean){
		if (userBean)
		{
			$("#tjmjjh").val(userBean["username"]);
			$("#tjmjxm").val(userBean["realname"]);
		}
	})
}
