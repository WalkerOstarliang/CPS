/**
 * 查询单位统计
 */
function queryDwtj(){
	$("#dataArea").empty();
	var url = "";
	url = contextPath + "/tjbb/toDwListPage.action?" + $("#dwqueryform").serialize();
	$.post(url,function(htmldata){
		$("#dataArea").html(htmldata);
	});
}

//单位选择
function dwSelect(code){
	openDwSelect2({
		rootOrgCode : code.substring(0,2) + '0000000000',
		mutilSelect : false,
		nodeSelectedType : "ps",
		nodeNotSelectedType : "ps"
		}, 
		function(orgbeans) {
			if (orgbeans != null) {
				
					$("#dwdm").val(orgbeans.id);
					$("#dwmc").val(orgbeans.name);
			}
		});
}

function downQuery(orgcode){
	$("#dataArea").empty();
	var url = "";
	url = contextPath + "/tjbb/toDwListPage.action" + 
		"?dwQuery.dwdm=" + orgcode + 
		"&tjsj_strat=" + $("#tjsj_strat").val() +
		"&tjsj_end=" + $("#tjsj_end").val();
	$.post(url,function(htmldata){
		$("#dataArea").html(htmldata);
	});
}

function clickExportXls()
{
	$("#dwqueryform").attr("action",contextPath + "/tjbb/downloadDwtj.action");
	$("#dwqueryform").submit();
}