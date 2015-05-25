function openXldSelectWin(xldlx)
{
	$.openDialogWindow({
		url : contextPath + "/gzgl/xldrw/toXldxxSelectPage.action?t=" + new Date().getTime() + "&queryBean.xldlx=" + xldlx,
		width:950,
		height : 500,
		scroll : false,
		callback : function(xldxxBean)
		{
			if (xldxxBean)
			{
				$("#xldmc").val(xldxxBean["xldmc"]);
				$("#xldbh").val(xldxxBean["xldbh"]);
				$("#xldbh_ry").val(xldxxBean["xldbh"]);
				$("#xldzrrxm").html(xldxxBean["xldzrrxm"]);
				$("#ssdwmc").html(xldxxBean["ssdwmc"]);
				queryXldryList();
			}			
		}
	});
}

function queryXldryList()
{
	$("#xldyquerylist").query("F","xldinfoform");
}

function selectXfryBySfzh(sfzh){
  $.ajax({
			type : "post",
			dataType : "json",
			url : contextPath + "/afgl/xldxx/selectXfryxxBySfzh.action",
			data :{
				"xldRyxxBean.xldysfzh":sfzh
			},
			success : function(isboolean)
			{
				if(isboolean){
				  alert("此身份证号已存在，请勿重复录入");
				}else{
					getXldryxx(sfzh);
				}
			}
		})
}

function getXldryxx(sfzh)
{
	if (sfzh != null && sfzh != "")
	{
		queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
			if (rkJbxxBean)
			{
				$("#xldyxm").val(rkJbxxBean["xm"]);
				$("#xldyxb").val(rkJbxxBean["xb"]);
				$("#xldycsrq").val(rkJbxxBean["csrq"]);
				$("#xldyhjdxz").val(rkJbxxBean["hjdxz"]);
				$("#xldyxzdxz").val(rkJbxxBean["xzzxz"]);
				$("#xldylxdh").val(rkJbxxBean["lxdh"]);
			}
			else
			{
				alert("没找到对应的人员信息.")
			}
		});
	}
	
}

function openSelectMjWin(rootOrgCode)
{
	openDwRySelect({
		rootOrgCode : rootOrgCode,
		mutilSelect : false
	},function(userBean){
		if (userBean)
		{
			$("#xldysfzh").val(userBean["sfzh"]);
			$("#xldyxm").val(userBean["realname"]);
		}
	})
}

function submitSaveXldryxx()
{
	var xldbh = $("#xldbh").val();
	if (xldbh != null && xldbh != "")
	{
		if ($.validateform("xldyform"))
		{
			$("#xldyform").ajaxSubmit({
				type : "post",
				success : function()
				{
					if($("#operType").val()=="add"){
					alert("保存成功！");
					queryXldryList();
					clearForm();
					//window.close();
				}
				else if($("#operType").val()=="update"){
					alert("保存成功！");
					queryXldryList();
					clearForm();
					//window.close(); 
				}	
					/*var xldbh = $("#xldbh").val()
					queryXldryList();
					$("#xldyform").find("input[name^=xldRyxxBean]").each(function(){
						var comid = $(this).attr("id");
						if (comid && comid != "djrjh" 
							&& comid != "djrxm" 
							&& comid != "djdwdm" 
							&& comid != "djdwmc" 
							&& comid != "djsj")
						{
							$(this).val("");
						}
					});
					$("#operType").val("add");*/
				}
			})
		}
	}
	else
	{
		alert("请选择巡逻队。");
	}
}

function clearForm()
{
	$("#operType").val("add");
	$("#xldyform").find("input[name^=xldRyxxBean]").each(function(){
		var comid = $(this).attr("id");
		if (comid && comid != "djrjh" 
			&& comid != "djrxm" 
			&& comid != "djdwdm" 
			&& comid != "djdwmc" 
			&& comid != "djsj")
		{
			$(this).val("");
		}
	});
	$("#bz").val("");
}

function rowSetFormValue(trObj, rowDataObj)
{
	$.setFormValue("xldyform",rowDataObj);
	$("#operType").val("update");
}

function deleteXldryxx(xldrybh)
{
	if (confirm("你确定要删除选中的队员？"))
	{
		$.ajax({
			type : "post",
			dataType : "json",
			url : contextPath + "/afgl/xldxx/deleteXldyxx.action",
			data : "xldrybhs=" + xldrybh,
			success : function()
			{
				queryXldryList();
			}
		})
	}
}

function czrowbackcallfun(trObj, rowdataobj)
{
	var result = "";
	 result += "<span style=\"color:green\" onclick=\"deleteXldryxx('" + rowdataobj["xldybh"] + "')\" class=\"cps_span_href\">删除</span>";
	 return result;
}

function setxlddyxx(ryxxBean){
	$("#xldyxm").val(ryxxBean["xm"]);
	$("#xldyxb").val(ryxxBean["xb"]);
	var inputxb =$("#xldyxb").attr("inputid");
	if(inputxb != undefined && inputxb!= null && inputxb!=''){
		var text = $("#xldyxb").find("option:selected").text();
	    $("#"+inputxb).val(text);
	}
	$("#xldycsrq").val(ryxxBean["csrq"]);
	$("#xldylxdh").val(ryxxBean["lxdh"]);
	$("#xldyxzdxz").val(ryxxBean["xzzxz"]);
	$("#xldyhjdxz").val(ryxxBean["hjdxz"]);
}

$(function(){
	var sfzh = $("#xldysfzh").val();
	var xldybh = $("#xldybh").val();
	if(xldybh == '' || xldybh == null){
		queryRkBean(sfzh,setxlddyxx);
	}


})
function submitSaveXfryxx(){
	if ($.validateform("xfryform"))
	{
		$("#xfryform").ajaxSubmit({
			type : "post",
			dataType:"json",
			success : function(message)
			{ 
				if (message)
				{
					alert("保存巡防人员信息成功！");
					window.close();
				}
				else
				{
					alert("保存巡防人员信息失败.请稍后再试。");
				}
			}
		})
	}
}