/**
 * 生成标准地址
 */
function callbackDzmc()
{
	var xjxzqh = $("#xzqh").find("option:selected").text();
	var jdxzdm = $("#jdxzdm").find("option:selected").text();
	var sqmc= $("#sqdm").find("option:selected").text();
	var dyhmc = $("#dyh").find("option:selected").text();
	var jlxmc = $("#jlxmc").val();
	var mph = $("#mph").val();
	var xqmc = $("#xqmc").val();
	var ldxz = $("#ldxz").val();
	var dyh = $("#dyh").val();
	var lch = $("#lch").val();
	var fjh = $("#fjh").val();
	var fsdz = $("#fsdz").val();
	var dzmc = "";
	
	if (xjxzqh != null && $.trim(xjxzqh) != "")
	{
		dzmc += $.trim(xjxzqh);
	}
	if (jdxzdm !=null && $.trim(jdxzdm) != "")
	{
		dzmc += $.trim(jdxzdm);
	}
	if (sqmc != null && $.trim(sqmc) != "")
	{
		dzmc += $.trim(sqmc);
	}
	if (jlxmc != null && $.trim(jlxmc) != "")
	{
		dzmc += jlxmc;
	}
	if (mph != null && $.trim(mph) != "")
	{
		if (mph.indexOf("号") >0)
		{
			dzmc += mph
		}
		else
		{
			dzmc += mph + "号";
		}
		
	}
	if (xqmc != null && $.trim(xqmc) != "")
	{
		dzmc += xqmc;
	}
	if (ldxz != null && $.trim(ldxz) != "")
	{
		dzmc += ldxz;
	}
	if (dyhmc != null && $.trim(dyhmc) != "" )
	{
		dzmc += $.trim(dyhmc);
	}
	if (fjh != null && $.trim(fjh) != "")
	{
		var shhz = $("#shhz").find("option:selected").text();
		dzmc += fjh + shhz;
	}
	if (fsdz != null && $.trim(fsdz!=""))
	{
		dzmc += fsdz;
	}
	
	$("#dzmc").val(dzmc);
}

//检查楼层号码是否合法，楼层号码不能大于实体的地面层数
function checklchm()
{
	var stxxdmcs = parseInt($("#stxxdmcs").val());
	var lch = parseInt($("#lch").val());
	if (lch > stxxdmcs)
	{
		alert("该实体楼栋下最大地面层数为" + stxxdmcs+",当前输入楼层号大于楼栋实际层数。");
		$("#lch").val("");
	}
	else
	{
		callbackDzmc();
	}
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
				 $("#sszrmjjh").val(userBean["username"]);
				 $("#sszrmjxm").val(userBean["realname"]);
				 $("#sszrdwdm").val(userBean["orgcode"]);
				 $("#sszrdwmc").val(userBean["orgname"]);
				 $("#sszrmjlxdh").val(userBean["telephone"]);
			}
		});
}

function openZazrrSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#dlr").val(userBean["realname"]);
				 $("#dlrsfzh").val(userBean["sfzh"]);
				 $("#dlrlxfs").val(userBean["telephone"]);
			}
		});
}

function openXcmjSelect(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : true
		},
		function(userBeans)
		{
			if(userBeans){
				var xcmjxms = [];
				$.each(userBeans,function(i,userBean){
					xcmjxms.push(userBean["realname"]);
					if (i == 0)
					{
						 $("#xcmjdwdm").val(userBean["orgcode"]);
						 $("#xcmjdwmc").val(userBean["orgname"]);
					}
				});
				 $("#xcmjxm").val(xcmjxms.join(","));
			 }
		});
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

function callPgisDw()
{
	alert("此功能暂未开发");
}

/**
 * 保存房屋信息
 */
