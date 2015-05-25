function initLoadLeftMenu()
{
	var url = contextPath + "/menu/toLeftMenuPage.action";
	$.post(url,{},function(html){
		$("#leftmenu").html(html);
		bindMenuContextMenu("left");
	})
}

function initMainMenu(parentid)
{
	var url = contextPath + "/menu/loadChildMenuMap.action";
	$.post(url,{"menuBean.menuid" : parentid},function(html){
		$("#centermenu").html(html);
		bindMenuContextMenu("main");
	});
}

function bindMenuContextMenu(position)
{
	$(".cps-icon-panel").find("ul").contextMenu("mymenu",{
		itemStyle: {
			borderBottom : "1px solid #CCCCCC"
      	},
      	bindings : {
      		"update" : function(menuobj)
			{
      			var menuid = $(menuobj).attr("id");
      			updateMenuBean(menuid,position)
			},
			"delete" : function(menuobj)
			{
				var menuid = $(menuobj).attr("id");
				deleteMenu(menuid);
			}
      	}
	});
}

function refershMainMenu()
{
	var parentid = $("#parentid").val();
	if (!$.isBlank(parentid))
	{
		initMainMenu(parentid);
	}
}

function deleteMenu(menuid)
{
	$.ajax({
		type : "post",
		url : contextPath +"/menu/deleteMenu.action",
		data : "menuBean.menuid=" + menuid,
		success : function(result)
		{
			if (result == false)
			{
				alert("删除菜单失败")	
			}
			else
			{
				initLoadLeftMenu();
				refershMainMenu();
			}
		}
	})
}

function openAddTowMenu(parentid)
{
	$.layer({
	    type : 2,
	    title : '添加菜单',
	    iframe : {src : contextPath + "/menu/toAddTwoMenuPage.action?menuBean.parentid=" +parentid+"&operType=add" },
	    area : ['500px' , '300px'],
	    offset : ['100px',''],
	    close : function(index){
			layer.close(index);
			refershMainMenu();
		}
	});
}

function openAddThreeMenu(parentid)
{
	$.layer({
	    type : 2,
	    title : '添加菜单',
	    iframe : {src : contextPath + "/menu/toAddThreeMenuPage.action?menuBean.parentid=" + parentid+"&operType=add"},
	    area : ['500px' , '300px'],
	    offset : ['100px',''],
	    close : function(index)
	    {
	    	layer.close(index);
			refershMainMenu();
	    }
	});
}

function updateMenuBean(menuid,position)
{
	$.layer({
	    type : 2,
	    title : '更新菜单',
	    iframe : {src : contextPath + "/menu/updateMenuPage.action?menuBean.menuid=" + menuid+"&operType=update"},
	    area : ['500px' , '300px'],
	    offset : ['100px',''],
	    close : function(index)
	    {
	    	if (position =="left")
	    	{
	    		initLoadLeftMenu();
	    	}
	    	else
	    	{
	    		refershMainMenu();
	    	}
			layer.close(index);
	    }
	});
}

function initCenterContent()
{
	var url = contextPath + "/afgl/sqgl/toSqJbxxPage.action";
	var data = {};
	$.post(url,data,function(html){
		$("#centermenu").html(html);
	});
}

$(function(){
	$("#leftpanel").setDomWindowHeight()
	initLoadLeftMenu();
	
	//initCenterContent();
});