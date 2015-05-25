function submitFormZdryInfo(callback)
{
	var dxlb = $("#dxlb").val();
	var sfzh=$("#sfzh").val();
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/saveZdryxxBean.action",
			data:{"sfzh":sfzh,"t":new Date().getTime()},
			type : "post",
			dataType : "json",
			success :function(zdryGzdxBean)
			{
				if (!$.isBlank(zdryGzdxBean))
				{	
					alert("数据保存成功");	
					if($.isFunction(callback)){
						callback(zdryGzdxBean["sfzh"]);
					}
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		});
	}
}

function savezdryaftercallback(sfzh){
	loadRkInfoMainPage(sfzh,function(){
			initAjaxLoadPage();	
		});
}
function submitFormZdryWffzjlInfo(callback)
{
	if ($.validateform("wffzjlform"))
	{
		$("#wffzjlform").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/saveZdryWffzjlBean.action",
			type : "post",
			dataType : "json",
			success :function(zdryWffzjlBean)
			{
				if (!$.isBlank(zdryWffzjlBean))
				{
					alert("数据保存成功");		
					$("#rybh").val(zdryWffzjlBean["rybh"]);
					clearform();
					$("#lswffzjlTable").query("F","wffzjlform");
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		});
	}
}
 
 
 function submitFormRkInfo(callback)
{
	if($("#gxrxm").length>0 && $("#wwx").length>0 && $("#wwm").length>0){
		if($("#gxrxm").val() == "" && $("#wwx").val() == "" && $("#wwm").val()== ""){
			alert("中文姓名与外文姓名中必须填写一个。");
			return;
		}
	}
	
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveRkxxBean.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (!$.isBlank(rkBean))
				{
					alert("数据保存成功");
					
					$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					$("#queryBeanrybh").val(rkBean["jbxxBean"]["rybh"]);
					
					$("#rkfwglid").val(rkBean["rkfwglBean"]["rkfwglid"]);
				
					$("#operType").val("update");
					
					if ($.isFunction(callback))
					{
						callback(rkBean);
					}
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		});
	}
}
 


function saveCzrkJbxxAfterCallback(rkBean)
{
	$("#czrkbh").val(rkBean["czrkBean"]["czrkbh"]);
	$("#queryBeanrkid").val(rkBean["czrkBean"]["czrkbh"]);
	saveAfterCallback(rkBean);
}

function saveLdrkJbxxAfterCallback(rkBean)
{
	$("#zzbh").val(rkBean["ldrkBean"]["zzbh"]);
	$("#queryBeanrkid").val(rkBean["ldrkBean"]["zzbh"]);
	saveAfterCallback(rkBean);
}

function saveJzrkJbxxAfterCallback(rkBean)
{
	$("#jzbh").val(rkBean["jzrkBean"]["jzbh"]);
	$("#queryBeanrkid").val(rkBean["jzrkBean"]["jzbh"]);
	saveAfterCallback(rkBean);
}

