function validateDwExists()
{
	var dwmc = $("#dwjbxx_dwmc").val();
	if (dwmc != null){
		$.ajax({
		type : "post",
		url : contextPath + "/sydw/dwgl/queryDwBeanBeanByXqDwmc.action",
		data:{"queryBean.dwmc":encodeURIComponent(dwmc)},
		success : function(dwdz)
		{
			if (dwdz != null && dwdz != "null")
			{
				if (!confirm("相同名称的单位已经在本辖区内登记,登记地址为：" + dwdz + ",请确定是否需要继续登记。点击”确定“继续登记，取消将关闭登记窗口？"))
				{
					window.close();				
				}
			}
		},
		error : function(error)
		{
			alert("验证发生错误，请稍后再试.")
		} 
	})
	}
}

function submitDwBeanForm()
{
	var dwmc = $("#dwjbxx_dwmc").val();
	var dwdm = $("#dwdm").val();
	var yyzzbh = $("#yyzzbh").val();
	if (dwmc == null || dwmc == "")
	{
		alert("单位名称不能为空.");
		return false;
	}
	if ((dwdm == null || dwdm == "") && (yyzzbh == null || yyzzbh == ""))
	{
		alert("组织机构代码和营业执照号必须填写一项。");
		return false;
	}
	if ($("#sfzjy").attr("checked"))
	{
		if ($("#frsfzhm").val() == null || $("#frsfzhm").val() == "")
		{
			alert("法人证件号码不能为空.")
			return false;
		}
		if (!isSfzh($("#frsfzhm").val()))
		{
			alert("法人证件号码不是正确的身份证号码.")
			return false;
		}
	}
	else
	{
		if ($("#frsfzhm").val() == null || $("#frsfzhm").val() == "")
		{
			alert("法人证件号码不能为空.")
			return false;
		}
	}
	
	if ($("#dwlbxl").val() == null || $("#dwlbxl").val() == "")
	{
		alert("单位类别不能为空.")
		return false;
	}
	if ($("#dwdh").val() == null || $("#dwdh").val() == "")
	{
		alert("单位电话号码不能为空.");
		return false;
	}
	
	var dwsxs = $("input[name='dwBean.dwjbxx.hylbs']:checked");
	if (dwsxs.length <=0)
	{
		alert("单位属性选项至少要选择一项.");
		return false;
	}
	
	var index = layer.load(0);
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("sydwform"))
	{
		$("#sydwform").submit();
	}
	else
	{
		$("#savebtn").removeAttr("disabled")
		 layer.close(index);
	}
}

function openDwSelectFwInfoPage()
{
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toSelectFwWin.action",
		width:900,
		height:650,
		data : {
			"queryBean.rylb":"2",
			"queryBean.selectType" : "select", 
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			if (resultObj)
			{
				var fwxxBean = resultObj["fwxxBean"];
				$("#fwid").val(fwxxBean["fwid"]);
				$("#dzid").val(fwxxBean["dzid"]);
				$("#dzmc").val(fwxxBean["dzmc"]);
				$("#sssqdm").val(fwxxBean["sssq"]);
			}
		}
	});
}



