/*查询物业小区*/
function queryWyxq(){
	$("#wyxqList").query("F", "wyxqcx");
}

/**
 * 打开物业小区窗口
 * @param {Object} wyxqId 物业小区ID
 * @param {Object} opertype 操作类型
 */
function openWyxqWin(wyxqId,opertype,ywwygs){
	var url = contextPath + "/zagl/wyxq/toWyxqPage.action?t=" + new Date().getTime() + "&operType=" + opertype ;
	if(wyxqId){
		url += "&wyxq.id=" + wyxqId;
	}
	if(ywwygs){
		url += "&query.ywwygs=" + ywwygs;
	}
	$.openWindow({
		url : url,
		width : 1020,
		height : 900
	});
}

/*打开注销窗口*/
function openWyxqZxWin(wyxqId){
	var url = contextPath + "/zagl/wyxq/toWyxqZxPage.action?t=" 
			+ new Date().getTime() + "&wyxq.id=" + wyxqId;
	$.openWindow({
		url : url,
		width : 900,
		height :400
	});
}
/**
打开登记物业小区安全检查页面

**/

function openWyxqAJWin(wyxqId,opertype){
var url = contextPath + "/zagl/wyxq/toWyxqAjPage.action?t=" 
			+ new Date().getTime() + "&operType=" + opertype;
	if(wyxqId){
		
		url += "&wyxq.id=" + wyxqId;
		$.openWindow({
		url : url,
		width : 1020,
		height : 900
	});
	}
}

/**


 * 保存物业小区
 */
