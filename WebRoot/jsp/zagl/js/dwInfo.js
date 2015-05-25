//旅馆业，印刷业，开锁业
var tzhypages = ["100","500","900"];
/**
 * 异步加载页面
 * @param {} url
 */
function ajaxLoadDwPageInfo(url)
{
	var jgbh = $("#jgbh").val();
	var jsppage = url;
	var operType = $("#operType").val();
	var url = contextPath + "/zagl/dw/" + url + ".action";
	var data = 
	{
		jgbh : jgbh,
		"operType":operType
	}
	if(!$.isBlank(jgbh))
	{
		$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
		$("#" + jsppage).addClass("dialog_menu_selected");
		$.post(url,data,function(htmldata){
			$("#dwjbxx").hide();
			$("#dwtxxx").hide()
			$("#contentpanel").html(htmldata);
			$("#contentpanel").show();
			
			if (operType == "detail")
			{
				$("#contentpanel").displayInputForText();
			}
		});
	}
	else
	{
		alert("请先保存单位基本信息!");
	}
}

function goHylbInfoPageClick(hylb)
{
	var jgbh = $("#jgbh").val();
	var hylbs = $("#hylbhidden").val();
	var flag = false;
	if(hylbs){
		var hylb_array = hylbs.split(",");
		for(var i = 0 ; i< hylb_array.length; i++){
			if(hylb_array[i] == hylb){
				flag = true;
				break;
			}else{
				flag = false;
			}
		}
		
		$("#toTzhy").hide();
		$("#toGgcs").hide();
		$("#toNbdw").hide();
		$("#toAbss").hide();
		$("#toAbry").hide();
		$("#toBwjgList").hide();
		$("#toTfsjyaList").hide();
		$("#toBadys").hide();
		$("#toZhsg").hide();
		$("#toAqyh").hide();
		$("#toWxwp").hide();
		$("#toSwfwcs").hide();
		$("#toSydw").hide();
		for(var i = 0 ; i< hylb_array.length; i++){
			if(hylb_array[i] == '01'){
				$("#toTzhy").show();
			}else if(hylb_array[i] == '02'){
				$("#toGgcs").show();
			}else if(hylb_array[i] == '03'){
				$("#toNbdw").show();
				
				$("#toAbss").show();
				$("#toAbry").show();
				$("#toBwjgList").show();
				$("#toTfsjyaList").show();
				$("#toBadys").show();
				$("#toZhsg").show();
				$("#toAqyh").show();
			}else if(hylb_array[i] == '04'){
				$("#toWxwp").show();
			}else if(hylb_array[i] == '05'){
				$("#toSwfwcs").show();
			}else if(hylb_array[i] == '06'){
				$("#toSydw").show();
			}
		}
	}
	if (!$.isBlank(jgbh) && flag)
	{
		if(hylb != null){
			$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
			if(hylb == '01'){
				$("#toTzhy").addClass("dialog_menu_selected");
			}else if(hylb == '02'){
				$("#toGgcs").addClass("dialog_menu_selected");
			}else if(hylb == '03'){
				$("#toNbdw").addClass("dialog_menu_selected");
			}else if(hylb == '04'){
				$("#toWxwp").addClass("dialog_menu_selected");
			}else if(hylb == '05'){
				$("#toSwfwcs").addClass("dialog_menu_selected");
			}else if(hylb == '06'){
				$("#toSydw").addClass("dialog_menu_selected");
			}
		}else{
			return;
		}
		//加载特种行业信息
		goHylbInfoPage("hllbinfo",jgbh,hylb, function(){
			//var tzhylb = $("#tzhy_thlb_hidden").val();
			//加载特种行业特殊信息
			//if ($.inArray(tzhylb,tzhypages) >= 0)
			//{
			//	loadTzhyTsxxInfoPage(tzhylb);
			//}
		});
	}
	else
	{
		if(hylb != null){
			alert("请保存单位基本信息!");
		}
	}
}

