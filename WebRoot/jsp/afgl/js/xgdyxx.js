/**
 * 协管队员信息
 */

/**
 * 查询协管队员信息
 */
function queryXgdyxx() {
	$("#xgdyxxList").query("F", "searchform");
}

/**
 * 查询协管队信息
 */
function queryXgdxx() {
	$("#xgdxxList").query("F", "searchform");
}

/**
 * 打开添加协管队员信息窗口
 */
function openAddXgdyxx() {
	$.openDialogWindow({
		url : contextPath + "/xgdyxx/toAddXgdyxx.action?xgdyxxQuery.czbs=1&t="+ new Date().getTime(),
		width : 900,
		height : 600,
		callback:function(){
			$("#xgdyxxList").query("F", "searchform");
		}
	});
	
}

/**
 * 页面上点击新增按钮，将dybh设为空，czbs设为1
 */
function pageAddXgdyxx(){
	$("#dybh").val("");
	$("#czbs").val("1");
	$("#title_id").html("登记协管队员信息");
}

/**
*清空协管队员信息
*/
function clearXgdyxx(){
	$("#xgdytable").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}
/**
 * 保存协管队员信息
 */
function addXgdyxx() {
	if ($.validateform("add_xgdyxx_form")) {
		$("#add_xgdyxx_form").ajaxSubmit({
			type : "post",
			success : function(result) {
				if(result){
					alert("数据保存成功");
					window.close();	
					/*clearXgdyxx();
					$("#xgdyxxList").query("F","add_xgdyxx_form");*/
				}else{
					alert("数据保存失败");
				}
				
			}
		});
	}
}

function setXgdyxx(ryxxBean){
		$("#dyxm").val(ryxxBean["xm"]);
		$("#dyxb").val(ryxxBean["xb"]);
		
		var inputxb =$("#dyxb").attr("inputid");
		if(inputxb != undefined && inputxb!= null && inputxb!=''){
			var text = $("#dyxb").find("option:selected").text();
		    $("#"+inputxb).val(text);
		}
		$("#bmch").val(ryxxBean["bmch"]);
		$("#dycsrq").val(ryxxBean["csrq"]);
		$("#dylxdh").val(ryxxBean["lxdh"]);
		$("#whcd").val(ryxxBean["whcd"]);
		$("#dyxzdxz").val(ryxxBean["xzzxz"]);
		$("#dyhjdxz").val(ryxxBean["hjdqh"]);
		$("#zpxx img").attr("src",contextPath + "/cps/common/showPoto.action?sfzh="+ryxxBean["sfzh"]);
	
}

/**
 * 打开修改协管队员信息窗口
 */
