/** 单位查询* */
function dwcx() {
	$("#cxjgList").query("F", "dwcx");
}

/**
 * 打开编辑窗口
 * 
 * @param {}
 *            url 地址
 * @param {}
 *            jgbh 机构编号
 * @param {}
 *            hylb 行业类别 (必须)
 * @param {}
 *            op 操作模式
 * @param {}
 *            dzid 地址ID
 */
function openEditWindow(url, jgbh, hylb, op, dzid) {
	if (!url) {
		alert("无效的地址");
		return;
	}

	var path = contextPath + "/zagl/dw/" + url + ".action?t="
			+ new Date().getTime();
	
	if (hylb) {
		path += "&hylb=" + hylb;
	}
			
	if (jgbh) {
		path += "&jgbh=" + jgbh;
	}
	if (op) {
		path += "&dw.opertype=" + op;
	}
	if(dzid){
		path += "&dw.dwjbxx.dzid=" + dzid;
	
	}
	$.openWindow({
				url : path,
				width : 1020,
				height : 900,
				callback : function() {
					dwcx();
					sydwcx();
				}
			});
}

function openDwInfo(params)
{
	var url = contextPath + "/zagl/dw/toDwInfoPage.action?t" + new Date().getTime();
	$.openWindow({
		url : url,
		width : 1020,
		height : 750,
		data : params,
		callback : function() 
		{
			dwcx();
		}
	});
}


function openAddDwInfo(hylb)
{
	openDwInfo({
		"operType" : "add",
		"dwcx.hylb" : hylb
	});
}

function openUpldateDwInfo(jgbh)
{
	
	$.openWindow({
		name : "dwwin",
		url : contextPath + "/sydw/dwgl/toDwInfoPage.action",
		data : {
			"operType" : "update",
			"queryBean.jgbh" :  jgbh
		},
		width:1000,
		height:700
	})
	
	//openDwInfo({
	//	"dw.dwjbxx.jgbh" : jgbh,
	//	"operType" : "update"
	//})
}

function openDetailDwInfo(jgbh)
{
	openDwInfo({
		"dw.dwjbxx.jgbh" : jgbh,
		"operType" : "detail"
	});
}

function toSydwdjFwSelect()
{
	
	layer.load(0);
	//业务部门 内部单位
	$("#dwcx").attr("action",contextPath + "/sydw/dwgl/toSydwdjDwQueryPage.action?dwcx.glbm=1");
	$("#dwcx").submit();
}

/**
 * 打开单位地址选择
 */
function openFwWin(hylb)
{
	
	$("#dwcx").attr("action",contextPath + "/sydw/dwgl/toSydwdjDwQueryPage.action");
	$("#dwcx").submit();
	/**
	$.openWindow({
		url : contextPath + "/zagl/dw/toDwfw.action?dwfwzt=add",
		width:900,
		height:650,
		data : 
		{
			"hylb":hylb,
			"queryBean.czType" :"sydw",
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			dwcx();
		}
	});
	*/
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
	}else{
		var selectDw = $("#cxjgList").getSelected();
		if(selectDw.length < 1){
			alert("请选择需要注销的单位!");
			return ;
		}else{
			for(var i = 0 ; i < selectDw.length ; i++){
				if(i < selectDw.length -1){
					param += selectDw[i].jgbh + ",";
				}else{
					param += selectDw[i].jgbh;
				}
			}
		}
	}
	if(window.confirm("确认注销所选单位？")){
		$.ajax({
			url:contextPath + "/zagl/dw/checkDw.action?t=" + new Date().getTime(),
			data:{'jgbh':param},
			type:"post",
			dataType:"json",
			success:function(result){
				if(result == ""){
					$.ajax({
						url:contextPath + "/zagl/dw/deleteDwByjgbh.action?t=" + new Date().getTime(),
						data:{'dw.dwjbxx.jgbh':param},
						type:"post",
						success:function(result){
							alert("操作成功。");
						}
					});
				}else{
					if(result == "0"){
						alert("该单位下存在从业人员，请先注销从业人员后再注销单位.");
					}else if(result == "1"){
						alert("已经提交过审核，请通过审核后在操作。")
					}
				}
			}
		});
		
		
		
	}
}


