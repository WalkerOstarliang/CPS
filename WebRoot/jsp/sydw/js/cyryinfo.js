/**
 * 从业人员查询
 */
function queryCyry() {
	$("#cyryList").query("F", "queryCyryForm");
}


//新增从业人员 (用于单位管理中的从业人员)
function addCyry(sfjwry,hylb){
	var jgbh = $("#jgbh").val();
	$.openWindow({
		url : contextPath + "/zagl/dw/toCyryDetail.action",
		data : {
			"dw.cyry.jgbh" : jgbh,
			"dw.opertype" : "add",
			"dw.cyry.sfzh" : $("#querySfz").val(),
			"dw.cyry.sfjwry" : sfjwry,
			"hylb" : hylb != undefined && hylb != null ?  hylb : ""
		},
		width : 1000,
		height : 700,
		callback : function() {
			queryCyry();
		}
	});
}

/**
 * 加载操作栏(用于单位管理中的从业人员)
 * @param {} tr
 * @param {} data
 * @return {}
 */
function cyryCallback(tr, data) {
	var sfjwry = data.sfjwry;
	var rylb = "";
	if (sfjwry == "1")
	{
		rylb = "4";
	}
	var html = "<span class=\"cps_span_href\" onclick=\"openSyrkInfoPage('rydaxx','" + data.rybh + "','" + rylb + "')\">人员详情</span>&nbsp;";
	if(data.zxbs == "1"){
				//html += "<span class=\"cps_span_href\" onclick=\"resetCyry('" + data.cyrybh + "')\">|&nbsp;恢复</span>";
	}else{
		html += "<span class=\"cps_span_href\" onclick=\"cyryDetail('" + data.cyrybh + "','update')\">修改</span>&nbsp;";
		html += "<span class=\"cps_span_href\" onclick=\"delCyry('" + data.cyrybh + "')\">注销</span>";
	}
	return html;
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
				$("#cyryList").query("F","queryCyryForm");
				alert("操作成功!");
			}	
		});
	}
}

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
			return;
		}
	})
}
