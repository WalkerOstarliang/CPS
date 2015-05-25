//查询
function query(){
	var dataArea = $("#dataArea");
	dataArea.empty();
	var url = contextPath + "/lsgl/jzzxx/queryJzztj.action?" + $("#jzztjQueryForm").serialize();
	$.post(url,function(htmldata){
			dataArea.html(htmldata);
	});
}

//重置查询条件
function resetForm(){
	$("#jzztjQueryForm").get(0).reset();
}

/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode.substr(0,4) + "00000000",
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
					$("#orgleve").val(orgbeans.leve);
					$("#tjjb").val(orgbeans.leve);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

//居住证统计下钻
function jzztjDown(orgcode,orgnane){
	var tjjb = parseInt($("#tjjb").val());
	$("#tjjb").val(tjjb + 1);
	$("#tjdwdm").val(orgcode);
	$("#tjdwmc").val(orgnane);
	query();
}
// 导出居住证统计结果
function downloadjzztj(divid){
	var v_url = contextPath + "/lsgl/jzzxx/downloadJZZtj.action?" + $("#jzztjQueryForm").serialize();
	$("#iframeid").attr("src",v_url);
	//opendownloadjzztj(v_url);
};
// 打开导出来的页面
function opendownloadjzztj(urls){
	$.openWindow({
		url : urls
	});
};