function changeHylb(hylb)
{
	var menuids = ["hylbtitle","toDwzp","toCyry","toAqjc","toAbss","toAbry","toDwjc","toZdyhbw"];
	$.each(menuids,function(i,value){
		$("#" + value).hide();
	});
	$("#hylbhidden").val(hylb);
	//特种行业
	if ("01" == hylb)
	{
		$("#dwtitle").text("特种行业");
		$("#hylbtitleinfo").text("特种行业信息");
		$("#hllbinfo").show();
		$("#toDwzp").show();
		$("#toCyry").show();
		$("#toAqjc").show();
		$("#toDwjc").show();
		$("#toZdyhbw").show();
		$("#toDwaqsb").show();
	}
	//公共场所
	else if ("02" == hylb)
	{
		$("#dwtitle").text("公共场所");
		$("#hylbtitleinfo").text("公共场所信息");
		$("#hllbinfo").show();
		$("#toDwzp").show();
		$("#toCyry").show();
		$("#toAqjc").show();
		$("#toDwjc").show();
		$("#toZdyhbw").show();
		$("#toDwaqsb").show();
	}
	//内保单位
	else if ("03" == hylb)
	{
		$("#dwtitle").text("企事业单位");
		$("#hylbtitleinfo").text("企事业单位信息");
		$("#hllbinfo").show();
		$("#toDwzp").show();
		$("#toCyry").show();
		$("#toAqjc").show();
		$("#toDwjc").show();
		$("#toDwaqsb").show();
		
		$("#toAqjc").show();
		$("#toZdyhbw").show();
		$("#toDwaqsb").show();
		$("#toAbss").show();
		$("#toAbry").show();
		$("#toBwjgList").show();
		$("#toTfsjyaList").show();
		$("#toBadys").show();
		$("#toZhsg").show();
		$("#toAqyh").show();
	}
	// 危险品单位
	else if ("04" == hylb)
	{
		$("#dwtitle").text("危险品单位");
		$("#hylbtitleinfo").text("危险品单位信息");
		$("#hllbinfo").show();
		$("#toDwzp").show();
		$("#toCyry").show();
		$("#toAqjc").show();
		$("#toDwjc").show();
		$("#toZdyhbw").show();
		$("#toAqsb").show();
		$("#toDwaqsb").show();
	}
	//上网服务场所
	else if ("05" == hylb)
	{
		$("#dwtitle").text("上网服务场所");
		$("#hylbtitleinfo").text("上网服务场所");
		$("#hllbinfo").show();
		$("#toDwzp").show();
		$("#toCyry").show();
		$("#toAqjc").show();
		$("#toDwjc").show();
		$("#toZdyhbw").show();
		$("#toAqsb").show();
		$("#toDwaqsb").show();
	}
	//涉外单位
	else if ("06" == hylb)
	{
		$("#dwtitle").text("涉外单位");
		$("#hylbtitleinfo").text("涉外单位信息");
		$("#hllbinfo").show();
		$("#toDwzp").show();
		$("#toCyry").show();
		$("#toAqjc").show();
		$("#toDwjc").show();
		$("#toZdyhbw").show();
		$("#toAqsb").show();
		$("#toDwaqsb").show();
	}
	
}

//跳转到单位基本信息
function goDwJbxxPage()
{
	var operType = $("#operType").val();
	var jgbh = $("#jgbh").val();
	if (!$.isBlank(jgbh))
	{
		var url = contextPath + "/zagl/dw/goDwJbxxPage.action";
		var data = 
		{
			"dw.dwjbxx.jgbh" : jgbh
		}
		$.post(url,data,function(html){
			$("#contentpanel").html(html);
			$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
			$("#dwjbxxinfo").addClass("dialog_menu_selected");
			if (operType == "detail")
			{
				$("#contentpanel").displayInputForText();
			}
		});
	}
}

function goHylbInfoPage(pageid,jgbh,hylb,callback)
{
	var operType = $("#operType").val();
	if (!$.isBlank(jgbh))
	{
		var url = contextPath + "/zagl/dw/goHylbInfoPage.action";
		var data = 
		{
			"dw.dwjbxx.jgbh" : jgbh,
			"dw.dwjbxx.hylb" : hylb
		}
		$.post(url,data,function(html){
			$("#contentpanel").html(html);
			//危险品单位
			if ("04" == hylb)
			{
				var dwfl = $("#dwfl").val();
			    $("input[name='dwfl']").each(function(i){
					var dwflindex = $(this).val();
					var indexstr = $.substr(dwfl,parseInt(dwflindex)-1,1);
					if (indexstr == "1")
					{
						$(this).attr("checked","checked");
					}
				});
			}
			if (operType == "detail")
			{
				$("#contentpanel").displayInputForText();
			}
			if($.isFunction(callback))
			{
				callback();
			}
		});
	}
	else
	{
		alert("请保存单位基本信息!");
	}
}

