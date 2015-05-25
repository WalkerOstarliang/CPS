/**
 * 查询物业小区通报
 */
function queryWyxqTb(){
	var url = contextPath + "/nbtj/toWyxqTbPage.action?" + $("#wyxqtbQuery").serialize();
	$("#mainiframe",parent.document).attr("src",url);
}

/**
 * 单位选择
 */
function dwselect(orgcode){
	openDwSelect2({
		rootOrgCode : orgcode.substr(0,4) + "00000000",
		mutilSelect : false,
		nodeSelectedType : "ps",
		nodeNotSelectedType : "ps"
		}, 
		function(orgbeans) {
			if (orgbeans != null) {
				$("#orgcode").val(orgbeans.id);
				$("#orgname").val(orgbeans.name);
			}
		});
}

/**
 * 物业小区发案统计查询
 */
function wyxqfatjQuery(){
	if($.validateform("wyxqfatjQuery")){
		var url = contextPath + "/nbtj/toWyxqFaPage.action?"+ $("#wyxqfatjQuery").serialize()
			+ "&t=" + new Date().getTime();
		$("#wyxqfatjFrame").attr("src",url);
	}
}

/**
 * 物业小区发案下钻
 */
function wyxqfatjDown(orgcode){
	var tjrq = $("#tjrq",parent.document).val();
	var url = contextPath + "/nbtj/toWyxqFaPage.action?t=" 
		+ new Date().getTime() + "&query.orgcode=" + orgcode 
		+"&query.tjrq=" + tjrq;
	$("#wyxqfatjFrame",parent.document).attr("src",url);	
}

/**
 * 内保单位发案统计
 */
function nbdwfatjQuery(){
	if($.validateform("nbdwfatjForm")){
		var url = contextPath + "/nbtj/toNbdwFaPage.action?"+ $("#nbdwfatjForm").serialize()
			+ "&t=" + new Date().getTime();
		$("#nbdwfatjFrame").attr("src",url);
	}
}

/**
 * 内保单位发案下钻
 */
function nbdwfatjDown(orgcode){
	var tjsj_start = $("#start",parent.document).val();
	var tjsj_end = $("#end",parent.document).val();
	var url = contextPath + "/nbtj/toNbdwFaPage.action?t=" + new Date().getTime() 
		+ "&query.orgcode=" + orgcode 
		+ "&query.tjsj_start=" + tjsj_start
		+ "&query.tjsj_end=" + tjsj_end;
	$("#nbdwfatjFrame",parent.document).attr("src",url);
}

/**
 * 重点单位发案查询
 */
function zddwfatjQuery(){
	var tjsj_start = $("#start").val();
	var tjsj_end = $("#end").val();
	var dwmc = $("#dwmc").val();
	var url = contextPath + "/nbtj/toZddwfaPage.action?t=" + new Date().getTime() 
		+ "&query.dwmc=" + dwmc 
		+ "&query.tjsj_start=" + tjsj_start
		+ "&query.tjsj_end=" + tjsj_end;
	$("#zddwfatjFrame").attr("src",url);
}

/**
 * 打开案件信息窗口
 * @param {} orgcode
 * @param {} id
 * @param {} dwfl
 * @param {} tjrq
 * @param {} tjsj_start
 * @param {} tjsj_end
 * @param {} ajlx 案件类型 1:扒窃 2:入室盗窃 3：内保单位其他盗窃 4：抢劫抢夺 5:其他案件
 *                       6:盗窃机动车 7:盗窃摩托车 8:盗窃电动车 9:盗窃车内财物 10:物业小区其他盗窃 
 * @param {} cxlx 查询类型 wyxq:物业小区 nbdw:内保单位
 */
function openAjxxWin(orgcode,id,dwfl,tjrq,tjsj_start,tjsj_end,ajlx,cxlx){
	$.openWindow({
		url:contextPath + "/nbtj/toAjxxPage.action",
		data:{"query.orgcode":orgcode,
			  "query.id":id,
			  "query.dwfl":dwfl,
			  "query.tjrq":tjrq,
			  "query.tjsj_start":tjsj_start,
			  "query.tjsj_end":tjsj_end,
			  "query.ajlx":ajlx,
			  "query.lx":cxlx
			 },
		height:"600px",
		width:"1000px"
	});
}

/**
 * 导出物业小区通报
 */
function expWyxqTb(){
	$("#wyxqtbQuery").attr("action",contextPath + "/nbtj/expWyxqTb.action");
	$("#wyxqtbQuery").submit();
}

/**
 * 导出物业小区发案
 */
function expWyxqfa(){
	$("#wyxqfatjQuery").attr("action",contextPath + "/nbtj/expWyxqFaTj.action");
	$("#wyxqfatjQuery").submit();
}

/**
 * 导出内保单位发案
 */
function expnbdwfa(){
	$("#nbdwfatjForm").attr("action",contextPath + "/nbtj/expNbdwfaTj.action");
	$("#nbdwfatjForm").submit();
}

/**
 * 导出重点单位发案
 */
function expZddwfa(){
	$("#nbdwfatjForm").attr("action",contextPath + "/nbtj/expZddwFa.action");
	$("#nbdwfatjForm").submit();
}

/**
 * 导出案件信息
 */
function expAjxx(){
	$("#queryForm").attr("action",contextPath + "/nbtj/expAjxx.action");
	$("#queryForm").submit();
}
