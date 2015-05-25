//旅馆业，印刷业，开锁业
var tzhypages = ["100","500","900"];
/**
 * 异步加载页面
 * @param {} url
 */
function ajaxLoadDwPageInfo(url)
{
	if(url == "toAbss" || url == "toAbry" || url == "toBwjgList" || url == "toTfsjyaList" || url == "toBadys" || url == "toZhsg" || url == "toAqyh"){
		if($("#hylbhidden").val().indexOf("03") == -1){
			alert("请在单位基本信息中勾选企事业单位并保存。");
			return;
		}
	} 
	
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
			"dw.dwjbxx.jgbh" : jgbh,
			"operType" : operType
		}
		$.post(url,data,function(html){
			$("#contentpanel").html(html);
			$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
			$("#dwjbxxinfo").addClass("dialog_menu_selected");
			showTabByHylb();
		});
	}
}

//保存单位信息
function saveDwJbxx()
{
	
	var hylb_old = $("#hylb_old").val();
 	if(hylb_old == null || hylb_old == ""){
 		$("#hylb_old").val("null");
 	}
 	var zzjgdm = $("#dwdm").val();
 	var yyzzhm = $("#yyzzbh").val();
 	
 	if(zzjgdm == "" && yyzzhm == ""){
 		alert("组织机构代码和营业执照号中必须填写一个。");
 		return;
 	}
 	
 	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
 	
 	//验证单位属性是否被选择
 	var haveselected = true;
 	if ($("input[name='dw.dwjbxx.hylbs']:checked").length <=0)
 	{
 		alert("单位属性至少需要选择一项.");
 		return false;
 	}
	if ($.validateform("dw_form"))
	{
		
		eventSrcObj.attr("disabled","disabled");
		
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
					$("#hylb_old").val(dwBean["dwjbxx"]["hylb"])
					
					if(dwBean.thlgy){
						$("#lgbh").val(dwBean.thlgy.lgbh);
					}else{
						$("#lgbh").val("");
					}
					
					if(dwBean.thksyBean){
						$("#ksbh").val(dwBean.thksyBean.ksbh);
					}else{
						$("#ksbh").val("");
					}
					
					if(dwBean.tzhy){
						$("#tzhyjgbh").val(dwBean.tzhy.tzhyjgbh);
						$("#thbh").val(dwBean.tzhy.thbh);
					}else{
						$("#thbh").val("");
					}
					
					if(dwBean.ggcs){
						$("#ggcs_jlbh").val(dwBean.ggcs.jlbh);
					}else{
						$("#ggcs_jlbh").val("");
					}
					
					if(dwBean.nbdw){
						$("#nbdwbh").val(dwBean.nbdw.nbdwbh);
					}else{
						$("#nbdwbh").val("");
					}
					
					if(dwBean.wxwpdwBean){
						$("#wxwpdw_jlbh").val(dwBean.wxwpdwBean.jlbh);
					}else{
						$("#wxwpdw_jlbh").val("");
					}
					
					if(dwBean.swfwcs){
						$("#swfwcs_jlbh").val(dwBean.swfwcs.jlbh);
					}else{
						$("#swfwcs_jlbh").val("");
					}
					
					if(dwBean.swdwBean){
						$("#swdw_jlbh").val(dwBean.swdwBean.jlbh);
					}else{
						$("#swdw_jlbh").val("");
					}
					
					if(dwBean.jfdw){
						$("#jfdw_id").val(dwBean.jfdw.id);
					}else{
						$("#jfdw_id").val("");
					}
					
					alert("单位信息保存成功!");
				}else{
					alert("单位信息保存失败!");
				}
				eventSrcObj.removeAttr("disabled","disabled");
			}
		});
	}
}

