var mutilSelect = false;
var currentOrgCode = 0;
var nodeSelectedType = "ps";
var nodeNotSelectedType = "ps";
var chkboxType = {"Y" : nodeSelectedType, "N" : nodeNotSelectedType}
var zTreeObj = null; 
var isAsyn = "false";	//是否异步
var setting = {
	check : 
	{
		enable : true,
		nocheckInherit: true,
		chkStyle :"checkbox",
		chkboxType: chkboxType
	},
	view: 
	{
		selectedMulti: false
	},
	async: 
	{
		enable: true,
		url:getAsyncUrl,
		autoParam:["id=rootOrgCode"],
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
		onDblClick : clickTreeEvent
	}
};

function getAsyncUrl(treeId, treeNode) 
{
	var url = "";
	if (isAsyn == "true")
	{
		url = contextPath + "/cps/loadChildXzqh.action";
	}
	else
	{
		url = contextPath + "/cps/queryXzqhListByParentDm.action";
	}
	if (!treeNode)
	{
		url += "?isRoot=true&rootOrgCode=" + currentOrgCode;
	}
    return url;
}

function filter(treeId, parentNode, childNodes) 
{
	if (!childNodes) return null;
	for (var i=0, l=childNodes.length; i<l; i++) 
	{
		childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		childNodes[i].isParent = true;
	}
	return childNodes;
}

/**
 * 搜索机构
 * @param {Object} searchname
 */
function seachOrgList()
{
	$.fn.zTree.init($("#treeDemo"), setting);
}

function clickTreeEvent(event, treeId, treeNode)
{
	if (!mutilSelect)
	{
		$.setResultValue(treeNode);
		$.closeWindow();
	}
}

function getSelectedNodes()
{
	if (zTreeObj)
	{
		return nodes = zTreeObj.getCheckedNodes(true);
	}
	return null;
}


function returnSelectedNodes()
{
	var nodes = getSelectedNodes();
	$.setResultValue(nodes)
	$.closeWindow();
}

$(document).ready(function(){
	$("#treeDemo").css("height",$("#treepanel").height() -20);

	zTreeObj = $.fn.zTree.init($("#treeDemo"), setting);
});