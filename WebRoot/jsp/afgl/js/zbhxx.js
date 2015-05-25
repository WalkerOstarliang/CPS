/**
 * 治保会信息
 */

/**
 * 查询治保会信息
 */
function queryZbhxx() {
	$("#zbhxxList").query("F", "searchform");
}

/**
 * 查询治保会成员西你想信息
 */
function queryZbhcyxx() {
	$("#zbhcyxxList").query("F", "add_zbhxx_form");
}

/**
 * 打开添加治保会信息窗口
 */
function openAddZbhxx() {
	$.openWindow({
		url : contextPath + "/zbhxx/toAddZbhxx.action?zbhxxQuery.czbs=1&t="+ new Date().getTime(),
		width : 900,
		height : 400
	});
	
}

/**
 * 保存治保会信息
 */
function addZbhxx() 
{
	if ($.validateform("add_zbhxx_form")) 
	{
		$("#add_zbhxx_form").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(result) 
			{
				if (result != null)
				{
					$("#zbhbh").val(result)
					alert("数据保存成功.");
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		});
	}
}
/**
 * 打开添加治保会成员信息窗口
 */
function openAddZbhcyxx(zbhbh) {
	$.openWindow({
		url : contextPath + "/zbhxx/toAddZbhcyxx.action?zbhbh="+zbhbh+"&t="+ new Date().getTime(),
		width : 900,
		height : 600
	});
	
}
function saveAndadd(){
	var zbhbh = $("#zbhbh").val();
	if (!$.isBlank(zbhbh))
	{
		openAddZbhcyxx(zbhbh);
	}
}
/**
 * 打开修改治保会信息窗口
 */
function openUpdateZbhxxByZbhbh(zbhbh) 
{
	$.openWindow({
		url : contextPath + "/zbhxx/toUpdateZbhxxByZbhbh.action?zbhxxQuery.czbs=2&zbhxxQuery.zbhbh=" + zbhbh + "&zbhbh="+zbhbh,
		width : 900,
		height : 400
	});
	
}

/**
 * 批量撤销治保会
 * 
 * @returns {Boolean}
 */
function toBatchDeleteZbhxx() {
	var selecteds = $("#zbhxxList").getSelected();
	if (selecteds.length <= 0) {
		alert("请选择要注销的治保会.");
		return false;
	} else {
		var zbhbhs = "";
		$.each(selecteds, function(i, zbhxxBean) {
			zbhbhs += "," + zbhxxBean.zbhbh;
		});

		zbhbhs = zbhbhs.substring(1, zbhbhs.length);
		$.openDialogWindow({
			url : contextPath + "/zbhxx/toBatchDeleteZbhxxByZbhbhs.action?t="
					+ new Date().getTime() + "&zbhxxQuery.zbhbh=" + zbhbhs,
			width : 900,
			height : 400
		});
		$("#zbhxxList").query("F", "searchform");
	}
}

/**
 * 保存批量撤消
 */
function batchDeleteZbhxx() {

	if ($.validateform("batchdelete_zbhxx_form")) {
		$("#batchdelete_zbhxx_form").ajaxSubmit({
			success : function() {
				$.closeWindow();
			}
		});
	}
}

/**
 * 打开删除治保会信息窗口
 */
