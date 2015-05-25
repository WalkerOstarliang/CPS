function submitSave()
{
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			success : function(result)
			{
				if (result)
				{
					alert("保存信息成功,将关闭窗口.");
					$.closeWindow();
				}
				else
				{
					alert("保存信息失败.");
				}
			}
		})
	}
}

function setSqxxToPage(sqjbxxBean)
{
	if (sqjbxxBean)
	{
		$("#sssqbh").val(sqjbxxBean["sqbh"]);
		$("#sssqmc").val(sqjbxxBean["sqmc"]);
		$("#ssxzqhdm").val(sqjbxxBean["ssxzqh"]);
		$("#ssxzqhmc").val(sqjbxxBean["ssxzqhmc"]);
		$("#ssjdxzfzrxm").val(sqjbxxBean["jdxzfzr"]);
		$("#ssjdfzrlxdh").val(sqjbxxBean["jdxzfzrdh"]);
		$("#jwhdz").val(sqjbxxBean["ssxzqhmc"] + sqjbxxBean["sqmc"]);
		doubleSelectJdxz(sqjbxxBean["ssxzqh"],"ssjdxz",function(){
			$("#ssjdxz").val(sqjbxxBean["ssjdxz"]);
		});
	}
}

function openXzqhSelectTree(rootXzqhCode,callback)
{
	openXzqhTree({
		rootOrgCode : "430000",
  		mutilSelect : false
	},function(xzqhBean){
		if ($.isFunction(callback))
		{
			callback(xzqhBean)
		}
	})
}

function setSqXzqh(xzqhBean)
{
	if (xzqhBean)
	{
		$("#ssxzqhdm").val(xzqhBean["id"]);
		$("#ssxzqhmc").val(xzqhBean["name"]);
		doubleSelectJdxz(xzqhBean["id"],"ssjdxz");
	}
	
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

function saveAndSaveDjRyxx()
{
	if ($.validateform("infoform"))
	{
		$("#savebtn").hide();
		$("#saveanddjbtn").hide();
		$("#submitbtn").show();
		$("#infoform").ajaxSubmit({
			dataType : "json",
			success : function(sqjwhxxBean)
			{
				if (sqjwhxxBean)
				{
					openInfoWin("add",sqjwhxxBean["sssqbh"],sqjwhxxBean["sssqmc"]);
				}
				else
				{
					alert("保存信息失败.");
				}
			}
		})
	}
}


function openInfoWin(operType,sqbh,sqmc)
{
	sqmc = encodeURI(encodeURI(sqmc));
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/toSqgbInfoPage.action",
		data : {operType : operType,"bean.sssqbh" : sqbh,"bean.sssqmc" : sqmc,t:new Date().getTime()},
		width : 980,
		height : 650
	})
}

function openSqjbxxSqglInfo(operType)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqgbgl/toSqgbInfoPage.action",
		data : {operType : operType,"bean.sssqbh" : sqbh,"bean.sssqmc" : sqmc,t:new Date().getTime()},
		width : 980,
		height : 650
	})
}

$(function(){
	var ssxzqh = $("#ssxzqhdm").val();
	if (ssxzqh != null && ssxzqh != "")
	{
		doubleSelectJdxz(ssxzqh,"ssjdxz",function(){
			$("#ssjdxz").val($("#ssjdxzhidden").val())
		});
	}
})