function saveCzrkInfo()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveCzrkInfo.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					if (confirm("保存人员信息成功,确定将继续添加。取消将关闭窗口。"))
					{
						top.location.href=contextPath + "/lsgl/rk/toSyrkInfoPage.action?operType=add&queryBean.fwid=" + $("#fwid").val()
					}
					else
					{
						parent.window.close();
					}			
					//$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					//$("#czrkbh").val(rkBean["czrkBean"]["czrkbh"]);
					//$("#rkfwglid").val(rkBean["czrkBean"]["rkfwglid"])
				}
				else
				{
					alert("保存人员信息失败");
				}
				$("#savebtn").removeAttr("disabled");
			},
			faulire:function()
			{
				$("#savebtn").removeAttr("disabled");
			},
			error : function()
			{
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveJwrkInfo()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveJwrkInfo.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					$("#jwbh").val(rkBean["jwrkBean"]["jwbh"]);
					$("#rkfwglid").val(rkBean["jwrkBean"]["rkfwglid"])					
					alert("保存人员信息成功.");
				}
				else
				{
					alert("保存人员信息失败");
				}
				$("#savebtn").removeAttr("disabled");
			},
			faulire:function()
			{
				$("#savebtn").removeAttr("disabled");
			},
			error : function()
			{
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveWlhrkxxBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveWlhrkxxBean.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					if (confirm("保存人员信息成功,确定将继续添加。取消将关闭窗口。"))
					{
						top.location.href=contextPath + "/lsgl/rk/toSyrkInfoPage.action?operType=add&queryBean.fwid=" + $("#fwid").val()
					}
					else
					{
						parent.window.close();
					}
					//$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					//$("#wlhrkbh").val(rkBean["wlhrkBean"]["wlhrkbh"]);
					//$("#rkfwglid").val(rkBean["wlhrkBean"]["rkfwglid"])					
					//alert("保存人员信息成功.");
				}
				else
				{
					alert("保存人员信息失败");
				}
				$("#savebtn").removeAttr("disabled");
			},
			faulire:function()
			{
				$("#savebtn").removeAttr("disabled");
			},
			error : function()
			{
				$("#savebtn").removeAttr("disabled");
			}
			
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveLdrkInfo()
{
	$("#savebtn").attr("disabled","disabled");
	
	if ($.validateform("rkxxform"))
	{
		var zzcs = $("#zzcs").val();
		var zzsy = $("#zzsy").val();
		var njzqx = $("#njzqx").val();
		
		if (zzcs == null || zzcs == "")
		{
			alert("居住处所不能为空!");
			$("#savebtn").removeAttr("disabled");
			return false;
		}
		
		if (zzsy == null || zzsy == "")
		{
			alert("暂住事由不能为空!");
			$("#savebtn").removeAttr("disabled");
			return false;
		}
		
		if (njzqx == null || njzqx == "")
		{
			alert("拟居期限不能为空!")
			$("#savebtn").removeAttr("disabled");
			return false;
		}
		
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveLdrkInfo.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					$("#zzbh").val(rkBean["ldrkBean"]["zzbh"]);
					$("#rkfwglid").val(rkBean["ldrkBean"]["rkfwglid"]);
					if (confirm("流动人口信息保存成功,确定将继续登记居住证信息,取消将继续其他操作。"))
					{
						 openLdrkJzzxxWin(rkBean["ldrkBean"]["rybh"],rkBean["ldrkBean"]["zzbh"]);
					}
					else
					{
						if (confirm("是否继续添加人口信息？确定将继续添加人口，取消将关闭窗口."))
						{
							top.location.href=contextPath + "/lsgl/rk/toSyrkInfoPage.action?operType=add&queryBean.fwid=" + $("#fwid").val()
						}
						else
						{
							parent.window.close();
						}
						
					}		
					/*	
					var i = $.layer({
					    shade : 1, //不显示遮罩
					    area : ['auto','auto'],
					    move : false,
					    dialog : 
					    {
					        msg:'流动人口信息保存成功,是否继续登记居住证信息?',
					        btns : 2, 
					        type : 4,
					        btn : ['是','否'],
					        yes : function()
					        {
					            openLdrkJzzxxWin(rkBean["ldrkBean"]["rybh"],rkBean["ldrkBean"]["zzbh"]);
					            layer.close(i);
					        },
					        no : function()
					        {
					            layer.close(i);
					        }
					    }
					});
					*/
				}
				else
				{
					alert("保存人员信息失败");
				}
				$("#savebtn").removeAttr("disabled");
			},
			faulire:function()
			{
				$("#savebtn").removeAttr("disabled");
			},
			error : function()
			{
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveJzrkBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveJzrkInfo.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					if (confirm("是否继续添加人口信息？确定将继续添加人口，取消将关闭窗口."))
					{
						top.location.href=contextPath + "/lsgl/rk/toSyrkInfoPage.action?operType=add&queryBean.fwid=" + $("#fwid").val()
					}
					else
					{
						parent.window.close();
					}
					//$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					//$("#jzbh").val(rkBean["jzrkBean"]["jzbh"]);
					//$("#rkfwglid").val(rkBean["jzrkBean"]["rkfwglid"])		
					//alert("保存人员信息成功。");
				}
				else
				{
					alert("保存人员信息失败。");
				}
				$("#savebtn").removeAttr("disabled");
			},
			faulire:function()
			{
				$("#savebtn").removeAttr("disabled");
			},
			error : function()
			{
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveTmtzxxBean()
{
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveTmtzxxBean.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					alert("保存体貌特征信息成功.");
				}
				else
				{
					alert("保存体貌特征信息成功.");
				}
			}
		})
	}
}

