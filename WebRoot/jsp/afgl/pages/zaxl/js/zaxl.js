/**
 * 治安巡逻查询
 */
function zaxlSearch(){
	$("#zaxlList").query("F","zaxlSearch");
}

/**
 * 重置查询表单
 */
function resetZaxlSeach(){
	$("#zaxlSearch").reset();
}

/**
 * 打开治安巡逻详情窗口
 */
function openZaxlInfoWin(opertype,id){
	var data = {"operType":opertype};
	if(id){
		data["query.id"] = id;
	}
	$.openWindow({
		url:contextPath + "/afgl/zaxl/toZaxlInfoPage.action",
		data:data,
		width:"750px",
		height:"600px"
	});
}

/**
 * 注销治安巡逻
 * @param {} id
 */
function cancelZaxl(id){
	if(confirm("确认注销?")){
		$.ajax({
			url:contextPath + "/afgl/zaxl/saveZaxl.action",
			data:{"zaxl.id":id,"operType":"delete"},
			type:"post",
			dataType:"json",
			success:function(result){
				if(result){
					if(result.id){
						alert("注销成功.");
						zaxlSearch();
					}else{
						alert("注销失败.");
					}
				}else{
					alert("注销失败.");
				}
			},
			error:function(){
				alert("请求失败.")
			}
		});
	}
}

/**
 * 保存治安巡逻信息
 */
function saveZaxlInfo(){
	if($.validateform("zaxlForm")){
		$("#zaxlForm").ajaxSubmit({
			url:contextPath + "/afgl/zaxl/saveZaxl.action",
			dataType:"json",
			success:function(result){
				if(result){
					if(result.id){
						$("#id").val(result.id);
						alert("保存成功");
					}else{
						alert("保存失败.");					
					}
				}else{
					alert("保存失败.");
				}
			}
		});
		
	}
}


//选择社区
function openSqxxSelectWin()
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if (sqjbxxBean)
			{
				$("#xlsqdm").val(sqjbxxBean.sqbh);
				$("#xlsqmc").val(sqjbxxBean.sqmc);
			}
		}
	});
}


function openOrgMj(rootOrgCode)
{
	openDwRySelect({
		 rootOrgCode : rootOrgCode,
       	 mutilSelect : true
	},function(userbeans){
		if (userbeans)
		{
			var usernames = [];
			$.each(userbeans,function(i,bean){
				usernames.push(bean["realname"]);
			})
			var xlry = $("#xlry").val();
			$("#xlry").val(xlry + usernames.join(","))
		}
	})
}

function addZaxlryMjInfo(rootOrgCode){
	var sTrHtml ;
	var zaxlid = $("#id").val();
	if(!zaxlid){
		alert('请先保存巡逻基本信息再添加民警');
		return false;
	}
	openDwRySelect({
		 rootOrgCode : rootOrgCode,
       	 mutilSelect : true
	},function(userbeans){
		if (userbeans)
		{
			$.each(userbeans,function(i,bean){
				sTrHtml = sTrHtml+'&'+ 'zaxlrymjlist['+i+'].xldyxm=' + ''+ bean["realname"];
				sTrHtml = sTrHtml+'&'+ 'zaxlrymjlist['+i+'].xldysfzh=' + ''+ bean["sfzh"];
				sTrHtml = sTrHtml+'&'+ 'zaxlrymjlist['+i+'].xldylxdh=' + ''+ bean["telephone"];
				sTrHtml = sTrHtml+'&'+ 'zaxlrymjlist['+i+'].zaxlid=' + ''+ zaxlid;
				sTrHtml = sTrHtml+'&'+ 'zaxlrymjlist['+i+'].zw=1';
			})
			$.ajax({
				type:"POST",
				data:sTrHtml,
				url:contextPath + "/afgl/zaxl/saveZaxlryMj.action",
				success:function(msg){
					$("#zaxlryList").query("F","zaxlForm");
				}
			});
		}
	})
}

