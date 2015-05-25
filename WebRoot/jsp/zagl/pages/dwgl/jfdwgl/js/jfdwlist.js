/**
 * 技防单位列表js
 */

/*技防单位查询*/
function queryJfdw(){
	$("#jfdwcx").removeAttr("action");
	$("#jfdwcx").removeAttr("target");
	$("#jfdwlist").query("F", "jfdwcx");
}

/*打开技防单位窗口*/
function openJfdwInfo(opertype,jgbh){
	var url = contextPath + "/zagl/dw/toJfdwPage.action?t=" + new Date().getTime();
	if(opertype){
		url += "&operType=" + opertype;
	}
	if(jgbh){
		url += "&jgbh=" + jgbh;
	}
	$.openWindow({
		url : url,
		width : 1020,
		height : 900
	});
}


/**
 * 单位注销
 * @param {} jgbh 机构编号
 * 当参数jgbh号为空时批量注销
 */
function delDw(jgbh){
	var param = "";
	if(jgbh){
		param = jgbh;
	}
	if(window.confirm("确认注销所选单位？")){
		$.ajax({
			url:contextPath + "/zagl/dw/queryDwcyryList.action?t=" + new Date().getTime(),
			data:{'jgbh':param},
			type:"post",
			success:function(result){
				eval("var cyryList = " + result);
				if(cyryList == null || cyryList.length == 0){
					$.ajax({
						url:contextPath + "/zagl/dw/deleteDwByjgbh.action?t=" + new Date().getTime(),
						data:{'dw.dwjbxx.jgbh':param},
						type:"post",
						success:function(result){
							alert("注销成功!");
						}
					});
				}else{
					alert("该单位下存在"+cyryList.length+"名从业人员，请先注销从业人员后再注销单位.");
				}
			}
		});
	}
}

/**
 * 单位恢复
 * @param {} jgbh
 */
function resetDw(jgbh){
	var param = "";
	if(jgbh){
		param = jgbh;
	}else{
		alert("数据错误，不能恢复该单位.");
	}
	if(window.confirm("确认恢复所选单位？")){
		$.ajax({
			url:contextPath + "/zagl/dw/resetDwByJgbh.action?t=" + new Date().getTime(),
			data:{'dw.dwjbxx.jgbh':param},
			type:"post",
			success:function(result){
				alert("恢复成功!");
			}
		});
	}
}

/*打开年审界面*/
function openNsxx(jgbh,opertype){
	var url = contextPath + "/zagl/dw/toJfdwNsxxPage.action?t=" + new Date().getTime();
	
	if(jgbh){
		url += "&jgbh=" + jgbh;
	}
	if(opertype){
		url += "&operType=" + opertype;
	}
	
	$.openWindow({
		url : url,
		width : 1020,
		height : 900
	});
}

/* 导出年审信息 */
function downloadExcel(){
	$("#jfdwcx").attr("action", contextPath + "/zagl/dw/downloadJfdwnsxx.action");
	$("#jfdwcx").attr("target","exportiframe");
	$("#jfdwcx").attr("method","post");
	$("#jfdwcx").get(0).submit();
}