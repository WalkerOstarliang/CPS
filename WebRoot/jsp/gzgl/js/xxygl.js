function queryData()
{
	$("#xxyList").query("F", "searchform");
}

function toAddXxyPage(op,zaembh){
	$.openWindow({
		url : contextPath + "/gzgl/tzgl/toAddXxyPage.action",
		data : {
			"operType":op,
			"zaembh":zaembh,
			"t":new Date().getTime()
		},
		width : 1000,
		height :760,
		scroll:false,
		callback : function() 
		{
			queryData();
		}
	});
}

//打开辅警界面
function  openFjPage(fjjh,operType)
{
	var ssdwdm=$("#logininfo_orgcode").val();
	var ssdwmc=$("#logininfo_orgname").val();
	if(ssdwdm == null){
		ssdwdm = "";
	}
	if(ssdwmc == null){
		ssdwmc = "";
	}
	$.openWindow({
		url:contextPath+"/gzgl/gzjwsgl/toFjPageInfo.action",
		data:{
			"operType":operType,
			"fjBean.fjjh":fjjh,
			"fjBean.ssdwdm":ssdwdm,
			"fjBean.ssdwmc":ssdwmc,
			t:new Date().getTime()
		},
		width:1000,
		height:500,
		callback:function(){
			if(operType!='detail'){
				$("#fjtableList").query("F","hiddenform");
			}
		}
	});
}


function toDetailXxyPage(op,zaembh){
	$.openDialogWindow({
		url : contextPath + "/gzgl/tzgl/toDetailXxyPage.action",
		data : {"op":op,"zaembh":zaembh,"t":new Date().getTime()},
		width : 1000,
		height :760,
		scroll:false,
		callback : function() 
		{
			queryXxyfyqk();
		}
	});
}

function queryXxyfyqk(){
	$("#fyqk").query("F","xxyform");
}
function selectGlsymj(orgCode){
	openDwRySelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		},
		function (userbeans)
		{
			if (userbeans)
			{
				$("#glsymj").val(userbeans["realname"]).focus();
				$("#mjjh").val(userbeans["username"]);//username表示警号
				$("#mjdwdm").val(userbeans['orgcode']);
				$("#mjdwmc").val(userbeans['orgname']);
			}
		});
}

function selectldxx(orgCode){
	openDwRySelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		},
		function (userbeans)
		{
			if (userbeans)
			{
				$("#ldxm").val(userbeans["realname"]).focus();
				$("#ldszdwdm").val(userbeans['orgcode']);
				$("#ldszdwmc").val(userbeans['orgname']);
			}
		});
}

function selectglmjxx(orgCode){
	openDwRySelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		},
		function (userbeans)
		{
			if (userbeans)
			{
				$("#glsymj").val(userbeans["realname"]).focus();
			}
		});
}

/**
 * 保存信息员
 */
function submitSave(){
	if ($.validateform("beanform"))
	{
		$("#beanform").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(result){
				if(result){
					$("#zaembh").val(result.zaembh);
					alert("保存成功.");
				}else{
					alert("保存失败.");
				}
			}
		});
		
	}
}

function openFyqkInfo(zaembh){
	$.openDialogWindow({
		url : contextPath + "/gzgl/tzgl/toxxyFyPage.action",
		data : {"zaembh":zaembh,"t":new Date().getTime()},
		width : 600,
		height :300,
		scroll:true,
		callback : function() 
		{
			queryData();
		}
	});
	
}

/*

function checkXxy(zaembh){
	$.ajax({
		url : contextPath + "/gzgl/tzgl/checkXxy.action",
		data : "zaembh=" + zaembh,
		dataType : "json",
		success : function(res)
		{
			if (res)
			{
				openFyqkInfo(zaembh);
			}else{
				alert("此人不可反应情况！");
			}
		}
	})
}
*/

function submitEmfyxx(){
	if ($.validateform("fyqkForm"))
	{
		$("#fyqkForm").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(result){
				if(result){
					alert("保存成功！");
					window.close();
				}else{
					alert("保存失败，请重试！");
				}
			}
		});
		
	}
}

function loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null){
		$("#rybh").val(rkJbxxBean["rybh"]);
		$("#zy").val(rkJbxxBean["zydm"]);
		$("#gzdw").val(rkJbxxBean["fwcs"]);
		}
	});
}

function setGbryxx(czrkxxBean)
{
	if (czrkxxBean)
	{
		$("#rybh").val(czrkxxBean["rybh"]);
		$("#xm").val(czrkxxBean["xm"]);
		
		$("#xb").val(czrkxxBean["xb"]);
		var inputxb =$("#xb").attr("inputid");
		if(inputxb != undefined && inputxb!= null && inputxb!=''){
			var text = $("#xb").find("option:selected").text();
		    $("#"+inputxb).val(text);
		}
		$("#bmch").val(czrkxxBean["bmch"]);
		$("#csrq").val(czrkxxBean["csrq"]);
	}
}


