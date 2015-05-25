/**
 * 治保会成员信息
 */

/**
 * 查询治保会成员信息
 */
function queryZbhcyxx() {
	$("#zbhcyxxList").query("F", "searchform");
}

/**
 * 打开添加治保会成员信息窗口
 */
function openAddZbhcyxx() {
	$.openDialogWindow({
		url : contextPath + "/zbhcyxx/toAddZbhcyxx.action?zbhcyxxQuery.czbs=1&t="+ new Date().getTime(),
		width : 900,
		height : 600,
		callback:function(){
			$("#zbhcyxxList").query("F", "searchform");
		}
	});
	
}

/**
 * 保存治保会成员信息
 */
function addZbhcyxx() {
   var czbs = $("#czbs").val();
	if ($.validateform("add_zbhcyxx_form")) 
	{
		$("#add_zbhcyxx_form").ajaxSubmit({
			type : "post",
			success : function(result) 
			{
				if(result != null)
				{
					$("#zbhcybh").val(result)
					if(opener){
						opener.queryZbhCy();
					}
					alert("信息操作成功.");
					window.close();
				}
				else
				{
					alert("信息操作失败.");
				}
			}
		});
	}
}
/**
*清除治保会成员信息
*/
function clearzbhcyxx(){
	$("#zbhcyxxtable").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}

function setValueToForm(trObj, rowdataobj){
	$.setFormValue("infoform",rowdataobj);
	$("#czbs").val("2");
}
/**
 * 页面上点击新增按钮
 */
function pageAddZbhcyxx(){
	$("#zbhcybh").val("");
	$("#czbs").val("1");
	$("#title_id").html("登记治保会成员信息");
}

/**
 * 打开修改治保会成员信息窗口
 */
function openUpdateZbhcyxxByZbhcybh(zbhcybh) {
	$.openDialogWindow({
		url : contextPath
						+ "/zbhcyxx/toUpdateZbhcyxxByZbhcybh.action?zbhcyxxQuery.czbs=2&zbhcyxxQuery.zbhcybh="
						+ zbhcybh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600
	});
}

/**
 * 批量撤销治保会
 * 
 * @returns {Boolean}
 */
function toBatchDeleteZbhcyxx() {
	var selecteds = $("#zbhcyxxList").getSelected();
	if (selecteds.length <= 0) {
		alert("请选择要注销的治保会成员.");
		return false;
	} else {
		var zbhcybhs = "";
		$.each(selecteds, function(i, zbhcyxxBean) {
			zbhcybhs += "," + zbhcyxxBean.zbhcybh;
		});

		zbhcybhs = zbhcybhs.substring(1, zbhcybhs.length);
		$.openDialogWindow({
			url : contextPath + "/zbhcyxx/toBatchDeleteZbhcyxxByZbhcybhs.action?t="
					+ new Date().getTime() + "&zbhcyxxQuery.zbhcybh=" + zbhcybhs,
			width : 900,
			height : 600
		});
		$("#zbhcyxxList").query("F", "searchform");
	}
}

/**
 * 保存批量撤消
 */
function batchDeleteZbhcyxx() {

	if ($.validateform("batchdelete_zbhcyxx_form")) {
		$("#batchdelete_zbhcyxx_form").ajaxSubmit({
			type : "post",
			success : function() {
				$.closeWindow();
			}
		});
	}
}

/**
 * 打开删除治保会成员信息窗口
 */
function openDeleteZbhcyxxByZbhcybh(zbhcybh) {
	$.openDialogWindow({
		url : contextPath
						+ "/zbhcyxx/toDeleteZbhcyxxByZbhcybh.action?zbhcyxxQuery.czbs=3&zbhcyxxQuery.zbhcybh="
						+ zbhcybh + "&t=" + new Date().getTime(),
		width : 900,
		height : 600,
		callback:function(){
			$("#zbhcyxxList").query("F", "searchform");
		}
	});
	
}

/**
 * 查看治保会成员信息
 * 
 */
