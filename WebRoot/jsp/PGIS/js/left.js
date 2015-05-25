var mutilSelect = false;
var currentOrgCode = 0;
var pageNum = 1;
var dzTreeObj = null;
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
		onClick :  null,
		onRightClick : function(event, treeId, treeNode)
		{
		
			var nodes = dzTreeObj.getSelectedNodes();
			
			if (nodes != null && nodes.length > 0)
			{
				var node = nodes[0];
				var leve = node["leve"];
				if (leve == "5")
				{
					$('#mymenu').menu('show',{
						left:event.pageX ,
						top:event.pageY
					});
				}
			}
		}
	}
};

function getAsyncUrl(treeId, treeNode) 
{
	
	var url = contextPath + "/xtgl/xzqh/queryHnxzqhList.action";
	if (!treeNode)
	{
		url += "?rootParentDm=" + currentOrgCode;
	}
    return url;
}

function filter(treeId, parentNode, childNodes) 
{
	if (!childNodes) return null;
	for (var i=0, l=childNodes.length; i<l; i++) 
	{
		childNodes[i].id = childNodes[i].dm.replace(/\.n/g, '.');
		childNodes[i].name = childNodes[i].jc.replace(/\.n/g, '.');
		if (childNodes[i].jc)
		{
			childNodes[i].jc = childNodes[i].jc.replace(/\.n/g, '.');
		}
		else
		{
			childNodes[i].jc = childNodes[i].mc;
		}
		
		childNodes[i].parent_dm = childNodes[i].parent_dm.replace(/\.n/g, '.');
		childNodes[i].leve = childNodes[i].leve.replace(/\.n/g, '.');
		childNodes[i].icon = contextPath + "/systemico/diy/" + childNodes[i].leve + ".png"
		
		childNodes[i].isParent = true;
	}
	return childNodes;
}


function czRowCall(tdObj, rowdataobj)
{
	var html = "";
	html += "<a href=\"javascript:openXzqhInfoNew('update','" + rowdataobj["dm"] + "')\">修改</a>&nbsp;";
	return html;
}

function ztRowCall(tdObj, rowdataobj)
{
	var html = "";
	var zt = rowdataobj["isvalid"];
	if (zt == "0")
	{
		html = "<font color='red'>无效</a>";
	}
	else
	{
		html = "有效";
	}
	return html;
}

function deleteXzqhBean(dm)
{
	if (confirm("你确定要注销该记录吗？"))
	{
		$.ajax({
			url : contextPath + "/xtgl/xzqh/zxHnxzqhBean.action",
			data : "dm=" + dm,
			dataType : "json",
			success : function(result)
			{
				if (result == true)
				{
					alert("注销成功.")
					$("#listgrid").query("F","hiddenform");
				}
				else
				{
					alert("注销失败.")
				}
			}
		})
	}
}

function openXqxzqhwin(operType)
{
	var node = dzTreeObj.getSelectedNodes()[0];
	var parentNode= node.getParentNode();
	$.openDialogWindow({
		url : contextPath + "/xtgl/xzqh/toXzqhPageInfo.action",
		width : 600,
		height : 400,
		data : {
			t : new Date().getTime(),
			"operType" : operType,
			"dm" : node["id"],
			"xzqhBean.parent_dm" : parentNode["id"],
			"xzqhBean.leve" : node["leve"]
		},
		callback : function(xzqhBean)
		{
			if (operType == "add")
			{
				if (xzqhBean != null && xzqhBean != undefined)
				{
					var newnode = new Object();
					newnode.id = xzqhBean.dm.replace(/\.n/g, '.');
					newnode.name = xzqhBean.jc.replace(/\.n/g, '.');
					if (newnode.jc)
					{
						newnode.jc = xzqhBean.jc.replace(/\.n/g, '.');
					}
					else
					{
						newnode.jc = xzqhBean.mc;
					}
					
					newnode.parent_dm = xzqhBean.parent_dm.replace(/\.n/g, '.');
					newnode.leve = xzqhBean.leve.replace(/\.n/g, '.');
					newnode.icon = contextPath + "/systemico/diy/" + xzqhBean.leve + ".png"
					newnode.isParent = true;
					var newnodes = [newnode];
					dzTreeObj.addNodes(parentNode,newnodes);
					
						
				}
			}
			else if (operType == "update")
			{
				node.name = xzqhBean["jc"];
				dzTreeObj.updateNode(node);
			}
		}
	})
}

$(function(){
	dzTreeObj = $.fn.zTree.init($("#treeDemo"), setting);
	//var bodyheight = $("#dzgl").height();
	//var treeheight = bodyheight;
	//$("#treeDemo").height(treeheight);
});