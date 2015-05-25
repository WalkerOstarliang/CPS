//单位查询
function dwcx(){
	$("#cxjgList").query("F", "dwcx");	
}

//单位选择
function dwselect(trobj,data){
	$.setResultValue(data);
	$.closeWindow();
}