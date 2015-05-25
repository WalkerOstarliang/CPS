function clickNewDwBtn()
{
	var selectes = $("#fwtablegrid").getSelected();
	if (selectes.length > 0)
	{
		$.openWindow({
			url : contextPath + "/sydw/dwgl/toDwInfoPage.action",
			data : {
				"operType" : "add",
				"queryBean.dwmc" : $("#dwmc").val(),
				"queryBean.fwid" : selectes[0]["fwid"]
			},
			width:1000,
			height:700
		})
	}
	else
	{
		alert("请选择单位地址后再新增单位。");
	}
}