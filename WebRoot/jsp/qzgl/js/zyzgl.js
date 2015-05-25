/*function saveZc(operType){
		var zc = $("#zc").val();
		var zcmc = $("#zc option:selected").text();
		var jysm = $("#jysm").val();
		var objArr = {"zc":zc, "zcmc":zcmc, "jysm":jysm,"operType":operType};
		window.returnValue = objArr;
	    window.close();
}*/
function save(){
   if ($.validateform("Zyzform"))
	{
		$("#Zyzform").ajaxSubmit({ 
			dataType:"json",
			type : "post",
			success : function(bean)
			{
				if($("#operType").val()=="add"){
					alert("新增成功！");
					$("#bh").val(bean["bh"]);
					$("#zyzbh").val(bean["zyzbh"]);
				}
				else if($("#operType").val()=="update"){
					alert("修改成功！");
				}
			}
		});
	}
   
}
function deleteZc(obj){
	$("#zcTable tr:eq("+obj+")").remove(); 	
}
function deleteZcxx(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/zyzgl/deleteZc.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					jxzcquery();
				}
			}
		});
	}
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
	$("#xm").val("");
	$("#sfzh").val("");
	jxquery();
}

function jxquery(){
	$("#zyzquerylist").query("F","zyzform");
}

function czRowCallback(trObj, rowDataObj)
{
	var result = "";
	result += "<a href=\"javascript:add('update','" + rowDataObj["bh"] + "')\">修改</a>&nbsp;";
	result += "<a href=\"javascript:deleteInfoByBh('" + rowDataObj["bh"] + "')\">删除</a>&nbsp;";
	result += "<a href=\"javascript:add('detail','" + rowDataObj["bh"] + "')\">详情</a>";
	return result;
}
function updatezcxxRowCallback(trObj, rowDataObj){
	var result = "";
	result += "<span onclick=\"addzc('update','" + rowDataObj["bh"] + "')\" style=\"cursor: pointer;\" class=\"cps_span_href\">修改</span>&nbsp;";
	result += "<span onclick=\"deleteZcxx('" + rowDataObj["bh"] + "')\" style=\"cursor: pointer;\" class=\"cps_span_href\">删除</span>&nbsp;";
	return result;
}
function add(operType,bh){
	$.openDialogWindow({
		url : contextPath + "/qzgl/zyzgl/toAddZyz.action",
		data : {"operType": operType,"bh":bh,t:new Date().getTime()},
		width : 980,
		height : 450,
		callback : function()
		{
			$(operType != "detail");
			{
				clearQuery();
				jxquery();
			}
		}
	});
}
function addzc(operType,bh){
	var zyzbh=$("#bh").val();
	if(zyzbh =="" || zyzbh ==null){
		alert("请填写志愿者基本信息");
		return ;
	}
	$.openDialogWindow({
		url : contextPath + "/qzgl/zyzgl/toAddZcxx.action",
		data : {
			"operType":operType,
			"zyzzcxxBean.bh":bh,
			"zyzbh":zyzbh,
			t:new Date().getTime()
		},
		width : 600,
		height : 400,
		callback : function()
		{
			$(operType != "detail");
			{
				jxzcquery();
			}
		}
	});
}
function jxzcquery(){
   $("#queryzcxxlist").query("F","Zyzform");
}

function saveZc(){
	if ($.validateform("zcForm"))
	{
		$("#zcForm").ajaxSubmit({
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
function deleteInfoByBh(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/zyzgl/deleteZyz.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该志愿者相关信息.");
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
		url : contextPath + "/qzgl/zyzgl/deleteZyzxx.action",
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
				alert("删除失败，请重新再试.")
			}
		}
	})
}
function bacthScZyzxx(){
	 var selectes = $("#zyzquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要删除这些数据吗？"))
		{
			var bhs = [];
			$.each(selectes,function(i, obj){
				bhs.push(obj["bh"]);
			});
			zxSqxx(bhs.join(","))
		}
	}
	else
	{
		alert("请选择需要删除的数据。")
	}
}

/**机构选择**/
function selectOrg(orgcode, hiddenfield, showfield){
	var code = "430000000000";
	openDwSelect({
		rootOrgCode : code,
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

function openSelectSqjwsWin()
{
	var sspcsdm = $("#sspcsdm").val();
	openSelectSqjwsTree(sspcsdm);
}

function openSelectSqjwsTree(orgcode)
{
	openDwSelect({
		rootOrgCode : orgcode,
        mutilSelect : false,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(orgBean){
		if (orgBean)
		{
			$("#ssjwsdm").val(orgBean.id);
			$("#ssjwsmc").val(orgBean.name);
			//加载派出所名称
			callbackPcsBeanByJwsdm(orgBean.id,function(orgPcsBean){
				$("#sspcsdm").val(orgPcsBean["orgcode"]);
				$("#sspcsmc").val(orgPcsBean["orgname"]);
			});
		}
		
	})
}
function queryRyxxBean(sfzh, callback) {
	$.ajax({
		type:"post", 
		url:contextPath+"/czrkcommon/queryRyxxBean.action", 
		data:"sfzh=" + sfzh, 
		dataType : "json",
		success:function (czrkBean) 
		{
			if ($.isFunction(callback)) 
			{
				callback(czrkBean);
			}
	}});
}

function setGbryxx(czrkBean)
{
	if (czrkBean)
	{
		$("#xm").val(czrkBean["xm"]);
		$("#xb").val(czrkBean["xb"]);
		var inputxb =$("#xb").attr("inputid");
		if(inputxb != undefined && inputxb!= null && inputxb!=''){
			var text = $("#xb").find("option:selected").text();
		    $("#"+inputxb).val(text);
		}
		$("#csrq").val(czrkBean["csrq"]);
		$("#whcd").val(czrkBean["whcd"]);
		$("#lxdh").val(czrkBean["lxdh"]);
		$("#jtzz").val(czrkBean["xzzxz"]);
	}
}

function resetzyzxx(){
	$("#sfzh").val("");
	$("#xm").val("");
	$("#xb").val("");
	$("#csrq").val("");
	$("#jtzz").val("");
	$("#whcd").val("");
	$("#lxdh").val("");
	$("#email").val("");
	$("#qqhm").val("");
	$("#sspcsmc").val("");
	$("#ssjwmc").val("");
}

function loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null){
		$("#xm").val(rkJbxxBean["xm"]);
		$("#xb").val(rkJbxxBean["xb"]);
		$("#csrq").val(rkJbxxBean["csrq"]);
		$("#whcd").val(rkJbxxBean["whcd"]);
		$("#lxdh").val(rkJbxxBean["lxdh"]);
		$("#jtzz").val(rkJbxxBean["xzzxz"]);
		}
	});
	
}

function cl(){
	window.close();
}

function isExistSfzhInOrg(value){
	var orgcode = $("#djdwdm").val();
	$.ajax({
		url : contextPath + "/qzgl/zyzgl/isExistSfzhInOrg.action",
		type:"post",
		dataType:"json",
		data:{
			"zyzdjxxBean.sfzh":value,
			"zyzdjxxBean.djdwdm":orgcode
		},
		success: function(msg){
			if(msg){
				alert("该身份证在本单位下已经登记，请重新输入！");
				return ;				
			}else{
				queryRkBean(value,setGbryxx);
			}
		}
	
	})


}

$(function(){
	var sfzh=$("#sfzh").val();
	var bh=$("#bh").val();
	if(bh=='' || bh==null){
		queryRkBean(sfzh,setGbryxx);
	}
})