function saveDwBean()
{
	var dwdm = $("#dwdm").val();
	var yyzzbh = $("#yyzzbh").val();
	if ((dwdm == null || dwdm == "") && (yyzzbh == null || yyzzbh == ""))
	{
		alert("组织机构代码和营业执照号必须填写一项。");
		return false;
	}
	if ($("#sfzjy").attr("checked"))
	{
		if ($("#frsfzhm").val() == null || $("#frsfzhm").val() == "")
		{
			alert("法人证件号码不能为空.")
			return false;
		}
		if (!isSfzh($("#frsfzhm").val()))
		{
			alert("发生证件号码不是正确的身份证号码.")
			return false;
		}
	}
	else
	{
		if ($("#frsfzhm").val() == null || $("#frsfzhm").val() == "")
		{
			alert("法人证件号码不能为空.")
			return false;
		}
	}
	
	if ($("#dwlbxl").val() == null || $("#dwlbxl").val() == "")
	{
		alert("单位类别不能为空.")
		return false;
	}
	
	if ($("#dwdh").val() == null || $("#dwdh").val() == "")
	{
		alert("单位电话号码不能为空.");
		return false;
	}
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("sydwform"))
	{
		$("#sydwform").ajaxSubmit({
			url : contextPath + "/sydw/dwgl/saveDwJbxxBean.action",
			dataType : "json",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					
					var jgbh = dwBean["dwjbxx"]["jgbh"];
					var thbh = dwBean["tzhy"]["thbh"];
					var ggcsbh = dwBean["ggcs"]["ggcsbh"];
					var nbdwbh = dwBean["nbdw"]["nbdwbh"];
					var wxpdwjlbh = dwBean["wxwpdwBean"]["jlbh"];
					var wbjlbh = dwBean["swfwcs"]["jlbh"];
					var swdwjlbh = dwBean["swdwBean"]["jlbh"];
					var oldhylb = dwBean["dwjbxx"]["hylb"];
					var dwwfwglid = dwBean["dwfwglBean"]["dwfwglid"];
					var oldfwid = dwBean["dwfwglBean"]["fwid"];
					$("#oldhylb").val(oldhylb);
					$("#jgbh").val(jgbh);
					$("#thbh").val(thbh);
					$("#ggcsjlbh").val(ggcsbh);
					$("#nbdwbh").val(nbdwbh);
					$("#wxpdwjlbh").val(wxpdwjlbh);
					$("#wbjlbh").val(wbjlbh);
					$("#swdwjlbh").val(swdwjlbh);
					$("#dwfwglid").val(dwwfwglid);
					$("#oldfwid").val(oldfwid)
					alert("单位信息保存成功.");
				}
				else
				{
					alert("单位信息保存失败.请稍后再试.")
				}
				$("#savebtn").removeAttr("disabled")
			},
			error : function(error)
			{
				alert("系统发生异常，请稍后再试.")
				$("#savebtn").removeAttr("disabled")
			}
		});
	}
	else
	{
		$("#savebtn").removeAttr("disabled")
	}
}

function checkLoadFrzjhmInfo()
{
	if ($("#frsfzhm").val() !=null && $("#frsfzhm").val() != "")
	{ 
		if (isSfzh($("#frsfzhm").val()))
		{
			queryRkBean($("#frsfzhm").val(), function(czrkxxBean) {
				if (czrkxxBean != null) 
				{
					$("#frdb").val(czrkxxBean.xm);
					$("#frlxdh").val(czrkxxBean.lxdh);
				}
			});
		}
		else
		{
			if ($("#sfzjy").attr("checked"))
			{
				alert("身份证号码格式不正确");
			}
		}
	}
}

//是否校验身份证
function changeFrsfrz(obj)
{
	var frsfzhm = $("#frsfzhm").val();
	if (frsfzhm != null && frsfzhm != "")
	{
		if ($(obj).attr("checked"))
		{
			$("#frsfzhm").attr("class"," validate[[required, maxSize[18],funcCall[checkIDC]]]  cps-input");
			$("#frsfzhm").bind("blur",function(){
				checkLoadFrzjhmInfo();
			});
		}
		else
		{
			$("#frsfzhm").attr("class"," validate[[required, maxSize[18]]] cps-input");
			$("#frsfzhm").unbind("blur");
		}
	}
	
}

function queryRyBysfz(sfzh,xmId,lxfsId,xzdzId)
{
	if($("#sfzjy").length > 0 &&　$("#sfzjy").attr("checked") == undefined)
	{
		return;
	}
	if(sfzh){
		queryRkBean(sfzh, function(czrkxxBean) {
			if (czrkxxBean != null) 
			{
				$("#"+xmId).val(czrkxxBean.xm);
				$("#"+lxfsId).val(czrkxxBean.lxdh);
			}
		});
	}
}

function changeDwsx(obj)
{
	if ($(obj).attr("checked"))
	{
		var value = $(obj).val();
		if (value == "07" || value == "08")
		{
			if (value == "07")
			{
				$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
					if ($(this).val() == "08")
					{
						$(this).removeAttr("checked");
					}
				});
			}
			else if (value == "08")
			{
				$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
					if ($(this).val() == "07")
					{
						$(this).removeAttr("checked");
					}
				});
			}
			
			$("input[name='dwBean.dwjbxx.hylbs']").each(function(){
				if($(this).val() == "01")
				{
					$(this).attr("checked",true);
					return true;
				}
			});
		}
		if (value != "10")
		{
			$("input[name='dwBean.dwjbxx.hylbs'][value='10']").removeAttr("checked")
		}
	}
	else
	{
		var value = $(obj).val();
		//特种行业
		if (value == "01")
		{
			var $this = $(obj);
			$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
				if ($(this).val() == "07" || $(this).val()=='08')
				{
					$this.attr("checked",true);
					//alert("旅馆业与开锁业为特种行业，你已经选择了旅馆业或者开锁业，无法去掉选择，必须先去掉的开锁业或者旅馆业的选项。")
				}
			})
			$("tr[id^='tzhy_']").hide();
		}
		else if (value == "07" || value == "08")
		{
			$("input[name='dwBean.dwjbxx.hylbs']").each(function(){
				if($(this).val() == "01")
				{
					$(this).attr("checked",true);
					return true;
				}
			})
		}
	}
	
	
	
}