function viewZbhcyxxByZbhcybh(zbhcybh) {
	$.openDialogWindow({
		url : contextPath + "/zbhcyxx/viewZbhcyxxByZbhcybh.action?zbhcyxxQuery.zbhcybh="
				+ zbhcybh + "&t=" + new Date().getTime(),
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
function zbhcyxxlistCzRowCallback(trObj, rowdataObj) {
	var result = "";
	if ("1" != rowdataObj["tcbs"]) {
	
		result += "<span style=\"color:green\" onclick=\"openUpdateZbhcyxxByZbhcybh('"+ rowdataObj["zbhcybh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"openDeleteZbhcyxxByZbhcybh('"+ rowdataObj["zbhcybh"] + "')\"  class=\"cps_span_href\">注销</span>&nbsp;";
	}
	result += "<span style=\"color:green\" onclick=\"viewZbhcyxxByZbhcybh('" + rowdataObj["zbhcybh"]+ "')\"  class=\"cps_span_href\">详情</span>";	
	return result;
}

//修改时
function updateZbhcyxxCzRowCallback(trObj, rowdataObj){
	var result = "";
	if ("1" != rowdataObj["tcbs"]) {
		result += "<span style=\"color:green\" onclick=\"setZbhcyxxByZbhcybh('"+ rowdataObj["zbhcybh"] + "')\"  class=\"cps_span_href\">修改</span>";	
	}
		result += "<span style=\"color:green\" onclick=\"viewZbhcyxxByZbhcybh('" + rowdataObj["zbhcybh"]+ "')\" class=\"cps_span_href\">详情</span>";	
	return result;
}

function setZbhcyxxByZbhcybh(zbhcybh){
	$.ajax({
		type : "post", 
		url : contextPath + "/zbhcyxx/getZbhcyxxByZbhcybh.action?zbhcyxxQuery.zbhcybh=" 
							+ zbhcybh + "&t=" + new Date().getTime(),
		dataType : "json",
		success : function(zbhcyxxBean){
			if(zbhcyxxBean){
				$("#add_zbhcyxx_form").find("input[name^=zbhcyxxBean]").each(function(){
					$(this).val(eval($(this).attr("name")));
				});
				$("#czbs").val("2");
				$("#title_id").html("修改治保会成员信息");
			}
		}
	});
}
/**
 * 高级查询
 */
function gjQueryZbhcyxx() {
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}
function toGjQueryZbhcyxx() {
	$.openDialogWindow({
		url : contextPath + "/zbhcyxx/toGjQueryZbhcyxx.action?t="
				+ new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams) {
			if (queryParams) {
				$("#zbhcyxxList").query("P", queryParams);
			} else {
				$("#zbhcyxxList").query("F", "searchform");
			}
		}
	});
}

function setZbhcyxx(rkxxBean){
	if (rkxxBean)
	{
		$("#rybh").val(rkxxBean["rybh"]);
		$("#xm").val(rkxxBean["xm"]);
		$("#xb").val(rkxxBean["xb"]);
		$("#hyzk").val(rkxxBean["hyzk"]);
		$("#csrq").val(rkxxBean["csrq"]);
		$("#whcd").val(rkxxBean["whcd"]);
		$("#hjdqh").val(rkxxBean["hjdqh"]);
		$("#hjdxz").val(rkxxBean["hjdxz"]);
		$("#xzdxz").val(rkxxBean["xzzxz"]);
		$("#lxdh").val(rkxxBean["lxdh"]);
		
	}
}
function isExistSfzhInZbh(value){
	var zbhbh=$("#zbhbh").val();
	$.ajax({
	 	url : contextPath + "/zbhcyxx/isExistSfzhInZbh.action",
	 	dataType:"json",
	 	type:"post",
	 	data:{
	 		"zbhcyxxBean.sfzh":value,
	 		"zbhcyxxBean.zbhbh":zbhbh
	 	},
	 	success:function(msg)
	 	{
	 		if(msg){
	 			alert("该身份证号已经登记过了，请重新输入");
	 			return ;
	 		}else{
	 			queryRkBean(value,setZbhcyxx);
	 		}
	 	}
	})
}

function dateMaxorMin(){
	var csrq = $("#csrq").val();
	var cjrq = $("#cjrq").val();
	if(cjrq < csrq  && cjrq !=''){
		alert("参加日期不能在出生日期之前.");
		$("#cjrq").val("");
	}
}
$(function(){
	var sfzh = $("#sfzh").val();
	var zbhcybh = $("#zbhcybh").val();
	if( sfzh!= "" && zbhcybh == '' || zbhcybh == null){
		queryRkBean(sfzh,setZbhcyxx)
	}
})


/**
 * 打开行政区划树
 */
function selectXzqh(hiddenfield, showfield)
{
	openXzqhTree({
		rootOrgCode : "430000",
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(xzqhBean){
		if(xzqhBean){
			$("#"+hiddenfield).val(xzqhBean.id);
			$("#"+showfield).val(xzqhBean.name);
		}
	});
}

/**
 * 填充社区信息
 * @param {} sqxx
 */
function fullSqxx(sqxx){
	if (sqxx)
	{
		$("#sssqdm").val(sqxx["sqbh"]);
		$("#sssqmc").val(sqxx["sqmc"]);
	}
}
