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
		onClick :  callbackOnclick
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
 
  	
function filter(treeId, parentNode, childNodes) 
{
	if (!childNodes) return null;
	for (var i=0, l=childNodes.length; i<l; i++) 
	{
		childNodes[i].name = childNodes[i].jc;
		childNodes[i].ispcs= childNodes[i].ispcs;
	}
	return childNodes;
}

function callbackOnclick(event, treeId, treeNode)
{
//	$("#rootParentDm").val(treeNode.id);
//	$("#rootParentMc").val(treeNode.name);
	var rootParentDm=treeNode.id;
	var rootParentMc=treeNode.name;
	$("#pcsjbxxiframe").attr("src",contextPath + "/gzgl/gzjwsgl/toPcsPageInfo.action?pcsBean.orgcode="+treeNode.id+"&ispcs="+treeNode.ispcs+"&rootParentDm="+rootParentDm);
//	$("#pcsjbxxiframe").attr("src",contextPath + "/gzgl/gzjwsgl/toPcsPageInfo.action?pcsBean.orgcode="+treeNode.id+"&rootParentDm="+rootParentDm+"&ispcs="+treeNode.ispcs+"&rootParentMc="+escape(encodeURIComponent(rootParentMc)));
//	$("#pcslist").query("F","hiddenform");
//	$("#fjtableList").query("F","hiddenform");
	
}

function pcsrowcallback(tdObj,rowdata){
	var html="";
	html += "<span class=\"cps_span_href\" onclick=\"openPcsInfoNew('update','" + rowdata["username"] + "')\">修改</span>&nbsp;"
	html += "<span class=\"cps_span_href\" onclick=\"openPcsInfoNew('detail','" + rowdata["username"] + "')\">详情</span>&nbsp;"
	return html;
}

/**
 * 人员选择
 * @param {} orgcode
 */
function orgUserSelect(orgcode){
	openDwRySelect(
		{
			rootOrgCode : orgcode,
			mutilSelect : false
		},
		function (userbean){
			if(userbean != null){
				$("#pcsszjh").val(userbean.username);
				$("#pcsszxm").val(userbean.realname);
				$("#pcsszsfzh").val(userbean.sfzh);
			}
		});
}

$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo"), setting);
	var docheight = $(document).height();
	
	$("#treeDemo").height(docheight -45)
	$("#centertable").height(docheight -50);
	$("#pcsjbxxiframe").height(docheight -8)
});

function updatePcsry(trobj,data){
	openPcsRyWin('update',data);
}

/**
 * 打开派出所荣誉
 */
var pcsRyDiv;
function openPcsRyWin(opertype,data){
	if(opertype == 'add'){
		$("#pcsryForm")[0].reset();
		$("#pcsry_hjlx").val("");
	}else if(opertype == 'update'){
		$.each(data,function(key,value){
			$("#pcsry_" + key).val(value);
		});
	}
	pcsRyDiv = $.layer({
	 	type:1,
	 	title:false,
	 	area:['500px','100px'],
	 	border: [10, 0.3, '#000'],
	 	shade: [0.5, '#000',true],
	 	page: {
			dom: '#pcsRyDiv' 
		}
	 });
}

/**
 * 保存派出所荣誉
 */
function savePcsry(){
	if($.validateform("pcsryForm")){
		$("#pcsryForm").ajaxSubmit({
			url:contextPath+"/gzgl/gzjwsgl/savePcsRy.action",
			dataType:"json",
			type:"post",
			success:function(result){
				if(result){
					$("#pcsryList").query("F");
					layer.close(pcsRyDiv);
					alert("保存成功.");
				}else{
					alert("保存失败.");
				}
			}
		});
	}
}

/**
 * 删除派出所荣誉
 * @param {} id
 */
function deletePcsRy(id){
	$.ajax({
		url:contextPath + "/gzgl/gzjwsgl/deletePcsRy.action",
		data:{"pcsry.id":id},
		type:"post",
		success:function(){
			$("#pcsryList").query("F");
			alert("删除成功.");
		}
	});
}