function isExistSfzhInOrg(value){
	var djdwdm=$("#djdwdm").val();
	if (isSfzh(value))
	{
		$("#zpxximg").attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + value);
		$.ajax({
			url : contextPath + "/gzgl/tzgl/isExistSfzhInOrg.action",
			dataType:"json",
			type:"post",
			data:{
				"emxxBean.sfzh":value,
				"emxxBean.djdwdm":djdwdm
			},
			success: function(msg){
				if(msg){
					alert("该身份证已经在本单位下登记过，请重新输入!");
					return ;
				}else{
					queryRkBean(value,setGbryxx);
				}			
			}
		})
	}
}

$(function(){
	var sfzh = $("#sfzh").val();
	var zaembh = $("#zaembh").val();
	var operType = $("#operType").val();
	if( sfzh !='' && (zaembh == ''|| zaembh==null))
	{
		queryRkBean(sfzh,setGbryxx);
	}
});

/**
 * 根据身份证号检查信息员是否在本单位存在
 * @param {} sfzh
 */
function checkXxy(sfzh){
	//加载人口信息
	queryRkJbxxBeanBySfzh(sfzh, function(rkxx) {
		if(rkxx){
			$.each(rkxx,function(key,value){
				$("#" + key).val(value);			
			});
			
			//检查信息员在本单位是否存在
			$.ajax({
				url:contextPath + "/gzgl/tzgl/checkXxy.action?sfzh=" + sfzh + "&t=" + new Date().getTime(),
				type:"post",
				success:function(result){
					if(result != null  &&  result != "null"){
						isExists = 
						$("#sfzh").val("");
						alert("该信息员已在本单位登记过.");
					}
				}
			});
		}else{
			queryRemoteRyxxBean(sfzh, function(rkxx) {
				if(rkxx){
					$.each(rkxx,function(key,value){
						$("#" + key).val(value);			
					});
					
					//检查信息员在本单位是否存在
					$.ajax({
						url:contextPath + "/gzgl/tzgl/checkXxy.action?sfzh=" + sfzh + "&t=" + new Date().getTime(),
						type:"post",
						success:function(result){
							if(result != null  &&  result != "null"){
								isExists = 
								$("#sfzh").val("");
								alert("该信息员已在本单位登记过.");
							}
						}
					});
				}else{
					alert("请先采集实有人口.");
				}
			});
		}
	});
	
	//加载照片
	var zpsrc = contextPath + "/cps/common/showPoto.action?sfzh=";
	$("#rkzpxx").attr("src",zpsrc+sfzh+"&t="+new Date().getTime());
	
	
}

//机构选择
function orgSelect(rootCode){
	openDwSelect({
		rootOrgCode : rootCode,
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(orgbean){
		if(orgbean != null){
			$("#ssdwdm").val(orgbean.id);
			$("#ssdwmc").val(orgbean.name);
		}
	});
}

function qyztChange(value){
	if(value == "1"){//启用
		$("#qysjLabel").html("<font color='red'>*</font>启用时间：");
		$("#qysj").attr("class","Wdate cps-input validate[required]");
		
		$("#tysjLabel").html("停用时间：");
		$("#tyyyLabel").html("停用原因");
		
		$("#tysj").removeAttr("required");
		$("#tzsyyy").removeAttr("required");
		$("#tysj").attr("disabled","true");
		$("#tzsyyy").attr("disabled","true");
	}else if(value == "0"){ //停用
		$("#qysjLabel").html("启用时间：");
		$("#qysj").removeAttr("required");
		
		$("#tysjLabel").html("<font color='red'>*</font>停用时间：");
		$("#tyyyLabel").html("<font color='red'>*</font>停用原因");
		
		$("#tysj").attr("class","Wdate cps-input validate[required]");
		$("#tysj").removeAttr("disabled");
		$("#tzsyyy").attr("class","cps-input validate[required]");
		$("#tzsyyy").removeAttr("disabled");
	}
}


function openFkxx(id,operType){
	var zaembh = $("#zaembh").val();
	if(zaembh){
		$.openDialogWindow({
			url:contextPath + "/gzgl/tzgl/toxxyFyPage.action?emfyqkxxBean.zaembh="+zaembh+"&emfyqkxxBean.id=" + id + "&operType=" + operType,
			width:"800px",
			height:"300px",
			callback : function() {
				$("#xxfkList").query("F");
			}
		});
	}else{
		alert("请先保存信息员信息.");
	}
}

function zxZaemxx(zaembh)
{
	$.ajax({
		type : "post",
		url : contextPath + "/gzgl/tzgl/zxZaemxx.action",
		data : "zaembh=" + zaembh,
		dataType : "json",
		success : function(result)
		{
			if (result)
			{
				alert("治安耳目注销成功.");
				$("#xxyList").query("F", "searchform");
			}
			else
			{
				alert("治安耳目注销失败,请稍后再试.");
			}
		}
	})
}