/**
 * 返回
 */
function xchdUp(){
	var orgcode = $("#orgcode").val();
	var orgLeve = $("#orgleve").val();
	
	if(orgLeve > 2){
		if(orgLeve == 5){
			orgcode = orgcode.substr(0,6) + "000000";
		}else if(orgLeve == 4){
			orgcode = orgcode.substr(0,4) + "000000";
		}else if(orgLeve == 3){
			orgcode = orgcode.substr(0,2) + "000000";
		}
		orgLeve = Number(orgLeve) - 1;
		var url = contextPath + "/gzgl/pcsxchd/toPcsXcHdTjPage.action"; 
		url += "?query.orgcode=" + orgcode + "&query.orgleve=" + orgLeve;
		$("#mainiframe",parent.document).attr("src",url);
	}
}

/**
 * 下钻
 */
function xchdDown(orgcode,orgleve){
	var url = contextPath + "/gzgl/pcsxchd/toPcsXcHdTjPage.action"; 
	url += "?query.orgcode=" + orgcode + "&query.orgleve=" +(Number(orgleve) + 1);
	$("#mainiframe",parent.document).attr("src",url);
}