function zxChange(value)
{
	if (value == "1")
	{
		$("#zxrq").val(new Date().pattern("yyyy-MM-dd HH:mm:ss"))
	}
	else
	{
		$("#zxrq").val("");
	}
}

function clickTzhyBtn()
{
	var jgbh = $("#jgbh").val();
	if (jgbh != null && jgbh != "")
	{
		var oldhylb = $("#oldhylb").val();
		var newhylb = [];
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			newhylb.push($(this).val());
		});
		if (oldhylb != newhylb.join(","))
		{
			alert("单位属性发生变化，请先进行保存.")
			return false;
		}
		
		var thdm = "01";
		var temp = false;
		var thxl = $("#thxl").val();
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			var value = $(this).val();
			if (value==thdm)
			{
				temp = true;
			}
		});
		
		if (temp)
		{
			if ($("input[name='dwBean.dwjbxx.hylbs'][value='07']").attr("checked"))
			{
				$.openWindow({
					name : "xwin",
					url : contextPath + "/sydw/dwgl/toOpenPage.action?page=thlgxxinfo",
					data : 
					{
						"dwBean.dwjbxx.jgbh" : jgbh,
						"operType" : $("#operType").val()
					},
					width:1000,
					height:700
				});
			}
			else if ($("input[name='dwBean.dwjbxx.hylbs'][value='08']").attr("checked"))
			{
				$.openWindow({
					name : "xwin",
					url : contextPath + "/sydw/dwgl/toOpenPage.action?page=thksy",
					data : 
					{
						"dwBean.dwjbxx.jgbh" : jgbh,
						"operType" : $("#operType").val()
					},
					width:1000,
					height:700
				});
			}
			else
			{
				$.openWindow({
					name : "xwin",
					url : contextPath + "/sydw/dwgl/toOpenPage.action?page=tzhy",
					data : 
					{
						"dwBean.dwjbxx.jgbh" : jgbh,
						"operType" : $("#operType").val()
					},
					width:1000,
					height:400
				});
			}
		}
		else
		{
			alert("单位属性未选择特种行业，无法继续操作特种行业信息。")
		}
	}
	else
	{
		alert("单位基本信息未保存，请先保存后在再进行操作。");
	}
}

function clickGgcsBtn()
{
	var jgbh = $("#jgbh").val();
	if (jgbh != null && jgbh != "")
	{
		var oldhylb = $("#oldhylb").val();
		var newhylb = [];
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			newhylb.push($(this).val());
		});
		if (oldhylb != newhylb.join(","))
		{
			alert("单位属性发生变化，请先进行保存.")
			return false;
		}
		var thdm = "02";
		var temp = false;
		var thxl = $("#thxl").val();
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			var value = $(this).val();
			if (value==thdm)
			{
				temp = true;
			}
		});
		if (temp)
		{
			$.openWindow({
				name : "xwin",
				url : contextPath + "/sydw/dwgl/toOpenPage.action?page=ggcsinfo",
				data : 
				{
					"dwBean.dwjbxx.jgbh" : jgbh,
					"operType" : $("#operType").val()
				},
				width:1000,
				height:700
			});
		}
		else
		{
			alert("单位属性未选择公共场所，无法继续操作公共场所信息。")
		}
	}
	else
	{
		alert("单位基本信息未保存，请先保存后在再进行操作。");
	}
}


function clickSwfwcsBtn()
{
	var jgbh = $("#jgbh").val();
	if (jgbh != null && jgbh != "")
	{
		var oldhylb = $("#oldhylb").val();
		var newhylb = [];
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			newhylb.push($(this).val());
		});
		if (oldhylb != newhylb.join(","))
		{
			alert("单位属性发生变化，请先进行保存.")
			return false;
		}
		var thdm = "05";
		var temp = false;
		var thxl = $("#thxl").val();
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			var value = $(this).val();
			if (value==thdm)
			{
				temp = true;
			}
		});
		if (temp)
		{
			$.openWindow({
				name : "xwin",
				url : contextPath + "/sydw/dwgl/toOpenPage.action?page=swfwcsinfo",
				data : 
				{
					"dwBean.dwjbxx.jgbh" : jgbh,
					"operType" : $("#operType").val()
				},
				width:1000,
				height:700
			});
		}
		else
		{
			alert("单位属性未选择上网服务场所，无法继续操作上网服务场所。")
		}
	}
	else
	{
		alert("单位基本信息未保存，请先保存后在再进行操作。");
	}
}