function saveWyxq(){
	//获取事件源
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	var ywwyxq = $("#ywwygs option:selected").val();
	if(ywwyxq == '0'){
		if($("#wygs_div").get(0)){
			$("#wyxqForm").get(0).removeChild($("#wygs_div").get(0));
		}
	}
	if ($.validateform("wyxqForm")){
		eventSrcObj.attr("disabled","disabled")
		$("#wyxqForm").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/wyxq/saveWyxq.action",
			dataType : "json",
			success : function(result){
				if(result != null && result !=""){
					$("#id").val(result.id);
					alert("保存成功.");
				}else{
					alert("保存失败.");
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}
/**
saveWyxqaJ() 
保存物业小区安检信息
*/
function saveWyxqaJ(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	var ok;
	if ($.validateform("wyxqaJForm")){
		ok = checkSfaqjcxz();
		if(ok){
			eventSrcObj.attr("disabled","disabled");
			$("#wyxqaJForm").ajaxSubmit({
				type : "post",
				url : contextPath + "/zagl/wyxq/saveWyxqaJ.action",
				dataType : "json",
				success : function(result){
					if(result != null && result !=""){
						$("#id").val(result.id);
						alert("保存成功.");
						$("#wyxqaJList").query("F", "wyxqaJForm");
					}else{
						alert("保存失败.")
					}
					eventSrcObj.removeAttr("disabled");
				}
			});
		}else{
			alert('带*为必填项！')
		}
	}
}
function checkSfaqjcxz(){
	if(typeof $("#zdlsnbzabwzd1").attr('checked') == 'undefined' && typeof $("#zdlsnbzabwzd0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#lsnbzabwzr1").attr('checked') == 'undefined' && typeof $("#lsnbzabwzr0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#lsygaqffpx1").attr('checked') == 'undefined' && typeof $("#lsygaqffpx0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#lfrywpdjsx1").attr('checked') == 'undefined' && typeof $("#lfrywpdjsx0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#dymjxt1").attr('checked') == 'undefined' && typeof $("#dymjxt0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#spbjxtyz1").attr('checked') == 'undefined' && typeof $("#spbjxtyz0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#sfjztcc1").attr('checked') == 'undefined' && typeof $("#sfjztcc0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#yhbwfdcfdm1").attr('checked') == 'undefined' && typeof $("#yhbwfdcfdm0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#wqsfwh1").attr('checked') == 'undefined' && typeof $("#wqsfwh0").attr('checked') == 'undefined'){
		return false;
	};
	if(typeof $("#sfzgabry1").attr('checked') == 'undefined' && typeof $("#sfzgabry0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sfgqpx1").attr('checked') == 'undefined' && typeof $("#sfgqpx0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sffwqxbj1").attr('checked') == 'undefined' && typeof $("#sffwqxbj0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sfcsgz1").attr('checked') == 'undefined' && typeof $("#sfcsgz0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sfdqjy1").attr('checked') == 'undefined' && typeof $("#sfdqjy0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sfybafz1").attr('checked') == 'undefined' && typeof $("#sfybafz0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sfrzlz1").attr('checked') == 'undefined' && typeof $("#sfrzlz0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sfzzabdw1").attr('checked') == 'undefined' && typeof $("#sfzzabdw0").attr('checked') == 'undefined'){
		return false;
	}; 
	if(typeof $("#sfblzzba1").attr('checked') == 'undefined' && typeof $("#sfblzzba0").attr('checked') == 'undefined'){
		return false;
	};  
	return true;
}
/**
点击列表刷新物业小区安全检查Form
*/
function formQueryList(trobj,rowData){
	$("#wyxqaJForm").eachObjectSetValue(rowData);
	if(rowData.zdlsnbzabwzd == '1'){
		$("#zdlsnbzabwzd1").attr('checked','true');
	}else if(rowData.zdlsnbzabwzd == '0'){
		$("#zdlsnbzabwzd0").attr('checked','true');
	};
	if(rowData.lsnbzabwzr == '1'){
		$("#lsnbzabwzr1").attr('checked','true');
	}else if(rowData.lsnbzabwzr == '0'){
		$("#lsnbzabwzr0").attr('checked','true');
	};
	if(rowData.lsygaqffpx == '1'){
		$("#lsygaqffpx1").attr('checked','true');
	}else if(rowData.lsygaqffpx == '0'){
		$("#lsygaqffpx0").attr('checked','true');
	};
	if(rowData.lfrywpdjsx == '1'){
		$("#lfrywpdjsx1").attr('checked','true');
	}else if(rowData.lfrywpdjsx == '0'){
		$("#lfrywpdjsx0").attr('checked','true');
	};
	if(rowData.dymjxt == '1'){
		$("#dymjxt1").attr('checked','true');
	}else if(rowData.dymjxt == '0'){
		$("#dymjxt0").attr('checked','true');
	};
	if(rowData.spbjxtyz == '1'){
		$("#spbjxtyz1").attr('checked','true');
	}else if(rowData.spbjxtyz == '0'){
		$("#spbjxtyz0").attr('checked','true');
	};
	if(rowData.sfjztcc == '1'){
		$("#sfjztcc1").attr('checked','true');
	}else if(rowData.sfjztcc == '0'){
		$("#sfjztcc0").attr('checked','true');
	};
	if(rowData.yhbwfdcfdm == '1'){
		$("#yhbwfdcfdm1").attr('checked','true');
	}else if(rowData.yhbwfdcfdm == '0'){
		$("#yhbwfdcfdm0").attr('checked','true');
	};
	if(rowData.wqsfwh == '1'){
		$("#wqsfwh1").attr('checked','true');
	}else if(rowData.wqsfwh == '0'){
		$("#wqsfwh0").attr('checked','true');
	};
	if(rowData.sfzgabry == '1'){
		$("#sfzgabry1").attr('checked','true');
	}else if(rowData.sfzgabry == '0'){
		$("#sfzgabry0").attr('checked','true');
	};
	if(rowData.sfgqpx == '1'){
		$("#sfgqpx1").attr('checked','true');
	}else if(rowData.sfgqpx == '0'){
		$("#sfgqpx0").attr('checked','true');
	};
	if(rowData.sffwqxbj == '1'){
		$("#sffwqxbj1").attr('checked','true');
	}else if(rowData.sffwqxbj == '0'){
		$("#sffwqxbj0").attr('checked','true');
	}; 
	if(rowData.sfcsgz == '1'){
		$("#sfcsgz1").attr('checked','true');
	}else if(rowData.sfcsgz == '0'){
		$("#sfcsgz0").attr('checked','true');
	};  
	if(rowData.sfdqjy == '1'){
		$("#sfdqjy1").attr('checked','true');
	}else if(rowData.sfdqjy == '0'){
		$("#sfdqjy0").attr('checked','true');
	}; 
	if(rowData.sfybafz == '1'){
		$("#sfybafz1").attr('checked','true');
	}else if(rowData.sfybafz == '0'){
		$("#sfybafz0").attr('checked','true');
	};  
	if(rowData.sfrzlz == '1'){
		$("#sfrzlz1").attr('checked','true');
	}else if(rowData.sfrzlz == '0'){
		$("#sfrzlz0").attr('checked','true');
	};   
	if(rowData.sfzzabdw == '1'){
		$("#sfzzabdw1").attr('checked','true');
	}else if(rowData.sfzzabdw == '0'){
		$("#sfzzabdw0").attr('checked','true');
	}; 
	if(rowData.sfblzzba == '1'){
		$("#sfblzzba1").attr('checked','true');
	}else if(rowData.sfblzzba == '0'){
		$("#sfblzzba0").attr('checked','true');
	};  
}
/*
新增物业小区安全管理
*/
function crearWyxqaJ(){
	$("#wyxqaJForm").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
	
}
/**
 * 打开社区选择界面
 */
function openSelectSqWin(sqmcId,sqdmId,jwqmcId,jwqdmId){
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
				$("#"+jwqdmId).val(sqjbxxBean.gxsqjwsdm);
				$("#"+jwqmcId).val(sqjbxxBean.gxsqjwsmc);
				$("#"+sqdmId).val(sqjbxxBean.sqbh);
				$("#"+sqmcId).val(sqjbxxBean.sqmc);
				
				if(!$("#sspcsdm").val()){
					$("#sspcsdm").val(sqjbxxBean.sspcsdm);
					$("#sspcsmc").val(sqjbxxBean.sspcsmc);
					$("#ssfxsjmc").val(sqjbxxBean.qxmc);
					$("#ssfxsjdm").val(sqjbxxBean.qxdm);
				}
				createXqdz();
			}
		}
	});
}

