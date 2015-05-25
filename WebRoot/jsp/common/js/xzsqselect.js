var mutilSelect = false;
var currentOrgCode = 0;
var pageNum = 1;
var setting = {
	view: 
	{
		selectedMulti: false
	},
	async: 
	{
		enable: true,
		url:getAsyncUrl,
		autoParam:["id=rootParentDm"],
		dataFilter: filter
	},
	data: 
	{
		simpleData: 
		{
			enable: true,
			idKey: "id",
			pIdKey: "parentId",
			rootPId: 0
		}
	},
	callback: 
	{
		onDblClick :  dblClickSelectXzSq
	}
};

function getAsyncUrl(treeId, treeNode) 
{
	var url = contextPath + "/xtgl/xzqh/queryHnxzqhList.action";
	if (!treeNode)
	{
		url += "?rootParentDm=" + currentOrgCode;
	}
	else
	{
		url += "?loadChild=true";
	}
    return url;
}

function filter(treeId, parentNode, childNodes) 
{
	if (!childNodes) return null;
	for (var i=0, l=childNodes.length; i<l; i++) 
	{
		childNodes[i].id = childNodes[i].dm;
		childNodes[i].name = childNodes[i].jc;
		if (childNodes[i].jc)
		{
			childNodes[i].jc = childNodes[i].jc;
		}
		else
		{
			childNodes[i].jc = childNodes[i].mc;
		}
		
		childNodes[i].parent_dm = childNodes[i].parent_dm;
		childNodes[i].leve = childNodes[i].leve;
		childNodes[i].icon = contextPath + "/systemico/diy/" + childNodes[i].leve + ".png"
		childNodes[i].isParent = true;
	}
	return childNodes;
}
 
 
function dblClickSelectXzSq(event, treeId, treeNode)
{
	if (treeNode.leve && treeNode.leve == "5")
	{
		$.setResultValue(treeNode);
		$.closeWindow();
	}
}
  
$(function(){
	$.fn.zTree.init($("#treeDemo"), setting);
	var docheight = $(document).height();
	$("#treeDemo").height(docheight - 40)
});