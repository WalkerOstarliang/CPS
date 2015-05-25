/**
 * 从业人员查询
 */
function queryCyry() {
	$("#cyryList").query("F", "queryCyryForm");
}

/**
 * 加载操作栏(用于单位管理中的从业人员)
 * @param {} tr
 * @param {} data
 * @return {}
 */
function cyryCallback(tr, data) {
	var html = "<span class=\"cps_span_href\" onclick=\"openSyrkInfoPage('rydaxx','" + data.rybh + "','')\">人员详情</span>&nbsp;";
	if(data.zxbs == "1"){
				//html += "<span class=\"cps_span_href\" onclick=\"resetCyry('" + data.cyrybh + "')\">|&nbsp;恢复</span>";
	}else{
		html += "<span class=\"cps_span_href\" onclick=\"cyryDetail('" + data.cyrybh + "','update')\">|&nbsp;修改</span>&nbsp;";
		html += "<span class=\"cps_span_href\" onclick=\"delCyry('" + data.cyrybh + "')\">注销</span>";
	}
	return html;
}

//新增从业人员 (用于单位管理中的从业人员)
function addCyry(sfjwry,hylb){
	var url = "";
	if(sfjwry)
	{
		url = "&dw.cyry.sfjwry=" + sfjwry;
	}
	if(hylb){
		url += "&hylb=" + hylb;
	}
	var jgbh = $("#jgbh").val();
	var dwmc = encodeURIComponent($("#dwmchidden").val());
	$.openDialogWindow({
		url : contextPath
				+ "/zagl/dw/toCyryDetail.action?dw.cyry.jgbh="+ jgbh +
					"&dw.cyry.dwmc=" + dwmc +"&dw.opertype=add" + "&dw.cyry.sfzh=" + $("#querySfz").val() + url,
		width : 1000,
		height : 700,
		callback : function() 
		{
			queryCyry();
		}
	});
}

/**
 * 打开从业人员详细信息
 * @param {} cyrybh
 * @param {} opertype
 */
function cyryDetail(cyrybh,opertype) {
	if(opertype == "detail"){
		$.openWindow({
			url : contextPath
					+ "/zagl/dw/toCyryDetail.action?t=" + new Date().getTime() + "&dw.cyry.cyrybh="
					+ cyrybh + "&dw.opertype=" + opertype,
			width : 1000,
			height : 720,
			callback : function() {
				return;
			}
		});
	}else{
		$.openWindow({
			url : contextPath
					+ "/zagl/dw/toCyryDetail.action?t=" + new Date().getTime() +"&dw.cyry.cyrybh="
					+ cyrybh + "&dw.opertype=" + opertype,
			width : 1000,
			height : 700
		});
	}
}

//添加同事
function addColleague(sfjwry){
	var selectCyry = $("#cyryList").getSelected();
	if(selectCyry.length != 1 ){
		alert("请先选择从一位从业人员!");
		return;
	}else{
		var url = "";
		if(sfjwry){
			url = "&dw.cyry.sfjwry=" + sfjwry;
		}
		
		$.openWindow({
			url : contextPath
					+ "/zagl/dw/toCyryDetail.action?dw.cyry.jgbh="+ selectCyry[0].jgbh +
						"&dw.cyry.dwmc=" + encodeURIComponent(selectCyry[0].dwmc) + "&dw.opertype=add" + url,
			width : 1000,
			height : 700,
			callback : function() {
				return;
			}
		});
	}		
}

function toDwSelectPage()
{
	layer.load(0);
	var url = contextPath + "/zagl/dw/toDwselect.action";
	document.location.href = url;
}

/**
 * 打开单位选择页面
 */
function openDwSelectPage(){
	$.openWindow({
		url : contextPath
				+ "/zagl/dw/toDwselect.action?t="
				+ new Date().getTime() ,
		width : 1000,
		height : 700,
		callback : function() {
			queryCyry();
		}
	});
}

/**
 * 加载人员基本信息
 * 
 * @param {}
 *            sfzh
 */
