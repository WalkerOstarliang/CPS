function save(){
   if ($.validateform("bmfwInfoform"))
	{
		$("#bmfwInfoform").ajaxSubmit({
			type : "post",
			success : function(result)
			{
				if(result){
				if($("#operType").val()=="add"){
					alert("新增成功！");
					window.close();
				}
				else if($("#operType").val()=="update"){
					alert("修改成功！");
					window.close(); 
				}
				}else{
					alert("保存失败！");
				}
			}
		});
	}
   
}
function openSelectzrmjxx(rootOrgCode){

	openDwRySelect({
		rootOrgCode : rootOrgCode,
		mutilSelect : false
	},function(userBean){
		if (userBean)
		{
			$("#zrmjsfzh").val(userBean["sfzh"]);
			$("#zrmjxm").val(userBean["realname"]);
			$("#zrmjdh").val(userBean["telephone"]);
		}
	})
}

function clearQuery(){
}

function jxquery(){
	$("#bmfwquerylist").query("F","bmfwform");
}

function czRowCallback(trObj, rowDataObj)
{
	var result = "";
	result += "<span onclick=\"openInfoWin('detail','" + rowDataObj["bh"] + "')\" class=\"cps_span_href\" style=\"color:green\">详情</span>&nbsp;";
	result += "<span onclick=\"openInfoWin('update','" + rowDataObj["bh"] + "')\" class=\"cps_span_href\" style=\"color:green\">修改</span>&nbsp;";
	result += "<span onclick=\"deleteInfoByBh('" + rowDataObj["bh"] + "')\" class=\"cps_span_href\" style=\"color:green\">删除</span>&nbsp;";
	return result;
}

function openInfoWin(operType,bh)
{	
	$.openDialogWindow({
		url : contextPath + "/qzgl/bmfwgl/toAddBmfw.action",
		data : {operType : operType,bh : bh,t:new Date().getTime()},
		width : 980,
		height : 450,
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
			url : contextPath + "/qzgl/bmfwgl/deleteBmfw.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该便民服务相关信息.");
					jxquery();
				}
			}
		});
	}
}
function bacthScBmfwxx(){
	 var selectes = $("#bmfwquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要删除这些数据吗？"))
		{
			var bhs = [];
			$.each(selectes,function(i, obj){
				bhs.push(obj["bh"]);
			});
			zxSqxx(bhs.join(","))
		}
	}
	else
	{
		alert("请选择需要删除的数据。")
	}
}

function zxSqxx(bhs)
{
	$.ajax({
		type : "post",
		url : contextPath + "/qzgl/bmfwgl/deleteBmfwxx.action",
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

function setFwdxxx(czrkxxBean){
	if(czrkxxBean){
		$("#fwdxxm").val(czrkxxBean["xm"]);
		$("#bfwdxlxfs").val(czrkxxBean["lxdh"]);
	}
}