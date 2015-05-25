function queryData(){
	$("#datagridList").query("F","searchform");
}

function openJqtbPage(operType,id,tjyf,orgcode){
	$.openWindow({
		url : contextPath+"/gzgl/rzgl/toJqtbInfoPage.action",
		width : 1000,
		height : 500,
		data:{
			"operType":operType,
			"jqtbBean.id":id,
			"jqtbBean.zrdwdm" : orgcode,
			"jqtbBean.ny" : tjyf
		},
		callback : function()
		{
			queryData();
		}
	});
}
function isEXistNySS(){
	var operType=$("#operType").val();
	if($.validateform("jqtbform")){
		if(operType =='add'){
			var ny=$("#ny").val();
			var djdw=$("#zrdwdm").val();
			$.ajax({
				url:contextPath+"/gzgl/rzgl/isExistNy.action",
				data:{"jqtbBean.ny":ny,"jqtbBean.zrdwdm":djdw,t:new Date().getTime()},
				dataType:"json",
				success:function(msg){
					if(msg){
						alert("该月份的案件发生数已经统计过，请对其进行修改或重新选择年月");
					}
				}	
			});	
		};	
	};
}

function saveJqtb(){
	var operType=$("#operType").val();
	if($.validateform("jqtbform")){
		if(operType =='add'){
			var ny=$("#ny").val();
			var djdw=$("#zrdwdm").val();
			$.ajax({
				url:contextPath+"/gzgl/rzgl/isExistNy.action",
				data:{"jqtbBean.ny":ny,"jqtbBean.zrdwdm":djdw,t:new Date().getTime()},
				dataType:"json",
				success:function(msg){
					if(msg){
						alert("该月份的案件发生数已经统计过，请对其进行修改或重新选择年月");
					}else{
						$("#jqtbform").ajaxSubmit({
							url:contextPath+"/gzgl/rzgl/saveJqtbBean.action",
							type:"post",
							dataType:"json",
							data:{t:new Date().getTime()},
							success: function(msg){
								if(msg){
									alert("保存成功");
									window.close();
								}else{
									alert("保存不成功");
								}
							}
						});
					}
				}
			});
		}else{
			$("#jqtbform").ajaxSubmit({
				url:contextPath+"/gzgl/rzgl/saveJqtbBean.action",
				type:"post",
				dataType:"json",
				data:{t:new Date().getTime()},
				success: function(msg){
					if(msg){
						alert("保存成功");
						window.close();
					}else{
						alert("保存不成功");
					}
				}
			})
		}
	}
}

function exportJqtbWord()
{
	var selectes = $("#datagridList").getSelected();
	if (selectes.length >0)
	{
		var jqtbBean = selectes[0];
		if (jqtbBean["id"] == null || jqtbBean["id"] == "" || jqtbBean["id"] == "null")
		{
			alert("你必须完善警情通报信息后才能进行导出打印.");
		}
		else
		{
			$.openWindow({
				url : contextPath+"/gzgl/rzgl/exportJqtbWord.action",
				width : 1000,
				height : 500,
				data:
				{
					"operType":"detail",
					"jqtbBean.id":jqtbBean["id"],
					"jqtbBean.zrdwdm" : jqtbBean["djdwdm"],
					"jqtbBean.ny" : jqtbBean["ny"]
				}
			});
		}
	}
	else
	{
		alert("请选择要导出打印的记录.");
	}
}