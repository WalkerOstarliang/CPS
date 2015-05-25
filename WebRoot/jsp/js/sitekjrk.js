function openMenuWindow(menuid,href)
{
	var url = contextPath + href;
	 $.openWindow({
		name : "win_" + menuid,
		url : url,
		width : 1000,
		height : 600,
		scroll : true,
		resizable : "yes"
	 });
}

function loadBtnChildMenu(menuid)
{
	var url = contextPath + "/menu/loadBtnChildMenuMap.action";
	var data = 
	{
		"menuBean.menuid" : menuid,
		"showSelectChk" : $("#showSelectChk").val()
	}
	$.post(url,data,function(html){
		$("#centermenu").html(html);
		$(".left_nav").css("background-color", "");
		$("#nav_" + menuid).css("background-color", "#FFFFFF");
	});
}

function changeSelectKjfsMenu(chkobj)
{
	var menuid = $(chkobj).val();
	if ($(chkobj).attr("checked") == "checked")
	{
		$.ajax({
			type : "post",
			url : contextPath + "/menu/insertShortCut.action",
			data : "menuBean.menuid=" + menuid
		});
	}
	else
	{
		$.ajax({
			type : "post",
			url : contextPath + "/menu/deleteShortCut.action",
			data : "menuBean.menuid=" + menuid
		});
	}
}

$(function(){
	var defaultMenuid = $("#defaultShowMenuId").val();
	if ($.isBlank(defaultMenuid))
	{
		$(".left_nav").first().trigger("click");
	}
	else
	{
		$("#nav_" + defaultMenuid).trigger("click");
	}
	$(".right_nav").bind("mouseover",function(){
		$(this).css("background-color","#D9FFBC");
	}).bind("mouseout",function(){
		$(this).css("background-color","");
	});
});