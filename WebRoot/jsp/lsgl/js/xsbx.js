function loadRkInfoMainPage(sfzh,callback)
{
	var data = {
		"queryBean.sfzh" : sfzh
	};
	var url = contextPath + "/lsgl/xsbx/toXsbxDetailPage.action";
	$.post(url,data,function(html){
		$("#detailinfo").html(html);
		$("#queryBeansfzh").val(sfzh);
		if ($.isFunction(callback))
		{
			callback();
		}
	});
}

function initAjaxLoadPage()
{
	$("#left_menu").accordion();
	$("#leftpanel").setDomWindowHeight();
	if ($.browser.version == "6.0")
	{
		$("#contentpanel").css("width","84%");
	}
	else
	{
		$("#contentpanel").css("width","86%");
	}
	var jspage = $("#dialog_leftmenu").find("div:first").attr("id");
	
	ajaxLoadPage(jspage,"6");
}


function ajaxLoadPage(jsppage,msgtype)
{
	var operType = $("#queryBeanoperType").val();
	$("#dialog_leftmenu div").removeClass("dialog_menu_selected");
	$("#" + jsppage).addClass("dialog_menu_selected");
	$("#msgtype").val(msgtype);
	$("#jsppage").val(jsppage);
	var url = contextPath + "/lsgl/xsbx/loadZdryInfoPage.action?jsppage=" + jsppage + "&msgtype=" + msgtype;
	$.post(url,$("#queryBeanform").serialize(),function(htmldata){
		$("#contentpanel").html(htmldata);
		var width = $(window).width() * 0.90;
		$("#displayImage").width(width);
		
		if (msgtype == "1")
		{
			var sfzh = $("#sfzh").val();
			loadRkxxBean(sfzh);
		}
		
		if (operType == "detail")
		{
			$("#contentpanel").displayInputForText();
		}
		
	});
}

function submitFormXsbxInfo(callback){
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/saveXsbxBean.action",
			type : "post",
			dataType : "json",
			success :function(Zdryxsbxbean)
			{
				if (!$.isBlank(Zdryxsbxbean))
				{
					alert("数据保存成功");
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		});
	}
}

function initPage(jsppage,msgtype)
{
		ajaxLoadPage(jsppage,msgtype);
}


function submitFormRkInfo(callback)
{
	if ($.validateform("rkxxform"))
	{
		$("#rkxxform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/saveRkxxBean.action",
			type : "post",
			dataType : "json",
			success :function(rkBean)
			{
				if (!$.isBlank(rkBean))
				{
					alert("数据保存成功");
					
					$("#rybh").val(rkBean["jbxxBean"]["rybh"]);
					$("#queryBeanrybh").val(rkBean["jbxxBean"]["rybh"]);
					
					$("#rkfwglid").val(rkBean["rkfwglBean"]["rkfwglid"]);
				
					$("#operType").val("update");
					
					if ($.isFunction(callback))
					{
						callback(rkBean);
					}
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		})
	}
}

function shgxxRowClick(trObj,rowdata)
{
	$("#shgxxxtable").eachObjectSetValue(rowdata);
}


function loadRkxxBean(sfzh)
{
	if (sfzh != null && sfzh != "")
	{
		if (isIdCardNo(sfzh))
		{
			var csrqdate = getCsrqBySfzh(sfzh);
			if (!$.isBlank(csrqdate))
			{
				$("#csrq").val(csrqdate.pattern("yyyy-MM-dd"));
				$("#zpxx").find("img").last().attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + sfzh);
			}
					
			queryRkJbxxBeanBySfzh(sfzh, function(rkJbxxBean){
				if (rkJbxxBean != null)
				{
					$.each(rkJbxxBean,function(key, value){
						if (key != "rylb")
						{
							$("#" + key).val(value);
							$("#" + key + "_hidden").val(value);
						}
					});
					$("#rybh").val(rkJbxxBean["rybh"]);
					$("#queryBeanrybh").val(rkJbxxBean["rybh"]);
				}
				else
				{
					queryRemoteRyxxBean(sfzh,function(czrkBean){
						if (czrkBean != null)
						{
							if (key != "rylb")
							{
								$.each(czrkBean, function(key, value){
									$("#" + key).val(value);
									$("#" + key + "_hidden").val(value);
								});
							}
						}
						else
						{
							$("#xm").removeAttr("readonly").css("background-color","");
							$("#xb").removeAttr("disabled");
							$("#mz").removeAttr("disabled");
							$("#hyzk").removeAttr("disabled");
						}
					});
				}
			});
		}
		else
		{
			alert("身份证号码格式不正确");
			$("#sfzh").val("");
		}
	}
}

function changeGyry(value)
{
	if (value == "1")
	{
		$("tr[id^='row_gyry_']").show();
	}
	else
	{
		$("tr[id^='row_gyry_']").hide();
	}
}

function changeHjylcs(value)
{
	if (value == "1")
	{
		$("tr[id^='hjylcs_row_']").show();
	}
	else
	{
		$("tr[id^='hjylcs_row_']").hide();
	}
}

function changeSfygdzy(value)
{
	if (value == "1")
	{
		$("tr[id^='ywgdzy_row_']").show();
	}
	else
	{
		$("tr[id^='ywgdzy_row_']").hide();
	}
}

function changeSfgzsjc(value)
{
	if (value == "1")
	{
		$("tr[id^='sfgzsjc_row_']").show();
	}
	else
	{
		$("tr[id^='sfgzsjc_row_']").hide();
	}
}

function changeSfgzfc(value)
{
	if (value == "1")
	{
		$("tr[id^='sfgzfc_row_']").show();
	}
	else
	{
		$("tr[id^='sfgzfc_row_']").hide();
	}
}

$(function(){
	var operType = $("#operType").val();
	var rylb = $("#queryBeanrylb").val();
	if (operType == "update" || operType=="detail")
	{
		initAjaxLoadPage();
	}
	else if (rylb == "6")
	{
		initAjaxLoadPage();
	}
})
