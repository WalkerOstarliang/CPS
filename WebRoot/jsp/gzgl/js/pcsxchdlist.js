//派出所宣传活动查询
function pcsXcHdQuery(){
	$("#pcsxchdList").query("F", "queryForm");
}

//打开派出所宣传活动信息窗口
function openPcsXcHdInfoWin(hdid,opertype){
	$.openWindow({
		url : contextPath + "/gzgl/pcsxchd/toPcsXcHdInfoPage.action",
		data : {"query.id":hdid,"operType":opertype},
		width : 1020,
		height : 900
	});
}

//注销派出所宣传活动
function deletePcsxchd(id){
	if(confirm("确认注销？")){
		$.ajax({
			url : contextPath + "/gzgl/pcsxchd/deletePcsXcHd.action?t=" + new Date().getTime(),
			data : {"xchd.id":id},
			type : "post",
			success:function(tip){
				eval("var tip = " + tip);
				alert(tip);
			}
		});
	}
}