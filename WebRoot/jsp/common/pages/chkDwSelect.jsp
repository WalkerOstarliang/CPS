<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>单位选择</title>
		
		<SCRIPT type="text/javascript">
		//是否多选
		var mutilSelect = ${mutilSelect};
		//根节点
		var rootOrgCode = "${rootOrgCode}";
		//节点选择触发类型
		var nodeSelectedType = "${nodeSelectedType}";
		//节点不选中触发类型
		var nodeNotSelectedType = "${nodeNotSelectedType}";
		
		var chkStyle = "checkbox";
		var enable = mutilSelect;
		var chkboxType = {"Y" : nodeSelectedType, "N" : nodeNotSelectedType}
		
		var setting = {
			check : 
			{
				enable : mutilSelect,
				nocheckInherit: true,
				chkStyle :chkStyle,
				chkboxType: chkboxType
			},
			view: {
				selectedMulti: true
			},
			async: 
			{
				enable: true,
				url:getUrl,
				autoParam:["id"],
				dataFilter: filter
			},
			data: 
			{
				simpleData: 
				{
					enable: true,
					idKey: "id",
					pIdKey: "parent_id",
					rootPId: rootOrgCode
				}
			},
			callback: 
			{
				beforeExpand: loadChildNodes
			}
		};

		function getUrl(treeId, treeNode) {
			var param = "";
			if (treeNode)
			{
				param = "rootOrgCode="+treeNode.id +"&isRoot=false";
			}
			else
			{
				param = "rootOrgCode=" + rootOrgCode + "&isRoot=true";
			}
			return "<c:url value='/tree/queryOrgList.action'/>?" + param;
		}
		
		
		function filter(treeId, parentNode, childNodes) {
			if (!childNodes) return null;
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].jc.replace(/\.n/g, '.');
			}
			return childNodes;
		}
		
		function getSelectedNodes()
		{
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			var orgInfos = new Array();
			if (nodes && nodes.length > 0)
			{
				for (var i=0;i<nodes.length;i++)
				{
					var node = nodes[i];
					var orgInfo = {
						orgId : node.org_id,
						orgName : node.org_name,
						parentId : node.parent_id
					}
					orgInfos[i] = orgInfo;
				}
			}
			window.returnValue = orgInfos;
			window.close();
		}

		function loadChildNodes(treeId, treeNode)
		{
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.reAsyncChildNodes(treeNode, "refresh", true);
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
		});
	</SCRIPT>
	</head>

	<body>
		<div class="zTreeDemoBackground" style="width:300px;height: 430px;text-align: center;">
			<ul id="treeDemo" class="ztree" style="width:300px;height: 430px"></ul>
			<ct:button value="确定" onclick="getSelectedNodes()"></ct:button>
			<ct:button value="关闭" onclick="window.close()"></ct:button>
		</div>
	</body>
</html>
