function jxyzwyhcyQuery(){
	$("#yzwyhcyquerylist").query("F","infoform");
}

function czywhcyRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<span style=\"color:green\" onclick=\"openInfoyzwyhcyWin('detail','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">详情</span>&nbsp;";
	if(rowdataobj["zxbs"]=='0'){
		html += "<span style=\"color:green\" onclick=\"openInfoyzwyhcyWin('update','" + rowdataobj["id"] + "')\" class=\"cps_span_href\">修改</span>&nbsp;";
		html += "<span style=\"color:green\" onclick=\"simpleDeleteYzwyhcyxx('" + rowdataobj["id"] + "')\" class=\"cps_span_href\">注销</span>";
	}
	return html;
}

function openInfoyzwyhcyWin(operType,id){
	$.openWindow({
		url : contextPath + "/afgl/sqldzgl/toOpenWyhcyxxInfo.action",
		data : {"operType" : operType,
				"id" : id,
				t:new Date().getTime()},
		width : 980,
		height : 650
	})
	if(operType != "detail")
	{
		window.parent.jxyzwyhcyQuery();
	}
}

function simpleDeleteYzwyhcyxx(id){
	if (confirm("你确定要注销该成员信息吗？"))
	{
		deleteYzwyhcyxx(id);
	}
}

function deleteYzwyhcyxx(id){
	$.ajax({
		url : contextPath + "/afgl/sqldzgl/deleteSqYzwyhcyBeanById.action?id="+id,
		dataType : "json",
		success : function(res)
		{
			if (res)
			{
				jxyzwyhcyQuery();
			}
		}
	})
}

function  loadywhcyRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#xm").val(rkJbxxBean["xm"]);
			$("#xb").val(rkJbxxBean["xb"]);
			$("#xbs").val(rkJbxxBean["xb"]);
			$("#csrq").val(rkJbxxBean["csrq"]);
			$("#lxdh").val(rkJbxxBean["lxdh"]);
			$("#zzmm").val(rkJbxxBean["zzmm"]);
			$("#zpxx").attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + sfzh);
		}
		else
		{
			alert("未找到人员信息");
		}
	});
}
function submitSaveywhcy(){
	var xb = $("#xb").val();
	var zw ;
	$.each($("input[name='zws']"),function(index,obj){
		if($(obj).attr("checked")){
			zw = $(obj).val();
		}
	})
	$("#zw").val(zw);
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(result)
			{
				if (result == "isexist")
				{
					alert("该业主已经存在，不能重复添加.");
				}
				else
				{
					if (result != null)
					{
						$("#id").val(result.id);
						var ywhssss = opener.document.getElementById('ywhssss');
						if(ywhssss){
							opener.jxyzwyhcyQuery();
						}
						 alert("保存业主信息成功.");
					}
					else
					{
						alert("保存业主信息失败.");
					}
				}
			}
		})
	}
}