function loadRkxxBean(sfzh,jgbh) {
	var rylb = $("#rylb").val();
	if (sfzh != null && sfzh != "") {
		var csrqdate = getCsrqBySfzh(sfzh);
		if (!$.isBlank(csrqdate)) {
			$("#csrq").val(csrqdate.pattern("yyyy-MM-dd"));
			//$("#imageswitch.spec-list").find("img").last().attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + sfzh);
		}
		queryRkJbxxBeanBySfzh(sfzh, function(rkJbxxBean) {
			if (rkJbxxBean != null) {
				var url = contextPath + "/lsgl/rk/";
				if(rkJbxxBean.rybh != "" && rkJbxxBean.rybh != null){
					url += "queryRkDzByRybh.action?rkdz.rk.rybh=" + rkJbxxBean.rybh + "&t=" + new Date().getTime();
				}else{
					url += "queryRkDzBySfzh.action?rkdz.rk.sfzh=" + rkJbxxBean.sfzh+ "&t=" + new Date().getTime();
				}
				
				$.ajax({
						url:url,
						type:"post",
						success:function(data){
							eval("data = " + data);
							if(data.fw != null){
								$("#fwid").val(data.fw.fwid);
								$("#dzid").val(data.fw.dzid);
								$("#xzdz").val(data.fw.dzmc);
							}
							if(data.rkfw != null){
								$("#rkfwglid").val(data.rkfw.rkfwglid);
							}
						}
					});
				insertRkxx(rkJbxxBean);
			} else {
				queryRemoteRyxxBean(sfzh, function(czrkBean) {
					if (czrkBean != null) {
						var url = contextPath + "/lsgl/rk/";
						if(czrkBean.rybh != "" && czrkBean.rybh != null){
							url += "queryRkDzByRybh.action?rkdz.rk.rybh=" + czrkBean.rybh+ "&t=" + new Date().getTime();
						}else{
							url += "queryRkDzBySfzh.action?rkdz.rk.sfzh=" + czrkBean.sfzh+ "&t=" + new Date().getTime();
						}
						
						$.ajax({
								url:url,
								type:"post",
								success:function(data){
									eval("data = " + data);
									if(data.fw != null){
										$("#fwid").val(data.fw.fwid);
										$("#dzid").val(data.fw.dzid);
										$("#xzdz").val(data.fw.dzmc);
									}
									if(data.rkfw != null){
										$("#rkfwglid").val(data.rkfw.rkfwglid);
									}
								}
							});
						insertRkxx(czrkBean);	
					}
				});
			}
		});
		//检查从业人员是否存在
		$.ajax({
			url : contextPath + "/zagl/dw/queryCyryPageResultInfo.action",
			type : 'post',
			data : {"cyrycx.sfzh":sfzh,"cyrycx.jgbh":jgbh,"cyrycx.zxbs":'0'},
			success:function(cyrylist){
				eval("var data = " + cyrylist)
				if(data.datas.length > 0){
					alert("人员已经在此单位被登记.");
				}
			}
		});
		
	}
}

/**
 * 自动填充从业人员基本信息
 * @param {} czrkBean
 */
function insertRkxx(czrkBean){
	var fwcs = $("#fwcs").val();
	
	$.each(czrkBean,function(key,value){
		if(key == "xb"){
			$("#xb_hidden").val(value);
		}
		if(key == "mz"){
			$("#mz_hidden").val(value);
		}
		$("#"+key).val(value);
	});
	if(czrkBean != null){
		var zpsrc = contextPath + "/cps/common/showPoto.action?sfzh=";
		$("#rkzpxx").attr("src",zpsrc+czrkBean.sfzh+"&t="+new Date().getTime());
	}
	
	 $("#fwcs").val(fwcs);
}

/**
 * 保存从业人员
 */