function saveFwBean(callback,savetype)
{	
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("fwxxform"))
	{
		$("#fwxxform").ajaxSubmit({
			url : contextPath + "/lsgl/fw/saveFwBean.action",
			type : "post",
			dataType : "json",
			success : function(fwBean)
			{
				if (fwBean != null && fwBean == false)
				{
					alert("同一实体下已经存在该房屋信息，请重新输入信息.");
				}
				else if (fwBean != null && !$.isBlank(fwBean["fwid"]))
				{
					//保存基本信息
					if (savetype == 'savejbxx')
					{
						//不是出租屋
						if ($("#sfczw").val() != "1")
						{
							if (confirm("房屋信息保存成功,确定将继续添加新的房屋，取消可进行其他操作."))
							{
								 $("#fwid").val("");
								 $("#queryBeanfwid").val(fwBean["fwid"]);
								 if ($.isFunction(callback))
								 {
									callback(fwBean);
								 }
							}
							else
							{
								 $("#fwid").val(fwBean["fwid"]);
								$("#queryBeanfwid").val(fwBean["fwid"]);
								if ($.isFunction(callback))
								{
									callback(fwBean);
								}
							}
							/*
							var i = $.layer({
							    area : ['auto','auto'],
							    dialog : {
							        msg:'当前房屋信息保存成功,是否添加新的房屋?',
							        btns : 2, 
							        type : 4,
							        btn : ['是','否'],
							        yes : function()
							        {
							            $("#fwid").val("");
										$("#queryBeanfwid").val(fwBean["fwid"]);
										layer.close(i);
										if ($.isFunction(callback))
										{
											callback(fwBean);
										}
							        },
							        no : function()
							        {
							            $("#fwid").val(fwBean["fwid"]);
										$("#queryBeanfwid").val(fwBean["fwid"]);
										layer.close(i);
										if ($.isFunction(callback))
										{
											callback(fwBean);
										}
							        }
							    }
							});
							*/
						}
						else
						{
							alert("出租房屋信息保存成功.");
							//$.closeWindow();
						}
					}
					//保存其他信息
					else
					{
						alert("信息保存成功.")
						$("#fwid").val(fwBean["fwid"]);
						$("#queryBeanfwid").val(fwBean["fwid"]);
						if ($.isFunction(callback))
						{
							callback(fwBean);
						}
					}
				}
				else
				{
					alert("房屋信息保存失败");
				}
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveAfterCallback(rkBean)
{
	var msgtype = $("#msgtype").val();
	var jsppage = $("#jsppage").val();
	ajaxLoadPage(jsppage,msgtype)
}


function deleteFwzpxx(zpid,zpxxdivid)
{
	$.ajax({
		url : contextPath + "/lsgl/fw/deleteFwzpxx.action",
		dataType : "json",
		data : "zpid=" + zpid,
		success : function(result)
		{
			if (result == true)
			{
				alert(zpxxdivid)
				$("#" + zpxxdivid).remove();
				alert("照片信息成功删除");
				
			}
			else
			{
				alert("照片信息删除失败");
			}
		}
	});
}

function openFileUploadWin()
{
	$.layer( {
		v_title : "附件上传",
		v_box : "1",
		v_dom : "#fileupload",
		v_area : ["500px", "400px"],
		v_btns : 1,
		close : function()
		{
			layer_close();
		}
	});
}

function addFjscTr()
{
	var trobj = $("#fjsctable").find("tr:last");
	$("#fjsctable").find("tr:last").before("<tr>" + trobj.html() + "</tr>");
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

function changeSylb(sylb)
{
	// 出租
	if (sylb == "1" || sylb == "2")
	{
		$("input[name='fwBean.sfczw'").each(function(){
			if ($(this).val() == "1")
			{
				$(this).attr("checked","checked");
			}
		});
	}
	//使用类别 不属于出租
	else
	{
		$("input[name='fwBean.sfczw'").each(function(){
			if ($(this).val() == "0")
			{
				$(this).attr("checked","checked");
			}
		});
	}
}

function ajaxLoadPage(jsppage,msgtype)
{
	var operType = $("#operType").val()
	$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
	$("#" + jsppage).addClass("dialog_menu_selected");
	$("#msgtype").val(msgtype);
	$("#jsppage").val(jsppage);
	var url = contextPath + "/lsgl/fw/loadFwInfoPage.action";
	var data = {
		"operType" : $("#operType").val(),
		"queryBean.fwid" : $("#fwid").val(),
		"queryBean.lch" : $("#fwlch").val(),
		"queryBean.dyh" : $("#fwdyh").val(),
		"queryBean.jsppage" : jsppage,
		"queryBean.isczfdj" : $("#isczfdj").val(),
		"queryBean.msgtype" : msgtype,
		"queryBean.stid" : $("#stid").val(),
		"queryBean.dzid" : $("#dzid").val(),
		"queryBean.dzid" : $("#dzid").val(),
		"queryBean.sfczw" : $("#queryBeanSfczw").val(),
		"queryBean.czType" : $("#queryBeanCzType").val()!=undefined && $("#queryBeanCzType").val() != null ? $("#queryBeanCzType").val() : ""
	};
	$.post(url,data,function(htmldata){
		$("#contentpanel").html(htmldata);
		var width = $(window).width() * 0.90;
		$("#displayImage").width(width);
		if (msgtype == "1")
		{
			initDzxx();
			var value=$("#cqlx").val();
			changeCqlx(value);
			$("#sfczwhidden").val($("#sfczw").val());
			changeCzfwInfo($("#sfczwhidden").val());
			//$("#sfczw").val("1");
			//showOrHiddenCzfwMenu();
		}
		$("#fwrkxxdiv").displayInputForText();
		if (operType == "detail")
		{
			$("#contentpanel").displayInputForText();
			$("#hzsfzhbutton").show();
		}
	});
}

/**
 * 
 * @param {Object} type
 */
function initPage(jsppage,msgtype)
{
	if (msgtype == "1")
	{
		ajaxLoadPage(jsppage,msgtype);
	}
	else
	{
		var fwid = $("#fwid").val();
		if (!$.isBlank(fwid))
		{
			ajaxLoadPage(jsppage,msgtype);
		}
		else
		{
			alert("请先填写并保存房屋基本信息内容");
		}
	}
}

function initDzxx()
{
	
	var sjxzqh = $("#sjxzqhhidden").val();
	if (sjxzqh != null && sjxzqh != "")
	{
		var xjxzqh = $("#xjxzqhhidden").val();
		doubleSelectCountry(sjxzqh,'xjxzqh',null,xjxzqh);
	}
	
	var xjxzqh = $("#xjxzqhhidden").val();
	if (xjxzqh != null && xjxzqh != "")
	{
		var jdxzdm = $("#jdxzdmhidden").val();
		doubleSelectJdxz(xjxzqh,'jdxzdm',null,jdxzdm);
	}
	var jdxzdm = $("#jdxzdmhidden").val();
	if (jdxzdm != null && jdxzdm != "")
	{
		var sqdm = $("#sqdmhidden").val();
		doubleSelectSqByJdxzdm(jdxzdm,'sqdm',null,sqdm);
	}
}

function callbackHzsfzxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#hzxm").val(rkxxBean["xm"]);
		$("#hzlxdh").val(rkxxBean["lxdh"])
	}
}

function callbackfrsfzxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#frdbxm").val(rkxxBean["xm"]);
		$("#frdblxdh").val(rkxxBean["lxdh"])
	}
}
function callbackCqrxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#cqrxm").val(rkxxBean["xm"]);
		$("#cqrlxdh").val(rkxxBean["lxdh"])
	}
}

function callbackSqrxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#fdsyrxm").val(rkxxBean["xm"]);
		$("#fdsyrlxdh").val(rkxxBean["lxdh"])
	}
}

function callbackfrdbxx(rkxxBean)
{
	if (rkxxBean != null)
	{
		$("#frdbxm").val(rkxxBean["xm"]);
		$("#frdblxdh").val(rkxxBean["lxdh"])
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

function openFwDwSelect(rootOrgCode, callback)
{
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       callback(orgBean);
    });
}

function openFwPcsDwSelect(callback)
{
	var rootOrgCode = $("#ssgajgjgdm").val();
	if (!$.isBlank(rootOrgCode))
	{
		openFwDwSelect(rootOrgCode,callback);
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

function rowcallbackCzfxcdj(trObj,rowData)
{
	$("#xcdjxx").eachObjectSetValue(rowData);
}

function changeCzfwInfo(value)
{
	if (value == "1")
	{
		$("#czwxxxx").show();
		$("#czyt").show();
		$("#hzsfzh").addClass("validate[required]");
		$("#hzxm").addClass("validate[required]");
		$("#hzlxdh").addClass("validate[required]");
		$("#hzsfzhlabel").html("<font color=\"red\">*</font><span class=\"cps_span_href\" id=\"hzsfzhbutton\"  onclick=\"openDetailRkInfo()\">房主证件号码</span>：");
		$("#hzxmlabel").html("<font color=\"red\">*</font>房主姓名：");
		$("#hzlxdhlabel").html("<font color=\"red\">*</font>联系电话：");
		
	}
	else
	{
		$("#czwxxxx").hide();
		$("#hzsfzh").removeClass("validate[required]");
		$("#hzxm").removeClass("validate[required]");
		$("#hzlxdh").removeClass("validate[required]")
		$("#hzsfzhlabel").html("<span class=\"cps_span_href\" id=\"hzsfzhbutton\"  onclick=\"openDetailRkInfo()\">房主证件号码</span>：");
		$("#hzxmlabel").html("房主姓名：");
		$("#hzlxdhlabel").html("联系电话：");
	}
	$("#sfczwhidden").val(value);
	showOrHiddenCzfwMenu();
}

function fwrkRowCallback(trObj,rowdata)
{
	$("#fwrkxxdiv").eachObjectSetValue(rowdata);
}

function changeCqlx(value)
{
	//公有
	if (value == "1")
	{
		$("#hzxx").hide();
		$("#cqrxx").hide();
		$("#syrxx").hide();
	
		$("#cqdwxx").show();
		$("#frxx").show();
		$("#dwselectxx").show();
		$("#sydwrow").show();
		
		$("#ssdwmclabel").show();
		$("#ssdwmc").show();
	}
	//私有
	else if (value == "2")
	{
	
		$("#hzxx").show();
		$("#cqrxx").show();
		$("#syrxx").show();
		
		$("#cqdwxx").hide();
		$("#frxx").hide();
		$("#dwselectxx").hide();
		$("#sydwrow").hide();
		
		$("#ssdwmclabel").hide();
		$("#ssdwmc").hide();
	}else{
		$("#hzxx").show();
		$("#cqrxx").show();
		$("#syrxx").show();
		$("#cqdwxx").show();
		$("#dwselectxx").show();
		$("#dwxx").show();
		
		$("#ssdwmclabel").show();
		$("#ssdwmc").show();
	}
}

function deleteFjscTr(btnobj,zpid)
{
	
	if (!$.isBlank(zpid))
	{
		$.ajax({
			url : contextPath + "/lsgl/fw/deleteFwzpxx.action",
			data : {"queryBean.zpid" : zpid},
			dataType : "json",
			success : function(result)
			{
				if (result == true)
				{
					ajaxLoadPage("fwzpxx","2");
				}
				
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

function showOrHiddenCzfwMenu()
{
	var sfczw = $("#sfczwhidden").val();
	// 是出租屋
	if (sfczw == "1")
	{
		$("#czfxcdj").show();
		$("#czxx").show();
		//$("#czwxx").show();
	}
	else
	{
		$("#czfxcdj").hide();
		$("#czxx").hide();
		//$("#czwxx").hide();
	}
}

function openJlxSelectWinxx(dm,mc){
	openDictionarySelectRowWin(function(orgInfo){
		if(orgInfo){
			$("#"+dm).val(orgInfo.orgDm);
			$("#"+mc).val(orgInfo.orgName);
		}
	});

}

function openDictionarySelectRowWin(callback){
	var url= contextPath+"/cps/dzjlx/toDzJlxPageInfo.action?t="+ new Date().getTime();
	var orgInfo = openModalDialog(url,650,550,"cc","no");
	if(orgInfo){
		if($.isFunction(callback)){
			callback(orgInfo);
		}
	}
}

function openNewSyrkInfo()
{
	var fwid =  $("#fwid").val();
	if (!$.isBlank(fwid))
	{	
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/lsgl/rk/toSyrkInfoPage.action",
			width:1000,
			height:700,
			data : 
			{
				"operType":"add",
				"queryBean.fwid" : $("#fwid").val(), 
				t: new Date().getTime()
			}
		});
	}
	else
	{
		alert("请先保存房屋信息");
	}
}

function openNewJwrkInfo()
{
	var fwid =  $("#fwid").val();
	if (!$.isBlank(fwid))
	{	 
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/lsgl/rk/toRkInfoPage.action",
			width:1000,
			height:700,
			data : 
			{
				"operType":"add",
				"queryBean.rylb" : "4",
				"queryBean.fwid" : $("#fwid").val(), 
				t: new Date().getTime()
			}
		});
	}
	else
	{
		alert("请先保存房屋信息");
	}
}

function openNewDwInfo()
{
	var fwid =  $("#fwid").val();
	if (!$.isBlank(fwid))
	{	 
		$.openWindow({
			url : contextPath + "/sydw/dwgl/toDwInfoPage.action",
			width : 1000,
			height : 700,
			data : {
				"operType":"add",
				"queryBean.fwid" : $("#fwid").val()
			}
		});
	}
	else
	{
		alert("请先保存房屋信息");
	}
}

function openSelectStxxBean()
{
	$.openDialogWindow({
		url : contextPath + "/dzgl/dzxx/toStxxBeanSelectPage.action?t="+new Date().getTime(),
		width:1000,
		height:600,
		callback: function(stxxBean)
		{
			if (stxxBean != null)
			{
				$("#stid").val(stxxBean["id"]);
				$("#hiddenstid").val(stxxBean["id"]);
				$("#hiddendzid").val(stxxBean["id"]);
				$("#stmc").val(stxxBean["stmc"]);
				$("#sjxzqh").val(stxxBean["sjxzqh"]);
				doubleSelectCountry(stxxBean["sjxzqh"],'xzqh',callbackDzmc,stxxBean["xzqh"]);
				doubleSelectJdxz(stxxBean["xzqh"],'jdxzdm',callbackDzmc,stxxBean["jdxzdm"]);
				doubleSelectSqByJdxzdm(stxxBean["jdxzdm"],'sqdm',callbackDzmc,stxxBean["sqdm"]);
				$("#jlxdm").val(stxxBean["jlxdm"]);
				$("#jlxmc").val(stxxBean["jlxmc"]);
				$("#mph").val(stxxBean["mph"]);
				$("#xqmc").val(stxxBean["xqz"]);
				$("#ldxz").val(stxxBean["ldxz"]);
				$("#sqdm1").val(stxxBean["sqdm"]);
				$("#fsdz").val("");
			}
		}
	})
}

function openSelectStxxBeanUseFw()
{
	$.openDialogWindow({
		url : contextPath + "/dzgl/dzxx/toStxxBeanSelectPage.action?t="+new Date().getTime(),
		width:1000,
		height:600,
		callback: function(stxxBean)
		{
			if (stxxBean != null)
			{
				$("#stid").val(stxxBean["id"]);
				$("#hiddenstid").val(stxxBean["id"]);
				$("#hiddendzid").val(stxxBean["id"]);
				$("#stmc").val(stxxBean["stmc"]);
				$("#sjxzqh").val(stxxBean["sjxzqh"]);
				doubleSelectCountry(stxxBean["sjxzqh"],'xzqh',callbackDzmc,stxxBean["xzqh"]);
				doubleSelectJdxz(stxxBean["xzqh"],'jdxzdm',callbackDzmc,stxxBean["jdxzdm"]);
				doubleSelectSqByJdxzdm(stxxBean["jdxzdm"],'sqdm',callbackDzmc,stxxBean["sqdm"]);
				$("#jlxdm").val(stxxBean["jlxdm"]);
				$("#jlxmc").val(stxxBean["jlxmc"]);
				$("#mph").val(stxxBean["mph"]);
				$("#xqmc").val(stxxBean["xqz"]);
				$("#ldxz").val(stxxBean["ldxz"]);
				$("#sqdm1").val(stxxBean["sqdm"]);
				$("#fsdz").val("");
			}
		}
	})
}


//单元号  楼层号  房间号 必填一项
function checkFwjbxx(){
	var dyh = $("#dyh").val();
	var lch = $("#lch").val();
	var fjh = $("#fjh").val();
	if(dyh == '' && lch == '' && fjh == ''){
		alert("房屋地址信息中的单元号、楼层号、房间号必须填写一项.");
		return false;
	}else{
		return true;
	}
}

function isExistFwInStxx(){
	var operType = $("#operType").val();
	if(operType == "add"){
		var stid =$("#hiddenstid").val();
		var dyh =$("#dyh").val();
		var lch =$("#lch").val();
		var lchz = $("#lchz").val();
		var fjh = $("#fjh").val();
		var shhz =$("#shhz").val();
		$.ajax({
			url : contextPath + "/lsgl/fw/isExistFwInStxx.action",
			type:"post",
			dataType:"json",
			data:{
				"stid":stid,
				"dyh":dyh,
//				"lch":lch,
//			    "lchz":lchz,
//				"fjh":fjh,
//				"shhz":shhz,
				t:new Date().getTime()
			},
			success:function(msg){
				if(msg){
					alert("同一实体下已经存在该房屋信息，请重新输入信息");
					return;
				}else{
					saveFwBean(saveAfterCallback);
				}
			}
			
		})
	}else{
		saveFwBean(saveAfterCallback);
	}

}


function openCzfwDjInfoWin()
{
	var fwid =  $("#fwid").val();
	if (!$.isBlank(fwid))
	{
		//var url = contextPath + "/lsgl/fw/toFwInfoPage.action?operType=update&queryBean.fwid="+fwid+"&queryBean.sfczw=1" 
		
		$.openWindow({
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			data : {
				operType : "update", 
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : "1",
				t : new Date().getTime()
			},
			height : 760,
			width : 1000,
			scroll : false
		})
	}
	else
	{
		alert("请选保存房屋信息");
	}
}

function fwdetailtzryCzRowCallback(trObj, rowdataObj) {
	var operType  = $("#operType").val();
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openSyrkInfoPage('rydaxx','"+ rowdataObj["rybh"] + "','"+rowdataObj["rylb"]+"')\">详情</span>&nbsp;";
	if("update" == operType && rowdataObj.zxbs == '0'){
		result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openRkInfo('update','" + rowdataObj["rkid"] +"','" + rowdataObj["rybh"] + "','"+rowdataObj["rylb"]+"','" +rowdataObj["rkfwglid"] + "')\">修改</span>&nbsp;";
		result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"batchLogoutRkInfo('logout','"+ rowdataObj["sfzh"] + "','"+rowdataObj["rylb"]+"','"+rowdataObj["rkid"]+"')\">注销</span>&nbsp;";
	}																								
	return result;
}

function openDwxxDetail(jgbh,hylb)
{
	var url = contextPath + "/sydw/dwgl/toDwInfoPage.action?operType=detail&queryBean.jgbh=" + jgbh;
	$.openWindow({
		name : "dwdetailwin",
		url : url,
		width : 1000,
		height : 760
	});
}

function gldwczCallback(tdObj, rowdata)
{
	var html = "";
	html = "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openDwxxDetail('" + rowdata["jgbh"] + "','" + rowdata["hylb"] + "')\">详情</span>";
	
	return html;
}

function changefzzllx(obj)
{
	 
}

function loadFwfzInfo(value)
{
	var fzzjlx = $("#fzzjlx").val()
	if (fzzjlx == "111")
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
}

function loadFwfrInfo(value)
{
	var fzzjlx = $("#fzzjlx").val()
	if (fzzjlx == "111")
	{
		if (value != null && value != "")
		{
			if (isSfzh(value))
			{
				queryRkBean(value,callbackfrsfzxx)
			}
			else
			{
				alert("不是有效的身份证号码.");
			}
		}
	}
}
function openDetailRkInfo(){
	var hzsfzh = $("#hzsfzh").val();
	var fzzjlx = $("#fzzjlx").val();
	if (fzzjlx != "111")
	{
		alert("证件类型不是身份证号码，不能进行查看.");
		return false;
	}
	if($.isBlank(hzsfzh))
	{
		alert("户主身份证号为空,不能查看.");
		return false;
	}
	$.ajax({
		url:contextPath+"/lsgl/rk/queryRyJbxxInfoBysfzh.action",
		type:"post",
		dataType:"json",
		data:{
			"sfzh":hzsfzh
		},
		success:function(jbxxBean){
			if(jbxxBean != null){
				openRkInfoDetail('rydaxx','',jbxxBean["rybh"],jbxxBean["rylb"]);	
			}else{
				alert("该身份证没有在本地登记过.");
			}
		}
	})
}

var layerObj ="";
function openCzfwInfo(){
	var fwid =  $("#fwid").val();
	var cqlx = $("#cqlx").val();
	if (!$.isBlank(fwid))
	{
		layerObj=$.layer({
			title : "出租房记录",
		    type : 2,
		    move : false,
		    title : false,
		    iframe : {
		    	src : contextPath+"/lsgl/fw/toCzfwInfo.action?fwBean.czfwBean.fwbh="+fwid+"&fwBean.cqlx="+cqlx
		    },
		    area : ['900px' , '400px'],
			offset : ['100px','']
		});
	}
	else
	{
		alert("请选保存房屋信息");
	}
}


$(function(){
	$("#leftpanel").setDomWindowHeight();
	initPage('fwinfo','1');
	showOrHiddenCzfwMenu();
});