function saveJwrkJbxxAfterCallback(rkBean)
{
	$("#jwbh").val(rkBean["jwrkBean"]["jwbh"]);
	$("#queryBeanrkid").val(rkBean["jwrkBean"]["jwbh"]);
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
	ajaxLoadPage(jsppage,msgtype);
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

function openZrmjSelectZdry(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#sszrmjjh").val(userBean["username"]);
				 $("#sszrmjxm").val(userBean["realname"]);
				 $("#sszrdwdm").val(userBean["orgcode"]);
				 $("#sszrdwmc").val(userBean["orgname"]);
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

function callbackLadw(orgBean)
{
	if (orgBean != null)
	{
		$("#ladwjgdm").val(orgBean["id"]);
		$("#ladw").val(orgBean["name"]);
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
		$("#fwmc").val(fwxxBean["fwmc"]);
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

function openFwInfo(operType, fwid)
{
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toFwInfoPage.action",
		data : {operType : operType, fwid : fwid,t : new Date().getTime()},
		height : 760,
		width : 1000,
		scroll : false,
		callback : function()
		{
			
		}
	})
}

function loadRkInfoMainPage(sfzh,callback)
{
	var showtype=$("#showtype").val();
	var data = {
		"queryBean.sfzh" : sfzh,
		"showtype":showtype
	}
	var url = contextPath + "/lsgl/zdry/toZdryDetailInfoPage.action"
	$.post(url,data,function(html){
		$("#detailinfo").html(html);
		$("#queryBeansfzh").val(sfzh);
		if ($.isFunction(callback))
		{
			callback();
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

function openDjmjSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#djrxm").val(userBean["realname"]);
				 $("#djdwdm").val(userBean["orgcode"]);
				 $("#djdwmc").val(userBean["orgname"]);
				 
			}
		});
}

function loadRkxxBean(sfzh)
{
	if (sfzh != null && sfzh != "")
	{
		if (isIdCardNo(sfzh))
		{
			var csrqdate = getCsrqBySfzh(sfzh);
			if (!$.isBlank(csrqdate))
			{
				$("#csrq").val(csrqdate.pattern("yyyy-MM-dd"));
				$("#zpxx").find("img").last().attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + sfzh);
			}
					
			queryRkJbxxBeanBySfzh(sfzh, function(rkJbxxBean){
				if (rkJbxxBean != null)
				{
					$.each(rkJbxxBean,function(key, value){
						if (key != "rylb")
						{
							$("#" + key).val(value);
							$("#" + key + "_hidden").val(value);
						}
					});
					$("#rybh").val(rkJbxxBean["rybh"]);
					$("#queryBeanrybh").val(rkJbxxBean["rybh"]);
				}
				else
				{
					queryRemoteRyxxBean(sfzh,function(czrkBean){
						if (czrkBean != null)
						{
							if (key != "rylb")
							{
//								$.each(czrkBean, function(key, value){
//									$("#" + key).val(value);
//									$("#" + key + "_hidden").val(value);
//								});
								insertRkxx(czrkBean);
							}
						}
						else
						{
							$("#xm").removeAttr("readonly").css("background-color","");
							$("#xb").removeAttr("disabled");
							$("#mz").removeAttr("disabled");
							$("#hyzk").removeAttr("disabled");
						}
					});
				}
			});
		}
		else
		{
			alert("身份证号码格式不正确");
			$("#sfzh").val("");
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
function callbackHjdqhs(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#qwbsqh").val(xzqhBean["id"]);
		$("#qwbsqhmc").val(xzqhBean["name"]);
	}
}
function callbackHsdzqh(xzqhBean){
	if (xzqhBean != null)
	{
		$("#hsddqh").val(xzqhBean["id"]);
		$("#hsddqhmc").val(xzqhBean["name"]);
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
				ajaxLoadPage("zdryzpxx","3");
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
function initPage(jsppage,msgtype)
{
	if (msgtype == "1")	{
		ajaxLoadPage(jsppage,msgtype);	}
	else
	{
		var flagChange = $("#flagChange").val();
		var xdrybh = $("#xdrybh").val();
		var jsbrbh = $("#jsbrbh").val();
		var swrybh = $("#swrybh").val();
		
		if (!$.isBlank(flagChange))
		{
			if(jsppage=="xdxhnjxx"){
				if(!$.isBlank(xdrybh)){
					ajaxLoadPage(jsppage,msgtype);
				}else{
					alert("请先填写并保存吸毒人员基本信息内容");
				}
			}else if(jsppage=="zdryjsbrzsxx"){
				if(!$.isBlank(jsbrbh)){
					ajaxLoadPage(jsppage,msgtype);
				}else{
					alert("请先填写并保存精神病人基本信息内容");
				}
			}else if(jsppage=="zdryswrysfjl"){
				if(!$.isBlank(swrybh)){
					ajaxLoadPage(jsppage,msgtype);
				}else{
					alert("请先填写并保存涉稳人员基本信息内容");
				}
			}else{
				ajaxLoadPage(jsppage,msgtype);
			}
		}
		else
		{
			alert("请先填写并保存人员基本信息内容");
		}
	}
}

function ajaxLoadPage(jsppage,msgtype)
{
	var operType = $("#queryBeanoperType").val()
	$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
	$("#" + jsppage).addClass("dialog_menu_selected");
	$("#msgtype").val(msgtype);
	$("#jsppage").val(jsppage);
	var url = contextPath + "/lsgl/zdry/loadRkInfoPage.action?jsppage=" + jsppage + "&msgtype=" + msgtype;
	$.post(url,$("#queryBeanform").serialize(),function(htmldata){
		$("#contentpanel").html(htmldata);
		var width = $(window).width() * 0.90;
		$("#displayImage").width(width);
		
		if (msgtype == "1")
		{
			var sfzh = $("#sfzh").val();
			loadRkxxBean(sfzh);
		}
		
		if (operType == "detail")
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
	$("#dqzzxx").eachObjectSetValue(rowdata);
	$("#dqzzxx").changeInputDisabled();
}

function initAjaxLoadPage()
{
	$("#left_menu").accordion();
	$("#leftpanel").setDomWindowHeight();
	if ($.browser.version == "6.0")
	{
		$("#contentpanel").css("width","84%");
	}
	else
	{
		$("#contentpanel").css("width","86%");
	}
	var jspage = $("#dialog_leftmenu").find("div:first").attr("id");
	ajaxLoadPage(jspage,"1");
}

function openFwDwSelect(rootOrgCode, callback)
{
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       callback(orgBean);
    });
}


function rowcallbackCzWffzjldj(trObj,rowData)
{
	$("#wffzjlxxdj").eachObjectSetValue(rowData);
	$("#wffzjlsfzh").val(rowData.sfzh);
	$("#rybh1").val(rowData.rybh);
}

function clearform(){
	$("#wffzjlform").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}

$(function(){
	var operType = $("#operType").val();
	var rylb = $("#queryBeanrylb").val();
	if (operType == "update" || operType=="detail")
	{
		initAjaxLoadPage();
	}
	else if (rylb == "6")
	{
		initAjaxLoadPage();
	}
	//自动定位到在控登记
	var showMen = $("#showMen").val();
	if(showMen !=""){
		$("#zkxxdjInfo").trigger("click");
	}
})

function submitFormXsbxInfo(callback){
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/saveXsbxBean.action",
			type : "post",
			dataType : "json",
			success :function(Zdryxsbxbean)
			{
				if (!$.isBlank(Zdryxsbxbean))
				{
					alert("数据保存成功");
					initPage('xsbx','6');
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		});
	}
}

function openCzmjSelect(rootOrgCode){
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

function openHsmjSelect(rootOrgCode){
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#hsmjxm").val(userBean["realname"]);
				 $("#hsmjsfzh").val(userBean["sfzh"]);
				 $("#hszedwdm").val(userBean["orgcode"]);
				 $("#hszedwmc").val(userBean["orgname"]);
				 
			}
		});
}

/**
*保存重点人员工作对象信息
**/
function submitFormZdryGzdxInfo(callback){
    var dxlb = $("#dxlb").val();
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/saveZdryGzdx.action?dxlb="+dxlb,
			data : {t:new Date().getTime()},
			type : "post",
			dataType : "json",
			success :function(gzdxBean)
			{
				if (!$.isBlank(gzdxBean))
				{
					alert("数据保存成功");
					if($.isFunction(callback)){
						callback(gzdxBean["sfzh"]);
					}	
				}
				else
				{
					alert("数据保存失败");
				}
			}
		});
	}
}
function rowcallbackCzZdryGzdxActivity(trObj,rowData)
{
	$("#zdrygzdxActivityDiv").eachObjectSetValue(rowData);
}

