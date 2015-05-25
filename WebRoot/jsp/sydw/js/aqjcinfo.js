function aqjcRowClickCallback(trObj,rowdata)
{
	if (rowdata["jclb"] != null && rowdata["jclb"] != "")
	{
		var jclbarr = rowdata["jclb"].split(",");
		$("input[id^='aqjclb_']").each(function(){
				var thisvalue = $(this).val();
				var have = false;
				for (var i=0;i<jclbarr.length;i++)
				{
					if ($.trim(jclbarr[i])==thisvalue)
					{
						have = true;
					}
				}
				if (have)
				{
					$(this).attr("checked", "checked");
				}
				else
				{
					$(this).removeAttr("checked");
				}
		});
	}
	else
	{
		$("input[id^='aqjclb_']").each(function(){
			$(this).removeAttr("checked");
		})
	}
	$("#aqjc_div").eachObjectSetValue(rowdata);
	$("#aqjc_jlbh").val(rowdata.jlbh);
	
	
}


//保存单位安全检查
function saveDwAqjcBean()
{
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("dw_form"))
	{
		var sffxwt = $("#sffxwt").val();
		if (sffxwt == "1")
		{
			var jcclqk = $("#jcclqk").val();
			if (jcclqk == null || jcclqk == "")
			{
				alert("检查发现问题后，检查处理情况不能为空.");
				return false;
			}
			else if (jcclqk == "4")
			{
				var jcxqzgrq = $("#jcxqzgrq").val();
				var zgqk = $("#zgqk").val();
				if ($.isBlank(jcxqzgrq) || $.isBlank(zgqk))
				{
					alert("选择整改后，限期整改日期，整改情况不能为空");
					return false;
				}
			}
			var jcclyj = $("#jcclyj").val();
			if (jcclyj == null || jcclyj == "")
			{
				alert("检查发现问题后，处理意见不能为空.");
				return false;
			}
		}
		eventSrcObj.attr("disabled","disabled");
		$("#dw_form").ajaxSubmit({
			url : contextPath + "/zagl/dw/saveDwAqjcBean.action",
			dataType : "json",
			type : "post",
			success : function(dwBean)
			{
				if (dwBean != null)
				{
					alert("信息保存成功!");
					$("#aqjcList").query("F","aqjcqueryform");
					$("#dw_form").reset();
				}else{
					alert("保存失败.")
					eventSrcObj.removeAttr("disabled");
				}
			}
		});
	}
}

function openDwjcrySelect(orgcode,jcryxm)
{
	openDwRySelect({
		rootOrgCode : orgcode,
      	mutilSelect : true
	},function(userBeans){
		var jcryxms = [];
		$.each(userBeans,function(i,bean){
			jcryxms.push(bean["realname"]);
		});
		$("#jcryxm").val(jcryxms.join(","));
	})
}

function changeAqjcSffxwt(value)
{
	if (value == "2")
	{
		$("#fxwtrow").hide();
		$("tr[id^=jcclqkrow_]").hide();
	}
	else
	{
		$("#fxwtrow").show();
		$("tr[id^=jcclqkrow_]").show();
	}
}