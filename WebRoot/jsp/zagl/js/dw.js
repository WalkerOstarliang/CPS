/**
 * 表单保存
 * 
 * @param {}
 *            formid 表单id
 */
function save(formid,before,collback,url) {
	if($.isFunction(before)){
		before();
	}
	
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	
	if ($.validateform(formid)) {
		eventSrcObj.attr("disabled","disabled");
		
		$("#" + formid).ajaxSubmit({
			type : "post",
			success : function(dw) {
				if(dw != null && dw != "" && dw != "null"){
					if($.isFunction(collback)){
						collback(url);
					}
					alert("保存成功!");
				}else{
					alert("保存失败!");
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}

/**
 * 获取地址
 */
function getDz(obj) {
	if ($("#opertype").val() == "add") {
		$(obj).val($("#dzmc").val());
	}
}

/**
 * 获取单位名称
 * @param {} obj
 */
function getDwmc(obj) {
	if ($("#dwjbxx_dwmc").val() != "" && $("#dwjbxx_dwmc").val() != null) {
		$(obj).val($("#dwjbxx_dwmc").val());
	}
}
 

function openDwjcrySelect(orgcode,showid)
{
	if (orgcode) {
		openDwRySelect({
			rootOrgCode : orgcode,
			mutilSelect : true
		}, function(userbeans) {
			var realnames = "";
			if (userbeans != null && userbeans.length > 0) 
			{
				$.each(userbeans,function(i,userbean){
					realnames += userbean.realname + ","
				});
				$("#" + showid).val($.trimLastChar(realnames,","));
				 
			}
		});

	} else {
		alert("无效的机构代码");
	}
}


/**
 * 机构人员选择
 * 
 * @param {}
 *            orgcode
 * @param {}
 *            hidden
 * @param {}
 *            show
 */
function orgUserSelect(orgcode, hidden, show,callback) 
{
	if (orgcode) {
		openDwRySelect({
			rootOrgCode : orgcode,
			mutilSelect : false
		}, function(userbean) {
			if (userbean != null) {
				$("#" + hidden).val(userbean.username);
				$("#" + show).val(userbean.realname);
				if($.isFunction(callback))
				{
					callback(userbean);
				}
			}
		});

	} else {
		alert("无效的机构代码");
	}
}

function setJcdwxx(userbean)
{
	$("#jcdwdm").val(userbean["orgcode"]);
	$("#jcdwmc").val(userbean["orgname"]);
}

function aqjcRowClickCallback(trObj,rowdata)
{
	$("#aqjc_div").eachObjectSetValue(rowdata);
	$("#aqjc_jlbh").val(rowdata.jlbh);
}

/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect({
			rootOrgCode : orgcode,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}


/**
 * 行政区划选择
 * 
 * @param {}
 *            rootOrgCode
 * @param {}
 *            callback
 */
function openSelectXzqh(rootOrgCode, callback) {
	openXzqhTree({
				rootOrgCode : rootOrgCode,
				mutilSelect : false,
				isAsyn : true,
				nodeSelectedType : "ps",
				nodeNotSelectedType : "ps"
			}, function(xzqhBean) {
				callback(xzqhBean);
			})
}

function callbackHjdqh(xzqhBean) {
	if (xzqhBean != null) {
		$("#hjdqh").val(xzqhBean["id"]);
		$("#hjdqhmc").val(xzqhBean["name"]);
	}
}

$(function() {
	var operType = $("#opertype").val();
	
	$("#dwinfo").addClass("dialog_menu_selected");
	//$("#leftpanel").setDomWindowHeight();
	if (operType == "detail") {
		$("#tzhy_div").displayInputForText();
		$("#ggcs_div").displayInputForText();
		$("#nbdw_div").displayInputForText();
		$("#swfwcs_div").displayInputForText();
	}
	
	/**
	if ($.browser.version == "6.0")
	{
		$("#dwjbxx").css("width","86%");
		$("#dwtxxx").css("width","86%");
		$("#contentpanel").css("width","86%");
	}
	else
	{
		$("#dwjbxx").css("width","86%");
		$("#dwtxxx").css("width","86%");
		$("#contentpanel").css("width","86%");
	}
	
	*/
	var sjxzqh = $("#sjxzqhhidden").val();
	if (sjxzqh != null && sjxzqh != "") {
		doubleSelectCountry(sjxzqh, 'xjxzqh', function() {
			var xjxzqh = $("#xjxzqhhidden").val();
			$("#xjxzqh").val(xjxzqh);
		});
	}

	var xjxzqh = $("#xjxzqhhidden").val();
	if (xjxzqh != null && xjxzqh != "") {
		doubleSelectJdxz(xjxzqh, 'jdxzdm', function() {
			var jdxzdm = $("#jdxzdmhidden").val();
			$("#jdxzdm").val(jdxzdm);
		});
	}

	var jdxzdm = $("#jdxzdmhidden").val();
	if (jdxzdm != null && jdxzdm != "") {
		doubleSelectSqByJdxzdm(jdxzdm, 'sqdm', function() {
			var sqdm = $("#sqdmhidden").val();
			$("#sqdm").val(sqdm)
			if (operType == "detail") {
				$("#dwjbxx_div").displayInputForText();
			}
		});
	}
});


function queryRyBysfz(sfzh,xmId,lxfsId,xzdzId){
	if($("#sfzjy").length > 0 &&　$("#sfzjy").attr("checked") == undefined){
		return;
	}
	if(sfzh){
		queryRkBean(sfzh, function(czrkxxBean) {
			if (czrkxxBean != null) 
			{
				$("#"+xmId).val(czrkxxBean.xm);
				$("#"+lxfsId).val(czrkxxBean.lxdh);
			}
		});
	}
}

//单位地址选择
function openSelectFwWin(callback)
{
	$.openWindow({
		url : contextPath + "/zagl/dw/toDwfw.action?dwfwzt=update&t=" + new Date().getTime(),
		width:900,
		height:650,
		callback : function(resultObj)
		{
			dwcx();
		}
	});
}

function openDwSelectFwInfoPage()
{
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
				$("#fwid").val(fwxxBean["fwid"]);
				$("#dzid").val(fwxxBean["dzid"]);
				$("#dzmc").val(fwxxBean["dzmc"]);
				$("#sssqdm").val(fwxxBean["sssq"]);
			}
		}
	});
}


function openSelectFwWinPage(callback)
{
	$.openWindow({
		url : contextPath + "/zagl/dw/toDwfw.action?dwfwzt=update",
		width:900,
		height:650,
		data : 
		{
			"hylb":hylb,
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			dwcx();
		}
	});
}

function changeDwlb(list)
{
	var dwlbdl = $("#dwlbdl").val();
	var dwlbxl = $("#dwlbxl").val();
	if (!$.isBlank(dwlbxl))
	{
		$("#dwlb").val(dwlbxl);	
	}
	else if (!$.isBlank(dwlbdl))
	{
		$("#dwlb").val(dwlbdl);	
	}
}

//是否校验身份证
function changeFrsfrz(obj)
{
	if ($(obj).attr("checked") == "checked")
	{
		$("#frsfzhm").attr("class"," validate[[required, maxSize[18],funcCall[checkIDC]]]  cps-input");
	}
	else
	{
		$("#frsfzhm").attr("class"," validate[[required, maxSize[18]]] cps-input");
	}
}

//单位名称后面的查询按钮
function queryDwxxByDwmc(){
	var dwmc = $("#dwjbxx_dwmc").val();
	if(dwmc == ""){
		alert("请输入单位名称后再查询。");
		return;
	}
	$.openWindow({
		url : contextPath + "/zagl/dw/toQueryDwxxByDwmc.action?dwcx.dwmc=" + dwmc,
		width:900,
		height:650
	});
}