function saveTzhyLgyBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("tzhylgyform"))
	{
		$("#tzhylgyform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var thbh = dwBean["tzhy"]["thbh"];
					var lgbh =dwBean["thlgy"]["lgbh"];
					$("#lgbh").val(lgbh);
					$("#thbh").val(thbh);
					alert("保存特种行业旅馆信息成功.")
				}
				else
				{
					alert("保存特行旅馆业信息失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveThksyBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("thksyform"))
	{
		$("#thksyform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var thbh = dwBean["tzhy"]["thbh"];
					var ksbh =dwBean["thksyBean"]["ksbh"];
					$("#thbh").val(thbh);
					$("#ksbh").val(ksbh);
					alert("保存特种行业开锁业信息成功.")
				}
				else
				{
					alert("保存特行开锁业信息失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveTzhyBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("tzhyform"))
	{
		$("#tzhyform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var thbh = dwBean["tzhy"]["thbh"];
					$("#thbh").val(thbh);
					if (confirm("保存特种行业信息成功,是否关闭窗口。"))
					{
						window.close();
					}
				}
				else
				{
					alert("保存特行信息失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveGgcsBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("ggcsform"))
	{
		$("#ggcsform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var jlbh = dwBean["ggcs"]["jlbh"];
					$("#ggcsjlbh").val(jlbh);
					if (confirm("保存公共场所信息成功,是否关闭窗口。"))
					{
						window.close();
					}
				}
				else
				{
					alert("保存公共场所信息失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveSwfwcsBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("swfwcsform"))
	{
		$("#swfwcsform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var jlbh = dwBean["swfwcs"]["jlbh"];
					$("#swfwcsjlbh").val(jlbh);
					if (confirm("保存上网服务场所成功,是否关闭窗口。"))
					{
						window.close();
					}
				}
				else
				{
					alert("保存上网服务场失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveNbdwBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("nbdwform"))
	{
		$("#nbdwform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var nbdwbh = dwBean["nbdw"]["nbdwbh"];
					$("#nbdwbh").val(nbdwbh);
					if (confirm("保存内保单位信息成功,是否关闭窗口。"))
					{
						window.close();
					}
				}
				else
				{
					alert("保存内保单位信息失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveWxwpdwBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("wxpdwform"))
	{
		$("#wxpdwform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var thbh = dwBean["wxwpdwBean"]["jlbh"];
					$("#wxwpdwjlbh").val(thbh);
					if (confirm("保存危险物品单位信息成功,是否关闭窗口。"))
					{
						window.close();
					}
				}
				else
				{
					alert("保存危险物品单位信息失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function saveSwdwBean()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("swfwform"))
	{
		$("#swfwform").ajaxSubmit({
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					var thbh = dwBean["swdwBean"]["jlbh"];
					$("#swdwlbh").val(thbh);
					if (confirm("保存涉外单位信息成功,是否关闭窗口。"))
					{
						window.close();
					}
				}
				else
				{
					alert("保存涉外单位信息失败,请稍后再试.");
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function(error)
			{
				alert("系统保存发生错误，请稍后再试。");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}


function queryRyBysfz(sfzh,xm,lxdh)
{
	queryRkBean(sfzh, function(czrkxxBean) {
		if (czrkxxBean != null) 
		{
			$("#" + xm).val(czrkxxBean.xm);
			$("#" + lxdh).val(czrkxxBean.lxdh);
		}
	});
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
				 	$("#dwjcList").query("F","dwjcqueryform");
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}
//单位检查列表点击查看详情
function dwjcClickRowcallback(trObj,rowdata)
{
	$("#dwjc_div").eachObjectSetValue(rowdata);
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
					alert("信息保存成功!");
					$("#zdyhbwList").query("F","zdyhbwqueryform");
					$("#dw_form").reset();
					
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

//重点要害部位点击查看详情
function zdyhbwClickRowCallback(trObj,rowdata)
{
	$("#zdyhbw_div").eachObjectSetValue(rowdata);
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
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

//保存安保设施
function saveAbss(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("abssform")){
		eventSrcObj.attr("disabled","disabled");
		$("#abssform").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveAbss.action",
			dataType : "json",
			success : function(result)
			{
				alert("保存安保设施信息成功.")
				window.document.location.reload();
			}
		});
	}
}

//删除安保设施
function delAbss(ssbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delAbss.action?dw.abss.ssbh=" + ssbh,
			type:"post",
			success:function(){
				window.document.location.reload();
				alert("删除成功!")
			}
		});
	}
}

//入侵子系统
function rqxtChange(value){
	if(value == "1"){
		$("#rqxtlwqk").removeAttr("disabled");
		$("#tcqsl").removeAttr("disabled");
		$("#gdmbs").removeAttr("disabled");
		$("#ydmbs").removeAttr("disabled");
	}else if(value=='0'){
		$("#rqxtlwqk").attr("disabled","true");
		$("#tcqsl").attr("disabled","true");
		$("#gdmbs").attr("disabled","true");
		$("#ydmbs").attr("disabled","true");
	}
}

//视频监控系统
function spjkxtChange(value){
	if(value == "1"){
		$("#sgdw").removeAttr("disabled");
		$("#sxjsl").removeAttr("disabled");
		$("#spjkxtlwqk").removeAttr("disabled");
		$("#txbcts").removeAttr("disabled");
		$("#yxqk").removeAttr("disabled");
		$("#xtzj").removeAttr("disabled");
	}else if(value='0'){
		$("#sgdw").attr("disabled","true");
		$("#sxjsl").attr("disabled","true");
		$("#spjkxtlwqk").attr("disabled","true");
		$("#txbcts").attr("disabled","true");
		$("#yxqk").attr("disabled","true");
		$("#xtzj").attr("disabled","true");
		
	}
}

function loadAfxtxx(tr,data){
	$.each(data,function(key,value){
		if(key == "jgbh"){
			$("#abss_jgbh").val(value);
		}else if(key == "afglsx"){
			$("#afglsxdl").val(data["afglsxdl"]);
			$("#afglsx").val(value);
		}else if(key != "afglsxdl"){
			$("#" + key).val(value);
			
			if(key=="ywrqbjzxt" ){
				$("input[name='dw.abss.ywrqbjzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
				if(value=='1'){
					$("input[name='dw.abss.ywrqbjzxt']")
					$("#rqxtlwqk").removeAttr("disabled");
					$("#tcqsl").removeAttr("disabled");
					$("#gdmbs").removeAttr("disabled");
					$("#ydmbs").removeAttr("disabled");
				}
			}
			if(key=="ywspjkzxt" ){
				$("input[name='dw.abss.ywspjkzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
				if(value=="1"){
					$("#sgdw").removeAttr("disabled");
					$("#sxjsl").removeAttr("disabled");
					$("#spjkxtlwqk").removeAttr("disabled");
					$("#txbcts").removeAttr("disabled");
					$("#yxqk").removeAttr("disabled");
					$("#xtzj").removeAttr("disabled");
				}
			}
			if(key == "ywcrkjkzxt"){
				$("input[name='dw.abss.ywcrkjkzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
			}
			if(key == "ywdzxcxt"){
				$("input[name='dw.abss.ywdzxcxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
			}
			if(key == "ywtckglzxt"){
				$("input[name='dw.abss.ywtckglzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
			}
		}
	});
}

/**
 * 从业人员查询
 */
function queryCyry() {
	$("#cyryList").query("F", "queryCyryForm");
}

//新增安保人员 (用于单位管理中的从业人员)
function addAbry(){
	var jgbh = $("#jgbh").val();
	var dwmc = encodeURIComponent($("#dwmchidden").val());
	$.openWindow({
		url : contextPath+ "/zagl/dw/toCyryDetail.action",
		data : {
			"dw.cyry.jgbh" : jgbh,
			"dw.cyry.dwmc" : "",
			"dw.opertype" : "add",
			"dw.cyry.sfabry" : "1"
		},
		width : 1000,
		height : 700
	});
}

/**
 * 加载操作栏(用于单位管理中的从业人员)
 * @param {} tr
 * @param {} data
 * @return {}
 */
function cyryCallback(tr, data) 
{
	var html = "<span class=\"cps_span_href\" onclick=\"openSyrkInfoPage('rydaxx','" + data.rybh + "','')\">人员详情</span>&nbsp;";
	if(data.zxbs == "1"){
		//html += "<span class=\"cps_span_href\" onclick=\"resetCyry('" + data.cyrybh + "')\">|&nbsp;恢复</span>";
	}else{
		html += "<span class=\"cps_span_href\" onclick=\"cyryDetail('" + data.cyrybh + "','update')\">修改</span>&nbsp;";
		html += "<span class=\"cps_span_href\" onclick=\"delCyry('" + data.cyrybh + "')\">注销</span>";
	}
	return html;
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
			height : 700,
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
				alert("操作成功!");
			}	
		});
	}
}

//保存灾害事故
function saveZhsg(){
	$("#zhsg_jgbh").val($("#jgbh").val());
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("zhsg_form")){
		eventSrcObj.attr("disabled","diaabled")
		$("#zhsg_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveZhsg.action",
			dataType : "json",
			success : function(result){
				alert("灾害事故信息保存成功!");
				window.document.location.reload();
			}
		});
	}
}

//加载灾害事故
function loadZhsg(tr,data){
	$.each(data,function(key,value){
		if(key == 'jgbh'){
			$("#zhsg_jgbh").val(value);
		}else{
			$("#" + key).val(value);
		}
	});
}

//删除灾害事故
function delZhsg(bh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delZhsg.action?dw.zhsg.bh=" + bh,
			type:"post",
			success:function(){
				alert("灾害事故删除成功!");
				window.document.location.reload();
			}
		});
	}
}

/**
 * 打开保卫机构
 * @param {} url 地址
 * @param {} opertype 操作类型
 */
function openBwjg(url,opertype,pk){
	var jgbh = $("#jgbh").val();
	if(opertype != 'detail'){
		$.openDialogWindow({
			url : contextPath + "/zagl/dw/" + url + ".action",
			width:600,
			height:300,
			data : {"jgbh":jgbh,"operType":opertype,"dw.bwjg.bwjgbh":pk,
					"dw.bwzd.zdbh":pk,"dw.bwjys.jysbh":pk,"t": new Date().getTime()},
			callback : function(result){
				window.document.location.reload();
			}
		});
	}else{
		$.openWindow({
			url : contextPath + "/zagl/dw/" + url + ".action",
			width:900,
			height:400,
			data : {"jgbh":jgbh,"operType":opertype,"dw.bwjg.bwjgbh":pk,
					"dw.bwzd.zdbh":pk,"dw.bwjys.jysbh":pk,"t": new Date().getTime()}
		});
	}
	
}
//删除保卫机构
function delBwjg(bwjgbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBwjg.action?dw.bwjg.bwjgbh=" + bwjgbh,
			type:"post",
			success:function(){
				alert("删除成功!");
				window.document.location.reload();
			}
		});
	}
}

//删除保卫制度
function delBwzd(zdbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBwzd.action?dw.bwzd.zdbh=" + zdbh,
			type:"post",
			success:function(){
				alert("删除成功!");
				window.document.location.reload();
			}
		});
	}
}

//删除保卫建议书
function delBwjys(jysbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBwjys.action?dw.bwjys.jysbh=" + jysbh,
			type:"post",
			success:function(){
				alert("删除成功!");
			}
		});
	}
}

//保存不安定因素
function saveBadys(){
	if($("#badys_jgbh").val() == "" || $("#badys_jgbh").val() == null){
		$("#badys_jgbh").val($("#jgbh").val())
	}
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("badys_form")){
		eventSrcObj.attr("disabled","disabled");
		$("#badys_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveBadys.action",
			dataType : "json",
			success : function(result){
				alert("不安定因素保存成功!");
				window.document.location.reload();
			}
		});
	}
}

//删除不安定因素
function delBadys(bh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBadys.action?dw.badys.bh=" + bh,
			type:"post",
			success:function(){
				alert("不安定因素删除成功!");
				window.document.location.reload();
			}
		});
	}
}

//加载不安定因素信息
function onloadBadxx(tr,data){
	var url = contextPath + "/zagl/dw/toBadys.action?t=" + new Date().getTime();
	var param = {"dw.badys.bh":data.bh,"jgbh":data.jgbh};
	$.post(url,param,function(htmldata){
			$("#dwjbxx").hide();
			$("#dwtxxx").hide()
			$("#contentpanel").html(htmldata);
			$("#contentpanel").show();
			
			if($("#lx").val() == '01'){
				$("#bxxsdl").removeAttr("disabled");
				$("#bxxs").removeAttr("disabled");
				$("#sdgm").removeAttr("disabled");
			}else{
				$("#bxxsdl").attr("disabled","true");
				$("#bxxs").attr("disabled","true");
				$("#sdgm").attr("disabled","true");
			}	
		});
}

function lxChange(value){
	if(value == "01"){
		$("#bxxsdl").removeAttr("disabled");
		$("#bxxs").removeAttr("disabled");
		$("#sdgm").removeAttr("disabled");
	}else{
		$("#bxxsdl").attr("disabled","true");
		$("#bxxs").attr("disabled","true");
		$("#sdgm").attr("disabled","true");
	}
}