function openDeleteZbhxxByZbhbh(zbhbh) {
	$.openDialogWindow({
		url : contextPath
						+ "/zbhxx/toDeleteZbhxxByZbhbh.action?zbhxxQuery.czbs=3&zbhxxQuery.zbhbh="
						+ zbhbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
	$("#zbhxxList").query("F", "searchform");
}

/**
 * 查看治保会信息
 * 
 */
function viewZbhxxByZbhbh(zbhbh) {
	$.openDialogWindow({
		url : contextPath + "/zbhxx/viewZbhxxByZbhbh.action?zbhxxQuery.zbhbh="
				+ zbhbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});
}

/**
 * 查看治保会成员信息
 * 
 */
function viewZbhcyxxByZbhbh(zbhbh,zbhmc){
	$.openDialogWindow({
		url : contextPath + "/zbhcyxx/toZbhcyxxListByZbhbh.action?zbhcyxxQuery.zbhbh="
				+ zbhbh + "&zbhcyxxQuery.zbhmc=" + encodeURI(encodeURIComponent(zbhmc)) + "&t=" + new Date().getTime(),
		width : 900,
		height : 400
	});	
}

/**
 * 设置操作栏
 * 
 * @param trObj
 * @param rowdataObj
 * @returns {String}
 */
function zbhxxlistCzRowCallback(trObj, rowdataObj) {
	var result = "";
	result += "<span style=\"color:green\" onclick=\"viewZbhxxByZbhbh('" + rowdataObj["zbhbh"]+ "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	if ("1" != rowdataObj["zxbs"]) {
		result += "<span style=\"color:green\" onclick=\"openUpdateZbhxxByZbhbh('"+ rowdataObj["zbhbh"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"openDeleteZbhxxByZbhbh('"+ rowdataObj["zbhbh"] + "')\" class=\"cps_span_href\">注销</span>&nbsp;";
		result += "<span style=\"color:green\" onclick=\"openAddZbhcyxx('" + rowdataObj["zbhbh"]+ "')\" class=\"cps_span_href\">添加成员</span>&nbsp;";
	}
	return result;
}

/**
 * 选择某个治保会返回治保会对象
 */
function rowClickEvent(trObj, rowDataObj) {
	$.setResultValue(rowDataObj);
	$.closeWindow();
}

function returnZbhxx() {
	var selectes = $("#zbhxxList").getSelected();
	if (selectes.length <= 0) {
		alert("请选择治保会.");
	} else {
		$.setResultValue(selectes[0]);
		$.closeWindow();
	}
}

/**
 * 高级查询
 */
function gjQueryZbhxx() {
	var params = $.getFormParams("gjsearchform");
	$.setResultValue(params);
	$.closeWindow();
}
function toGjQueryZbhxx() {
	$.openDialogWindow({
		url : contextPath + "/zbhxx/toGjQueryZbhxx.action?t="
				+ new Date().getTime(),
		width : 900,
		height : 400,
		callback : function(queryParams) {
			if (queryParams) {
				$("#zbhxxList").query("P", queryParams);
			} else {
				$("#zbhxxList").query("F", "searchform");
			}
		}
	});
}

/**
*加载所属警务室
**/
function openJwsDwSelect(hiddenfield,showfield){
	var rootOrgCode = $("#sspcsdm").val();
	if(rootOrgCode==null){
		alert("请先选择所属派出所信息");
	}
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
    	if (orgBean)
    	{
    		$("#"+hiddenfield).val(orgBean["id"]);
       		$("#"+showfield).val(orgBean["name"]);
    	}
      
    });
}

function isExistZbhmc(value){
	var djdwdm=$("#djdwdm").val();
	$.ajax({
		url : contextPath + "/zbhxx/isExistZbhmc.action",
		dataType:"json",
		type:"post",
		data:{
			"zbhxxBean.zbhmc":value,
			"zbhxxBean.djdwdm":djdwdm
		},
		success:function(msg){
			if(msg){
				alert("该治保会名称在此单位已经登记过了，请重新输入！");
				return;
			}
		}
	})
}


function setSqxxToPage(sqjbxxBean)
{
	if (sqjbxxBean != null)
	{
		$("#sssqdm").val(sqjbxxBean["sqbh"]);
		$("#sssqmc").val(sqjbxxBean["sqmc"]);
		$("#sssqjwdm").val(sqjbxxBean["gxsqjwsdm"])
		$("#sssqjwmc").val(sqjbxxBean["gxsqjwsmc"])
		$("#sspcsdm").val(sqjbxxBean["gxsqjwsdm"].substr(0,8) + "0000")
		$("#sspcsmc").val(sqjbxxBean["sspcsmc"])
		
	}
}

function zbhcyczrowcallback(tdobj,rowdata)
{
	var html = "";
	html += "<span class=\"cps_span_href\" onclick=\"toUpdateZbhcyxx('" +rowdata['zbhcybh'] + "')\">修改</span>&nbsp;";
	html += "<span class=\"cps_span_href\" onclick=\"zxZbhcyxx('" +rowdata['zbhcybh'] + "')\">注销</span>";
	return html;
}


function toUpdateZbhcyxx(zbhcybh)
{
	$.openWindow({
		url : contextPath + "/zbhcyxx/toAddZbhcyxx.action?zbhcyxxQuery.zbhcybh="+zbhcybh,
		width : 900,
		height : 600
	});
}

function zxZbhcyxx(zbhcybh)
{
	if (confirm("你确定要注销该成员吗？"))
	{
		$.ajax({
			type : "post",
			url : contextPath + "/zbhcyxx/zxZbhcyxx.action",
			data : "zbhcyxxQuery.zbhcybh=" + zbhcybh,
			dataType : "json",
			success : function(result)
			{
				if (result == true)
				{
					alert("成员注销成功.");
					$("#zbhcyxxList").query("F","add_zbhxx_form");
				}
				else
				{
					alert("成员注销失败,请稍后再试。");
				}
			}
		});
	}
}