function clickNbdwBtn()
{
	var jgbh = $("#jgbh").val();
	if (jgbh != null && jgbh != "")
	{
		var oldhylb = $("#oldhylb").val();
		var newhylb = [];
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			newhylb.push($(this).val());
		});
		if (oldhylb != newhylb.join(","))
		{
			alert("单位属性发生变化，请先进行保存.")
			return false;
		}
		var thdm = "03";
		var temp = false;
		var thxl = $("#thxl").val();
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			var value = $(this).val();
			if (value==thdm)
			{
				temp = true;
			}
		});
		if (temp)
		{
			$.openWindow({
				name : "xwin",
				url : contextPath + "/sydw/dwgl/toOpenPage.action?page=nbdwinfo",
				data : 
				{
					"dwBean.dwjbxx.jgbh" : jgbh,
					"operType" : $("#operType").val()
				},
				width:1000,
				height:700
			});
		}
		else
		{
			alert("单位属性未选择内部单位，无法继续操作内保单位信息。")
		}
	}
	else
	{
		alert("单位基本信息未保存，请先保存后在再进行操作。");
	}
}

function clickWxpdwBtn()
{
	var jgbh = $("#jgbh").val();
	if (jgbh != null && jgbh != "")
	{
		var oldhylb = $("#oldhylb").val();
		var newhylb = [];
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			newhylb.push($(this).val());
		});
		if (oldhylb != newhylb.join(","))
		{
			alert("单位属性发生变化，请先进行保存.")
			return false;
		}
		var thdm = "04";
		var temp = false;
		var thxl = $("#thxl").val();
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			var value = $(this).val();
			if (value==thdm)
			{
				temp = true;
			}
		});
		if (temp)
		{
			var dwfls = [];
			$("input[name='dwBean.wxwpdwBean.dwfls']:checked").each(function(){
				dwfls.push($(this).val());
			})
			$.openWindow({
				name : "xwin",
				url : contextPath + "/sydw/dwgl/toOpenPage.action?page=wxwpdwinfo",
				data : 
				{
					"dwBean.dwjbxx.jgbh" : jgbh,
					"operType" : $("#operType").val()
				},
				width:1000,
				height:700
			});
		}
		else
		{
			alert("单位属性未选择危险品单位，无法继续操作危险品单位信息。")
		}
	}
	else
	{
		alert("单位基本信息未保存，请先保存后在再进行操作。");
	}
}

function clickSwdwxxBtn()
{
	var jgbh = $("#jgbh").val();
	if (jgbh != null && jgbh != "")
	{
		var oldhylb = $("#oldhylb").val();
		var newhylb = [];
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			newhylb.push($(this).val());
		});
		if (oldhylb != newhylb.join(","))
		{
			alert("单位属性发生变化，请先进行保存.")
			return false;
		}
		var thdm = "06";
		var temp = false;
		var thxl = $("#thxl").val();
		$("input[name='dwBean.dwjbxx.hylbs']:checked").each(function(){
			var value = $(this).val();
			if (value==thdm)
			{
				temp = true;
			}
		});
		if (temp)
		{
			$.openWindow({
				name : "xwin",
				url : contextPath + "/sydw/dwgl/toOpenPage.action?page=swdwinfo",
				data : 
				{
					"dwBean.dwjbxx.jgbh" : jgbh,
					"operType" : $("#operType").val()
				},
				width:1000,
				height:700
			});
		}
		else
		{
			alert("单位属性未选择涉外单位，无法继续操作涉外单位信息。")
		}
	}
	else
	{
		alert("单位基本信息未保存，请先保存后在再进行操作。")
	}
}
/**
*从业人员
*/
function clickCyryBtn()
{
	var selectes = $("#cxjgList").getSelected();
	if (selectes.length == 1)
	{
		var jgbh = selectes[0]["jgbh"];
		layer.load(0);
		document.location.href = contextPath + "/zagl/cyry/toCyryDjPage.action?cyrycx.jgbh=" + jgbh;
	}
	else if (selectes.length > 1)
	{
		alert("只能选择一个单位.");
	}
	else if (selectes.length <=0)
	{
		alert("必须选择一个单位.")
	}
	
}