function saveCyry()
{
	if($("#jzdpcsdm").val()== "" && $("#jzdsqdm").val() == ""){
		alert("居住地派出所和居住地社区中必须填写一项.");
		return;
	}
	
	var isAdd = false;
	if($("#cyrybh").val() == "" || $("#cyrybh").val() == null){
		isAdd = true;
	}
	
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	
	if ($.validateform("cyry_form")) {
		eventSrcObj.attr("disabled","disabled");
		$("#cyry_form").ajaxSubmit({
			type:"post",
			dataType : "json",
			url : contextPath + "/zagl/dw/saveCyryBean.action?t="+new Date().getTime(),
			success : function(result) 
			{
				if (result == "existcyry")
				{
					alert("该从业人员已经在此单位被登记，无法重复次进行添加.")
				}
				else 
				{
					var dw = result;
					if (dw != null)
					{
						if(isAdd)
						{
							if(confirm("保存从业人员信息成功！是否继续新增？"))
							{
								$("#cyry_form").get(0).reset();
							}
							else
							{
								$.closeWindow();
							}
						}
						else
						{
							var dwBean = dw;
							$("#cyrybh").val(dwBean.cyry.cyrybh);
							alert("保存从业人员信息成功!")
						}
					}
					else
					{
						alert("从业人员新增失败!");
					}
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

/**
 * 人员选择
 */
function rySelect(){
	$.openDialogWindow({
		url : contextPath
				+ "/lsgl/rk/toRkSelectWin.action?t="
				+ new Date().getTime(),
		width : 1000,
		height : 700,
		callback : function(rkjbxx) {
			if(rkjbxx != null){
				var url = contextPath + "/lsgl/rk/";
				if(rkjbxx.rybh != "" && rkjbxx.rybh != null){
					url += "queryRkDzByRybh.action?rkdz.rk.rybh=" + rkjbxx.rybh;
				}else{
					url += "queryRkDzBySfzh.action?rkdz.rk.sfzh=" + rkjbxx.sfzh;
				}
				
				$.ajax({
						url:url,
						type:"post",
						success:function(data){
							eval("data = " + data);
							if(data.fw != null){
								$("#fwid").val(data.fw.fwid);
								$("#dzid").val(data.fw.dzid);
								$("#xzdz").val(data.fw.dzmc);
							}
							if(data.rkfw != null){
								$("#rkfwglid").val(data.rkfw.rkfwglid);
							}
						}
					});
			insertRkxx(rkjbxx);
			}
			
		}
	});
}

/**
 * 查看从业历史
 * @param {} tr
 * @param {} data
 */
function showCyry(tr,data){
	var key = ["bmmc","zwlbmc","pynx","sjhm","qtlxdh","zsqk","pxzs","cyryygh","rzsj","xzdz","dwmc",
				"lzsj","pxzh","fwdx","gzly","bwcs","kzcs","zygx","zywt","jcqk","bz","djrxm","djsj","djdwmc"];
	for(var i = 0 ; i < key.length ; i++){
		if(key[i] != "zxbs"){
			value = data[key[i]];
			if(value == null || value == ""){
				$("#" + key[i]).html("&nbsp;");
			}else{
				$("#" + key[i]).text(data[key[i]]);
			}
		}else{
			if(data[key[i]] == '0'){
				$("#zxbs").text("正常");
			}else if(data[key[i]] == '1'){
				$("#zxbs").text("注销");
			}else{
				$("#zxbs").html("&nbsp;");
			}
		}
	}
}

/**
 * 注销从业人员编号 cyrybh为空时批量注销
 * @param {} cyrybh
 */
function delCyry(cyrybh){
	var param = "";
	if(cyrybh){
		param = cyrybh;
	}else{
		var selectCyry = $("#cyryList").getSelected();
		if(selectCyry.length < 1 ){
			alert("请选择需要注销的人员!");
			return;
		}else{
			for(var i = 0 ; i < selectCyry.length ; i++){
				if(i< selectCyry.length -1){
					param += selectCyry[i].cyrybh +",";
				}else{
					param += selectCyry[i].cyrybh;
				}
			}
		}
	}
	if(window.confirm("确认注销所选人员？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delCyryByCyryBh.action?dw.cyry.cyrybh=" + param + "&t=" + new Date().getTime(),
			type:"post",
			success:function(){
//				queryCyry();
				alert("操作成功!");
			}	
		});
	}
}

/**
 * 恢复注销的从业人员 cyrybh为空时批量恢复
 * @param {} cyrybh
 */
function resetCyry(cyrybh){
		var param = "";
	if(cyrybh){
		param = cyrybh;
	}else{
		var selectCyry = $("#cyryList").getSelected();
		if(selectCyry.length < 1 ){
			alert("请选择需要恢复的人员!");
			return;
		}else{
			for(var i = 0 ; i < selectCyry.length ; i++){
				if(i< selectCyry.length -1){
					param += selectCyry[i].cyrybh +",";
				}else{
					param += selectCyry[i].cyrybh;
				}
			}
		}
	}
	if(window.confirm("确认恢复所选人员？")){
		$.ajax({
			url:contextPath + "/zagl/dw/resetCyryByCyryBh.action?dw.cyry.cyrybh=" + param + "&t=" + new Date().getTime(),
			type:"post",
			success:function(){
//				queryCyry();
				alert("操作成功!");
			}	
		});
	}
}

/**
 * 注销标识切换
 * @param {} value
 */
function zxbsOnchange(value){
	if(value == "0"){
		$("#del").css({display:"inline"});
		$("#reset").css({display:"none"});
	}else if(value == "1"){
		$("#reset").css({display:"inline"});
		$("#del").css({display:"none"});
	}
	
//	queryCyry();
}

//房屋选择
function openFwSelect(){
	$.openDialogWindow({
		url : contextPath
				+ "/zagl/dw/toDwfw.action?dwfwzt=select&t="
				+ new Date().getTime(),
		width : 1000,
		height : 700,
		callback : function(data) {
			if(data == null){
				return;
			}
			if(data.fwxxBean != null){
				$("#xzdz").val(data.fwxxBean.dzmc);
				$("#dzid").val(data.fwxxBean.dzid);
				$("#fwid").val(data.fwxxBean.fwid);
			}
			if(data.rkfw != null){
				$("#rkfwglid").val(data.rkfw.rkfwglid);
			}
		}
	});
	
	
}

/**
 * 打开人员详情
 * @param {} operType
 * @param {} rybh
 * @param {} rylb
 */
function openSyrkInfoPage(operType, rybh, rylb)
{
	var rybh = rybh == undefined ? "" : rybh;
	$.openWindow({
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {"operType" : operType,"queryBean.rybh" : rybh,"queryBean.rylb" :rylb,  t:new Date().getTime()},
		width : 1000,
		height : 760,
		callback : function()
		{
			queryList();
		}
	})
}

/**
 * 查看单位详情（历史从业记录回调）
 * @param {} tr
 * @param {} data
 */
function dwDetail(tr,data){
	var html = "";
	html += "<span class=\"cps_span_href\" onclick=\"openDwDetail('" + data.jgbh + "','" + data.hylb + "','')\">单位详情</span>";
	return html;
}

//打开单位详情
function openDwDetail(jgbh,hylb){
	var url = contextPath + "/sydw/dwgl/toDwInfoPage.action?operType=detail&queryBean.jgbh=" + jgbh;
	$.openWindow({
		url : url,
		width : 1020,
		height : 760
	});
}

function setterXzjwqxx(jwsqobj)
{
	if (jwsqobj)
	{
		$("#xzdjwq").val(jwsqobj["dm"]);
		$("#xzdjwqmc").val(jwsqobj["mc"]);
	}
}

//从业人员注销改变
function zxChange(value){
	if(value == '0'){
		$("#zxyy").attr("disabled","true");
		$("#zxrq").attr("disabled","true");
	}else if(value == '1'){
		$("#zxyy").removeAttr("disabled");
		$("#zxrq").removeAttr("disabled");
	}else{
		$("#zxyy").attr("disabled","true");
		$("#zxrq").attr("disabled","true");
	}
}

function openDjcyrysjrkWin()
{
	var sfjwry = $("#sfjwry").val();
	var cyrybh = $("#cyrybh").val()
	//是境外人员
	if (sfjwry == "1")
	{
		var gj = $("#gj").val();
		var zjzl = $("#zjzl").val();
		var zjhm = $("#zjhm").val();
		var ywm =$("#ywm").val();
		var ywx = $("#ywx").val();
		var xb = $("#xb").val();
	
		var url = contextPath + "/lsgl/jwrk/toJwrkfwSelectPage.action?queryBean.cyrybh="+cyrybh + "&queryBean.gj=" + gj+"&queryBean.zjzl="+zjzl + "&queryBean.zjhm=" + zjhm + "&queryBean.ywm=" + ywm + "&queryBean.ywx=" + ywx + "&queryBean.xb=" + xb;
		layer.load(0);
		document.location.href = url;
	}
	else
	{
		
		var sfzh = $("#sfzh").val();
		var url = contextPath + "/lsgl/fw/toSyrkDjFwSelectPage.action?queryBean.cyrybh=" + cyrybh + "&queryBean.zjzl=111&queryBean.zjhm=" + sfzh + "&queryBean.sfzh=" + sfzh;
		layer.load(0);
		document.location.href = url;
	}
}
var layerObj = null;
function closeLayer()
{
	layer.close(layerObj);
}

function openCyryTxfkWin(cyrybh)
{
	layerObj=$.layer({
		title : "从业人员反馈",
	    type : 2,
	    move : false,
	    title : false,
	    iframe : {
	    	src : contextPath + "/zagl/dw/toCyryfkPage.action?cyryBean.cyrybh="+cyrybh
	    },
	    area : ['700px' , '250px'],
		offset : ['100px','']
	});
}

$(function() {
	if($("#opertype").val() == "update"){
		$("#sfzh").attr("disabled","disabled");
	}
	if($("#dwjbxx_hylb").val() == '09'){
		$("#sjhm").removeAttr("class");
		$("#sjhm").attr("class","validate[custom[phone], maxSize[15], minSize[7]] cps-input");
		$("#sjhm_tag").text("");
		
		$("#lxdh").removeAttr("class");
		$("#lxdh").attr("class"," validate[ custom[phone], maxSize[20], minSize[7]] cps-input");
		$("#lxdh_tag").text("");
	}
})

//人员特殊属性
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
function openZdryInfoPage(operType, sfzh)
{
	$.openWindow({
		url : contextPath + "/lsgl/zdry/toZdryInfoPage.action",
		data : {"operType" : operType,"queryBean.sfzh" : sfzh,  t:new Date().getTime()},
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


//选择社区
function openSqxxSelectWin(xzdjwq,jzdsqdm,jzdsqmc,xzdjwqmc){
	$.openDialogWindow({
		url : contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if (sqjbxxBean)
			{
				$("#"+xzdjwq).val(sqjbxxBean.gxsqjwsdm)
				$("#"+xzdjwqmc).val(sqjbxxBean.gxsqjwsmc)
				$("#"+jzdsqdm).val(sqjbxxBean.sqbh);
				$("#"+jzdsqmc).val(sqjbxxBean.sqmc);
				
				$("#jzdpcsdm").val(sqjbxxBean.sspcsdm);
				$("#jzdpcsmc").val(sqjbxxBean.sspcsmc);
			}
		}
	});
}

//删除从业人员
function deleteCyryByCyrybh(param){
	if(window.confirm("确认删除所选人员，删除后不能恢复？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delteCyryBycyrybh.action?dw.cyry.cyrybh=" + param + "&t=" + new Date().getTime(),
			type:"post",
			success:function()
			{
				alert("操作成功!");
				$("#cyryList").query("F","queryCyryForm");
			}	
		});
	}
}
//导出从业人员
function toExportExcelCyry(){
	var cyrybeans = $("#cyryList").getSelected();
	if (cyrybeans.length > 0)
	{
		if (confirm("你确定导出选择的记录吗？"))
		{
			 $("#exportform").attr("action",contextPath + "/zagl/dw/toExportExcelCyryInfoPage.action");
			 var cyrybhs = [];
			
			 $.each(cyrybeans,function(i){
			 	var cyrybean = cyrybeans[i];
			 	cyrybhs.push(cyrybean["cyrybh"]);
			 });
			
			 var cyrybhsstr = cyrybhs.join(",");
			 $("#cyrybhs").val(cyrybhsstr);
			 $("#exportform").attr("target","exportiframe");
			 $("#exportform").submit();
		 }
	}
	else
	{
		if (confirm("你确定导出满足条件的所有数据吗？"))
		{
			var total = $("#cyryList").getTotalSize();
			if(total < 5000){
				$("#queryCyryForm").attr("target","exportiframe");
				$("#queryCyryForm").attr("action",contextPath + "/zagl/dw/toExportExcelCyryInfoPage.action");
				$("#queryCyryForm").submit();
			}else{
				alert("最多只能导出5000条数据.");
			}
		}
	}
}

/*派出所选择*/
function orgSelect(code,hiddenfield,showfield){
	if (code) {
		openDwSelect2({
			rootOrgCode : code.substr(0,4) + "00000000",
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					if(orgbeans.ispcs !="1"){
						alert("请选择派出所.");
						$("#" + hiddenfield).val("");
						$("#" + showfield).val("");
						return;
					}else{
						$("#" + hiddenfield).val(orgbeans.id);
						$("#" + showfield).val(orgbeans.name);
					}
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

/*清除居住地社区*/
function clearJzdsq(){
	$("#xzdjwq").val('');
	$("#xzdjwqmc").val('');
	$("#jzdsqdm").val('');
	$("#jzdsqmc").val('');
}

/**
 * 清除居住地派出所
 */
function clearJzdPcs(){
	$("#jzdpcsdm").val("");
	$("#jzdpcsmc").val("");
}

//打开从业人员派发窗口
function openCyryPfWin(cyrybh){
	$.openWindow({
		url : contextPath + "/zagl/dw/toCyrypf.action?t=" + new Date().getTime() + "&dw.cyry.cyrybh=" + cyrybh ,
		width : 950,
		height : 500,
		scroll : false
	});
}

/**
 * 从业人员派发
 */
function cyrypf(){
	if($.validateform("cyry_form")){
		$("#cyry_form").ajaxSubmit({
			url:contextPath + "/zagl/dw/Cyrypf.action?t=" + new Date().getTime(),
			type:'post',
			success:function(){
				alert("派发成功!");
				window.close();
			}
		});
	}
}

//房屋选择
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



function updateJnrkCyryBean(cyrybh,jgbh,sfzh)
{
	$.openWindow({
		name : "cyrywin",
		url : contextPath + "/zagl/cyry/toJnCyryDjPage.action",
		data : {
			"cyrycx.sfzh" : sfzh,
			"cyrycx.jgbh" : jgbh,
			"cyrycx.cyrybh" : cyrybh,
			"operType" : "update"
		},
		width:1000,
		height:700,
		scroll : false
	})
}

function updateJwrkCyryBean(cyrybh,jgbh,gj,zjzl,zjhm,ywm,ywx)
{
	$.openWindow({
		name : "cyrywin",
		url : contextPath + "/zagl/cyry/toJwCyryDjPage.action",
		data : {
			"cyrycx.cyrybh" : cyrybh,
			"cyrycx.gj" : gj,
			"cyrycx.ywx": ywx,
			"cyrycx.ywm": ywm,
			"cyrycx.zjzl": zjzl,
			"cyrycx.zjhm": zjhm,
			"cyrycx.jgbh": jgbh,
			"operType" : "update"
		},
		width:1000,
		height:700,
		scroll : false
	})
}


function toImportCyryHcPage()
{
	$("#queryCyryForm").attr("action",contextPath + "/zagl/cyry/toImportCyryHcPage.action");
	$("#queryCyryForm").attr("method","post");
	$("#queryCyryForm").submit();
}