//保存单位安全检查
function saveDwAqjcBean()
{
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("dw_form"))
	{
		eventSrcObj.attr("disabled","disabled");
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwAqjcBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					alert("信息保存成功!");
					ajaxLoadDwPageInfo('toAqjc');
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

//保存单位奖惩
function saveDwJcxxBean()
{
	
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("dw_form"))
	{
		
		eventSrcObj.attr("disabled","disabled");
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwJcBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					alert("信息保存成功!");
					ajaxLoadDwPageInfo('toDwjc');
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

//保存重点要害部位
function saveZdyhbwBean()
{
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("dw_form"))
	{
		eventSrcObj.attr("disabled","disabled");
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveZdyhbwBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					ajaxLoadDwPageInfo('toZdyhbw');
					alert("信息保存成功!");
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

//保存单位照片
function saveDwZp()
{
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("dw_form")) {
		eventSrcObj.attr("disabled","disabled");
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwZp.action",
			success : function(dw) 
			{
				if (dw != null)
				{
					ajaxLoadDwPageInfo('toDwzp');
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled")
				}
			}
		});
	}
}

//保存安全设备
function saveDwAqsb()
{
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("dw_form")) {
		eventSrcObj.attr("disabled","disabled");
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwAqsb.action",
			success : function(dw) 
			{
				if (dw != null)
				{
					alert("信息保存成功!");
					ajaxLoadDwPageInfo('toDwaqsb');
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

//填充单位地址信息
function setDwdzxx(fwxxBean)
{
	var dzid = fwxxBean["dzid"];
	var fwid = fwxxBean["fwid"];
	var dzmc = fwxxBean["dzmc"];
	$("#fwid").val(fwid);
	$("#dzid").val(dzid);
	$("#dzmc").val(dzmc);
}

//单位检查列表点击查看详情
function dwjcClickRowcallback(trObj,rowdata)
{
	$("#dwjc_div").eachObjectSetValue(rowdata);
}

//重点要害部位点击查看详情
function zdyhbwClickRowCallback(trObj,rowdata)
{
	$("#zdyhbw_div").eachObjectSetValue(rowdata);
}

//开锁业
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

//获取危险物品分类
function changeWxwpdwfl(chkobj)
{
	var dwfl = $("#wxwp_dwfl").val();
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
	
	$("#wxwp_dwfl").val(dwfl);
}

//菜单操作
function opMenu(obj){
	var hylb = obj.value;
	var selectCheckBox = $("#dwsx_td").find("input[type='checkbox']:checked");
	if(hylb == '10'){
		selectCheckBox.removeAttr("checked");
		$("#dwsx_td").find("input[type='checkbox'][value='10']").attr("checked","checked");
	}else{
		$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
	}
	
	$("#tzhy_tab").hide();
	$("#ggcs_tab").hide();
	$("#wxwp_tab").hide();
	$("#nbdw_tab").hide();
	$("#wb_tab").hide();
	$("#swdw_tab").hide();
	$("#lg_tab").hide();
	$("#ks_tab").hide();
	$("#jfdw_tab").hide();
	selectCheckBox.each(function(){
		if($(this).val() == '01'){
			$("#tzhy_tab").show();
		}else if($(this).val() == '02'){
			$("#ggcs_tab").show();
		}else if($(this).val() == '03'){
			$("#nbdw_tab").show();
		}else if($(this).val() == '04'){
			$("#wxwp_tab").show();
		}else if($(this).val() == '05'){
			$("#wb_tab").show();
		}else if($(this).val() == '06'){
			$("#swdw_tab").show();
		}else if($(this).val() == '07'){
			$("#tzhy_tab").show();
			$("#lg_tab").show();
		}else if($(this).val() == '08'){
			$("#tzhy_tab").show();
			$("#ks_tab").show();
		}
		else if($(this).val() == '09'){
			$("#jfdw_tab").show();
		}
	});
	
	var checkedNum = selectCheckBox.length;
	if(checkedNum > 0 && hylb != "10"){
		$("#dwtxx_tab").show();
	}
	if(obj.checked){
		if(hylb == '01'){
			$("#tzhy_tab").show();
			$("#tzhy_tab").trigger("click");
		}else if(hylb == '02'){
			$("#ggcs_tab").show();
			$("#ggcs_tab").trigger("click");
		}else if(hylb == '03'){
			$("#nbdw_tab").show();
			$("#nbdw_tab").trigger("click");
			$("#toAbss").show();
			$("#toAbry").show();
			$("#toBwjgList").show();
			$("#toTfsjyaList").show();
			$("#toBadys").show();
			$("#toZhsg").show();
			$("#toAqyh").show();
		
		}else if(hylb == '04'){
			$("#wxwp_tab").show();
			$("#wxwp_tab").trigger("click");
		}else if(hylb == '05'){
			$("#wb_tab").show();
			$("#wb_tab").trigger("click");
		}else if(hylb == '06'){
			$("#swdw_tab").show();
			$("#swdw_tab").trigger("click");
		}else if(hylb == '07'){
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='01']").attr("checked","checked");
			$("#thlb").val("100");
			$("#tzhy_tab").show();
			$("#lg_tab").show();
			$("#lg_tab").trigger("click");
		}else if(hylb == '08'){
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='01']").attr("checked","checked");
			$("#thlb").val("900");
			$("#tzhy_tab").show();
			$("#ks_tab").show();
			
			if($("#ksbh").val() == ""){
				$("#ksy_kysj").val($("#dwjbxx_kyrq").val());
			}
			
			$("#ks_tab").trigger("click");
		}
		else if(hylb == '09'){
			$("#jfdw_tab").show();
			$("#jfdw_tab").trigger("click");
		}
	}else{
		if(hylb == '01')
		{
			$("#tzhy_tab").hide();
			$("#lg_tab").hide();
			$("#ks_tab").hide();
			$("#tzhy_tab").attr("display","false");
			$("#lg_tab").attr("display","false");
			$("#ks_tab").attr("display","false");
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='07']").removeAttr("checked");
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='08']").removeAttr("checked");
		}
		else if(hylb == '02')
		{
			$("#ggcs_tab").hide();
			$("#ggcs_tab").attr("display","false");
		}
		else if(hylb == '03')
		{
			$("#nbdw_tab").hide();
			$("#nbdw_tab").attr("display","false");
			$("#toAbss").hide();
			$("#toAbry").hide();
			$("#toBwjgList").hide();
			$("#toTfsjyaList").hide();
			$("#toBadys").hide();
			$("#toZhsg").hide();
			$("#toAqyh").hide();
		}
		else if(hylb == '04')
		{
			$("#wxwp_tab").hide();
			$("#wxwp_tab").attr("display","false");
		}
		else if(hylb == '05')
		{
			$("#wb_tab").hide();
			$("#wb_tab").attr("display","false");
			
		}
		else if(hylb == '06')
		{
			$("#swdw_tab").hide();
			$("#swdw_tab").attr("display","false");
		}
		else if(hylb == '07')
		{
			$("#lg_tab").hide();
			$("#lg_tab").attr("display","false");
			$("#tzhy_tab").trigger("click");
		}
		else if(hylb == '08')
		{
			$("#ks_tab").hide();
			$("#ks_tab").attr("display","false");
			$("#tzhy_tab").trigger("click");
		}
		else if(hylb == '09')
		{
			$("#jfdw_tab").hide();
			$("#jfdw_tab").attr("display","false");
		}
		
		var length = $("#dwtxx_tab").find("button[display='true']").length;
		if (length > 0)
		{
			$("#dwtxx_tab").find("button[display='true']").last().trigger("click");
		}
		else
		{
			$("#dwtxx_tab").find(".cps-tab-content .tab-content").hide();
		}
		
		if($("#dwsx_td").find("input[type='checkbox']:checked").length == 0){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").attr("checked","checked");
		}
	}
	
	if(checkedNum < 1 || hylb == '10'){
		$("#dwtxx_tab").hide();
	}
}