function clickDwInfoCyryDjBtn()
{
	var jgbh = $("#jgbh").val();
	if (jgbh != null && jgbh != "")
	{
		layer.load(0);
		document.location.href = contextPath + "/zagl/cyry/toCyryDjPage.action?cyrycx.jgbh=" + jgbh;
	}
	else
	{
		alert("单位没有保存请先保存单位.");
	}
}

function clickAqjcBtnEvent()
{

	var selectes = $("#cxjgList").getSelected();
	if (selectes.length == 1)
	{
		var jgbh = selectes[0]["jgbh"];
		
		var dwmc = encodeURIComponent(selectes[0]["dwmc"]);
		var dwlb = selectes[0]["dwfl"];
		var sfnbgl = selectes[0]["sfnbgl"];
		var sfzagl = selectes[0]["sfzagl"];
		var hylb = selectes[0]["hylb"];
		var wbdwhwlb = selectes[0]["wbdwhwlb"];
		var wbdwfl = selectes[0]["wbdwfl"]; 
        
		//是内保管理部门
		if (sfnbgl == "1" && dwlb)
		{
			$.openWindow({
				url:contextPath + "/nbdwaqjc/toAqjcPage.action",
				data : 
				{
					"jgbh" : jgbh,
					"dwmc" : dwmc,
					"dwlb" : dwlb,
					"operType" : "add"
				},
				width:1000,
				height:800
			});
		}
		else if(sfzagl == '1' && hylb.indexOf('04') != -1 && wbdwhwlb){
			var url;
			var data_param;
			if(wbdwfl.indexOf('2')!= -1 || wbdwfl.indexOf('5') != -1){//单位分类为储存或使用
				if(wbdwhwlb == '6'){//枪支（货物类别为枪支、子弹）
					url = contextPath + "/sydw/wbdwgl/toAqjcWbdw.action";
					data_param = {"qzjcBean.jgbh" : jgbh};
				}
				else if(wbdwhwlb == '3' || wbdwhwlb == '4'){//剧毒化学（货物类别为剧毒化学品或放射性物品）
					url = contextPath + "/sydw/wbdwgl/toJdhxWbdw.action";
					data_param = {"jdhxBean.jgbh" : jgbh};
				}
				else if(wbdwhwlb == '2' || wbdwhwlb == '5'){//易制爆危险化学（货物类别为易制爆危险化学品或爆炸物品）
					url = contextPath + "/sydw/wbdwgl/toWxhxWbdw.action";
					data_param = {"wxhxBean.jgbh" : jgbh};
				}
			}else{
				$.openWindow({
					name : "xwin",
					url : contextPath + "/sydw/dwgl/toOpenPage.action?page=aqjcinfo",
					data : 
					{
						"dwBean.dwjbxx.jgbh" : jgbh,
						"operType" : "add"
					},
					width:1000,
					height:700
				});
			
			}
			if(url && data_param){
				$.openWindow({
					url:url,
					data:data_param,
					width:1000,
					height:800
				});
			}
		}
		else
		{
			$.openWindow({
				name : "xwin",
				url : contextPath + "/sydw/dwgl/toOpenPage.action?page=aqjcinfo",
				data : 
				{
					"dwBean.dwjbxx.jgbh" : jgbh,
					"operType" : "add"
				},
				width:1000,
				height:700
			});
		}
	}
	else if (selectes.length > 1)
	{
		alert("只能选择一个单位.");
	}
	else if (selectes.length <=0)
	{
		alert("必须选择一个单位.")
	}
}

function clickGgBtnEvent(type)
{
	var selectes = $("#cxjgList").getSelected();
	if (selectes.length == 1)
	{
		var jgbh = selectes[0]["jgbh"];
		$.openWindow({
			name : "xwin",
			url : contextPath + "/sydw/dwgl/toOpenPage.action?page=" + type,
			data : 
			{
				"dwBean.dwjbxx.jgbh" : jgbh
			},
			width:1000,
			height:700
		});
	}
	else if (selectes.length > 1)
	{
		alert("只能选择一个单位.");
	}
	else if (selectes.length <=0)
	{
		alert("必须选择一个单位.")
	}
}

