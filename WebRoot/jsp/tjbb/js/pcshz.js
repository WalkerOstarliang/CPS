//查询派出所汇总
function queryPcshz(){
	if($.validateform("queryParam"))
	{
		$("#pcstablegrid").query("F","queryParam");
		/**
		$.ajax({
			url:contextPath + "/tjbb/queryPcsjbqkhz.action",
			type:'post',
			data:{'pcstjQueryBean.orgcode':$("#dwdm").val(),'pcstjQueryBean.orgLeve':$("#dwleve").val()},
			success:function(result){
				if(result){
					eval("var data = " + result)
					for(key in data){
						$("#" + key).empty();
						$("#" + key).text(data[key])
					}
				}
			}
		});
		*/
	}
}

//单位选择
function orgSelect(){
	openDwSelect2({
			rootOrgCode : '430000000000',
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) 
				{
					if (orgbeans.leve < 3)
					{
						$("#dwdm").val(orgbeans.id);
						$("#dwmc").val(orgbeans.name);
						$("#dwleve").val(orgbeans.leve);
					}
					else
					{
						alert("只能选择区县上级单位.")
					}
				}
			});
}

//清除选择的单位
function clearOrg(){
	$("#dwdm").val("");
	$("#dwleve").val("");
	$("#dwmc").val("");
}

//导出派出所汇总
function dowloadPcshz(){                                                               
	$("#queryParam").attr("method","post");
	$("#queryParam").attr("action", contextPath + "/tjbb/dowloadPcsjbqkhz.action");
	$("#queryParam").attr("target","_blank");
	$("#queryParam").submit();
	
	$("#queryParam").attr("action","");
	$("#queryParam").attr("target","");
	
}


function dowloadPcshzList()
{
	$("#queryParam").attr("method","post");
	$("#queryParam").attr("action", contextPath + "/tjbb/dowloadPcsjbqkhzList.action");
	$("#queryParam").attr("target","_blank");
	$("#queryParam").submit();
	
	$("#queryParam").attr("action","");
	$("#queryParam").attr("target","");
}