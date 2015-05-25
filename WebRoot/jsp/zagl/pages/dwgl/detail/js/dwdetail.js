$(function(){
	var hylbs = $("#hylb",parent.document).val();
	if(hylbs != "" && hylbs != null && hylbs != "null"){
		var hylb_array = hylbs.split(",");
		if(hylb_array[0] != "10"){
			$("#dwDetai_main").attr("src",contextPath + "/zagl/dw/toDwInfoDetail.action?dw.dwjbxx.jgbh=" + $("#jgbh").val() + "&dw.dwjbxx.hylb=" +hylb_array[0]);
		}
	}
});