function saveLxfsxxBean()
{
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveLxfsxxBean.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					alert("保存联系方式信息成功.");
				}
				else
				{
					alert("保存联系方式信息成功.");
				}
			}
		})
	}
}

function saveGxrShxx()
{
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveGxrShxx.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (rkBean != null)
				{
					$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					alert("保存关系人信息成功.");
					$("#gxrxxtablegrid").query("F","rkxxform");
				}
				else
				{
					alert("保存人口基本信息失败");
				}
			}
		})
	}
}

function closeWindow()
{
	if (confirm("你确定要关闭窗口吗？"))
	{
		parent.close();
	}
}

function submitFormRkInfo(callback,op)
{
	var operType = $("#operType").val();
	if ($.validateform("rkxxform"))
	{
		$("#savebtn").attr("disabled","disabled");
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveRkxxBean.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (!$.isBlank(rkBean))
				{
					if(rkBean["rylb"] == '2' && op == 'jzzxx'){
						var i = $.layer({
						    shade : [1], //不显示遮罩
						    area : ['auto','auto'],
						    dialog : {
						        msg:'流动人口信息保存成功,是否登记居住证信息?',
						        btns : 2, 
						        type : 4,
						        btn : ['是','否'],
						        yes : function()
						        {
						            openLdrkJzzxxWin(rkBean["ldrkBean"]["rybh"],rkBean["ldrkBean"]["zzbh"]);
						            layer.close(i);
						        },
						        no : function()
						        {
						            layer.close(i);
						        }
						    }
						});
					}else{
						alert("数据保存成功.");
					}
					
					$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					$("#queryBeanrybh").val(rkBean["jbxxBean"]["rybh"]);
					
					$("#rkfwglid").val(rkBean["rkfwglBean"]["rkfwglid"]);
				
					$("#operType").val("update");
					$("#queryBeanoperType").val("update");
					if ($.isFunction(callback))
					{
						callback(rkBean);
					}
				}
				else
				{
					alert("数据保存失败.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			faulire: function()
			{
				$("#savebtn").removeAttr("disabled");
			},
			error:function()
			{
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
}
 


function saveCzrkJbxxAfterCallback(rkBean)
{
	$("#czrkbh").val(rkBean["czrkBean"]["czrkbh"]);
	$("#queryBeanrkid").val(rkBean["czrkBean"]["czrkbh"]);
	$("#queryBeansfzh").val(rkBean["jbxxBean"]["sfzh"]);
	$("#queryBeanfwid").val(rkBean["fwxxBean"]["fwid"]);
	
	saveAfterCallback(rkBean);
}

function saveLdrkJbxxAfterCallback(rkBean)
{
	$("#zzbh").val(rkBean["ldrkBean"]["zzbh"]);
	$("#queryBeanrkid").val(rkBean["ldrkBean"]["zzbh"]);
	$("#queryBeanrybh").val(rkBean["ldrkBean"]["rybh"]);
	$("#queryBeanoperType").val("update");
	
	$("#queryBeansfzh").val(rkBean["jbxxBean"]["sfzh"]);
	$("#queryBeanfwid").val(rkBean["fwxxBean"]["fwid"]);
	
	saveAfterCallback(rkBean);
}

function saveJzrkJbxxAfterCallback(rkBean)
{
	$("#jzbh").val(rkBean["jzrkBean"]["jzbh"]);
	$("#queryBeanrkid").val(rkBean["jzrkBean"]["jzbh"]);
	
	$("#queryBeansfzh").val(rkBean["jbxxBean"]["sfzh"]);
	$("#queryBeanfwid").val(rkBean["fwxxBean"]["fwid"]);
	
	saveAfterCallback(rkBean);
}

function saveJwrkJbxxAfterCallback(rkBean)
{
	$("#jwbh").val(rkBean["jwrkBean"]["jwbh"]);
	$("#queryBeanrkid").val(rkBean["jwrkBean"]["jwbh"]);
	$("#queryBeanrkid").val(rkBean["jwrkBean"]["jwbh"]);
	
	$("#queryBeansfzh").val(rkBean["jbxxBean"]["sfzh"]);
	$("#queryBeanfwid").val(rkBean["fwxxBean"]["fwid"]);
	
	saveAfterCallback(rkBean);
}

function saveWlhrkJbxxAfterCallback(rkBean)
{
	$("#wlhrkbh").val(rkBean["wlhrkBean"]["wlhrkbh"]);
	$("#queryBeanrkid").val(rkBean["wlhrkBean"]["wlhrkbh"]);
	saveAfterCallback(rkBean);
}

function saveAfterCallback(rkBean)
{
	var msgtype = $("#msgtype").val();
	var jsppage = $("#jsppage").val();
	ajaxLoadPage(jsppage,msgtype)
}



function saveTmtzAfterCallback(rkBean)
{
	var tmtzid = rkBean["tmtzBean"]["id"];
	$("#tmtzid").val(tmtzid);
}

function saveLxfsAfterCallback(rkBean)
{
	var lxfsid = rkBean["lxfsBean"]["id"];
	$("#lxfsid").val(lxfsid);
}

function selectZrmjWin(rootOrgCode)
{
	openZrmjSelect(rootOrgCode);
}

function openOrgSelect(rootOrgCode){
	openDwSelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
			},
			function(dwBean){
				if(dwBean && dwBean!=null){
					$("#sspcsdm").val(dwBean["id"]);
					$("#sspcsmc").val(dwBean["name"]);
				}
			});
}


/**
 * 责任民警
 * @param {Object} rootOrgCode
 */
function openZrmjSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#zrmjjh").val(userBean["username"]);
				 $("#zrmjxm").val(userBean["realname"]);
				 $("#zrdwdm").val(userBean["orgcode"]);
				 $("#zrdwmc").val(userBean["orgname"]);
				 $("#sszrmjlxdh").val(userBean["telephone"]);
			}
		});
}


