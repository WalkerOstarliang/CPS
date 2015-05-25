function queryList()
{
	$("#cyryList").query("F","queryCyryForm",function(){
		$("#oldrylb").val($("#rylb").val());
		$("#oldzjzl").val($("#zjzl").val());
		$("#oldzjhm").val($("#zjhm").val());
		$("#oldgj").val($("#gj").val());
		$("#oldywm").val($("#ywm").val());
		$("#oldywx").val($("#ywx").val());
	});
}

function clickQueryBtn()
{
	var rylb = $("#rylb").val();
	if (rylb == "0")
	{
		var zjzl = $("#zjzl").val();
		if (zjzl != "111")
		{
			alert("人员类别为境内人员，则证件类型必须选择身份证号码.");
		}
		else
		{
			var sfzh = $("#zjhm").val();
			if (sfzh == null || sfzh == "")
			{
				alert("证件号码不能为空.");
			}
			else if (isSfzh(sfzh))
			{
				queryList();
			}
			else
			{
				alert("身份证号码格式不正确.")
			}
		}
	}
	else
	{
		var zjzl = $("#zjzl").val();
		if (zjzl == "111")
		{
			alert("境外人员不能选择居民身份证.");
			return false;
		}
		var zjhm = $("#zjhm").val()
		var gj = $("#gj").val();
		var ywm = $("#ywm").val();
		var ywx = $("#ywx").val();
		if(!$.isBlank(zjhm) && !$.isBlank(gj) && !$.isBlank(ywm) && !$.isBlank(ywx))
		{
			queryList();
		}
		else
		{
			alert("所有查询项均不能为空.");
		}
	}
}

function changeRylb(value)
{
	if (value == "1")
	{
		$("#otherrow").show();
	}
	else
	{
		$("#zjzl").val("111");
		$("#gj").val("");
		$("#ywx").val("");
		$("#ywm").val("");
		$("#otherrow").hide();
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

function clickCyryDjBtn(opertype)
{
	if ($("#oldrylb").val() == $("#rylb").val()
		&& $("#oldzjzl").val() == $("#zjzl").val()
		&& $("#oldzjhm").val() == $("#zjhm").val()
		&& $("#oldgj").val() == $("#gj").val()
		&& $("#oldywm").val() == $("#ywm").val()
		&& $("#oldywx").val() == $("#ywx").val()
		)
	{
		//重点人员验证
		
		var size = $("#cyryList").getDataSize();
		if (size <=0)
		{
			//境内人员登记
			if ($("#rylb").val() == "0")
			{
				var sfzh = $("#zjhm").val();
				var jgbh = $("#jgbh").val();
				var url = contextPath + "/zagl/cyry/toJnCyryDjPage.action?cyrycx.sfzh=" + sfzh+"&cyrycx.jgbh=" + jgbh;
				if(opertype){
					url += "&operType=" + opertype;
				}
				
				$.openWindow({
					name : "cyrywin",
					url : url,
					width:1000,
					height:700,
					scroll : false
				})
			}
			//境外人员登记
			else
			{
				var jgbh = $("#jgbh").val();
				$.openWindow({
					name : "cyrywin",
					url : contextPath + "/zagl/cyry/toJwCyryDjPage.action",
					data : 
					{
						"cyrycx.gj" : $("#gj").val(),
						"cyrycx.ywx":$("#ywx").val(),
						"cyrycx.ywm":$("#ywm").val(),
						"cyrycx.zjzl":$("#zjzl").val(),
						"cyrycx.zjhm":$("#zjhm").val(),
						"cyrycx.jgbh":jgbh
					},
					width:1000,
					height:700,
					scroll : false
				})
			}
		}
		else
		{
			alert("从业人员已经登记，无法重复登记.")
		}
	}
	else
	{
		alert("请先进行查询");
	}
}


/*派出所选择*/
function orgSelect(code,hiddenfield,showfield)
{
	if (code) 
	{
		openDwSelect2({
			rootOrgCode : code.substr(0,4) + "00000000",
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					if(orgbeans.ispcs !="1"){
						alert("请选择派出所.");
						$("#" + hiddenfield).val("");
						$("#" + showfield).val("");
						return;
					}else{
						$("#" + hiddenfield).val(orgbeans.id);
						$("#" + showfield).val(orgbeans.name);
					}
				}
			});
	} 
	else 
	{
		alert("无效的机构代码")
	}
}

//选择社区
function openSqxxSelectWin(xzdjwq,jzdsqdm,jzdsqmc,xzdjwqmc){
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
				$("#"+xzdjwq).val(sqjbxxBean.gxsqjwsdm)
				$("#"+xzdjwqmc).val(sqjbxxBean.gxsqjwsmc)
				$("#"+jzdsqdm).val(sqjbxxBean.sqbh);
				$("#"+jzdsqmc).val(sqjbxxBean.sqmc);
				
				$("#jzdpcsdm").val(sqjbxxBean.sspcsdm);
				$("#jzdpcsmc").val(sqjbxxBean.sspcsmc);
			}
		}
	});
}


function saveJnrkCyryInfo()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("cyrydjform"))
	{
		$("#cyrydjform").ajaxSubmit({
			url : contextPath + "/zagl/cyry/saveJnrkCyryInfo.action",
			dataType: "json",
			success : function(cyryBean)
			{
				if (cyryBean != null)
				{
					$("#cyrybh").val(cyryBean["cyrybh"])
					alert("从业人员信息保存成功.将关闭窗口");
					window.close();
					
				}
				else
				{
					alert("从业人员信息保存失败.请稍后再试.")
				}
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}


function saveJwrkCyryInfo()
{
	$("#savebtn").attr("disabled","disabled");
	if ($.validateform("cyrydjform"))
	{
		$("#cyrydjform").ajaxSubmit({
			url : contextPath + "/zagl/cyry/saveJwrkCyryInfo.action",
			dataType: "json",
			success : function(cyryBean)
			{
				if (cyryBean != null)
				{
					$("#cyrybh").val(cyryBean["cyrybh"])
					alert("从业人员信息保存成功.");
					window.close();
				}
				else
				{
					alert("从业人员信息保存失败.请稍后再试.")
				}
				$("#savebtn").removeAttr("disabled");
			},
			error : function()
			{
				alert("从业人员信息保存失败.请稍后再试.")
				$("#savebtn").removeAttr("disabled");
			},
			faulire : function()
			{
				alert("从业人员信息保存失败.请稍后再试.")
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}

function zxCyryInfoBean(cyrybh)
{
	if(confirm("确认注销该从业人员？"))
	{
		$.ajax({
			url:contextPath + "/zagl/dw/delCyryByCyryBh.action?dw.cyry.cyrybh=" + cyrybh,
			type:"post",
			success:function()
			{
				queryList();
				alert("操作成功!");
			}	
		});
	}
}

//从业人员注销改变
function zxChange(value){
	if(value == '0'){
		$("#zxyy").attr("disabled","true");
		$("#zxrq").attr("disabled","true");
	}else if(value == '1'){
		$("#zxyy").removeAttr("disabled");
		$("#zxrq").removeAttr("disabled");
	}else{
		$("#zxyy").attr("disabled","true");
		$("#zxrq").attr("disabled","true");
	}
}

$(function(){
	if(eval($("#sfzdry").val())){
		alert("该人员为在逃人员，请及时处理.")
	}
});