function zxbsOnchange(value){
	if(value == "0"){
		$("#del").css({display:"inline"});
		$("#reset").css({display:"none"});
	}else if(value == "1"){
		$("#reset").css({display:"inline"});
		$("#del").css({display:"none"});
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
		var selectDw = $("#cxjgList").getSelected();
		if(selectDw.length < 1){
			alert("请选择需要恢复的单位!");
			return ;
		}else{
			for(var i = 0 ; i < selectDw.length ; i++){
				if(i < selectDw.length -1){
					param += selectDw[i].jgbh + ",";
				}else{
					param += selectDw[i].jgbh;
				}
			}
		}
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



//单位详情
function openDwDetail(jgbh,hylb)
{
	$.openWindow({
		name : "dwwin",
		url : contextPath + "/sydw/dwgl/toDwInfoPage.action",
		data : {
			"operType" : "detail",
			"queryBean.jgbh" :  jgbh
		},
		width:1000,
		height:700
	})
}
//导出单位信息
function toExportExcelDwxx(){
	var sydwbeans = $("#cxjgList").getSelected();
	if (sydwbeans.length > 0)
	{
		if (confirm("你确定导出选择的记录吗？"))
		{
			 $("#exportform").attr("action",contextPath + "/zagl/dw/toExportExcelSydwInfoPage.action");
			 var jgbhs = [];
			
			 $.each(sydwbeans,function(i){
			 	var sydwbean = sydwbeans[i];
			 	jgbhs.push(sydwbean["jgbh"]);
			 });
			
			 var jgbhsstr = jgbhs.join(",");
			 $("#jgbhs").val(jgbhsstr);
			 $("#exportform").attr("target","exportiframe");
			 $("#exportform").submit();
		 }
	}
	else
	{
		if (confirm("你确定导出满足条件的所有数据吗？"))
		{
			var total = $("#cxjgList").getTotalSize();
			if(total < 5000){
				$("#dwcx").attr("target","exportiframe");
				$("#dwcx").attr("action",contextPath + "/zagl/dw/toExportExcelSydwInfoPage.action");
				$("#dwcx").submit();
			}else{
				alert("最多只能导出5000条数据.")
			}
		}
	}
}

//安全检查
function  safeCheck(opertype,isnbmj){
	var dwSelect = $("#cxjgList").getSelected();
	if(dwSelect.length == 1){
		var jcdwdm = dwSelect[0]["jgbh"];
		var jcdwmc = encodeURIComponent(dwSelect[0]["dwmc"]);
		var dwlb =  dwSelect[0]["dwfl"];
		
		if(dwlb == '007' && isnbmj){
			dwlb = "098";
		}
		
		var url = contextPath + "/nbdwaqjc/toAqjcPage.action?jgbh=" 
						+ jcdwdm + "&dwmc=" + dwSelect[0]["dwmc"] + "&dwlb=" + dwlb
						+ "&operType=" +  opertype;
		if(isnbmj){
			url += "&isNbmj=" + isnbmj;
		}				
		$.openWindow({
			url:url,
			width:900,
			height:800
		});
	}else{
		alert("必须且只能选择一条数据.");	
	}
}
//撤销核签
function cxhqCheck(opertype){
	var dwSelect = $("#cxjgList").getSelected();
	if(dwSelect.length == 1){
		var jgbh = dwSelect[0]["jgbh"];
		//var jcdwmc = encodeURIComponent(dwSelect[0]["dwmc"]);
		//var dwlb =  dwSelect[0]["dwfl"];
		var path = contextPath + "/nbdwaqjc/cxhqCheck.action?jgbh=" + jgbh;
		$.ajax({
				url : path,
				success:function(datas){
					if (datas){
						alert('撤销核签成功！');
					}else{
						alert('撤销核签失败！');
					}
				}
		});
	}else{
		alert("必须且只能选择一条数据.");	
	}
}

function nbdwcz(trobj,data){
	var html = "<span class=\"cps_span_href\" onclick=\"openDwDetail('" + data.jgbh + "','" + data.hylb + "')\" style=\"color:green\">详情</span>&nbsp;";
	html += "<span class=\"cps_span_href\" onclick=\"opernDwhcWin('" + data.jgbh + "')\" style=\"color:green\">修改</span>";
	return html;
}

//打开单位核查窗口
function opernDwhcWin(jgbh){
	var path = contextPath + "/sydw/dwgl/toDwGlbmhcPage.action?dwcx.jgbh=" + jgbh + "&dwcx.glbm=2&operType=update";
	$.openWindow({
			url : path,
			width : 1200,
			height : 600
	});
}

function openYjysWin(jgbh){
	var path = contextPath + "/nbdwaqjc/toYjysPage.action?jgbh=" + jgbh;
	$.openWindow({
			url:path,
			width:900,
			height:800
	});
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


function toImportCyryExcel()
{
	var selecteds = $("#cxjgList").getSelected();
	if (selecteds.length == 1)
	{
		openImportCyryXls(selecteds[0]["jgbh"]);
	}
	else if (selecteds.length == 0)
	{
		alert("请选择一条单位记录.")
	}
	else if (selecteds.length > 1)
	{
		alert("只能选择一条单位记录.");
	}
}