function openRkDwSelect(rootOrgCode, callback)
{
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       callback(orgBean);
    });
}

function openRkPcsDwSelect(callback)
{
	var rootOrgCode = $("#ssgajgjgdm").val();
	if (!$.isBlank(rootOrgCode))
	{
		openRkDwSelect(rootOrgCode,callback);
	}
	else
	{
		alert("请先选择所属公安机构.");
	}
}

function callbackSsgajgjg(orgBean)
{
	if (orgBean != null)
	{
		$("#ssgajgjgdm").val(orgBean["id"]);
		$("#ssgajgjgmc").val(orgBean["name"]);
	}
}

function callbackSspcs(orgBean)
{
	if (orgBean != null)
	{
		$("#sspcsdm").val(orgBean["id"]);
		$("#sspcsmc").val(orgBean["name"]);
	}
}

function openSelectFwWin(callback,selectType,rylb)
{
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toSelectFwWin.action",
		width:900,
		height:650,
		data : {
			"queryBean.rylb":rylb,
			"queryBean.selectType" : selectType, 
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			if ($.isFunction(callback))
			{
				callback(resultObj);
			}
		}
	});
}

function updateSelectFwCallback(resultObj)
{
	if (!$.isBlank(resultObj))
	{
		var fwxxBean = resultObj["fwxxBean"];
		$("#fwid").val(fwxxBean["fwid"]);
		$("#dzid").val(fwxxBean["dzid"]);
		$("#dzmc").val(fwxxBean["dzmc"]);
		
		$("#sssq").val(fwxxBean["sssq"]);
		$("#ssxzqh").val(fwxxBean["ssxzqh"]);
		
	}
	
}

function selectFwCallback(resultObj)
{
	if ($.isBlank(resultObj))
	{
		$.closeWindow();
	}
	else
	{
		loadRkInfoMainPage(resultObj["sfzh"],resultObj["rylb"],resultObj["fwxxBean"]["fwid"],function(){
			initAjaxLoadPage();
		});
	}
}

function zzrkzzlsopenFwInfo(operType, fwid)
{
	$.openWindow({
		url : contextPath + "/lsgl/fw/toFwInfoPage.action",
		data : {operType : operType, "queryBean.fwid" : fwid,t : new Date().getTime()},
		height : 760,
		width : 1000,
		scroll : false,
		callback : function()
		{
			
		}
	})
}

function loadRkInfoMainPage(sfzh,rylb,fwid,dxlb,operType,callback)
{
	var data = {
		"queryBean.sfzh" : sfzh,
		"queryBean.fwid" : fwid,
		"queryBean.rylb" : rylb,
		"zdryDxlb"       : dxlb,
		"operType" : operType
	}
	var url = contextPath + "/lsgl/rk/toRkDetailInfoPage.action";
	$.ajax({
		url : url,
		type : "post",
		data : $.param(data),
		success : function(html)
		{
			$("#detailinfo").html(html);
			$("#queryBeansfzh").val(sfzh);
			$("#queryBeanfwid").val(fwid);
			if ($.isFunction(callback))
			{
				callback();
			}
		}
	});
}

function callbackLdrkFzxx(fwxxBean)
{
	$("#fzsfzh").val(fwxxBean["hzsfzh"]);
	$("#fzxm").val(fwxxBean["hzxm"]);
}

function callbackJzrkFwxx(fwxxBean)
{
	$("#hzsfzh").val(fwxxBean["hzsfzh"]);
	$("#hzxm").val(fwxxBean["hzxm"]);
	
}

function changeZxbs(zxbs)
{
	//成功
	if ("0" == zxbs)
	{
		$("#zxsj").val("");
		$("#zxyy").val("");
		$("#zxsj").attr("disabled","true");
		$("#zxyy").attr("disabled","true");
		if ($("#operType").val() == "add")
		{
			$("#czbs").val("1");
		}
		else
		{
			$("#czbs").val("2");
		}
	}
	//已注销
	else if ("1" == zxbs)
	{
		$("#zxsj").val(new Date().pattern("yyyy-MM-dd HH:mm:ss"));
		//注销标示
		$("#czbs").val("3");
		$("#zxsj").removeAttr("disabled");
		$("#zxyy").removeAttr("disabled");
	}
}

/**
 * 操作民警
 * @param {Object} rootOrgCode
 */
function openCzmjSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#czrxm").val(userBean["realname"]);
				 $("#czdwdm").val(userBean["orgcode"]);
				 $("#czdwmc").val(userBean["orgname"]);
				 
			}
		});
}

