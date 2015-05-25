

function openInfoWin(operType,bh)
{	
	$.openDialogWindow({
		url : contextPath + "/qzgl/lxdjgl/toAddLxdj.action",
		data : {operType : operType,bh : bh,t:new Date().getTime()},
		width : 980,
		height : 500,
		callback : function()
		{
			$(operType != "detail");
			{
				clearQuery();
				jxquery();
			}
		}
	});
}

function deleteInfoByBh(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/lxdjgl/deleteLxdj.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除来访来信信息.");
					jxquery();
				}
			}
		});
	}
}

function clearQuery(){
	if($("#citydm").attr("disabled")!="disabled"){
		$("#citydm").val("");
	}
	if($("#countrydmselect").attr("disabled")!="disabled"){
		$("#countrydmselect").val("");
	}
	if($("#pcsdm").attr("disabled")!="disabled"){
		$("#pcsdm").val("");
	}
	if($("#jwsselect").attr("disabled")!="disabled"){
		$("#jwsselect").val("");
	}
	$("#xjzt").val("");
	$("#lfsj_from").val("");
	$("#lfsj_to").val("");
	jxquery();
}

function jxquery(){
	$("#lxdjquerylist").query("F","lxdjqueryform");
}

