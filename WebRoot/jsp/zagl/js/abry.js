//新增安保人员 (用于单位管理中的从业人员)
function addAbry(){
	var jgbh = $("#jgbh").val();
	var dwmc = encodeURIComponent($("#dwmchidden").val());
	$.openDialogWindow({
		url : contextPath
				+ "/zagl/dw/toCyryDetail.action?dw.cyry.jgbh="+ jgbh +
					"&dw.cyry.dwmc=" + dwmc +"&dw.opertype=add"+
					"&dw.cyry.sfabry=1",
		width : 1000,
		height : 700,
		callback : function() {
			queryCyry();
		}
	});
}