function loadTzhyTsxxInfoPage(tzhylb)
{
	var operType = $("#operType").val();
	var jgbh = $("#jgbh").val();
	var hylb = $("#hylbhidden").val()
	var url = contextPath + "/zagl/dw/loadTzhyTsxxInfoPage.action";
	$.ajax({
		type : "post",
		url : url,
		data : "dw.tzhy.thlb=" + tzhylb+"&dw.dwjbxx.jgbh=" + jgbh + "&dw.dwjbxx.hylb=" + hylb,
		success : function(text)
		{
			$("#tzhytsxxdiv").html(text);
			var thlb = $("#thlb").val();
			//旅馆业
			if (thlb == "100")
			{
				$("#thlgjgbh").val(jgbh);
				$("#lgmc").val($("#dwmchidden").val())
			}
			//开锁业
			else if (thlb == "900")
			{
				var kslx = $("#kslx").val();
			    $("input[name='kslx']").each(function(i){
					var kslxindex = $(this).val();
					var indexstr = $.substr(kslx,parseInt(kslxindex)-1,1);
					if (indexstr == "1")
					{
						$(this).attr("checked","checked");
					}
				});
			}
			if (operType == "detail")
			{
				$("#contentpanel").displayInputForText();
			}
		}
	});
}

//特行类别改变
function changeTzhylb(selectlist)
{
	
	var tzhylb = $("#thlb").val()+"";
	if ($.inArray(tzhylb,tzhypages) >= 0)
	{
		loadTzhyTsxxInfoPage(tzhylb);
		$("#tzhytsxxdiv").show();
	}
	else
	{
		$("#tzhytsxxdiv").hide();
	}
}

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

//保存单位基本信息
function saveDwJbxx()
{
	var hylb_old = $("#hylb_old").val();
 	if(hylb_old == null || hylb_old == ""){
 		$("#hylb_old").val("null");
 	}
 	
	if ($.validateform("dw_form"))
	{
		changeDwlb(null);
		$("#dw_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveDwJbxx.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					$("#jgbh").val(dwBean["dwjbxx"]["jgbh"]);
					$("#dwmchidden").val(dwBean["dwjbxx"]["dwmc"]);
					$("#hylbhidden").val(dwBean["dwjbxx"]["hylb"]);
					goHylbInfoPageClick();
					alert("基本信息保存成功!");
				}
			}
		});
	}
}

//保存特种行业信息
function saveTzhyBean()
{
	if ($.validateform("dw_form"))
	{
		//填充特行名称
		var thmc = $("#tzhythmc").val();
		if(thmc == null || thmc == ""){
			thmc = $("#dwmchidden").val();
			$("#tzhythmc").val(thmc);
		}
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveTzhyBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var tzhylb = dwBean["tzhy"]["thlb"];
					$("#tzhylbhidden").val(tzhylb);
					goHylbInfoPageClick('01');
					/**
					$("#thlb").attr("disabled","disabled");
					$("#thxl").attr("disabled","disabled");
					
					
					
					$("#thbh").val(dwBean["tzhy"]["thbh"])
					if (dwBean["thlgy"] != null)
					{
						$("#lgbh").val(dwBean["thlgy"]["lgbh"]);
					}
					if (dwBean["thksyBean"] != null)
					{
						$("#ksbh").val(dwBean["thksyBean"]["ksbh"]);
					}*/
					alert("信息保存成功!");
				}
			}
		});
	}
}

//保存公共场所
function saveGGCSBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveGGCSBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					 alert("信息保存成功!");
					 goHylbInfoPageClick('02');
				}
			}
		});
	}
}

//保存企事业单位
function saveNbdwBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveNbdwBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					 alert("信息保存成功!");
					 goHylbInfoPageClick('03');
				}
			}
		});
	}
}

//保存上网服务场所
function saveSwfwcsBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveSwfwcsBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					 alert("信息保存成功!");
					 goHylbInfoPageClick('05');
				}
			}
		});
	}
}

//保存涉外单位
function saveSwdwBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveSwdwBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					 alert("信息保存成功!");
					 goHylbInfoPageClick('06');
				}
			}
		});
	}
}

//保存危险物品单位
function saveWxwpdwBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveWxwpdwBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					 goHylbInfoPageClick('04');
					  alert("信息保存成功!");
				}
			}
		});
	}
}

//保存单位安全检查
function saveDwAqjcBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwAqjcBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					ajaxLoadDwPageInfo('toAqjc');
					alert("信息保存成功!");
				}
			}
		});
	}
}

//保存单位奖惩
function saveDwJcxxBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwJcBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					ajaxLoadDwPageInfo('toDwjc');
					alert("信息保存成功!");
				}
			}
		});
	}
}

//保存重点要害部位
function saveZdyhbwBean()
{
	if ($.validateform("dw_form"))
	{
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveZdyhbwBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					ajaxLoadDwPageInfo('toZdyhbw');
					alert("信息保存成功!");
				}
			}
		});
	}
}

//保存单位照片
function saveDwZp()
{
	if ($.validateform("dw_form")) {
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwZp.action",
			success : function(dw) 
			{
				if (dw != null)
				{
					ajaxLoadDwPageInfo('toDwzp');
				}
			}
		});
	}
}

