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
		onClick :  getUserBeanList
	}
};

function getAsyncUrl(treeId, treeNode) 
{
	var url = contextPath + "/cps/queryOrgListByParentCode.action";
	if (!treeNode)
	{
		url += "?isRoot=true&rootOrgCode=" + currentOrgCode;
	}
    return url;
}


function getUserBeanList(event, treeId, treeNode)
{
  	pageNum = 1;
  	currentOrgCode = treeNode.id;
  	queryUserBeanList(currentOrgCode);
}
  
function queryUserBeanList(orgcode)
{
  	$.ajax({
		type : "post",
		url : contextPath + "/cps/queryUserListByOrgCode.action",
		data : "rootOrgCode=" + orgcode + "&pageNum=" + pageNum,
		dataType : "json",
		success : function(userBeanList)
		{
			createUserTable(userBeanList);
		}
	});
}
  	
function createUserTable(userBeanList)
{
  	$("#dwrytable").find("tbody").empty();
  	appendUserTable(userBeanList);
}
  	
function appendUserTable(userBeanList)
{
  		if (userBeanList && userBeanList != null)
  		{
  			$.each(userBeanList,function(i){
  				var userBean = userBeanList[i];
  				$("#dwrytable").find("tbody:first").append("<tr onmouseover=\"style.backgroundColor='#DCEEFC'\" onmouseout=\"style.backgroundColor='#FFFFFF'\"></tr>");
  				$("#dwrytable").find("tbody:first").find("tr:last").data("rowdata",userBean);
  				
  				if (!mutilSelect)
  				{
  					$("#dwrytable").find("tbody:first").find("tr:last").bind("dblclick",function(){
  						var userBean = $(this).data("rowdata");
		  				$.setResultValue(userBean);
		  				$.closeWindow();
		  			});
  				}
  				
  				
  				if (mutilSelect == true)
  				{
  					$("#dwrytable").find("tbody:first").find("tr:last").append("<td align=\"center\"><input type=\"checkbox\"/></td>")
  				}
  				else
  				{
  					var length = $("#dwrytable").find("tbody:first").find("tr").length;
  					$("#dwrytable").find("tbody:first").find("tr:last").append("<td align=\"center\">" + length + "</td>")
  				}
  				$("#dwrytable").find("tbody:first").find("tr:last").append("<td align=\"center\" title=\"" +userBean["orgname"] +"\">"  + userBean["realname"] + "</td>");
  				$("#dwrytable").find("tbody:first").find("tr:last").append("<td align=\"center\" title=\"" +userBean["orgname"] +"\">"  + $.substring(userBean["orgname"],0,10) + "..</td>");
  			});
  			if (userBeanList.length >= 50)
  			{
  				$("#dwrytable").find("tbody:first").append("<tr><td colspan=\"3\"><a href=\"javascript:loadMoreUserBeanList()\">显示更多</a></td></tr>");
  			}
  		}
}
  	
function loadMoreUserBeanList()
{
  	pageNum = pageNum + 1;
  	$.ajax({
		type : "post",
		url : contextPath + "/cps/queryUserListByOrgCode.action",
		data : "rootOrgCode=" + currentOrgCode+"&pageNum=" + pageNum,
		dataType : "json",
		success : function(userBeanList)
		{
  			$("#dwrytable").find("tbody:first").find("tr:last").remove();
			appendUserTable(userBeanList);
		}
	});
}
  	
function seachUserBeanList(value)
{
  	$.ajax({
			type : "post",
			url : contextPath + "/cps/seachUserBeanListBySearchName.action",
			data : "searchname=" + value,
			dataType : "json",
			success : function(userBeanList)
			{
  				createUserTable(userBeanList);
			}
	});
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

function getSelectedDwryList()
{
	var resultArr = new Array();
	$("#dwrytable").find("tbody:first").find("input:checked").each(function(i){
		var userBean = $(this).parent().parent().data("rowdata");
		resultArr.push(userBean);
	});
	return resultArr;
}

function resultSelectedDwryList()
{
	var resultArr = getSelectedDwryList();
	$.setResultValue(resultArr);
	$.closeWindow();
}


$(document).ready(function(){
	$("#treeDemo").css("height",$("#treepanel").height() -20);
	$("#rylbtable").css("height",$("#treepanel").height() -20);
	$.fn.zTree.init($("#treeDemo"), setting);
	
	if (mutilSelect)
	{
		$("#selectAllChk").click(function(){
			if ($(this).attr("checked"))
			{
				$("#dwrytable").find("tbody:first").find("input[type=checkbox]").attr("checked","true");
			}
			else
			{
				$("#dwrytable").find("tbody:first").find("input[type=checkbox]").removeAttr("checked");
			}
		});
	}
});