function saveGzdxAfterCallback(sfzh){
	var msgtype = $("#msgtype").val();
	var jsppage = $("#jsppage").val();
	loadRkInfoMainPage(sfzh,function(){
		ajaxLoadPage(jsppage,msgtype);
		});
}

function clearZdryGzdxActivityForm(){
	$("#zdrygzdxActivityForm").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}
function submitFormZdryGzdxDetailInfo(){
    var dxlb = $("#dxlb").val();
	if ($.validateform("zdrygzdxActivityForm"))
	{
		$("#zdrygzdxActivityForm").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/savaZdryGzdxActivity.action?dxlb="+dxlb,
			data : {t:new Date().getTime()},
			type : "post",
			dataType : "json",
			success :function(result)
			{
				if (result)
				{
					alert("数据保存成功");
					clearZdryGzdxActivityForm();
					//刷新   把form表单  div  list 改成一样的
					$("#zdrygzdxActivityList").query("F","zdrygzdxActivityForm")
				}
				else
				{
					alert("数据保存失败");
				}
			}
		});
	}
}
/**
*加载批准机构
**/
function callbackPzjg(orgBean){
	if (orgBean != null)
	{
		$("#pzjg").val(orgBean["name"]);
	}
}

/**
*加载判决机构
**/
function callbackPjjg(orgBean){
	if (orgBean != null)
	{
		$("#pjjg").val(orgBean["name"]);
	}
}
/**
*加载委托机构
**/
function callbackWtzxdw(orgBean){
	if (orgBean != null)
	{
		$("#wtzxdw").val(orgBean["name"]);
	}
}
/**
*加载委托机构
**/
function callbackYzxjg(orgBean){
	if (orgBean != null)
	{
		$("#yzxjg").val(orgBean["name"]);
	}
}
/**
*加载管辖派出所
**/
function callbackGxpcsdm(orgBean){
	if (orgBean != null)
	{
		$("#gxpcsmc").val(orgBean["name"]);
		$("#gxpcsdm").val(orgBean["id"]);
	}
}