function callBackXldyCz(trObj, rowdataObj)
{
	var result = "";
	var _operType = $("#operType").val();
	if(_operType != 'detail'){
		result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"cancelXldyById('"+ rowdataObj["id"] +"')\">删除</span>&nbsp;";
	}
	return result;
}
// 根据ID注销巡逻人员信息
function cancelXldyById(id){
	$.ajax({
		type:'POST',
		data:{"query.id":id},
		url:contextPath + "/afgl/zaxl/cancelZaxlryById.action",
		success:function(msg){
			$("#zaxlryList").query("F","zaxlForm");
		}
	});
}
// 选择巡逻民警
function addZaxlryXlMjInfo(){
	var id = $("#id").val();
	if(!id){
		alert('请先保存巡逻基本信息再添加巡逻民警');
		return ;
	}
	$.openDialogWindow({
		url : contextPath + "/afgl/zaxl/toOpenXlMjSelectPage.action?query.id="+id,
		width : 900,
		height : 500,
		callback : function(xlMjxxBean)
		{
			if (xlMjxxBean)
			{
				var xm = xlMjxxBean.xldyxm ;
				var sfzh = xlMjxxBean.xldysfzh ;
				var lxdh = xlMjxxBean.xldylxdh ;
				$.ajax({
					type:'POST',
					data:{"zaxlry.xldyxm": xm ,
						  "zaxlry.xldysfzh":sfzh ,
						  "zaxlry.xldylxdh":lxdh ,
						  "zaxlry.zaxlid":id
						  },
					url: contextPath + "/afgl/zaxl/saveXlMjxx.action",
					success:function(msg){
					}	  
				});
			}
		}
	});
	 xlmjxxQuery();
}
function xlmjxxQuery(){
	$("#zaxlryList").query("F","zaxlForm");
}
// 新增社区干部
function addZaxlrySqgbInfo(){
	var id = $("#id").val();
	if(!id){
		alert('请先保存巡逻基本信息再添加社区干部');
		return ;
	}
	$.openDialogWindow({
		url : contextPath + "/afgl/zaxl/toOpenSqgbSelectPage.action?query.id="+id,
		width : 900,
		height : 500,
		callback : function(sqgbxxBean)
		{
			if (sqgbxxBean)
			{
				var xm = sqgbxxBean.gbxm ;
				var sfzh = sqgbxxBean.gbsfzh ;
				var lxdh = sqgbxxBean.gblxdh ;
				$.ajax({
					type:'POST',
					data:{"zaxlry.xldyxm": xm ,
						  "zaxlry.xldysfzh":sfzh ,
						  "zaxlry.xldylxdh":lxdh ,
						  "zaxlry.zaxlid":id
						  },
					url: contextPath + "/afgl/zaxl/saveSqgbxx.action",
					success:function(msg){
					}	  
				});
			}
		}
	});
	 xlmjxxQuery();
}
// 新增治安巡逻--普通群众巡逻员
function addZaxlryInfo(){
	var id = $("#id").val();
	if(!id){
		alert('请先保存巡逻基本信息再添加巡逻人员');
		return ;
	}
	$.openWindow({
		url : contextPath + "/afgl/zaxl/toOpenZaxlryInfo.action?zaxlry.zaxlid="+id,
		width : 700,
		height : 400,
		data : {
			"operType":'add',
			t: new Date().getTime()
		}
	});
}
// 保存治安巡逻--普通群众巡逻员信息
function submitSavexlryinfo(){
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(result)
			{
				opener.xlmjxxQuery();
			}
		})
	}
}

// 通过身份证号加载人员基本信息
function  loadywhcyRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#xldyxm").val(rkJbxxBean["xm"]);
			$("#xldylxdh").val(rkJbxxBean["lxdh"]);
		}
		else
		{
			alert("未找到人员信息");
		}
	});
}
// 新增治安巡逻-- 盘查人员
function addZaxlpcryInfo(){
	var id = $("#id").val();
	if(!id){
		alert('请先保存巡逻基本信息再添加盘查人员');
		return ;
	}
	$.openWindow({
		url : contextPath + "/afgl/zaxl/toOpenZaxlpcryInfo.action?zaxlpcdx.zaxlid="+id,
		width : 600,
		height : 300,
		data : {
			"operType":'add',
			t: new Date().getTime()
		}
	});
}

function  loadypccyRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#pcryxm").val(rkJbxxBean["xm"]);
			$("#pcrylxdh").val(rkJbxxBean["lxdh"]);
		}
		else
		{
			alert("未找到人员信息");
		}
	});
}

// 保存盘查人员信息
function submitSavexlpcryinfo(){
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(result)
			{
				opener.xlpcryQuery();
			}
		})
	}
}
function xlpcryQuery(){
	$("#zaxlpcryList").query("F","zaxlForm");
}

function callBackXldypcryCz(trObj, rowdataObj)
{
	var result = "";
	var _operType = $("#operType").val();
	if(_operType != 'detail'){
		result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"cancelXldpcryById('"+ rowdataObj["id"] +"')\">删除</span>&nbsp;";
	}
	return result;
}
// 删除（注销）盘查人员
function cancelXldpcryById(id){
	$.ajax({
		type:'POST',
		data:{"query.id":id},
		url:contextPath + "/afgl/zaxl/cancelZaxlrpcryById.action",
		success:function(msg){
			$("#zaxlpcryList").query("F","zaxlForm");
		}
	});
}