function clickNbdwGnanBtnEvent(type)
{
	var selectes = $("#cxjgList").getSelected();
	if (selectes.length == 1)
	{
		var jgbh = selectes[0]["jgbh"];
		var hylbs = selectes[0]["hylb"];
		if (hylbs != null && hylbs.indexOf("03") >= 0)
		{
			$.openWindow({
				name : "xwin",
				url : contextPath + "/sydw/dwgl/toOpenPage.action?page=" + type,
				data : 
				{
					"dwBean.dwjbxx.jgbh" : jgbh
				},
				width:1000,
				height:700
			});
		}
		else
		{
			alert("不是内保单位不能进行登记.");
		}
	}
	else if (selectes.length > 1)
	{
		alert("只能选择一个单位.");
	}
	else if (selectes.length <=0)
	{
		alert("必须选择一个单位.")
	}
}

//保存安保设施
function saveAbss(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("abssform")){
		eventSrcObj.attr("disabled","disabled");
		$("#abssform").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveAbss.action",
			dataType : "json",
			success : function(result)
			{
				alert("保存成功.");
			}
		});
	}
}

function cyryDetail(cyrybh,opertype) {
	if(opertype == "detail"){
		$.openWindow({
			url : contextPath
					+ "/zagl/dw/toCyryDetail.action?t=" + new Date().getTime() + "&dw.cyry.cyrybh="
					+ cyrybh + "&dw.opertype=" + opertype,
			width : 1000,
			height : 720,
			callback : function() {
				return;
			}
		});
	}else{
		$.openWindow({
			url : contextPath
					+ "/zagl/dw/toCyryDetail.action?t=" + new Date().getTime() +"&dw.cyry.cyrybh="
					+ cyrybh + "&dw.opertype=" + opertype,
			width : 1000,
			height : 700
		});
	}
}



function updateJnrkCyryBean(cyrybh,jgbh,sfzh)
{
	$.openWindow({
		name : "cyrywin",
		url : contextPath + "/zagl/cyry/toJnCyryDjPage.action",
		data : {
			"cyrycx.sfzh" : sfzh,
			"cyrycx.jgbh" : jgbh,
			"cyrycx.cyrybh" : cyrybh,
			"operType" : "update"
		},
		width:1000,
		height:700,
		scroll : false
	})
}

function updateJwrkCyryBean(cyrybh,jgbh,gj,zjzl,zjhm,ywm,ywx)
{
	$.openWindow({
		name : "cyrywin",
		url : contextPath + "/zagl/cyry/toJwCyryDjPage.action",
		data : {
			"cyrycx.cyrybh" : cyrybh,
			"cyrycx.gj" : gj,
			"cyrycx.ywx": ywx,
			"cyrycx.ywm": ywm,
			"cyrycx.zjzl": zjzl,
			"cyrycx.zjhm": zjhm,
			"cyrycx.jgbh": jgbh,
			"operType" : "update"
		},
		width:1000,
		height:700,
		scroll : false
	})
}

/**
 * 注销从业人员编号 cyrybh为空时批量注销
 * @param {} cyrybh
 */
function delCyry(cyrybh){
	var param = "";
	if(cyrybh){
		param = cyrybh;
	}else{
		var selectCyry = $("#cyryList").getSelected();
		if(selectCyry.length < 1 ){
			alert("请选择需要注销的人员!");
			return;
		}else{
			for(var i = 0 ; i < selectCyry.length ; i++){
				if(i< selectCyry.length -1){
					param += selectCyry[i].cyrybh +",";
				}else{
					param += selectCyry[i].cyrybh;
				}
			}
		}
	}
	if(window.confirm("确认注销所选人员？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delCyryByCyryBh.action?dw.cyry.cyrybh=" + param + "&t=" + new Date().getTime(),
			type:"post",
			success:function(){
				alert("操作成功!");
				$("#cyryList").query("F","queryCyryForm");
			}	
		});
	}
}

//删除从业人员
function deleteCyryByCyrybh(param){
	if(window.confirm("确认删除所选人员，删除后不能恢复？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delteCyryBycyrybh.action?dw.cyry.cyrybh=" + param + "&t=" + new Date().getTime(),
			type:"post",
			success:function()
			{
				alert("操作成功!");
				$("#cyryList").query("F","queryCyryForm");
			}	
		});
	}
}



function openImportCyryXls(jgbh)
{
	if (jgbh != null && jgbh != "" && jgbh != "null")
	{
		$.openWindow({
			name : "cyryImportWin",
			url : contextPath + "/zagl/cyry/toCyryImportPage.action?jgbh=" + jgbh,
			width : 1000,
			height : 700
		});
	}
	else
	{
		alert("单位没有保存请先保存单位基本信息.");
	}
}
