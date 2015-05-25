function ajaxGetXzjdDm(value)
{
	var jdType = value
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/xtgl/xzqh/getXzjdDm.action",
		data : "jdType=" + jdType + "&parent_dm=" + $("#parent_dm").val(),
		success : function(result)
		{
			$("#dm").val(result)
		}
	})
}


function saveXzqhBean()
{
	if ($.validateform("xzqhform"))
	{
		$("#xzqhform").ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(xzqhBean)
			{
				if (xzqhBean != undefined && xzqhBean != null)
				{
					alert("保存成功.");
					$.setResultValue(xzqhBean)
					$.closeWindow();
				}
				else
				{
					alert("保存失败.");
				}
				
			}
		});
	}
}


function openSelectPcsWin()
{
	var parentdm = $("#parent_dm").val();
	openDwSelect({
		rootOrgCode : $.substr(parentdm,0,6) + "000000",
        mutilSelect : false,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(orgBean){
		if (orgBean)
		{
			$("#sspcsdm").val(orgBean.id);
			$("#sspcsmc").val(orgBean.name);
			$("#gxsqjwsdm").val("");
			$("#gxsqjwsmc").val("");
		}
	});
}

function openSelectPcsWinBySjdm()
{
	var parentdm = $("#parent_dm").val();
	openDwSelect({
		rootOrgCode : $.substr(parentdm,0,4) + "00000000",
        mutilSelect : false,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(orgBean){
		if (orgBean)
		{
			$("#sspcsdm").val(orgBean.id);
			$("#sspcsmc").val(orgBean.name);
			 $("#gxsqjwsdm").val("");
			 $("#gxsqjwsmc").val("");
		}
	});
}


function openSelectSqjwsWin()
{
	var orgcode = $("#sspcsdm").val()
	if (orgcode == null || orgcode == "")
	{
		alert("请选择管辖派出所");
		return false;
	}
	openDwSelect({
		rootOrgCode : orgcode,
        mutilSelect : false,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(orgBean){
		if (orgBean)
		{
			 $("#gxsqjwsdm").val(orgBean.id);
			 $("#gxsqjwsmc").val(orgBean.name);
		}
		
	})
}
