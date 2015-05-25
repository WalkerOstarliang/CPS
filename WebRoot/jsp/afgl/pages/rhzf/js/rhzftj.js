/**
 * 查询入户走访统计
 */
var load;
function queryRhzfTj(){
	$("#isExp").val("false");
	$("#searchForm").attr("target","dataArea");
	$("#searchForm").submit();
	load = layer.load(0);
}

/**
 * 重置查询条件表单
 */
function clearSearhForm(){
	$("#searchForm").reset();
}

/**
 * 返回
 */
function back(){
	$("#isExp",parent.document).val("false");
	var dwleve = $("#dwleve",parent.document).val();
	if(dwleve == "6"){
		var jwsdm = $("#jwsdw").val();
		if(jwsdm){
			$("#parent_dm",parent.document).val(jwsdm.substring(0,8) + "3100");
			$("#dwleve",parent.document).val("5");
		}
	}else if(dwleve == "5"){
		var parent_dm = $("#parent_dm",parent.document).val();
		$("#parent_dm",parent.document).val(parent_dm.substring(0,6) + "000000");
		$("#dwleve",parent.document).val("4");
	}else if(dwleve == "4"){
		var parent_dm = $("#parent_dm",parent.document).val();
		$("#parent_dm",parent.document).val(parent_dm.substring(0,4) + "00000000");
		$("#dwleve",parent.document).val("3");
	}
	load = layer.load(0);
	$("#searchForm",parent.document).attr("target","dataArea");
	$("#searchForm",parent.document).submit();

}

/**
 * 下钻
 */
function down(dwdm,dwleve){
	$("#isExp",parent.document).val("false");
	if(dwleve == 4){
		$("#parent_dm",parent.document).val(dwdm.substring(0,8)+"3100");
	}else{
		$("#parent_dm",parent.document).val(dwdm);
	}
	$("#dwleve",parent.document).val(dwleve + 1);
	load = layer.load(0);
	$("#searchForm",parent.document).attr("target","dataArea");
	$("#searchForm",parent.document).submit();
}

/**
 * 入户走访统计导出
 */
function expRhzfTj(){
	$("#isExp").val("true");
	$("#searchForm").attr("target","expFrame");
	$("#searchForm").submit();
}

$(function(){
	if(parent.load){
		parent.layer.close(parent.load);
	}
});