function openInfoWin(operType,bh)
{	
	$.openDialogWindow({
		url : contextPath + "/qzgl/gyhdgl/togyhdInfo.action",
		data : {operType : operType,bh : bh,t:new Date().getTime()},
		width : 900,
		height : 600,
		callback : function()
		{
			if ($(operType != "detail"))
			{
				jxquery();
				clearQuery();
			}
		}
	});
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
	$("#hddz").val("");
	$("#hdsj_from").val("");
	$("#hdsj_to").val("");
	jxquery();
}

function fjcz(trObj,rowdataobj){
	if($(operType != "detail")){
		var html="<a href=\"javascript:deletefjxx('"+rowdataobj["bh"]+"')\"删除</a>&nbsp;"
	}
	html+="<a href=\"javascript:downloadFjxx('"+rowdataobj["bh"]+"')\"下载</a>";
	return html;
}

function downloadFjxx(bh){
	window.location= contextPath + "/qzgl/gyhdgl/downloadFjxx.action?bh="+bh;
}

function deletefjxx(bh){
	if (confirm("你确定要删除该附件吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/gyhdgl/deleteFjxx.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该附件信息.");
					jxquery();
				}
			}
		});
	}
}

function OpenWin(bh){
	$.openDialogWindow({
		url : contextPath + "/qzgl/gyhdgl/tofjxx.action",
		data : {bh:bh,t:new Date().getTime()},
		width : 900,
		height : 450
	});
	jxquery();
}




function jxquery(){
	$("#gyhdquerylist").query("F","gyhdform");
}


function deleteInfoByBh(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/gyhdgl/deleteGyhd.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该公益活动相关信息.");
					jxquery();
				}
			}
		});
	}
}

function batchDeleteGyhd(){
	  var selectes = $("#gyhdquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要删除这些数据吗？"))
		{
			var bhs = [];
			$.each(selectes,function(i, obj){
				bhs.push(obj["bh"]);
			});
			zxGyhdxx(bhs.join(","))
		}
	}
	else
	{
		alert("请选择需要删除的数据。")
	}
}
function zxGyhdxx(bhs){
$.ajax({
		type : "post",
		url : contextPath + "/qzgl/gyhdgl/batchdeleteGyhdxx.action",
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
