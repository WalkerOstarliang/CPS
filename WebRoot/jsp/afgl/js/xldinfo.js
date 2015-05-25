function openSelectZrrInfo(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : true
		},
		function(userBeans)
		{
			if (userBeans && userBeans != null)
			{
				var names = [];
				var dhs = [];
				$.each(userBeans, function(i, userBean){
					names.push(userBean["realname"]);
					var dh = userBean["mobile"] ? userBean["mobile"] : userBean["telephone"];
					if (dh != null && dh != "")
					{
						dhs.push(dh);
					}
				});
				$("#xldzrrxm").val(names.join(","));
				if (dhs.length > 0)
				{
					$("#xldzzrlxdh").val(dhs.join(","));
				}
			}
		});
}

function openFgdwldrWid(rootOrgCode)
{
	openDwRySelect({
			rootOrgCode : rootOrgCode,
			mutilSelect : false
		},
		function(userBean)
		{
			if (userBean && userBean != null)
			{
				$("#djrjh").val(userBean["username"]);
				$("#ssdwfgld").val(userBean["realname"]);
				$("#ssdwdm").val(userBean["orgcode"]);
				$("#ssdwmc").val(userBean["orgname"])
				$("#ssdwfgldlxdh").val(userBean["mobile"] ? userBean["mobile"] : userBean["telephone"]);
			}
		});
}

function openSsdwSelectWin(rootOrgCode,dwdm,dwmc)
{
		openDwSelect({
			rootOrgCode : rootOrgCode,
      		mutilSelect : false,
       		nodeSelectedType : "ps",
       		nodeNotSelectedType : "ps"
		},function(orgbean){
			if (orgbean)
			{
				$("#" + dwdm).val(orgbean["id"]);
				$("#" + dwmc).val(orgbean["name"]);
			}
		});
}

function submitSaveXldxx()
{
	if ($.validateform("xldform"))
	{
		$("#xldform").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(xldbh)
			{
				if (xldbh != null && xldbh != "")
				{
					$("#xldbh").val(xldbh);
					alert("保存巡逻队信息成功.请添加队员信息");
					
				}
				else
				{
					alert("保存巡逻队信息失败.请稍后再试。");
				}
			},
			error : function(xldbh)
			{
				alert("保存巡逻队信息失败,请检查原因。");
			}
		})
	}
}

function changeCxbs(value)
{
	if (value == "0")
	{
		var currentDate = new Date();
		var dateObj = new Date();
		var dateStr = dateObj.pattern("yyyy-MM-dd HH:mm:ss");
		$("#cxsj").val(dateStr)
	}
	else
	{
		$("#cxsj").val("");
	}
}

/**
 * 添加巡逻队员
 * @param {Object} operType
 * @param {Object} xldlx
 * @param {Object} xldbh
 */
function openXldryInfoWin(operType,fjid,fjlb,xldbh)
{
	$.openWindow({
		url:contextPath+"/gzgl/gzjwsgl/toFjPageInfo.action",
		data:{
			"operType":operType,
			"fjBean.id":fjid,
			"fjBean.fjlb":fjlb,
			"fjBean.xldbh":xldbh
		},
		width:1000,
		height:500
	}); 
}



function addXldyxx()
{
	var xldbh = $("#xldbh").val();
	var xldlx = $("#xldlx").val();
	if (!$.isBlank(xldbh))
	{
		openXldryInfoWin('add',"","2",xldbh);
	}
	else
	{
		alert("请保存巡逻队信息。");
	}
}

function fjCallback(tdObj, rowDataObj){
	var content = "";
	content += "<span  onclick=\"openFjPage('" + rowDataObj["id"] + "', 'detail')\"  style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;";
	var ssdwdm = rowDataObj["ssdwdm"];
	var loginorgcode = rowDataObj["currentOrgCode"];
	if(loginorgcode==ssdwdm)
	{
		content += "<span  onclick=\"openFjPage('" + rowDataObj["id"] + "', 'update')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;";
		
		if (rowDataObj["zxbs"] != "1")
		{
			content += "<span onclick =\"loginoutFjBean('"+rowDataObj["id"]+"')\" style = \"color:green\"  class=\"cps_span_href\"  >注销</span>";
		}
	}
	return content;
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
	$.openWindow({
		url:contextPath+"/gzgl/gzjwsgl/toFjPageInfo.action",
		data:{
			"operType":operType,
			"fjBean.id":fjid,
			"fjBean.ssdwdm":ssdwdm,
			"fjBean.ssdwmc":ssdwmc,
			"fjBean.fjlb":fjlb
		},
		width:1000,
		height:500
	});
}

function loginoutFjBean(id){
	if(confirm("确定要注销该记录么?"))
	{
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