function loadRkxxBean(sfzh)
{
	var rylb = $("#rylb").val();
	if (sfzh != null && sfzh != "")
	{
		if (isSfzh(sfzh))
		{
			var csrqdate = getCsrqBySfzh(sfzh);
			if (!$.isBlank(csrqdate))
			{
				$("#csrq").val(csrqdate.pattern("yyyy-MM-dd"));
			}
			queryRkBean(sfzh,function(rkJbxxBean){
				if (rkJbxxBean != null)
				{
					$("#rkjbxxtable").eachObjectSetValue(rkJbxxBean);
					$("#rybh").val(rkJbxxBean["rybh"]);
					$("#rybh1").val(rkJbxxBean["rybh"]);
					$("#queryBeanrybh").val(rkJbxxBean["rybh"]);
					
					var hjdqh = rkJbxxBean.hjdqh;
					var hjdqhmc = rkJbxxBean.hjdqhmc;
					var sspcsdm =rkJbxxBean.sspcsdm;
					var loginhjdqh = $("#loginhjdqh").val();
					var loginhjdqhmc = $("#loginhjdqhmc").val();
					if(hjdqh == "" || hjdqh == null){
						if("1" == rylb ){
							$("#hjdqh").val(loginhjdqh.substr(0,6));
							getXzqhmcByXzqhdm(loginhjdqh.substr(0,6),function(mc){
								$("#hjdqhmc").val(mc);
							});
						}else{
							$("#hjdqhmc").attr("class","cps-popu-btn  cps-input");
							$("#hjdqhmc").bind("click",function(){
								openSelectXzqh('0',callbackHjdqh);
							});
						}
					}
					if(sspcsdm =="" || sspcsdm == null){
						if("1" == rylb ){
							$("#sspcsdm").val(loginhjdqh);
							$("#sspcsmc").val(loginhjdqhmc);
						}else{
							$("#sspcsmc").attr("class","cps-popu-btn  cps-input");
							$("#sspcsmc").bind("click",function(){
								openOrgSelect('430000000000');
							});
						}
					}
					var hjdxz = $("#hjdxz").val();
					if(hjdxz =="" || hjdxz == null){
						$("#hjdxz").removeAttr("readonly");
					}
				}
				else
				{
					$("#xm").removeAttr("readonly").css("background-color","");
					$("#xb").removeAttr("disabled");
					$("#mz").removeAttr("disabled");
					$("#hyzk").removeAttr("disabled");
				}
			})
		}
		else
		{
			alert("身份证号码格式不正确");
		}
	}
}

function insertRkxx(czrkBean){
	var attr = ['sfzh','xm','bmch','xb','csrq','mz','ywm','zjzl','zjhm','zzmm','whcd',
				'hyzk','byzk','zzxy','xx','sg','lxdh','sf','fwcs','zw','zc',
				'hjdqh','hjdqhmc','hjdxz','rybh'];
	for(var i=0;i<attr.length;i++){
		$("#"+attr[i]).val(czrkBean[attr[i]]);
	}
}

/**
 * 加载境外人口信息
 */
function loadJwRkxxBean(callback)
{
	var gj = $("#gj").val();
	var zjzl = $("#zjzl").val();
	var zjhm = $("#zjhm").val();
	
	if (!$.isBlank(gj) && !$.isBlank(zjzl) && !$.isBlank(zjhm))
	{
		$.ajax({
			type : "post",
			dataType : "json",
			url : contextPath + "/cps/common/loadJwrkJbxxBean.action",
			data : "gj=" + gj+"&zjzl=" + zjzl + "&zjhm=" + zjhm,
			success : function(rkjbxxBean)
			{
				$("#jwrkjbxx").eachObjectSetValue(rkjbxxBean);
				$($.isFunction(callback))
				{
					callback(rkjbxxBean);
				}
			}
		});
	}
}

function changeSetJwrkJzxxZjxx(rkjbxxBean)
{
	if (rkjbxxBean != null)
	{
		$("#rybh").val(rkjbxxBean["rybh"]);
		$("#queryBeanrybh").val(rkjbxxBean["rybh"]);
	}
	$("#rjzjzl").val($("#zjzl").val());
	$("#rjzjhm").val($("#zjhm").val());
}

function openSelectXzqh(rootOrgCode,callback)
{
	openXzqhTree({
		rootOrgCode : rootOrgCode,
        mutilSelect : false,
        isAsyn : true,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(xzqhBean){
		callback(xzqhBean);
	})
}

function openSelectQgXzqh(rootOrgCode,hiddenid,textid)
{
	openXzqhTree({
		rootOrgCode : rootOrgCode,
        mutilSelect : false,
        isAsyn : true,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(xzqhBean){
		if (xzqhBean)
		{
			$("#" + hiddenid).val(xzqhBean["id"]);
			$("#" + textid).val(xzqhBean["name"]);
		}
	})
}
function callbackHjdqh(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#hjdqh").val(xzqhBean["id"]);
		$("#hjdqhmc").val(xzqhBean["name"]);
	}
}

function callbackXzzdqh(xzqhBean)
{
	if (xzqhBean)
	{
		$("#xzzqh").val(xzqhBean["id"]);
		$("#xzzqhmc").val(xzqhBean["name"]);
	}
}


function callbackZzdqh(xzqhBean)
{
	if (xzqhBean)
	{
		$("#zzdqh").val(xzqhBean["id"]);
		$("#zzdqhms").val(xzqhBean["name"]);
	}
}

function callbackZzxq(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#zzssxq").val(xzqhBean["id"]);
		$("#zzssxqmc").val(xzqhBean["name"]);
	}
}

function callbackQtzzxq(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#qtzzssxq").val(xzqhBean["id"]);
		$("#qtzzssxqmc").val(xzqhBean["name"]);
	}
}

function callbackBdqh(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#bdqh").val(xzqhBean["id"]);
		$("#bdqhmc").val(xzqhBean["name"]);
	}
}

function callbackHdqr(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#hdqr").val(xzqhBean["id"]);
		$("#hdqrmc").val(xzqhBean["name"]);
	}
}

function clearHkxx()
{
	$("#hkxx").find(":input").val("");
	$("#dzxx").find(":input").val("");
}

function hkxxRowClick(trObj, rowdata)
{
	var operType = $("#queryBeanoperType").val();
	$("#hkxxPage").attr("style","display:block");
	$("#hkxx").eachObjectSetValue(rowdata);
	$("#dzxx").eachObjectSetValue(rowdata);
	$("#zrczdjdwxx").eachObjectSetValue(rowdata);
}

