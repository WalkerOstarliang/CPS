function jxquery(){
	$("#lxdjquerylist").query("F","hbgzform");
}

function openInfoWin(operType,bh)
{	
	$.openDialogWindow({
		url : contextPath + "/qzgl/hbgzgl/tohbgzIn.action",
		data : {operType : operType,bh : bh,t:new Date().getTime()},
		width : 900,
		height : 600,
		callback : function()
		{
			if ($(operType != "detail"))
			{
				clearQuery();
				jxquery();
			}
		}
	});
}


function OpenWin(bh){
	$.openDialogWindow({
		url : contextPath + "/qzgl/hbgzgl/tohbgzCyr.action",
		data : {bh:bh,t:new Date().getTime()},
		width : 900,
		height : 450
	});
	jxquery();
}

function deleteInfoByBh(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/hbgzgl/deleteHbgz.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该汇报工作相关信息.");
					jxquery();
				}
			}
		});
	}
}

function downloadFjxx(bh){
	window.location= contextPath + "/qzgl/hbgzgl/downloadFjxx.action?bh="+bh;
	
	/*
	 * $.ajax({
		url : contextPath + "/qzgl/hbgzgl/downloadFjxx.action",
		data : "bh=" + bh,
		dataType : "json",
		success : function()
		{
			alert("成功删除该汇报工作相关信息.");
			jxquery();
		}
	});
	 * */
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
	$("#bggzzt").val("");
	$("#hbsj_from").val("");
	$("#hbsj_to").val("");
	jxquery();
}
function batchdeletehbgzxx(){
	  var selectes = $("#jftjquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要删除这些数据吗？"))
		{
			var bhs = [];
			$.each(selectes,function(i, obj){
				bhs.push(obj["bh"]);
			});
			zxHbgzxx(bhs.join(","))
		}
	}
	else
	{
		alert("请选择需要删除的数据。")
	}
}
function zxHbgzxx(bhs){
	$.ajax({
		type : "post",
		url : contextPath + "/qzgl/hbgzgl/batchdeletehbgzxx.action",
		data : "bhs=" + bhs,
		dataType : "json",
		success : function(result)
		{
			if (result)
			{
				alert("删除成功.");
				jxquery();
			}
			else
			{
				alert("删除失败，请重新再试.")
			}
		}
	})
}