/**
 * 注销标识改变
 */
function zxbsChange(value){
	if(value == '1'){
		$("#zxsj").val("");
		$("#zxsj").removeAttr("disabled");
		$("#zxyy").val("");
		$("#zxyy").removeAttr("disabled");
	}else{
		$("#zxsj").attr("disabled","disabled");
		$("#zxyy").attr("disabled","disabled");
	}
}

/**
 * 生成小区地址
 */
function createXqdz(){
	$("#dzmc").val($("#sssqmc").val() + $("#xqmc").val());
}

/*注销物业小区*/
function zxWyxq(){
	if ($.validateform("wyxqForm")){
		$("#wyxqForm").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/wyxq/zxWyxq.action",
			dataType : "json",
			success : function(){
				alert("注销成功.");
			}
		});
	}
}

$(function(){
	if($("#operType").val() == 'detail'){
		$("#wyxqDiv").displayInputForText();

	}
});
/* 打开民警选择窗口
*/
function openZrmjSelect(rootOrgCode,hidden,show)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				 $("#"+hidden).val(userBean["username"]);
				 $("#"+show).val(userBean["realname"]);
			}
		});
}

/**
 * 有无物业小区改变
 * @param {Object} value
 */
function wyxqChage(value){
	if(value == '1'){
		$("#wygs_div").show();
	}else{
		$("#wygs_div").hide();
	}
}

/**
 * 警员选择
 */
function selectUser(orgcode,leve){
	var code;
	if(leve == 5){
		code = orgcode;
	}else{
		if($("#ssjwqdm").val()){
			code = $("#ssjwqdm").val();
		}else{
			alert("请先选择所属社区(村)");
			return;
		}
	}
	openDwRySelect(
		{
			rootOrgCode : code,
			mutilSelect : true
		},
		function (userbean)
		{
			if (userbean)
			{
				$("#sqmjxm").val(userbean[0].realname);
				$("#sqmjjh").val(userbean[0].username);
			}
		});
}

function queryRyBysfz(sfzh){
	if(sfzh){
		queryRkBean(sfzh, function(czrkxxBean) {
			if (czrkxxBean != null) 
			{
				$("#dwfzr").val(czrkxxBean.xm);
				$("#dwfzrlxdh").val(czrkxxBean.lxdh);
			}
		});
	}
}