function openUpdateXgdyxxByDybh(dybh) {
	$.openDialogWindow({
		url : contextPath
						+ "/xgdyxx/toUpdateXgdyxxByDybh.action?xgdyxxQuery.czbs=2&xgdyxxQuery.dybh="
						+ dybh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
	$("#xgdyxxList").query("F", "searchform");
}

/**
 * 打开选择协管队信息窗口
 */
function openSelectXgdxx() {
	$.openDialogWindow({
		url : contextPath
						+ "/xgdyxx/toSelectXgdxx.action?t=" + new Date().getTime(),
		width : 600,
		height : 400,
		callback : function(xgdxxBean){
			if(xgdxxBean){
				$("#xgdbh").val(xgdxxBean.xgdbh);
				$("#xgdmc").val(xgdxxBean.xgdmc);
				$("#sssqbh").val(xgdxxBean.sssqbh);
				$("#sssqmc").val(xgdxxBean.sssqmc);
				$("#zjrq").val(xgdxxBean.zjrq);
				$("#fzrxm").val(xgdxxBean.fzrxm);
				$("#fzrlxdh").val(xgdxxBean.fzrlxdh);
			}
			
		}
	});
}

/**
 * 保存批量撤消
 */
function batchDeleteXgdyxx() {
	var selecteds = $("#xgdyxxList").getSelected();
	if (selecteds.length <= 0) {
		alert("请选择要注销的协管队员.");
		return false;
	} else {
		var dybhs = "";
		$.each(selecteds, function(i, xgdyxxBean) {
			dybhs += "," + xgdyxxBean.dybh;
		});

		dybhs = dybhs.substring(1, dybhs.length);
		$.ajax({
			type : "post",
			url : contextPath + "/xgdyxx/batchDeleteXgdyxxByDybhs.action?t="
					+ new Date().getTime() + "&xgdyxxQuery.dybh=" + dybhs,
			success : function(result) {
				if(result){
				alert("注销成功");
				$("#xgdyxxList").query("F", "searchform");
				}
			}
		});
		
	}
}

/**
 * 打开删除协管队员信息窗口
 */
function deleteXgdyxxByDybh(dybh) {
	$.ajax({
		type : "post",
		url : contextPath
						+ "/xgdyxx/deleteXgdyxxByDybh.action?xgdyxxBean.czbs=3&xgdyxxBean.dybh="
						+ dybh + "&t=" + new Date().getTime(),
		success : function(result) {
			if(result){
				alert("注销成功");
				$("#xgdyxxList").query("F", "searchform");
			}
		}
	});
}

/**
 * 查看协管队员信息
 * 
 */
function viewXgdyxxByDybh(dybh) {
	$.openDialogWindow({
		url : contextPath + "/xgdyxx/viewXgdyxxByDybh.action?xgdyxxQuery.dybh="
				+ dybh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
}

/**
 * 设置操作栏
 * 
 * @param trObj
 * @param rowdataObj
 * @returns {String}
 */
function xgdyxxlistCzRowCallback(trObj, rowdataObj) {
	var result = "";
	result += "<span style=\"color:green\" onclick=\"viewXgdyxxByDybh('" + rowdataObj["dybh"]+ "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	if ("1" != rowdataObj["zxbs"]) {
	
		result += "<span style=\"color:green\" onclick=\"openUpdateXgdyxxByDybh('"+ rowdataObj["dybh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"deleteXgdyxxByDybh('"+ rowdataObj["dybh"] + "')\" class=\"cps_span_href\">删除</span>&nbsp;";

	}
	return result;
}

/**
 * 设置新增页面里操作栏
 * 
 * @param trObj
 * @param rowdataObj
 * @returns {String}
 */
function addCzRowCallback(trObj, rowdataObj) {
	var result = "";
	if ("1" != rowdataObj["zxbs"]) {
		result += "<a href=\"javascript:setUpdateXgdyxxByDybh('"
				+ rowdataObj["dybh"] + "')\" class=\"a_2\">修改</a>|";
		result += "<a href=\"javascript:deleteXgdyxxByDybh('"
				+ rowdataObj["dybh"] + "')\" class=\"a_2\">注销</a>|";
	}
	result += "<a href=\"javascript:viewXgdyxxByDybh('" + rowdataObj["dybh"]
			+ "')\" class=\"a_2\">详情</a>";
	return result;
}

/**
 * 选择某个协管队返回协管队对象
 */
function rowClickEvent(trObj, rowDataObj) {
	$.setResultValue(rowDataObj);
	$.closeWindow();
}

function returnXgdxx() {
	var selectes = $("#xgdxxList").getSelected();
	if (selectes.length <= 0) {
		alert("请选择协管队.");
	} else {
		$.setResultValue(selectes[0]);
		$.closeWindow();
	}
}

/**
*计算工龄
*/
function calGl(){
	var begin = $("#sgrq").val();
	var end = $("#lgrq").val();

	if(begin && end){
		
		var date1 = new Date(begin.replace(/-/g, "/")).getTime();
		var date2 = new Date(end.replace(/-/g, "/")).getTime();  
		$("#gl").val(Math.floor((date2-date1)/(1000*3600*24)));
	}else{
		$("#gl").val("0");
	}
}


/**
 * 在修改页面修改协管队员信息窗口
 */
function setUpdateXgdyxxByDybh(dybh)
{
	$.ajax({
		type : "post", 
		url : contextPath + "/xgdyxx/getXgdyxxByDybh.action?xgdyxxQuery.dybh=" 
							+ dybh + "&t=" + new Date().getTime(),
		dataType : "json",
		success : function(xgdyxxBean){
			if(xgdyxxBean){
				$("#add_xgdyxx_form").find("input[name^=xgdyxxBean]").each(function(){
					$(this).val(eval($(this).attr("name")));
				});
				$("#czbs").val("2");
				$("#title_id").html("修改协管队员信息");
			}
		}
	});
}

function setValueToForm(trObj, rowdataobj)
{
	
	$.setFormValue("infoform",rowdataobj);
	$("#czbs").val("2");
	
}

function isExistSfzhInOrg(value){
	var djrdwdm=$("#djrdwdm").val();
	$.ajax({
		url : contextPath + "/xgdyxx/isExistSfzhInOrg.action",
		dataType:"json",
		type:"post",
		data:{
			"xgdyxxBean.dysfzh":value,
			"xgdyxxBean.djrdwdm":djrdwdm
		},
		success: function(msg){
			if(msg){
				alert("该身份证号已经在本单位登记，请重新输入!");
				return ;			
			}else{
				queryRkBean(value,setXgdyxx);	
			}
		}
	
	})
}

$(function(){
	var sfzh=$("#dysfzh").val();
	var dybh=$("#dybh").val();
	if( sfzh !='' && dybh=='' || dybh==null){
		queryRkBean(sfzh,setXgdyxx);
	}		
})
