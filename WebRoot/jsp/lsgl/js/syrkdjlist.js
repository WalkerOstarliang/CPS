function queryList()
{
	var sfzh = $("#zjhm").val();
	if (sfzh == null || sfzh == "")
	{
		alert("身份证号码不能为空.");
		return false;
	}
	if (!isSfzh(sfzh))
	{
		alert("身份证号码格式不正确.");
		return false;
	}
	$("#rktablegrid").query("F","queryForm",function(){
		$("#oldquerysfzh").val(sfzh);
	});
}

function changeSfzhTo18W(value)
{
	if (value != null &&　value != "")
	{
		$("#zjhm").val(IDNum15To18(value));
	}
}

function clickNextBtn()
{
	var sfzh = $("#zjhm").val();
	var oldquerysfzh = $("#oldquerysfzh").val();
	if (sfzh != oldquerysfzh)
	{
		alert("请先进行查询");
	}
	else
	{
		$.ajax({
			url : contextPath + "/lsgl/rk/checkRKisExists.action",
			type : "post",
			data : "queryBean.sfzh="+sfzh,
			dataType : "json",
			success:function(dzmc)
			{
				var i = layer.load(0);
				if (dzmc == null || dzmc == "")
				{
					if ($("#sftjsfzh").attr("checked"))
					{
						$("#sfzh").val(sfzh);
					}
					else
					{
						$("#sfzh").val("");
					}
					$("#queryForm").attr("action",contextPath + "/lsgl/fw/toSyrkDjFwSelectPage.action");
					$("#queryForm").submit();
				}
				else
				{
					var hint = "当前实有人口已经在辖区内登记，住址为【" +dzmc + "】.确定要继续登记？"
					if (confirm(hint))
					{
						if ($("#sftjsfzh").attr("checked"))
						{
							$("#sfzh").val(sfzh);
						}
						else
						{
							$("#sfzh").val("");
						}
						//?queryBean.sfzh=" + sfzh+"&queryBean.hideSfzh=true
						$("#queryForm").attr("action",contextPath + "/lsgl/fw/toSyrkDjFwSelectPage.action");
						$("#queryForm").submit();
					}
				}
				layer.close(i);
			}
		});
	}
}


function syrkDrNext()
{
	$("#queryForm").attr("action",contextPath + "/lsgl/fw/toSyrkDjFwSelectPage.action");
	$("#queryForm").submit();
}
 