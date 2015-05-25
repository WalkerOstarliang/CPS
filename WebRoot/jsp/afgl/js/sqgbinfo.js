function submitSave()
{
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(result)
			{
				if (result)
				{
					if(result == "isexist"){
						alert("人员已存在")
					}else{
						clearForm();
						$("#operType").val("add");
						$("#sqbh").val(result.sssqbh);
						$("#gbquerylist").query("F","gblistqueryform");
						alert("保存成功")
					}
				}
				else
				{
					alert("保存失败，请重试.");
				}
			}
		})
	}
}

function submitSqgbSave()
{
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(result)
			{
				if (result == "isexist")
				{
					alert("人员已经存在，不能重复添加.");
				}
				else
				{
					if (result != null)
					{
						alert("保存成功.");
						$.closeWindow();
					}
					else
					{
						alert("保存失败.");
					}
				}
			}
		})
	}
}

function clearForm()
{
	$("#gbxxtable").find("tr[id^=clear_row]").each(function(i){
		$(this).find(":input").val("");
	});
}

function setSqxxToPage(sqjbxxbean)
{
	if (sqjbxxbean)
	{
		$("#sssqbh").val(sqjbxxbean["sqbh"]);
		$("#sssqmc").val(sqjbxxbean["sqmc"]);
		//$("#sqlx").html(sqjbxxbean["sqlxmc"]);
		//$("#sspcs").html(sqjbxxbean["sspcsmc"]);
		$("#sqbh").val(sqjbxxbean["sqbh"]);
		$("#gbquerylist").query("F", "gblistqueryform");
	}
}

function setJdxxToPage(sqjbxxbean)
{
	if (sqjbxxbean)
	{
		if(sqjbxxbean.leve){
			if(sqjbxxbean.leve != "4"){
				alert("请选择乡镇街道.")
				return ;
			}
		}
		
		$("#sssqbh").val(sqjbxxbean["sqbh"]);
		$("#sssqmc").val(sqjbxxbean["sqmc"]);
		$("#sqbh").val(sqjbxxbean["sqbh"]);
		$("#gbquerylist").query("F", "gblistqueryform");
	}
}


function setGbryxx(ryxxBean)
{
	if (ryxxBean)
	{
		$("#gbxm").val(ryxxBean["xm"]);
		$("#gbxb").val(ryxxBean["xb"]);
		$("#gbcsrq").val(ryxxBean["csrq"]);
		$("#gbhjdqh").val(ryxxBean["zzssxq"]);
		$("#gbhjdqhmc").val(ryxxBean["zzssxqmc"]);
		$("#gbxzdxz").val(ryxxBean["zzxz"]);
	}
}

function openHjdxzqh()
{
	openXzqhTree({
		rootOrgCode : 430000
	},function(xzqhbean){
		if (xzqhbean)
		{
			$("#gbhjdqh").val(xzqhbean["id"]);
			$("#gbhjdqhmc").val(xzqhbean["name"]);
		}
	})
}

function setValueToForm(trObj, rowdataobj)
{
	$("#operType").val("update");
	$("#infoform").eachObjectSetValue(rowdataobj);
	var gbzwStr = rowdataobj["gbzws"];
	if(gbzwStr){
		var zw = $("input[type='checkbox']");
		for(var i = 0 ; i < zw.length; i++){
			for(var j = 0 ; j < gbzwStr.length ; j++){
				if($(zw[i]).val() == gbzwStr[j]){
					$(zw[i]).attr("checked","checked");
					break;
				}else{
					$(zw[i]).removeAttr("checked");
				}
			}
		}
	}
	
	if(rowdataobj["gbsfzh"]){
		$("#gbzpxx").attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + rowdataobj["gbsfzh"]);
	}
}

function czRowCallBack(trObj, rowdataobj)
{
	var html = "";
	html = "<span onclick=\"deleteGbxx('" + rowdataobj["gbbh"] + "')\"  style=\"color:green\"  class=\"cps_span_href\">删除</span>";
	return html;
}

function deleteGbxx(gbbh)
{
	if (confirm("你确定要删除该干部信息吗？"))
	{
		$.ajax({
			url : contextPath + "/afgl/sqgbgl/deleteSqgbxxBeanByGbbhs.action",
			data : "gbbhs=" + gbbh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除干部信息.");
					clearForm();
					$("#gbquerylist").query("F","gblistqueryform");
				}
			}
		})
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

function  loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#gbxm").val(rkJbxxBean["xm"]);
			$("#gbxb").val(rkJbxxBean["xb"]);
			$("#gbcsrq").val(rkJbxxBean["csrq"]);
			$("#gbhjdqh").val(rkJbxxBean["hjdqh"]);
			$("#gbhjdqhmc").val(rkJbxxBean["hjdqhmc"])
			$("#gblxdh").val(rkJbxxBean["lxdh"]);
			$("#gbzzmm").val(rkJbxxBean["zzmm"]);
			$("#gbhjdqhmc").val(rkJbxxBean["hjdqhmc"]);
			$("#gbxzdxz").val(rkJbxxBean["xzzxz"]);
			$("#gbzpxx").attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + sfzh);
		}
		else
		{
			alert("未找到人员信息");
		}
	});
}


function changeSfdc(value)
{
	if (value == "0")
	{
		$("#gbdcsj").attr("disabled","disabled");
	}
	else
	{
		$("#gbdcsj").removeAttr("disabled");
	}
}

$(function(){
	var sfzh=$("#gbsfzh").val();
	var gbbh = $("#gbbh").val();
	if( sfzh!='' &&gbbh == '' || gbbh == null){
		loadRkxxBean(sfzh);
	}
})

function openWyxqxxSelectWin(){
	$.openDialogWindow({
		url : contextPath + "/afgl/sqldzgl/toOpenWyxqListSelect.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(wyxqxxBean)
		{
			if (wyxqxxBean)
			{
				$("#sssqbh").val(wyxqxxBean.id);
				$("#sssqmc").val(wyxqxxBean.xqmc);
				$("#sqbh").val(wyxqxxBean.id);
			}
		}
	});
}

function openJdxxSelect(callback,leve)
{	var url = contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action?t=" + new Date().getTime();
	if(leve){
		url += "&queryBean.sqleve=" + leve;
	}
	$.openDialogWindow({
		url : url,
		width : 900,
		height : 500,
		scroll : true,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if ($.isFunction(callback))
			{
				callback(sqjbxxBean);
			}
		}
	})
}