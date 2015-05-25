/*根据不同的考核类型加载不同的数据数据列表*/
function ajaxLoadDataPage(){
	var url = contextPath + "/xtgl/sjhc/toDataPage.action";
	var khlx = $("#khlx").get(0).value;
	var data = {"query.khlx": khlx,"t":new Date().getTime()};
	$.post(url,data,function(htmlstr){
		$("#datamain").empty();
		$("#datamain").html(htmlstr);
		loadDataByKhlx();
	});
}

/*根据考核类型加载列表数据*/
function loadDataByKhlx(){
	$("#dataList").query("F", "queryForm")
}

/*从业人员操作*/
function cyryCz(tr, data){
	var html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/zagl/dw/toCyryDetail.action?isxttxpage=true&dw.opertype=update&dw.cyry.cyrybh=" + data.cyrybh + "')" +
			   "\">办理</span>";
	return html;
}

/*流动人口操作*/
function ldrkCz(tr,data){
	var html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/lsgl/rk/toLdrkYanQi.action?rkBean.ldrkBean.rybh=" + data.rybh + "&zzbh=" + data.zzbh + "')" +
			   "\">办理</span>";
	return html;
}

/*出租房屋操作*/
function czfwCz(tr,data){
	var html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/lsgl/fw/toFwxcInfoPage.action?operType=update&queryBean.fwid=" + data.fwid + "')" +
			   "\">办理</span>";
	return html;
}

/*实体操作*/
function stCz(tr,data){
	var html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/dzgl/dzxx/toStxxDetailPageInfo.action?a=b&operType=update&stxxBean.id=" + data.id + "')" +
			   "\">办理</span>";
	return html;
}

/*房屋操作*/
function fwCz(tr,data){
	var html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/lsgl/fw/toFwInfoPage.action?operType=update&queryBean.sfczw=1&queryBean.fwid=" + data.fwid + "')" +
			   "\">办理</span>";
	return html;
}

/*重点人员操作*/
function zdryCz(tr,data){
	var khlx = $("#khlx").get(0).value;
	var html = "";
	if(khlx == '201' || khlx == '203'){
		html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/lsgl/zdry/toZdryInfoPage.action?a=b&operType=update&showMenu=showMenu&queryBean.sfzh=" + data.sfzh + "')" +
			   "\">办理</span>";
	}else if(khlx == '202'){
		html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/lsgl/zdry/toZdryJgPage.action?a=b&operType=update&zdryBean.tgxxId=" + data.tgxxId + "&queryBean.rybh=" + data.rybh + "')" +
			   "\">办理</span>";;
	}
	return html;
}

/*盘查操作*/
function pcCz(tr,data){
	var html = "";
	html = "<span class=\"cps_span_href\" onclick=\"" +
			   "openOperateWin('" + contextPath + "/afgl/lmpcxx/toAddLmpcxx.action?a=b&operType=detail&t=1395303885937&jlbh=" + data.jlbh + "')" +
			   "\">详情</span>";
	return html;
}

/*打开办理窗口*/
function openOperateWin(url){
	$.openWindow({
		url : url + "&t=" + new Date().getTime(),
		width:900,
		height:700
	});
}