function jwrkjzRowCallback(trObj, rowdata)
{
	$("#dqjwrkjzxx").eachObjectSetValue(rowdata);
}

function wlhrkRowCallback(trObj, rowdata)
{
	$("#dqwlhxx").eachObjectSetValue(rowdata);
}

function shgxxRowClick(trObj,rowdata)
{
	$.each(rowdata,function(key,value){
		$("#" + key).val(value);
	});
}

function jzrkRowClick(trObj, rowdata)
{
	$("#jzxxPage").attr("style","display: block");
	$("#dqjzxx").eachObjectSetValue(rowdata);
	$("#dqjzxx").changeInputDisabled();
}

function addFjscTr()
{
	var trobj = $("#fjsctable").find("tr:last");
	$("#fjsctable").find("tr:last").before("<tr>" + trobj.html() + "</tr>");
}

function deleteFjscTr(btnobj,zpid)
{
	
	if (!$.isBlank(zpid))
	{
		$.ajax({
			url : contextPath + "/lsgl/rk/deleteRkzpImage.action",
			data : {"queryBean.zpid" : zpid},
			dataType : "json",
			success : function(result)
			{
				ajaxLoadPage("rkzpxx","3");
			}
		});
		
	}
	else
	{
		var size = $("#fjsctable").find("input[type=file]").length;
		if (size > 1)
		{
				$(btnobj).parent().parent().remove();
		}
		else
		{
			alert("已经为最后一个无法删除");
		}
	}
	
}

function showImage(zpid)
{
	$("#displayImage").find("img:first").attr("src", contextPath + "/lsgl/rk/showRkzpImage.action?queryBean.zpid="+zpid)
	$("#displayImage").show();
}

function hideImage()
{
	$("#displayImage").hide();
}

function changeYwsb(value)
{
	// 无
	if (value == "0")
	{
		$(".sbwzrow").hide();
		$(".sbwzrow").find(":input").val("");
	}
	// 有
	else if (value == "1")
	{
		$(".sbwzrow").show(); 
		$(".sbwzrow").find(":input").val("");
	}
}

function changeTstzbj(value)
{
	// 无
	if (value == "0")
	{
		$(".tstzrow").hide();
		$(".tstzrow").find(":input").val("");
	}
	// 有
	else if (value == "1")
	{
		$(".tstzrow").show();
		$(".tstzrow").find(":input").val("");
	}
}

/**
 * 
 * @param {Object} type
 */
function initPage(jsppage,msgtype,rylb)
{
	if (msgtype == "1")
	{
		ajaxLoadPage(jsppage,msgtype,rylb);
	}
	else
	{
		var rybh = $("#queryBeanrybh").val();
		var rkid = $("#queryBeanrkid").val();
		if (!$.isBlank(rybh))
		{
			ajaxLoadPage(jsppage,msgtype,rylb);
		}
		else
		{
			alert("请先填写并保存人员基本信息内容");
		}
	}
}

function ajaxLoadPage(jsppage,msgtype,rylb)
{
	
	var operType = $("#queryBeanoperType").val()
	$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
	$("#" + jsppage).addClass("dialog_menu_selected");
	$("#msgtype").val(msgtype);
	$("#jsppage").val(jsppage);
	if(operType=='rydaxx'){
		var url = contextPath + "/lsgl/rk/rydaxxloadRkInfoPage.action?jsppage=" + jsppage + "&msgtype=" + msgtype+"&rylb="+rylb;
	}
	else{
		var url = contextPath + "/lsgl/rk/loadRkInfoPage.action?jsppage=" + jsppage + "&msgtype=" + msgtype;
	}
	$.post(url,$("#queryBeanform").serialize(),function(htmldata){
		$("#contentpanel").html(htmldata);
		//var width = $(window).width() * 0.90;
		//$("#displayImage").width(width);
		
		if (msgtype == "1")
		{
			if ($("#queryBeanoperType").val() != "detail")
			{
				var sfzh = $("#sfzh").val();
				loadRkxxBean(sfzh);
			}
		}
		
		if (operType == "detail"||operType=="rydaxx")
		{
			$("#contentpanel").displayInputForText();
		}
		
	});
	
}

function loadShgxrkxx(sfzh)
{
	if (isIdCardNo(sfzh))
	{
		var csrqdate = getCsrqBySfzh(sfzh);
		if (!$.isBlank(csrqdate))
		{
			$("#gxrcsrq").val(csrqdate.pattern("yyyy-MM-dd"));
		}
				
		queryRkJbxxBeanBySfzh(sfzh, function(rkJbxxBean){
			if (rkJbxxBean != null)
			{
				$.each(rkJbxxBean,function(key, value){
					$("#gxr" + key).val(value);
				});
			}
			else
			{
				queryRemoteRyxxBean(sfzh,function(czrkBean){
					if (czrkBean != null)
					{
						$.each(czrkBean, function(key, value){
							$("#gxr" + key).val(value);
						});
					}
				});
			}
		});
	}
}

function ldrkZzxxCallback(trObj, rowdata)
{
	//$("#ldrkxxPage").attr("style","display:block");
	$("#dqzzxx").eachObjectSetValue(rowdata);
	$("#dqzzxx").changeInputDisabled();
}

function initAjaxLoadPage()
{
	$("#left_menu").accordion();
	//$("#leftpanel").setDomWindowHeight();
	//if ($.browser.version == "6.0")
	//{
	//	$("#contentpanel").css("width","86%");
	//}
	//else
	//{
	//	$("#contentpanel").css("width","86%");
	//}
	var jspage = $("#dialog_leftmenu").find("div:first").attr("id");
	
	var operType=$("#operType").val();
	if(operType=='rydaxx'){
		ajaxLoadPage(jspage,"2","1");
	}else{
		ajaxLoadPage(jspage,"1");
	}
}

