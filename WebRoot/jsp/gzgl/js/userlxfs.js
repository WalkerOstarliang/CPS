/**
* 查询用户信息列表
**/
function queryList(){
	$("#datagridList").query("F","searchform");
}

/**
* 
**/
function lxfsCallback(tdObj, rowDataObj){
	var loginuserjh =$("#userjh").val();
	var content = "";
	if(loginuserjh==rowDataObj.username){
	content += "<span  onclick=\"+('" + rowDataObj.id + "','" + loginuserjh +"', 'update')\" style=\"color:green\" class=\"cps_span_href\">修改</span>";
	}
	content += "&nbsp;<span  onclick=\"openLxfsPage('" + rowDataObj.id + "','" + loginuserjh +"', 'detail')\"  style=\"color:green\" class=\"cps_span_href\">详情</span>";
	$(tdObj).html(content);
}
/**
**打开修改页面
**/
function openLxfsPage(lxfsid,userid,operType){
	var url = contextPath +"/gzgl/userlxsfgl/toLxfsPage.action";
	$.openWindow({
		url : url,
		data : {"operType":operType,"id":lxfsid,userid : userid,"t":new Date().getTime()},
		width : 1000,
		height : 500,
		callback : function(){
			if(operType!='detail'){
				$("#pcslist").query("F","hiddenform");
			}
		}
	});
}

function updateLxfs(){
	if ($.validateform("lxfsForm"))
	{
		var lbqxcjsj = $("#lbqxcjsj").val();
		var ssdwdm = $("#orgdwdm").val();
		
		if ((lbqxcjsj == null || lbqxcjsj =="") && ssdwdm.substring(8,10) == '31' && ssdwdm.substring(10) != "00")
		{
			alert("当前民警为社区民警，必须填写从事现社区民警时间.");
			return;
		}
		else
		{
			$("#lxfsForm").ajaxSubmit({
				dataType : "json",
				type : "post",
				success : function(result){
					if(result == true)
					{
						alert("操作成功！");
						window.close();
					}
					else
					{
						alert("操作失败，请重试！");
					}
				}
			});
		}
	}
}

function selectOrg(orgCode){
	openDwSelect(
		{
			rootOrgCode : orgCode,
			mutilSelect : false
		},
		function (orgBean)
		{
			if (orgBean)
			{
				$("#ssdwmc").val(orgBean["name"]);
				$("#ssdwdm").val(orgBean["id"]);
			}
		});
}

function openFjPageInfoNew(fjid,operType,fjlb)
{
	var ssdwdm=$("#rootParentDm").val();
	var ssdwmc=$("#rootParentMc").val();
	if(ssdwdm == null){
		ssdwdm = "";
	}
	if(ssdwmc == null){
		ssdwmc = "";
	}
	$.openWindow({
		url:contextPath+"/gzgl/gzjwsgl/toFjPageInfo.action",
		data:{
			"operType":operType,
			"fjBean.id":fjid,
			"fjBean.ssdwdm":ssdwdm,
			"fjBean.ssdwmc":ssdwmc,
			"fjBean.fjlb":fjlb,
			t:new Date().getTime()
		},
		width:1000,
		height:500,
		callback:function(){
			if(operType!='detail')
			{
				$("#fjtableList").query("F","hiddenform");
			}
		}
	});
}

//打开辅警界面
function  openFjPage(fjid,operType,fjlb)
{
	var ssdwdm=$("#rootParentDm").val();
	var ssdwmc=$("#rootParentMc").val();
	if(ssdwdm == null){
		ssdwdm = "";
	}
	if(ssdwmc == null){
		ssdwmc = "";
	}
	if (fjlb == "1" || fjlb == "3")
	{
		$.openWindow({
			url:contextPath+"/gzgl/gzjwsgl/toFjPageInfo.action",
			data:{
				"operType":operType,
				"fjBean.id":fjid,
				"fjBean.ssdwdm":ssdwdm,
				"fjBean.ssdwmc":ssdwmc,
				"fjBean.fjlb":fjlb,
				t:new Date().getTime()
			},
			width:1000,
			height:500,
			callback:function(){
				if(operType!='detail'){
					$("#fjtableList").query("F","hiddenform");
				}
			}
		});
	}
	else if (fjlb == "2")
	{
		$.openWindow({
			url:contextPath+"/afgl/xldxx/toXldxxPage.action",
			width:1000,
			height:500
		});
	}
}


//保存辅警
function saveFjBean(){
	if($.validateform("fjForm"))
	{
		$("#fjForm").ajaxSubmit({
			url:contextPath+"/gzgl/gzjwsgl/saveFjBean.action",	
			type:"post",
			dataType:"json",
			success: function(msg)
			{
				if(msg == "sameperson"){
					alert("该身份证号已经登记过,请重新输入。");
				}
				else if(msg == true){
					alert("信息保存成功!");
					window.close();
					$("#fjtableList").query("F","hiddenform");
				}else{
					alert("操作失败，请重试！");
				}
			}	
		})
	}
}

