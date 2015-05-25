function openSelectFwWin(callback,selectType,rylb)
{
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toSelectFwWin.action",
		width:900,
		height:650,
		data : {
			"queryBean.rylb":rylb,
			"queryBean.selectType" : selectType, 
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			if ($.isFunction(callback))
			{
				callback(resultObj);
			}
		}
	});
}


function updateSelectFwCallback(resultObj)
{
	if (!$.isBlank(resultObj))
	{
		var fwxxBean = resultObj["fwxxBean"];
		$("#fwid").val(fwxxBean["fwid"]);
		$("#dzmc").val(fwxxBean["dzmc"]);
	}
}


function saveJwrkInfo()
{
	$("#savebtn").attr("disabled","disabled")
	if ($.validateform("jwrkform"))
	{
		$("#jwrkform").ajaxSubmit({
			url : contextPath + "/lsgl/jwrk/saveJwrkInfo.action",
			type : "post",
			dataType : "json",
			success :function(jwrkBean)
			{
				if (jwrkBean != null)
				{
					$("#jwbh").val(jwrkBean["jwbh"]);
					$("#rybh").val(jwrkBean["rybh"]);
					alert("保存境外人口信息成功.将关闭窗口.")
					parent.close();
				}
				else
				{
					alert("保存境外人口信息失败.请稍后再试");
				}
				$("#savebtn").removeAttr("disabled")	
			},
			faulire : function()
			{
				alert("保存境外人口信息失败.请稍后再试");
				$("#savebtn").removeAttr("disabled");
			},
			error : function()
			{
				alert("保存境外人口信息失败.请稍后再试");
				$("#savebtn").removeAttr("disabled");
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled")
	}
}


function openAddJwrkRkzpxx()
{
	var rybh = $("#rybh").val();
	if (rybh != null && rybh != "")
	{
		$.openWindow({
			name : "zpwhwin",
			url : contextPath + "/rk/rxgl/toRyzpglPageInfo.action",
			data : {
				rybh : rybh
			},
			width:900,
			height:700
		});
	}
	else
	{
		alert("人员信息没有保存，请先保存境外人员信息.");
	}
}


function saveGxrShxx()
{
	var rybh = $("#rybh").val();
	if (rybh != null && rybh != "")
	{ 
		if ($.validateform("rkxxform"))
		{
			$("#rkxxform").ajaxSubmit({
				url : contextPath + "/lsgl/rk/saveGxrShxx.action",
				type : "post",
				dataType : "json",
				success :function(rkBean)
				{
					if (rkBean != null)
					{
						$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
						alert("保存关系人信息成功.");
						$("#gxrxxtablegrid").query("F","rkxxform");
						$("#rkxxform").reset();
					}
					else
					{
						alert("保存人口基本信息失败");
					}
				}
			})
		}
	}
	else
	{
		alert("人员信息没有保存，请先保存境外人员信息.");
	}
}


function saveTmtzxxBean()
{
	var rybh = $("#rybh").val();
	if (rybh != null && rybh != "")
	{ 
		if ($.validateform("rkxxform"))
		{
			$("#rkxxform").ajaxSubmit({
				url : contextPath + "/lsgl/rk/saveTmtzxxBean.action",
				type : "post",
				dataType : "json",
				success :function(rkBean)
				{
					if (rkBean != null)
					{
						alert("保存体貌特征信息成功.");
					}
					else
					{
						alert("保存体貌特征信息成功.");
					}
				}
			})
		}
	}
	else
	{
		alert("人员信息没有保存，请先保存境外人员信息.");
	}
}

function saveLxfsxxBean()
{
	var rybh = $("#rybh").val();
	if (rybh != null && rybh != "")
	{ 
		if ($.validateform("rkxxform"))
		{
			$("#rkxxform").ajaxSubmit({
				url : contextPath + "/lsgl/rk/saveLxfsxxBean.action",
				type : "post",
				dataType : "json",
				success :function(rkBean)
				{
					if (rkBean != null)
					{
						alert("保存联系方式信息成功.");
					}
					else
					{
						alert("保存联系方式信息成功.");
					}
				}
			})
		}
	}
	else
	{
		alert("人员信息没有保存，请先保存境外人员信息.");
	}
}



function shgxxRowClick(trObj,rowdata)
{
	$.each(rowdata,function(key,value){
		$("#" + key).val(value);
	});
}

//添加联系方式
function addLxfs(){
	var lxfsTable = $("#lxfsTable");
	var lastRow = lxfsTable.find("tr").last();
	var index = lastRow.attr("id").split("row")[1];
	var newRow = lastRow.clone();
	newRow.attr("id","row" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfslx" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].lxfslx");
	newRow.find("[id='lxfslx" + index + "']").attr("value","");
	newRow.find("[id='lxfslx" + index + "']").attr("id","lxfslx" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfs" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].lxfs");
	newRow.find("[id='lxfs" + index + "']").attr("value","");
	newRow.find("[id='lxfs" + index + "']").attr("id","lxfs" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfsid" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].id");
	newRow.find("[id='lxfsid" + index + "']").attr("value","");
	newRow.find("[id='lxfsid" + index + "']").attr("id","lxfsid" + eval(parseInt(index) + 1));
	
	newRow.find("[id='lxfsbz" + index + "']").attr("name","rkBean.lxfsBean[" + eval(parseInt(index) + 1) + "].lxfsbz");
	newRow.find("[id='lxfsbz" + index + "']").attr("value","");
	newRow.find("[id='lxfsbz" + index + "']").attr("id","lxfsbz" + eval(parseInt(index) + 1));
	
	lxfsTable.append(newRow);
}


function saveLxfsxxBean()
{
	var rybh = $("#rybh").val();
	if (rybh != null && rybh != "")
	{ 
		if ($.validateform("rkxxform"))
		{
			$("#rkxxform").ajaxSubmit({
				url : contextPath + "/lsgl/rk/saveLxfsxxBean.action",
				type : "post",
				dataType : "json",
				success :function(rkBean)
				{
					if (rkBean != null)
					{
						alert("保存联系方式信息成功.");
					}
					else
					{
						alert("保存联系方式信息成功.");
					}
				}
			})
		}
	}
	else
	{
		alert("人员信息没有保存，请先保存境外人员信息.");
	}
}


//删除联系方式
function delLxfs(obj){
	var lxfsTable = $("#lxfsTable");
	var rows = lxfsTable.find("tr");
	if(rows.length == 1 ){
		alert("最后一条联系方式不能删除!")
	}else{
		var lxfsId = $(obj.parentNode.parentNode).find("[id^='lxfsid']").val();
		if(lxfsId == ""){
			$(obj.parentNode.parentNode).remove();
		}else{
			$.ajax({
				url:contextPath + "/lsgl/rk/delLxfs.action?lxfsId=" + lxfsId,
				type:"post",
				success:function(){
					$(obj.parentNode.parentNode).remove();
					alert("删除成功.");
				}
			});
		}
	}
}
