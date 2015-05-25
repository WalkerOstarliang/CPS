/**
 * 查询大型活动
 */
function queryDxhd(){
	$("#dxhdList").query("F","searchform");
}
/**
 * 选择单位
 */
function selectDw(orgcode, hiddenfield, showfield){
	openDwSelect({
		rootOrgCode : orgcode,
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(orgbeans){
		if(orgbeans){
			$("#"+hiddenfield).val(orgbeans.id);
			$("#"+showfield).val(orgbeans.name);
		}
	});
}
/**
 * 新增大型活动
 */
function openAddDxhd(){
	$.openWindow({
		url : contextPath + "/dxhd/toAddDxhd.action?dxhdBean.czbs=1",
		width : 1020,
		height : 680
	});
	queryDxhd();
}
/**
 * 修改大型活动
 */
function openUpdateDxhdByHdbh(hdbh)
{
	$.openWindow({
		url : contextPath + "/dxhd/toUpdateDxhdByHdbh.action?dxhdBean.czbs=2&dxhdBean.hdbh=" 
							+ hdbh + "&t=" + new Date().getTime(),
		width : 1020,
		height : 680
	});
	queryDxhd();
}
/**
 * 保存大型活动
 */
function addDxhd(){
	if($.validateform("add_dxhd_form")){
		$("#add_dxhd_form").ajaxSubmit({
			dataType :"json",
			type : "post",
			success : function(dxhd) 
			{
				if(dxhd != null)
				{
					$("#hdbh").val(dxhd.hdbh);			
					alert("大型活动信息操作成功");
				}
				else
				{
					alert("大型活动信息保存失败");
				}
			}
		});
	}
}

/**
 * 删除大型活动
 * @param {} hdbh
 */
function deleteDxhdByHdbh(hdbh){
	var flag = window.confirm("确认删除数据?");
	if(flag){
		$.ajax({
			url : contextPath + "/dxhd/deleteDxhdByHdbh.action?t="
					+ new Date().getTime() + "&dxhdBean.hdbh=" + hdbh,
			success : function(){
				alert("删除成功");
				queryDxhd();
			}
		});
	}
}
/**
 * 批量删除大型活动
 */
function batchDeleteDxhdByHdbh(){
	var selecteds = $("#dxhdList").getSelected();
	if (selecteds.length <= 0) {
		alert("请选择需要删除的数据!");
		return false;
	} else {
		var flag = window.confirm("确认删除数据?");
		if(flag){
			var hdbhs = "";
			$.each(selecteds, function(i, dxhdBean) {
				hdbhs += "," + dxhdBean.hdbh;
			});
	
			hdbhs = hdbhs.substring(1, hdbhs.length);
			$.ajax({
				url : contextPath + "/dxhd/batchDeleteDxhdByHdbh.action?t="
						+ new Date().getTime() + "&dxhdBean.hdbh=" + hdbhs,
				type: "POST",
				dataType: "json",
				success : function(){
					alert("删除成功!");
					queryDxhd();
				}
			});
		}
	}
}

function dxhdlistCzRowCallback(trObj, rowdataObj)
{
	var result = "";
	result += "<a href=\"javascript:openUpdateDxhdByHdbh('"+ rowdataObj["hdbh"] +"')\" class=\"a_2\">修改</a>|";
	result += "<a href=\"javascript:deleteDxhdByHdbh('"+ rowdataObj["hdbh"] +"')\" class=\"a_2\">删除</a>|";
	result += "<a href=\"javascript:viewDxhdByHdbh('"+ rowdataObj["hdbh"] +"')\" class=\"a_2\">详情</a>";
	return result;
}

function viewDxhdByHdbh(hdbh){
	$.openWindow({
		url : contextPath + "/dxhd/toViewDxhdByHdbh.action?dxhdBean.czbs=detail&dxhdBean.hdbh=" 
							+ hdbh + "&t=" + new Date().getTime(),
		width : 1020,
		height : 680
	});
}