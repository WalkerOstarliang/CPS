function openInfoCjWinByBasePath(basePath,stid)
{
	$.openWindow({
		name : "xxcjwin",
		url : basePath + "/dzgl/dzxx/toStxxDetailNoMapPageInfo.action?operType=update&stxxBean.id=" + stid
	});
}

function openUpdateStxxInfoByPath(basePath,stid)
{
	$.openWindow({
		name : "xxcjwin",
		url : basePath + "/dzgl/dzxx/toStxxDetailPageInfo.action?operType=update&stxxBean.id=" + stid
	});
}