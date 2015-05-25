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

function setSqxxToPage(sqjbxxbean)
{
	if (sqjbxxbean)
	{
		$("#sqdm").val(sqjbxxbean["sqbh"]);
		$("#sqmc").val(sqjbxxbean["sqmc"]);
	}
}

function  loadRkxxBean(sfzh){
	queryRkJbxxBeanBySfzh(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#ddbxm").val(rkJbxxBean["xm"]);
			$("#xb").val(rkJbxxBean["xb"]);
			$("#xbs").val(rkJbxxBean["xb"]);
			$("#csrq").val(rkJbxxBean["csrq"]);
			$("#hjdqh").val(rkJbxxBean["hjdqh"]);
			$("#hjdqhmc").val(rkJbxxBean["hjdqhmc"]);
			$("#ddblxdh").val(rkJbxxBean["lxdh"]);
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

function submitSave(){
	//var rddb = $("#rddb").attr('checked');
	//var zxwy = $("#zxwy").attr('checked');
	var xb = $("#xb").val();
	
	//if(typeof rddb == 'undefined' || rddb == ''){
	//	$("#sfrddb").val('0');
	//}else if(rddb == 'checked'){
	//	$("#sfrddb").val('1');
	//}
	
	//if(typeof zxwy == 'undefined' || zxwy == ''){
	//	$("#sfzxwy").val('0') ;
	//}else if(zxwy == 'checked'){
	//	$("#sfzxwy").val('1');
	//}
	
	if ($.validateform("infoform"))
	{
		if($("#sfrddb").val() == '0' && $("#sfzxwy").val() == '0'){
			alert('身份至少选一个');
			return ;
		}
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
						 alert("保存党代表信息成功.");
						$.closeWindow();
					}
					else
					{
						alert("保存党代表信息失败.");
					}
				}
			}
		})
	}
}