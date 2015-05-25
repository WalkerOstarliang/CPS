function submitSaveMenu()
{
	$("#menuform").ajaxSubmit({
		dataType : "json",
		type : "post",
		url : contextPath + "/menu/saveMenuBean.action",
		success : function(result)
		{
			if (result)
			{
				alert("菜单添加成功.");
			}
			else
			{
				alert("菜单添加失败.");
			}
			
		}
	});
}

function closelayerWin()
{
	var index = parent.layer.getFrameIndex(window.name);
	parent.refershMainMenu();
	parent.initLoadLeftMenu();
	parent.layer.close(index);
	
}