function fjCallback(tdObj, rowDataObj){
	var content = "";
	content += "<span  onclick=\"openFjPageInfoNew('" + rowDataObj["id"] + "', 'detail','" + rowDataObj["fjlb"] + "')\"  style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;";
	var ssdwdm = rowDataObj["ssdwdm"];
	if($("#loginorgcode").val().substring(1,8)==ssdwdm.substring(1,8))
	{
		content += "<span  onclick=\"openFjPageInfoNew('" + rowDataObj["id"] + "', 'update','" + rowDataObj["fjlb"] + "')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;";
		
		if (rowDataObj["zxbs"] != "1")
		{
			content += "<span onclick =\"loginoutFjBean('"+rowDataObj["id"]+"')\" style = \"color:green\"  class=\"cps_span_href\"  >注销</span>";
		}
	}
	return content;
}

function loginoutFjBean(id){
	if(confirm("确定要注销该记录么?")){
		$.ajax({
			url : contextPath + "/gzgl/gzjwsgl/loginoutFjBean.action",
			type:"post",
			dataType :"json",
			data:{
				"fjBean.id":id
			},
			success : function(msg){
				if(msg){
					alert("注销成功");
					$("#fjtableList").query("F","hiddenform");
				}else{
					alert("操作失败,请重试.");
				}
			}
		})
	}
}

function loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null){
			$("#xb").val(rkJbxxBean["xb"]);
			var inputxb =$("#xb").attr("inputid");
			if(inputxb != undefined && inputxb!= null && inputxb!=''){
				var text = $("#xb").find("option:selected").text();
			    $("#"+inputxb).val(text);
			}
			$("#xbms").val(rkJbxxBean["xb"])
			$("#fjxm").val(rkJbxxBean["xm"]);
			$("#whcd").val(rkJbxxBean["whcd"]);
			$("#mz").val(rkJbxxBean["mz"]);
			$("#lxfs").val(rkJbxxBean["lxdh"]);
			$("#hjd").val(rkJbxxBean["hjdxz"]);
			$("#xzz").val(rkJbxxBean["xzzxz"]);
			$("#rkzpxx").attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + sfzh);
		}
	});
}


function openSelectXzqh(rootOrgCode,callback)
{
	openXzqhTree({
		rootOrgCode : rootOrgCode,
        mutilSelect : false,
        isAsyn : true,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(xzqhBean){
		callback(xzqhBean);
	})
}

function callbackHjdqh(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#hjd").val(xzqhBean["name"]);
	}
}

$(function(){
	var sfzh=$("#sfzh").val();
	var id=$("#id").val();
	if(id==''|| id==null){
		loadRkxxBean(sfzh);
	}
})


function exportLkXgyInfo(){
	var fjlistSelects = $("#fjtableList").getSelected();
	if(fjlistSelects.length > 0){
		if (confirm("你确定导出选择的记录吗?")){
			$("#exportform").attr("action",contextPath + "/gzgl/gzjwsgl/toExportExcelFjxxInfoPage.action");
			var ids = [];
			$.each(fjlistSelects,function(i){
				var fjBean = fjlistSelects[i];
				ids.push(fjBean["id"]);
			});
			var idsStr = ids.join(",");
			$("#ids").val(idsStr);
			$("#exportform").attr("target","exportiframe");
			$("#exportform").submit();
		}	
	}else{
		if (confirm("你确定导出满足条件的所有数据吗?"))
		{
			$("#hiddenform").attr("target","exportiframe");
			$("#hiddenform").attr("action",contextPath + "/gzgl/gzjwsgl/toExportExcelFjxxInfoPage.action");
			$("#hiddenform").submit();
		}
	}
}



function doublePcsGajgjgForLkXgy(parentcode,selectid,callback)
{
	$.ajax({
		type : "post",
		dataType : "json",
		url : contextPath + "/cps/common/queryPcsGajgjgForLkXgy.action",
		data : "parent_dm=" + parentcode,
		success : function(list)
		{
			if (selectid != null && selectid != "")
			{
				$("#" + selectid).empty();
				if (list != null && list.length > 0)
				{
					$("#" + selectid).append("<option value=''> </option>");
					$.each(list,function(i,obj){
						$("#" + selectid).append("<option value='" + obj["dm"] + "'>" + obj["jc"] + "</option>");
					});
				}
			}
			if ($.isFunction(callback))
			{
				callback(list);
			}
		}
	});
}


function selectOrg1(rootOrgCode, hiddenfield, showfield) {
	if (rootOrgCode) {
		openDwSelect3({
			rootOrgCode : rootOrgCode,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

function addXldydyxx()
{
 	var selectes = $("#fjtableList").getSelected();
 	if (selectes.length==1)
 	{
 		var xldbh = selectes[0]["xldbh"];
		$.openWindow({
			url:contextPath+"/gzgl/gzjwsgl/toFjPageInfo.action",
			data:{
				"operType":"add",
				"fjBean.fjlb":"2",
				"fjBean.xldbh":xldbh
			},
			width:1000,
			height:500
		}); 
	}
	else if (selectes.length > 1)
	{
		alert("只能选择一个队友.");
	}
	else if(selectes.length<=0)
	{
		alert("请选择一个队友.");
	}
}

//新增巡防队员
function addNewXfdy(){
	$("#mainiframe",parent.document).attr("src",contextPath + "/afgl/xldxx/toXldxxPage.action");
}

