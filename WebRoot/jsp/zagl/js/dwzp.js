function addDwzp() {
	var trobj = $("#fjsctable").find("tr:last");
	$("#fjsctable").find("tr:last").before("<tr>" + trobj.html() + "</tr>");
}

function deleteDwzp(zpObj, zpid) {

	if (!$.isBlank(zpid)) {
		var flag = window.confirm("删除后将无法恢复，确认删除？");
		if(flag){
			$.ajax({
				url : contextPath + "/zagl/dw/deleteDwzp.action",
				data : {
					"dw.dwzp.id" : zpid
				},
				dataType : "json",
				success : function(result) {
					$(zpObj).parent().parent().remove();
				}
			});
		}

	} else {
		var size = $("#fjsctable").find("input[type=file]").length;
		if (size > 1) {
			$(zpObj).parent().parent().remove();
		} else {
			alert("已经为最后一个无法删除");
		}
	}

}

function hideImage() {
	$("#displayImage").hide();
}

function showImage(zpid) {
	$("#displayImage").find("img:first").attr("src",
			contextPath + "/zagl/dw/showDwzp.action?dw.dwzp.id=" + zpid)
	$("#displayImage").show();
}