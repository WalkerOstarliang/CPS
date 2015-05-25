function showImage(zpid) {
	$("#displayImage").find("img:first").attr("src",
			contextPath + "/zagl/dw/showDwzp.action?dw.dwzp.id=" + zpid)
	$("#displayImage").show();
}