function zzrkLszzRowCallback(tdObj,rowdata)
{	
	var html = "";
	if(rowdata["fwid"] == null || rowdata["fwid"] == ''){
		html = "地址未找到";
	}else{
		html = "<span class=\"cps_span_href\" onclick=\"zzrkzzlsopenFwInfo('detail','" + rowdata["fwid"] + "','"+rowdata["sfczw"]+"')\">地址详情</a>";
	}
	return html;
	
}

function openFwInfoDetail(fwid)
{
	alert("功能开发中.....");
}

function openSelectSxWin(id,value){
	var sfzh=$("#sfzh").val();
  	if(document.getElementById(id).checked==true){
  		//重点人员
  		if(value=='011'){
  			if(confirm("是否进入重点人员信息登记?")){
  				openZdryInfoPage('update',sfzh);
  			}
  		}
  		//村/居委会干部
  		if(value=='012'){
  			if(confirm("是否进入村/居委会干部信息登记?")){
  				openInfoWinInfo('add','',sfzh );
  			}
  		}
  		//协警/辅警
  		if(value=='013'){
  			if(confirm("是否进入协警/辅警信息登记?")){
  				openFjPageInfo('','add',sfzh);
  			}
  		}
  		//专职巡逻队员
  		if(value=='014'){
  			//1 专职 
  			if(confirm("是否进入专职巡逻队员信息登记?")){
  				openXldryInfoWinInfo('add','1','',sfzh);
  			}
  		}
  		//治保会成员
  		if(value=='015'){
  			if(confirm("是否进入治保会成员信息登记?")){
  				openAddZbhcyxxInfo(sfzh);
  			}
  		}
  		//信息员/耳目
  		if(value=='016'){
  			if(confirm("是否进入信息员/耳目信息登记?")){
  				toAddXxyPageInfo('new','',sfzh);
  			}
  		}
  		//协管员
  		if(value=='017'){
  			if(confirm("是否进入协管员信息登记?")){
  				openAddXgdyxxInfo(sfzh);
  			}
  		}
  		//志愿者
  		if(value=='018'){
  			if(confirm("是否进入志愿者信息登记?")){
  				addZyzInfo('add','',sfzh);
  			}
  		}
  	}
}
//open重点人员
function openZdryInfoPage(operType, sfzh,showMenu)
{
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryInfoPage.action",
		data : {"operType" : operType,"queryBean.sfzh" : sfzh,  t:new Date().getTime(),"showMenu":showMenu},
		width : 1000,
		height : 760,
		callback : function()
		{
		}
	});
}

//open 村/居委会干部
function openInfoWinInfo(operType,gbbh,sfzh)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/toSqgbInfoPage.action",
		data : {"sfzh":sfzh,operType : operType,gbbh : gbbh,t:new Date().getTime()},
		width : 980,
		height : 650,
		callback : function()
		{
		}
	})
}

//open 协警/辅警
function  openFjPageInfo(fjjh,operType,sfzh){
	$.openDialogWindow({
		url:contextPath+"/gzgl/gzjwsgl/toFjPageInfo.action",
		data:{"operType":operType,"fjBean.fjjh":fjjh,"sfzh":sfzh,t:new Date().getTime()},
		width:1000,
		height:500,
		callback:function(){
		}
	});
}

//open 专职巡逻队员
function openXldryInfoWinInfo(operType,xldlx,xldbh,sfzh)
{
	$.openWindow({
		name: "xldrywin",
		url : contextPath + "/afgl/xldxx/toXldryInfoPage.action?t=" + new Date().getTime() + "&operType=" + operType + "&queryBean.xldlx=" + xldlx + "&xldbh=" + xldbh,
		data:{"sfzh":sfzh},
		width : 950,
		height : 600,
		scroll : false,
		callback : function()
		{
		}
	});
}

//open 治保会成员
function openAddZbhcyxxInfo(sfzh) {
	$.openDialogWindow({
		url : contextPath + "/zbhcyxx/toAddZbhcyxx.action?zbhcyxxQuery.czbs=1&t="+ new Date().getTime(),
		data:{"sfzh":sfzh},
		width : 900,
		height : 600,
		callback:function(){
		}
	});
	
}

//信息员/耳目
function toAddXxyPageInfo(op,zaembh,sfzh){
	$.openDialogWindow({
		url : contextPath + "/gzgl/tzgl/toAddXxyPage.action",
		data : {"op":op,"sfzh":sfzh,"zaembh":zaembh,"t":new Date().getTime()},
		width : 1000,
		height :760,
		scroll:false,
		callback : function() 
		{
		}
	});
}

//open 协管员
function openAddXgdyxxInfo(sfzh) {
	$.openDialogWindow({
		url : contextPath + "/xgdyxx/toAddXgdyxx.action?xgdyxxQuery.czbs=1&t="+ new Date().getTime(),
		data:{"sfzh":sfzh},
		width : 900,
		height : 600,
		callback:function(){
		}
	});
	
}
//open 志愿者
function addZyzInfo(operType,bh,sfzh){
	$.openDialogWindow({
		url : contextPath + "/qzgl/zyzgl/toAddZyz.action",
		data : {"operType": operType,t:new Date().getTime(),"sfzh":sfzh},
		width : 980,
		height : 450,
		callback : function()
		{
		}
	});
}

//房主身份证带姓名
function callbackSetFzInfo(rkJbxxBean){
	if (rkJbxxBean != null)
	{
		$("#fzxm").val(rkJbxxBean["xm"]);
	}
}

