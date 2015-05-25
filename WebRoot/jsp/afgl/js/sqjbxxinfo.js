function submitSave()
{
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			success : function()
			{
				alert("社区信息保存成功.");
				$.closeWindow();
			},
			error : function()
			{
				alert("信息保存失败,请重新再试.");
			}
		});
	}
}

function saveSqJbxxBean()
{
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			url : contextPath + "/afgl/sqjbgl/saveSqJbxxBean.action",
			dataType : "json",
			success : function(sqBean)
			{
				if (sqBean != null)
				{
					$("#sqid").val(sqBean["sqid"]);
					$("#fromJwqdm").val(sqBean["gxsqjwsdm"]);
					alert("社区信息保存成功.");
				}
				else
				{
					alert("信息保存失败，请重新再试。");
				}
			},
			error : function()
			{
				alert("信息保存失败,请重新再试.");
			}
		});
	}
}

function openSelectPcsWin(rootOrgCode)
{
	var sjxzqh = $("#ssxzqh").val();
	openDwSelect2({
		rootOrgCode : rootOrgCode,
        mutilSelect : false,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(orgBean){
		if (orgBean)
		{
			var leve = orgBean.leve;
			if (leve == "4")
			{
				$("#sspcsdm").val(orgBean.id);
				$("#sspcsmc").val(orgBean.name);
			}
			else
			{
				alert("请选择派出所.");
			}
		}
	});
}

function openSelectSqjwsWin()
{
	var sspcsdm = $("#sspcsdm").val();
	openSelectSqjwsTree(sspcsdm);
}

function openSelectSqjwsTree(orgcode)
{
	openDwSelect2({
		rootOrgCode : orgcode,
        mutilSelect : false,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(orgBean){
		if (orgBean)
		{
			var leve = orgBean.leve;
			if (leve == "5")
			{
				$("#gxsqjwsdm").val(orgBean.id);
				$("#gxsqjwsmc").val(orgBean.name);
				//加载派出所名称
				callbackPcsBeanByJwsdm(orgBean.id,function(orgPcsBean){
					$("#sspcsdm").val(orgPcsBean["orgcode"]);
					$("#sspcsmc").val(orgPcsBean["orgname"]);
				});
				//加载社区民警信息
				callbackJwsMjBeanListByJwsdm(orgBean.id,function(userBeanList){
					if (userBeanList)
					{
						var sqmjxms = [];
						var sqmjlxdhs = [];
						$.each(userBeanList,function(i,userBean){
							sqmjxms.push(userBean["realname"]);
							sqmjlxdhs.push(userBean["telephone"]);
						});
						if (sqmjxms.length > 0)
						{
							$("#sqmjxm").val(sqmjxms.join(","));
						}
						if (sqmjlxdhs.length > 0)
						{
							$("#sqmjlxdh").val(sqmjlxdhs.join(","));
						}
					}
				});
			}
			else
			{
				alert("请选择警务区/室.");
			}
		}
		
	});
}



function openXzqhSelectTree(rootXzqhCode,callback)
{
	openXzqhTree({
		rootOrgCode : rootXzqhCode,
  		mutilSelect : false
	},function(xzqhBean){
		if ($.isFunction(callback))
		{
			callback(xzqhBean);
		}
	});
}

function setSqXzqh(id)
{
	if (id)
	{
		doubleSelectJdxz(id,"ssjdxz");
	}
	
}

function openSelectSqmjSelectWin()
{
	var sspcsdm = $("#sspcsdm").val();
	openSelectSqMjWin(sspcsdm);
}

function openSqmjMutilSelect()
{
	var rootOrgCode = $("#sspcsdm").val();
	openDwRySelect({
		rootOrgCode : rootOrgCode,
		mutilSelect : true
	}, function(userbeans)
	{
		if (userbeans != null && userbeans.length > 0)
		{
			var sqmjxms = [];
			var sqmjlxdhs = [];
			$.each(userbeans,function(i, userbean){
				sqmjxms.push(userbean["realname"]);
				var lxdh = userbean["moblie"] != null && userbean["moblie"] != "" ? userbean["moblie"] : userbean["telephone"];
				if (lxdh != null)
				{
					sqmjlxdhs.push(lxdh);
				}
			});
			$("#sqmjxm").val(sqmjxms.join(","));
			$("#sqmjlxdh").val(sqmjlxdhs.join(","));
		}
	});
}

function openSelectSqMjWin(rootOrgCode)
{
	openDwRySelect({
		rootOrgCode : rootOrgCode,
		mutilSelect : true
	},
	function(userbeans)
	{
		if (userbeans != null && userbeans.length > 0)
		{
			var sqmjxms = [];
			var lxdhs = [];
			var jwsdm = "";
			var jwsmc = "";
			var pcsdm = "";
			var pcsmc = "";
			$.each(userbeans,function(i, userbean){
				sqmjxms.push(userbean["realname"]);
				lxdhs.push(userbean["mobile"] ? userbean["mobile"] : userbean["telephone"]);
				if (jwsdm== null || jwsdm == "")
				{
					jwsdm = userbean["orgcode"];
					jwsmc = userbean["orgname"];
					pcsdm = userbean["pcsdm"];
					pcsmc = userbean["pcsmc"];
				}
			});
			if (sqmjxms.length > 0)
			{
				$("#sqmjxm").val(sqmjxms.join(","));
			}
			if (lxdhs.length > 0)
			{
				$("#sqmjlxdh").val(lxdhs.join(","));
			}
			$("#gxsqjwsdm").val(jwsdm);
			$("#gxsqjwsmc").val(jwsmc);
			$("#sspcsdm").val(pcsdm);
			$("#sspcsmc").val(pcsmc);
				
		}
	});
}


function setZxsj(value)
{
	if (value == "1")
	{
		$("#zxsj").val("");
		$("#zxyy").val("");
	}
	else if (value == "0")
	{
		$("#zxsj").val(new Date().pattern("yyyy-MM-dd HH:mm:ss"));
	}
}