function callbackSszrdwdm(orgBean){
	if (orgBean != null)
	{
		$("#zrdwmc").val(orgBean["name"]);
		$("#zrdwdm").val(orgBean["id"]);
	}
}


/**
**加载机构人员信息
**/
function openDwRyxxSelect(rootOrgCode,callback){
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},function(userBean){
       callback(userBean);
    });
}

/**
**加载责任民警相关信息
**/
function callbackZrmj(userBean){
	if(userBean!=null){
		 $("#zrmjjh").val(userBean["username"]);
		 $("#zrmjxm").val(userBean["realname"]);
		 $("#zrmjlxdh").val(userBean["telephone"]);
	}
}

/** 加载维护人相关信息
*/
function callbackWhr(userBean){
	if(userBean!=null){
		 $("#whr").val(userBean["realname"]);
		 $("#whdw").val(userBean["orgname"]);
	}
}

/**
**加载注销单位信息
**/
function callbackZxdw(userBean){
	if(userBean!=null){
		 $("#zxdwmc").val(userBean["orgname"]);
		 $("#zxdwdm").val(userBean["orgcode"]);
		 $("#zxrxm").val(userBean["realname"]);
		 
	}
}

/**
**加载立案单位信息
*/
function callbackLadw(orgBean){
	if(orgBean!=null){
		 $("#ladw").val(orgBean["name"]);
	}
}

/**
**立案民警信息
*/
function callbackLamjxm(userBean){
	if(userBean!=null){
		 $("#lamjsfzh").val(userBean["sfzh"]);
		 $("#lamjxm").val(userBean["realname"]);
		 $("#lamjlxfs").val(userBean["telephone"]);
		 $("#ladw").val(userBean["orgname"]);
	}
}

/**
*加载所属警务室
**/
function openJwsDwSelect(callback){
	var rootOrgCode = $("#gxpcsdm").val();
	if(rootOrgCode==null){
		alert("请先选择所属派出所信息");
	}
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       callback(orgBean);
    });
}

function callbackGxjwqdm(orgBean)
{
	if(orgBean!=null){
		 $("#gxjwqmc").val(orgBean["name"]);
		 $("#gxjwqdm").val(orgBean["id"]);
		 
	}
}

/**
*获取查获地区
**/
function callbackChdq(xzqhBean){
	if (xzqhBean != null)
	{
		$("#chdq").val(xzqhBean["id"]);
		$("#chdqmc").val(xzqhBean["name"]);
	}
}

