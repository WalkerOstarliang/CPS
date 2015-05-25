function openOutSiteWin(menuid,menuname,url)
{
	//更新点击次数
	$.ajax({
		type : "post",
		url : contextPath + "/menu/updateOutSiteClickNumber.action",
		data : {"outsiteMenuBean.id" : menuid}
	});
	window.open(url);
}

function deleteOutSizeMenu(menuid)
{
	$.ajaxFire("/menu","deleteOutSiteMenuBean",{"outsiteMenuBean.id" : menuid},function(result){
		if (result == true)
		{
			alert("成功删除系统网站");
			$("#outsiteform").reset();
			document.location.reload();
		}
		else
		{
			alert("删除系统网站失败.");
		}
	})
}

function saveAddOutsiteWin()
{
	if($.validateform("outsiteform"))
	{
		$("#outsiteform").ajaxSubmit({
			type : "post",
			url : contextPath + "/menu/saveOutSiteMenuBean.action",
			dataType : "json",
			success : function(result)
			{
				if (result == true)
				{
					alert("成功添加系统网站");
					$("#outsiteform").reset();
					window.location.reload();
				}
				else
				{
					alert("添加系统网站失败.");
				}
			}
		});
	}
}

function openTjDetailPage(url)
{
	$.openWindow({
		name : "win_" + new Date().getTime(),
		url : contextPath + url
	})
}