function mjxx(data){
	$("#zrmj").val(data.realname);
	$("#mjdh").val(data.mobile);
}

//根据行业类别显示TAB
function showTabByHylb(hylb){
	$("#tzhy_tab").hide();
	$("#ggcs_tab").hide();
	$("#wxwp_tab").hide();
	$("#nbdw_tab").hide();
	$("#wb_tab").hide();
	$("#swdw_tab").hide();
	$("#lg_tab").hide();
	$("#ks_tab").hide();
	$("#jfdw_tab").hide();
	
	if(hylb)
	{
		$("#dwtxxx_tab").show();
		
		var hylb_array = hylb.split(",");
		for(var i=0; i<hylb_array.length; i++){
			if(hylb_array[i] == '01'){
				$("#tzhy_tab").show();
				$("#tzhy_tab").attr("display","true");
			}else if(hylb_array[i] == '02'){
				$("#ggcs_tab").show();
				$("#ggcs_tab").attr("display","true");
			}else if(hylb_array[i] == '03'){
				$("#nbdw_tab").show();
				$("#nbdw_tab").attr("display","true");
				$("#toAbss").show();
				$("#toAbry").show();
				$("#toBwjgList").show();
				$("#toTfsjyaList").show();
				$("#toBadys").show();
				$("#toZhsg").show();
				$("#toAqyh").show();
			}else if(hylb_array[i] == '04'){
				$("#wxwp_tab").show();
				$("#wxwp_tab").attr("display","true");
				var dwfl = $("#wxwp_dwfl").val();
			    $("input[name='dwfl']").each(function(i){
					var dwflindex = $(this).val();
					var indexstr = $.substr(dwfl,parseInt(dwflindex)-1,1);
					if (indexstr == "1")
					{
						$(this).attr("checked","checked");
					}
				});
			}else if(hylb_array[i] == '05'){
				$("#wb_tab").show();
				$("#wb_tab").attr("display","true");
			}else if(hylb_array[i] == '06'){
				$("#swdw_tab").show();
				$("#swdw_tab").attr("display","true");
			}else if(hylb_array[i] == '07'){
				$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='01']").attr("checked","checked");
				$("#lg_tab").show();
				$("#tzhy_tab").show();
				$("#tzhy_tab").attr("display","true");
			}else if(hylb_array[i] == '08'){
				$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='01']").attr("checked","checked");
				$("#ks_tab").show();
				$("#tzhy_tab").show();
				$("#tzhy_tab").attr("display","true");
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
			else if(hylb_array[i] == '09'){
				$("#jfdw_tab").show();
				$("#jfdw_tab").attr("display","true");
			}
		}
	}
}