/**
*获取尿检地区
**/
function callbackNjdq(xzqhBean){
	if (xzqhBean != null)
	{
		$("#njdq").val(xzqhBean["id"]);
		$("#njdqmc").val(xzqhBean["name"]);
	}
}

/**
*获取事发地区县
**/
function callbackSfdqx(xzqhBean){
	if (xzqhBean != null)
	{
		$("#sfdqx").val(xzqhBean["id"]);
		$("#sfdqxmc").val(xzqhBean["name"]);
	}
}
//获取事发责任区
function callbackSfzrq(xzqhBean){
	if (xzqhBean != null)
	{
		$("#sfzrq").val(xzqhBean["id"]);
		$("#sfzrqmc").val(xzqhBean["name"]);
	}
}


/**
*获取查获单位信息
**/
function callbackChdwdm(orgBean){
	if(orgBean!=null){
		 $("#chdwmc").val(orgBean["name"]);
		 $("#chdwdm").val(orgBean["id"]);
		 
	}
}

/**
*flag 控制单选 或多选
*/
function openDictionSelectWinxx(zdlb,dm,mc,flag){
	openDictionarySelectRowWin(flag,zdlb,function(orgInfo){
		if(orgInfo){
			$("#"+dm).val(orgInfo.orgDm);
			$("#"+mc).val(orgInfo.orgName);
		}
	});

}

function openDictionarySelectRowWin(flag,zdlb,callback){
	var zdlb=$("#"+zdlb).attr("title");
	var url= contextPath+"/dic/selectdic/toSelectDicPage.action?t="+ new Date().getTime()+"&zdlb="+zdlb+"&selectFlag="+flag;
	var orgInfo = openModalDialog(url,500,550,"cc","no");
	if(orgInfo){
		if($.isFunction(callback)){
			callback(orgInfo);
		}
	}
}

function openModalDialog(url,width,height,vArguments,isbars)
{
	if(!isbars) 
	{
		isbars = "no";
	}
	var sFeatures = "dialogWidth="+width+"px;dialogHeight="+height+"px;help=yes;resizable=no;status=no;center=yes;scroll="+isbars+";edge=sunken;";
	return window.showModalDialog(url,vArguments,sFeatures);
}

function callbackZxdwmc(orgBean){
	if(orgBean!=null){
		 $("#zxdwmc").val(orgBean["name"]);
		 $("#zxdwdm").val(orgBean["id"]);
		 
	}
}
function detailZdry(sfzh){
	loadRkInfoMainPage(sfzh,function(){
		initAjaxLoadPage();										
	});
}

function rowCallbackCz(tdObj, rowdata)
{
	var html = "";
	//html += "<a href=\"javascript:openSyrkInfoPage('update','" + rowdata["rybh"] + "','" + rowdata["rylb"] +"')\">核实登记</a>&nbsp;";
	html += "<a href=\"javascript:openZdryInfoPage('detail','" + rowdata["sfzh"] + "')\">详情</a>";
	return html;
}
function loadRkInfoMainPageDetail(sfzh,callback)
{	
	var showtype=$("#showtype").val();
	var data = {
		"queryBean.sfzh" : sfzh,
		"showtype":showtype,
		"operType":operType
	}
	var url = contextPath + "/lsgl/zdry/toZdryDetailInfoPage.action"
	$.post(url,data,function(html){
		$("#detailinfo").html(html);
		$("#queryBeansfzh").val(sfzh);
		if ($.isFunction(callback))
		{
			callback();
		}
	});
}
function openZdryInfoPage(operType, sfzh,rybh,showMenu,zdrybh)
{
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryInfoPage.action",
		data : {"operType" : operType,
				"queryBean.sfzh" : sfzh,
				"queryBean.rybh" : rybh,
				t:new Date().getTime(),
				"queryBean.zdrybh":zdrybh,
				"showMenu":showMenu
		},
		width : 1000,
		height : 760,
		callback : function()
		{
			$("#zdrylist").query("F","queryForm");
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
				}
			}
		});
	}
} 


