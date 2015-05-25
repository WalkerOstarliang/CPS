var layerObj;
//单位选择
function orgSelect(){
	openDwSelect2({
		rootOrgCode : '430000000000',
		mutilSelect : false,
		nodeSelectedType : "ps",
		nodeNotSelectedType : "ps"
		}, 
		function(orgbeans) {
			if (orgbeans != null) 
			{
				$("#dwdm").val(orgbeans.id);
				$("#dwmc").val(orgbeans.name);
				$("#dwleve").val(orgbeans.leve);
			}
		});
}

//查询季度通报
function queryJdTb(){
	if($.validateform("searchForm")){
		layerObj = layer.load(0);
		$("#searchForm").submit();
	}
}
//重置查询表单
function resetSearchForm(){
	$("#searchForm").reset();
}

$(function(){
	if(parent.layerObj){
		parent.layer.close(parent.layerObj);
	}
	
	if($("#tjnf").get(0)){
		$("#tjnf").val(new Date().getFullYear());
		
		var total = $(document).height();
		var cxpanel = $("#search_panel").height();
		$("#dataArea").height(total - cxpanel -40);
	}
});

/**
 * 下钻
 */
function down(dwdm,dwmc,dwleve){
	$("#dwdm",parent.document).val(dwdm);
	$("#dwmc",parent.document).val(dwmc);
	$("#dwleve",parent.document).val(dwleve);
	parent.queryJdTb();
}

function exportTjbb()
{
	$("#searchForm").attr("target","_blank");
	$("#searchForm").attr("action",contextPath + "/tjbb/exportJdtbDataPage.action");
	$("#searchForm").submit();
	$("#searchForm").attr("target","dataArea");
	$("#searchForm").attr("action",contextPath + "/tjbb/toJdTbDataPage.action");
}