$(function(){
	$.maxWindow();
	var hylb = "";
	if($("#operType").val() == "add"){
		hylb = $("#dw_add_hylb").val()
		if(hylb == "01"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='01']").attr("checked","checked");
		}else if(hylb == "02"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='02']").attr("checked","checked");
		}else if(hylb == "03"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='03']").attr("checked","checked");
		}else if(hylb == "04"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='04']").attr("checked","checked");
		}else if(hylb == "05"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='05']").attr("checked","checked");
		}else if(hylb == "06"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='06']").attr("checked","checked");
		}else if(hylb == "07"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='01']").attr("checked","checked");
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='07']").attr("checked","checked");
		}else if(hylb == "08"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='01']").attr("checked","checked");
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='08']").attr("checked","checked");
		}else if(hylb == "09"){
			$("#dwsx_td").find("input[type='checkbox'][value='10']").removeAttr("checked");
			
			$("input[type='checkbox'][name='dw.dwjbxx.hylbs'][value='09']").attr("checked","checked");
		}
		
	}else{
		hylb = $("#hylbhidden").val();
	}
	
	showTabByHylb(hylb);
	$("#dwxxrowhe").height($(window).height()-5);

	if(hylb =="" || hylb == "10"){
		$("#dwtxx_tab").hide();
	}else{
		$("#dwtxx_tab").show();
	}
});