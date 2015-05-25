//查询治保会成员
function queryZbhCy(){
	$("#zbhcyxxList").query("F","zbhcySearchForm");
}

//重置表单
function resetForm(formid){
	$("#" + formid).reset();
}

function zbhcyczrowcallback(tdobj,rowdata)
{
	var html = "";
	html += "<span class=\"cps_span_href\" onclick=\"toUpdateZbhcyxx('" +rowdata['zbhcybh'] + "')\">修改</span>&nbsp;";
	html += "<span class=\"cps_span_href\" onclick=\"zxZbhcyxx('" +rowdata['zbhcybh'] + "')\">注销</span>";
	return html;
}

/**
 * 修改治保会成员
 * @param {} zbhcybh
 */
function toUpdateZbhcyxx(zbhcybh)
{
	$.openWindow({
		url : contextPath + "/zbhcyxx/toAddZbhcyxx.action?zbhcyxxQuery.zbhcybh="+zbhcybh,
		width : 900,
		height : 600
	});
}

/**
 * 注销治保会成员
 * @param {} zbhcybh
 */
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

/**
 * 新增治保会成员
 * @param {} zbhbh
 */
function openAddZbhcyxx() {
	$.openWindow({
		url : contextPath + "/zbhxx/toAddZbhcyxx.action?t="+ new Date().getTime(),
		width : 900,
		height : 600
	});
	
}