//治安责任人身份证带姓名
function callbackSetZazrrInfo(rkJbxxBean){
	if (rkJbxxBean != null)
	{
		$("#zaglzrrxm").val(rkJbxxBean["xm"]);
	}
}

function NewDate(str) { 
	str = str.split('-'); 
	var date = new Date(); 
	date.setUTCFullYear(str[0], str[1] - 1, str[2]); 
	date.setUTCHours(0, 0, 0, 0); 
	return date; 
} 
/**
function getYxDate(value){
	var qfDate=$("#zzzqfrq").val();
	if(qfDate == null || qfDate =='' || qfDate == undefined){
		alert("请填写签发日期.");
		return;
	}
	var qf = new NewDate(qfDate);
	if("1" == value){
		qf.setMonth(qf.getMonth()+1);
	}
	else if("2" == value){
		qf.setMonth(qf.getMonth()+3);
	}
	else if("3" == value){
		qf.setMonth(qf.getMonth()+6);
	}
	else if("4" == value){
		qf.setMonth(qf.getMonth()+12);
	}
	else if("5" == value){
		qf.setMonth(qf.getMonth()+24);
	}
	else if("6" == value){
		qf.setMonth(qf.getMonth()+36);
	}
	$("#zzzyxqjzrq").val(qf.getFullYear()+"-"+eval(qf.getMonth()+1)+"-"+qf.getDate());
	
}
*/
function getYxDate(value){
	var qf = new Date();
	if("1" == value){
		qf.setMonth(qf.getMonth()+1);
	}
	else if("2" == value){
		qf.setMonth(qf.getMonth()+3);
	}
	else if("3" == value){
		qf.setMonth(qf.getMonth()+6);
	}
	else if("4" == value){
		qf.setMonth(qf.getMonth()+12);
	}
	else if("5" == value){
		qf.setMonth(qf.getMonth()+24);
	}
	else if("6" == value){
		qf.setMonth(qf.getMonth()+36);
	}
	
	$("#njzrq").val(qf.getFullYear()+"-"+eval(qf.getMonth()+1)+"-"+qf.getDate());
	
}



function openLdrkJzzxxWin(rybh,zzbh){
	$.openWindow({
		name : "jzzxxWin",
		url : contextPath + "/lsgl/jzzxx/toAddJzzxxPage.action",
		width:900,
		height:450,
		data : 
		{
			"bean.jzzrybh":rybh,
			"zzbh":zzbh,
			t: new Date().getTime()
		}
	});
}

function openLdrkJzzxxPage(){
	var zzbh =$("#zzbh").val();
	var rybh =$("#rybh").val();
	if(zzbh =='' || zzbh ==null || zzbh == undefined){
		alert("请先填写流动人口居住信息.");
		return ;
	}
	$.openWindow({
		name : "jzzxxWin",
		url : contextPath + "/lsgl/jzzxx/toAddJzzxxPage.action",
		width:900,
		height:450,
		data : 
		{
			"bean.jzzrybh":rybh,
			"zzbh":zzbh,
			t: new Date().getTime()
		}
	});
}

function zjlxChange(obj){
	if(obj.value == '111'){
		$("#gxrsfzh").attr("class"," validate[[required, maxSize[18],funcCall[checkIDC]]]  cps-input");
	}else{
		$("#gxrsfzh").attr("class"," validate[[required, maxSize[18]]] cps-input");
	}
}

function delGxr(id,callBack){
	if(window.confirm("确认删除社会关系人？")){
		$.ajax({
			url: contextPath + "/lsgl/rk/delGxr.action?rkBean.gxrBean.id=" + id,
			type : "post",
			dataType : "json",
			success:function(){
				alert("删除社会关系人成功。");
				if ($.isFunction(callBack)){
					callBack();
					$("#gxrxxtablegrid").query("F","rkxxform");
				}
			}
		});
	}
} 


//添加联系方式
function addLxfs(){
	var lxfsTable = $("#lxfsTable");
	var lastRow = lxfsTable.find("tr").last();
	var index = lastRow.attr("id").split("row")[1];
	var newRow = lastRow.clone();
	newRow.attr("id","row" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfslx" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].lxfslx");
	newRow.find("[id='lxfslx" + index + "']").attr("value","");
	newRow.find("[id='lxfslx" + index + "']").attr("id","lxfslx" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfs" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].lxfs");
	newRow.find("[id='lxfs" + index + "']").attr("value","");
	newRow.find("[id='lxfs" + index + "']").attr("id","lxfs" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfsid" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].id");
	newRow.find("[id='lxfsid" + index + "']").attr("value","");
	newRow.find("[id='lxfsid" + index + "']").attr("id","lxfsid" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfsbz" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].lxfsbz");
	newRow.find("[id='lxfsbz" + index + "']").attr("value","");
	newRow.find("[id='lxfsbz" + index + "']").attr("id","lxfsbz" + eval(parseInt(index) + 1));
	
	lxfsTable.append(newRow);
}

//删除联系方式
function delLxfs(obj){
	var lxfsTable = $("#lxfsTable");
	var rows = lxfsTable.find("tr");
	if(rows.length == 1 ){
		alert("最后一条联系方式不能删除!")
	}else{
		var lxfsId = $(obj.parentNode.parentNode).find("[id^='lxfsid']").val();
		if(lxfsId == ""){
			$(obj.parentNode.parentNode).remove();
		}else{
			$.ajax({
				url:contextPath + "/lsgl/rk/delLxfs.action?lxfsId=" + lxfsId,
				type:"post",
				success:function(){
					$(obj.parentNode.parentNode).remove();
					alert("删除成功.");
				}
			});
		}
	}
}

