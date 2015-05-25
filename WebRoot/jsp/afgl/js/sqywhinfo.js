function  loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#xm").val(rkJbxxBean["xm"]);
			$("#xb").val(rkJbxxBean["xb"]);
			$("#xbs").val(rkJbxxBean["xb"]);
			$("#csrq").val(rkJbxxBean["csrq"]);
			$("#lxdh").val(rkJbxxBean["lxdh"]);
			$("#zzmm").val(rkJbxxBean["zzmm"]);
		}
		else
		{
			alert("未找到人员信息");
		}
	});
}
function openWyxqxxSelectWin(hiddenid,showid){
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
				$("#"+hiddenid).val(wyxqxxBean.id);
				$("#"+showid).val(wyxqxxBean.xqmc);
				$("#sqdm").val(wyxqxxBean.sqdm);
				$("#sqmc").val(wyxqxxBean.sqmc);
			}
		}
	});
}

function submitSave(){
	var xb = $("#xb").val();
	if ($.validateform("infoform"))
	{
		$("#infoform").ajaxSubmit({
			type : "post",
			dataType : "json",
			success : function(result)
			{
				if (result == "isexist")
				{
					alert("该业主委员会已经存在，不能重复添加.");
				}
				else
				{
					if (result != null)
					{
						$("#id").val(result.id);
						$("#operType").val('update');
						 alert("保存业主委员会信息成功.");
					}
					else
					{
						alert("保存业主委员会信息失败.");
					}
				}
			}
		})
	}
}
function addyzwyhcy(){
	var wyhid = $("#id").val();
	if(!wyhid){
		alert('请先保存业主委员会信息');
		return ;
	}
	$.openWindow({
		url : contextPath + "/afgl/sqldzgl/toOpenWyhcyxxInfo.action?operType=add&wyhid="+wyhid,
		width : 900,
		height : 500
	});
}
//查询物业小区list
function wyxqxxQuery(){
	$("#wyxqquerylist").query("F","wyxqqueryform");
}

function czWyxqselectRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<span style=\"color:green\" onclick=\"returnWyxqxx('" + rowdataobj["id"] + "','" + rowdataobj["xqmc"] + "','" + rowdataobj["dzmc"] + "','" + rowdataobj["sqdm"] + "','" + rowdataobj["sqmc"] + "')\" class=\"cps_span_href\">选择物业小区</span>&nbsp;";
	return html;
}
function returnWyxqxx(id,xqmc,dzmc,sqdm,sqmc){
	var wyxqxxBean ={"id":id,"xqmc":xqmc,"dzmc":dzmc,"sqdm":sqdm,"sqmc":sqmc};
	window.returnValue = wyxqxxBean;
	window.close() ;
}
