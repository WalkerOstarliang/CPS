var mutilSelect = false;
var currentOrgCode = 0;
var nodeSelectedType = "ps";
var nodeNotSelectedType = "ps";
var chkboxType = {"Y" : nodeSelectedType, "N" : nodeNotSelectedType}
var zTreeObj = null; 
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
	var url = contextPath + "/cps/queryOrgListByParentCode.action";
	if (!treeNode)
	{
		var searchname = $("#orgname").val();
		
		if (searchname && searchname != "")
		{
			url = contextPath + "/cps/searchOrgListBySearchName.action?searchname=" + encodeURIComponent(searchname);
		}
		else
		{
			url += "?isRoot=true&rootOrgCode=" + currentOrgCode;
		}
	}
	
    return url;
}

function filter(treeId, parentNode, childNodes) 
{
	if (!childNodes) return null;
	for (var i=0, l=childNodes.length; i<l; i++) 
	{
		childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
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