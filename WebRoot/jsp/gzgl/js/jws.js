
function jwsCallback(tdObj, rowDataObj){
	var content = "";
	var orgcode=$("#orgcode").val();
	if(orgcode==rowDataObj.orgcode){
		content += "<span  onclick=\"openJwsPage('" + rowDataObj.orgcode + "', 'update')\" style=\"color:green\" class=\"cps_span_href\">修改</span>";
	}
	content += "&nbsp;<span  onclick=\"openJwsPage('" + rowDataObj.orgcode + "', 'detail')\"  style=\"color:green\" class=\"cps_span_href\">详情</span>";
	return content;
}
/**
*查询列表
**/
function queryList(){
	$("#datagridList").query("F","searchform");
}

function queryFjList(){
	$("#fjtableList").query("F","hiddenform");
}
/**
* 打开修改页面
**/
function openJwsPage(id,operType){
	url = contextPath +"/gzgl/gzjwsgl/toJwsPage.action";
	$.openDialogWindow({
		url : url,
		data : {"operType":operType,"id":id,"t":new Date().getTime()},
		width : 900,
		height :450,
		callback : function(){
				queryList();
			
		}
	});
}

function updateJws(){
	if ($.validateform("jwsForm"))
	{
		$("#jwsForm").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(result){
			if(result){
				alert("操作成功！");
				window.close();
				}else{
				alert("操作失败，请重试！");
				}
			}
		});
	}
}

/**
**选择机构
**/
function selectOrg(orgCode){
	openDwSelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		},
		function (orgBean)
		{
			if (orgBean)
			{
				$("#orgname").val(orgBean["name"]);
				$("#orgcode").val(orgBean["id"]);
			}
		});
}
/**
**选择人员
**/
function selectRyxx(orgCode,xm,sfzh,jh){
	openDwRySelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		},
		function (userbeans)
		{
			if (userbeans)
			{
				$("#"+xm).val(userbeans['realname']);
				$("#"+sfzh).val(userbeans['sfzh']);
				$("#"+jh).val(userbeans['username']);
			}
		});
}

function updatePcsInfo(orgcode,operType){
	orgcode=$("#orgcode").val();
	$.openDialogWindow({
		url : contextPath+"/gzgl/gzjwsgl/toPcsPageInfo.action",
		data : {"operType":operType,"pcsBean.orgcode":orgcode,t:new Date().getTime()},
		width : 1000,
		height : 500,
		callback : function(){
		}
	});
}

function savaPcsInfo(){
	if(($("#sxsq").val() == null || $("#sxsq").val() == "") || !($("#ispcs").val() == '1')){
	    if($.validateform("pcsform")){
	    	$("#pcsform").ajaxSubmit({
	    		url:contextPath+"/gzgl/gzjwsgl/savePcsBean.action",
	    		dataType:"json",
	    		type:"post",
	    		success:function(msg){
	    			if(msg){
	    				alert("信息保存成功");
	    				//刷新
	    				window.location.href=window.location.href;
	    			}else{
	    				alert("操作失败，请重试");
	    			}
	    		}
	    	})
	    }
	}else{
		alert("请先往【地址管理】->【行政社区管理】 中添加行政社区.");
	}
}


function pcsExportWord(){
	 alert("开始");
	 $("#exportform").attr("action",contextPath + "/gzgl/gzjwsgl/toExportPcsPage.action");
	 $("#exportform").submit();
}

function openFwSelect(){
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toSelectFwWin.action",
		width:900,
		height:650,
		data : {
			"queryBean.rylb":"2",
			"queryBean.selectType" : "select", 
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			if (resultObj)
			{
				var fwxxBean = resultObj["fwxxBean"];
				$("#dzid").val(fwxxBean["dzid"]);
				$("#dzmc").val(fwxxBean["dzmc"]);
			}
		}
	});
}


function changeSfjyjws(value)
{
	if (value == 0)
	{
		$("#pcsjwqdj").val("9");
		$("#bgddlx").val("3");
		$("#ywjws").val("2");
		$("#jtjzrow").hide();
		$("#sfncjws").val("1");
	}
	else
	{
		$("#pcsjwqdj").val("");
		$("#bgddlx").val("");
		$("#ywjws").val("");
		$("#jtjzrow").show();
		$("#sfncjws").val("");
	}
}