function openAddRkzpxx()
{
	var rybh = $("#rybh").val();
	var sfzh = $("#queryBeansfzh").val();
	$.openWindow({
		name : "zpwhwin",
		url : contextPath + "/rk/rxgl/toRyzpglPageInfo.action",
		data : {
			rybh : rybh,
			sfzh : sfzh
		},
		width:900,
		height:700
	});
}

//改变验证方式
function chageStyle(obj){
	var value = $(obj).val();
	var lxfs = $("#lxfs" + $(obj).attr("id").split("lxfslx")[1]);
	if(value == "001"){ //手机号码
		lxfs.removeClass();
		lxfs.addClass("validate[required, custom[phone], maxSize[11], minSize[11]] cps-input");
	}else if(value == "002" || value == "003"){  //家庭电话 //公司电话
		lxfs.removeClass();
		lxfs.addClass("validate[required, custom[phone], maxSize[20], minSize[7]] cps-input");
	}else if(value == "004"){  //传真号码
		lxfs.removeClass();
		lxfs.addClass("validate[required, maxSize[20]] cps-input");
	}else if(value == "005" || value == "007"){  //QQ号码
		lxfs.removeClass();
		lxfs.addClass("validate[required, maxSize[40]] cps-input");
	}else if(value == "006"){ //电子邮箱
		lxfs.removeClass();
		lxfs.addClass("validate[required, maxSize[40], custom[email]] cps-input");
	}
}


function changeJhsyDiv(value){
	var csrq = $("#csrq").val();
	var xb = $("#xb").val();
	var sfjhsy = $("#sfjhsy").val();
	var age =daysBetween(csrq);
	if((xb == '2') && (age >= 16 && age <=49) && sfjhsy == '1'){
		$("#jhsydiv").show();
		$("#jszhmLabel").html("<font color=\"red\">*</font>计生证号码：");
		$("#jszhm").addClass("validate[required]");
	}else{
		$("#jhsydiv").hide();
		$("#jszhmLabel").html("计生证号码：");
		$("#jszhm").removeClass("validate[required]");
	}
}

function callbackRkJzxxInfo(trObj, rowdata)
{
	var rkid = rowdata.rkid;
	var rylb = rowdata.rylb;
	
	$.ajax({
		url:contextPath+"/lsgl/rk/queryLsJzxxPageByRkidAndRylb.action",
		type:"post",
		dataType:"json",
		data:{
			"bhs":rkid,
			"rylb":rylb
		},
		success:function(bean){
			if(bean != null){
				if("1" == rylb){
					$("#ldrkxxPage").hide();
					$("#wlhrkxxPage").hide();
					$("#jwrkxxPage").hide();
					$("#jzrkxxPage").hide();
					$("#czrkxxPage").show();
					$("#czrkxxPage").eachObjectSetValue(bean);
					$("#czrkxxPage").changeInputDisabled();
				}
				else if("2" == rylb){
					$("#czrkxxPage").hide();
					$("#wlhrkxxPage").hide();
					$("#jwrkxxPage").hide();
					$("#jzrkxxPage").hide();
					$("#ldrkxxPage").show();
					$("#ldrkxxPage").eachObjectSetValue(bean);
					$("#ldrkxxPage").changeInputDisabled();
				}
				else if("3" == rylb){
					$("#czrkxxPage").hide();
					$("#ldrkxxPage").hide();
					$("#jwrkxxPage").hide();
					$("#jzrkxxPage").hide();
					$("#wlhrkxxPage").show();
					$("#wlhrkxxPage").eachObjectSetValue(bean);
					$("#wlhrkxxPage").changeInputDisabled();
				}
				else if("4" == rylb){
					$("#czrkxxPage").hide();
					$("#ldrkxxPage").hide();
					$("#wlhrkxxPage").hide();
					$("#jzrkxxPage").hide();
					$("#jwrkxxPage").show();
					$("#jwrkxxPage").eachObjectSetValue(bean);
					$("#jwrkxxPage").changeInputDisabled();
				}
				else if("5" == rylb){
					$("#czrkxxPage").hide();
					$("#ldrkxxPage").hide();
					$("#wlhrkxxPage").hide();
					$("#jwrkxxPage").hide();
					$("#jzrkxxPage").show();
					$("#jzrkxxPage").eachObjectSetValue(bean);
					$("#jzrkxxPage").changeInputDisabled();
				}
			}else{
				alert("数据错误,请联系管理员.");
			}
		}	
	});
//	$("#dqzzxx").eachObjectSetValue(rowdata);
//	$("#dqzzxx").changeInputDisabled();
}


function validatehyzk(value){
	var csrq =  $("#csrq").val();
	var age = daysBetween(csrq);
	if("10" != value && age <18){
		alert("18岁以下只能选未婚");
		$("#hyzk").val("");
	}
}

function validatewhcd(value){
	var csrq = $("#csrq").val();
	var age = daysBetween(csrq);
	if("41" > value && age<15){
		alert("15周岁以下不能选择大学学历以上.");
		$("#whcd").val("");
	}
}

function daysBetween(DateTwo){   
 	var now = new Date();
  	var OneYear = now.getFullYear();
  	var OneMonth = now.getMonth()+1;
  	var OneDay = now.getDate();
  
    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
  
    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000/365);   
  	var age = Math.abs(cha)+1+"";
  	
    return age.split(".")[0];
}
$(function(){
	var operType = $("#operType").val();
	var rylb = $("#queryBeanrylb").val();
	if (operType == "add" || operType == "update" || operType=="detail"||operType=="rydaxx")
	{
		initAjaxLoadPage();
	}
	else if (rylb == "4")
	{
		initAjaxLoadPage();
	}
});