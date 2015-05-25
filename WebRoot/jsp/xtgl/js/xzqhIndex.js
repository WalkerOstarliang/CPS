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
		onClick :  queryXzqhList
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
 
function queryXzqhList(event, treeId, treeNode)
{
	var dm = treeNode.id;
	$("#jc").val(treeNode.jc);
	$("#sqbh").val(dm);
	$("#rootParentDm").val(dm);
	var leve = treeNode.leve;
	if (parseInt(leve) < 3)
	{
		$("#addbtn").hide();
	}
	else
	{
		$("#addbtn").show();
	}
	$("#leve").val(leve);
	if (leve == "1" || leve == "2")
	{
		$("#listpanel").show();
		$("#onediv").show();
		$("#towdiv").hide();
		$("#otherdiv").hide();
		$("#sqjbxxdiv").hide();
		$("#gbdiv").hide();
		$("#onelistgrid").query("F","hiddenform");
		$("#currentlistgrid").val("onelistgrid");
	}
	else if (leve == "3")
	{
		$("#listpanel").show();
		$("#onediv").hide();
		$("#twodiv").show()
		$("#otherdiv").hide();
		$("#sqjbxxdiv").hide();
		$("#gbdiv").hide();
		$("#twolistgrid").query("F","hiddenform");
		$("#currentlistgrid").val("twolistgrid");
	}
	else if (leve == "4")
	{
		$("#listpanel").show();
		$("#onediv").hide();
		$("#twodiv").hide()
		$("#otherdiv").show();
		$("#sqjbxxdiv").hide();
		$("#gbdiv").show();
		$("#otherlistgrid").query("F","hiddenform");
		$("#xldquerylist").query("F","hiddenform");
		$("#currentlistgrid").val("otherlistgrid");
	}
	else if (leve == "5")
	{
		$("#listpanel").hide();
		$("#onediv").hide();
		$("#twodiv").hide()
		$("#otherdiv").hide();
		$("#sqjbxxdiv").show();
		$("#gbdiv").hide();
		$("#sqjbxxiframe").attr("src",contextPath + "/afgl/sqjbgl/toXtglSqJbxxInfoPage.action?sqdm=" + dm + "&t=" + new Date().getTime());
	}
}

function czRowCall(tdObj, rowdataobj)
{
	var html = "";
	var leve = $("#leve").val()
	if (leve != "1" && leve!="2")
	{
		html += "<span class=\"cps_span_href\" onclick=\"openXzqhInfoNew('update','" + rowdataobj["dm"] + "')\">修改</span>&nbsp;";
	}
	html += "<span class=\"cps_span_href\" onclick=\"openXzqhInfoNew('detail','" + rowdataobj["dm"] + "')\">详情</span>&nbsp;"
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

function openXzqhInfoNew(operType,dm)
{
	var xzqh = $("#rootParentDm").val();
	if (xzqh != null && xzqh != "")
	{
		$.openWindow({
			url : contextPath + "/xtgl/xzqh/toXzqhPageInfo.action",
			width : 600,
			height : 400,
			data : {
				t : new Date().getTime(),
				operType : operType,
				dm : dm,
				"xzqhBean.parent_dm" : $("#rootParentDm").val(),
				"xzqhBean.leve" : parseInt($("#leve").val()) + 1
			}
		})
	}
	else
	{
		alert("请选择行政区划.");
	}
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

$(function(){
	$.fn.zTree.init($("#treeDemo"), setting);
	var bodyheight = $(document).height();
	var treeheight = bodyheight - 60;
	$("#treeDemo").height(treeheight);
	/*$("#onelistgrid").setTableGridHeight(bodyheight - 40);
	$("#twolistgrid").setTableGridHeight(bodyheight - 40);
	$("#otherlistgrid").setTableGridHeight(bodyheight - 40);*/
	$("#sqjbxxiframe").height(bodyheight - 10)
});



function openSqgbDetailInfo(operType,gbbh)
{
	var sssqbh = $("#sqbh").val();
	var sssqmc =$("#jc").val();
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/toSqgbDetailPage.action",
		data : {
			operType : operType,
			"bean.gbbh" : gbbh,
			"bean.sssqbh":sssqbh,
			"bean.sssqmc":encodeURIComponent(sssqmc),
			"queryBean.lx":$("#lx").val(),
			t:new Date().getTime()
		},
		width : 980,
		height : 650,
		callback : function()
		{
			if(operType != "detail")
			{
				$("#xldquerylist").query("F","queryform");
			}
		}
	})
}


function batchDeleteGbxx()
{
	var selectes = $("#xldquerylist").getSelected();
	if (selectes.length > 0)
	{
		if (confirm("你确定要删除选中的记录？"))
		{
			var bhs = [];
			$.each(selectes,function(i,obj){
				bhs.push(obj["gbbh"]);
			});
			deleteGbxx(bhs.join(","));
		}
	}
	else
	{
		alert("请选择要删除的记录。");
	}
	
}


function deleteGbxx(gbbh)
{
	if (confirm("你确定要删除该干部信息吗？"))
	{
		$.ajax({
			url : contextPath + "/afgl/sqgbgl/deleteSqgbxxBeanByGbbhs.action",
			data : "gbbhs=" + gbbh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除干部信息.");
					$("#xldquerylist").query("F","queryform");
				}
			}
		})
	}
}


function sqgbczRowCallback(tdObj, rowdata)
{
	var html = "";
	var gbbh = rowdata["gbbh"];
	html += "<span class=\"cps_span_href\" onclick=\"openSqgbDetailInfo('update','" + gbbh + "')\">修改</span>";
	return html;
}