//保存安全设备
function saveDwAqsb()
{
	if ($.validateform("dw_form")) {
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwAqsb.action",
			success : function(dw) 
			{
				if (dw != null)
				{
					alert("信息保存成功!");
					ajaxLoadDwPageInfo('toDwaqsb');
				}
			}
		});
	}
}

function setDwdzxx(fwxxBean)
{
	var dzid = fwxxBean["dzid"];
	var fwid = fwxxBean["fwid"];
	var dzmc = fwxxBean["dzmc"];
	$("#fwid").val(fwid);
	$("#dzid").val(dzid);
	$("#dzmc").val(dzmc);
}

function dwjcClickRowcallback(trObj,rowdata)
{
	$("#dwjc_div").eachObjectSetValue(rowdata);
}

function zdyhbwClickRowCallback(trObj,rowdata)
{
	$("#zdyhbw_div").eachObjectSetValue(rowdata);
}

function changeKslx(chkobj)
{
	var kslx = $("#kslx").val();
	var checked = $(chkobj).attr("checked");
	var kslxindex = $(chkobj).val();
	if (checked == "checked")
	{
		kslx = $.replaceStr(kslx,parseInt(kslxindex)-1,parseInt(kslxindex),"1");
	}
	else
	{
		kslx = $.replaceStr(kslx,parseInt(kslxindex)-1,parseInt(kslxindex),"0");
	}
	$("#kslx").val(kslx);
}

function changeWxwpdwfl(chkobj)
{
	var dwfl = $("#dwfl").val();
	var checked = $(chkobj).attr("checked");
	var dwflindex = $(chkobj).val();
	if (checked == "checked")
	{
		dwfl = $.replaceStr(dwfl,parseInt(dwflindex)-1,parseInt(dwflindex),"1");
	}
	else
	{
		dwfl = $.replaceStr(dwfl,parseInt(dwflindex)-1,parseInt(dwflindex),"0");
	}
	$("#dwfl").val(dwfl);
}

//菜单操作
function opMenu(obj){
	var hylb = obj.value;
	if(obj.checked){
		if(hylb == '01'){
			$("#toTzhy").show();
		}else if(hylb == '02'){
			$("#toGgcs").show();
		}else if(hylb == '03'){
			$("#toNbdw").show();
			
			$("#toAbss").show();
			$("#toAbry").show();
			$("#toBwjgList").show();
			$("#toTfsjyaList").show();
			$("#toBadys").show();
			$("#toZhsg").show();
			$("#toAqyh").show();
		}else if(hylb == '04'){
			$("#toWxwp").show();
		}else if(hylb == '05'){
			$("#toSwfwcs").show();
		}else if(hylb == '06'){
			$("#toSydw").show();
		}
	}else{
		if(hylb == '01'){
			$("#toTzhy").hide();
		}else if(hylb == '02'){
			$("#toGgcs").hide();
		}else if(hylb == '03'){
			$("#toNbdw").hide();
			
			$("#toAbss").hide();
			$("#toAbry").hide();
			$("#toBwjgList").hide();
			$("#toTfsjyaList").hide();
			$("#toBadys").hide();
			$("#toZhsg").hide();
			$("#toAqyh").hide();
		}else if(hylb == '04'){
			$("#toWxwp").hide();
		}else if(hylb == '05'){
			$("#toSwfwcs").hide();
		}else if(hylb == '06'){
			$("#toSydw").hide();
		}
	}
}

function mjxx(data){
	$("#zrmj").val(data.realname);
	$("#mjdh").val(data.mobile);
}

$(function(){
	var operType = $("#operType").val();
	if (operType=="detail")
	{
		$("#contentpanel").displayInputForText();
	}
	
	var hylb = $("#hylbhidden").val();
	if(hylb){
		var hylb_array = hylb.split(",");
		for(var i=0; i<hylb_array.length; i++){
			if(hylb_array[i] == '01'){
				$("#toTzhy").show();
			}else if(hylb_array[i] == '02'){
				$("#toGgcs").show();
			}else if(hylb_array[i] == '03'){
				$("#toNbdw").show();
				
				$("#toAbss").show();
				$("#toAbry").show();
				$("#toBwjgList").show();
				$("#toTfsjyaList").show();
				$("#toBadys").show();
				$("#toZhsg").show();
				$("#toAqyh").show();
			}else if(hylb_array[i] == '04'){
				$("#toWxwp").show();
			}else if(hylb_array[i] == '05'){
				$("#toSwfwcs").show();
			}else if(hylb_array[i] == '06'){
				$("#toSydw").show();
			}
		}
	}
});