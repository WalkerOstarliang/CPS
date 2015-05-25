function queryList()
{
	$("#rktablegrid").query("F","queryForm");
}

function toJwrkSelectFwWin(hideSfzh,rylb,selectType)
{
	layer.load(0);
	document.location.href = contextPath + "/lsgl/jwrk/toJwrkfwSelectPage.action";
}



function ldrkExportWord()
{
	var ldrkbeans = $("#rktablegrid").getSelected();
	var jwbh = ldrkbeans[0]["jwbh"];
	if (ldrkbeans.length==1)
	{
		 $.openWindow({
		 	name : "exportwin",
		 	url : contextPath + "/lsgl/jwrk/toJwrkDyPage.action",
		 	data : {"queryBean.jwbh" : jwbh},
		 	width:900,
		 	height:700
		 });
	}
	else if (ldrkbeans.length > 1)
	{
		alert("每次只能打印一条记录.")
	}
	else
	{
		alert("请选择要导出的人口记录.");
	}
}


function openJwrkUpdateRkInfo(jwbh)
{
	$.openWindow({
		name : "jwrkinfowin",
		url : contextPath + "/lsgl/jwrk/toJwrkInfoPage.action",
		data : {
			"queryBean.jwbh" : jwbh
		},
		width:1000,
		height:800,
		scroll:false
	})
}



function openJwrkRkInfoDetail(jwbh,rybh)
{
	$.openWindow({
		name : "detailwin",
		url : contextPath + "/lsgl/jwrk/toJwrkDetailPage.action",
		data : {
			"queryBean.jwbh" : jwbh,
			"queryBean.rybh" : rybh
		},
		width:1000,
		height:800,
		scroll : false
	})
}

function clickRowSetValue(trObj,rowdata)
{
	$.each(rowdata,function(key,value){
		$("#" + key).val(value);
	});
}

function updateJwrkZxbs(jwbh,zxbs)
{
	if(confirm("你确定要注销该境外人口信息吗？"))
	{
		$.ajax({
			type : "post",
			url : contextPath + "/lsgl/jwrk/updateJwrkZxbs.action",
			dataType : "json",
			data : "queryBean.zxbs=" + zxbs + "&queryBean.zxyy=自动注销&queryBean.jwbh=" + jwbh, 
			success : function(result)
			{
				if(result == true)
				{
					if (zxbs == "1")
					{
						alert("境外人口注销成功.");
					}
					else
					{
						alert("境外人口恢复成功.")
					}
					queryList();
				}
				else
				{
					if (zxbs == "1")
					{
						alert("注销失败，请稍后再试");
					}
					else
					{
						alert("恢复境外人口信息失败.请稍后再试.")
					}
					
				}
			}
		});
	}
}
