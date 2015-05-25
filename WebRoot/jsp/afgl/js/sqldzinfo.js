function openStxxSelectWin(hiddenid,showid){
	$.openDialogWindow({
		url : contextPath + "/afgl/sqldzgl/toOpenStListSelect.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(stxxBean)
		{
			if (stxxBean)
			{
				$("#"+hiddenid).val(stxxBean.stid);
				$("#"+showid).val(stxxBean.stdz);
				$("#sqdm").val(stxxBean.sqdm);
				$("#sqmc").val(stxxBean.sqmc);
			}
		}
	});
}

function czStselectRowCallback(trObj,rowdataobj)
{
	var html = "";
	html += "<span style=\"color:green\" onclick=\"returnStxx('" + rowdataobj["stid"] + "','" + rowdataobj["stdz"] + "','" + rowdataobj["sqdm"] + "','" + rowdataobj["sqmc"] + "')\" class=\"cps_span_href\">选择实体</span>&nbsp;";
	return html;
}
function returnStxx(stid,stdz,sqdm,sqmc){
	var stxxBean ={"stid":stid,"stdz":stdz,"sqdm":sqdm,"sqmc":sqmc};
	window.returnValue = stxxBean;
	window.close() ;
}
function stxxQuery(){
	$("#xldquerylist").query("F","xldqueryform");
}

function  loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#xm").val(rkJbxxBean["xm"]);
			$("#xb").val(rkJbxxBean["xb"]);
			$("#xbs").val(rkJbxxBean["xb"]);
			$("#csrq").val(rkJbxxBean["csrq"]);
			$("#hjdqh").val(rkJbxxBean["hjdqh"]);
			$("#hjdqhmc").val(rkJbxxBean["hjdqhmc"]);
			$("#lxdh").val(rkJbxxBean["lxdh"]);
			$("#zzmm").val(rkJbxxBean["zzmm"]);
			$("#xzzxz").val(rkJbxxBean["xzzxz"]);
			$("#zpxx").attr("src",contextPath + "/cps/common/showPoto.action?sfzh=" + sfzh);
		}
		else
		{
			alert("未找到人员信息");
		}
	});
}

function openHjdxzqh()
{
	openXzqhTree({
	},function(xzqhbean){
		if (xzqhbean)
		{
			$("#hjdqh").val(xzqhbean["id"]);
			$("#hjdqhmc").val(xzqhbean["name"]);
		}
	})
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
					alert("人员已经存在，不能重复添加.");
				}
				else
				{
					if (result != null)
					{
						//$("#id").val(result.id);
						 alert("保存楼栋长信息成功.");
						$.closeWindow();
					}
					else
					{
						alert("保存楼栋长信息失败.");
					}
				}
			}
		})
	}
}
