/**
 * 查询
 */
function query(){
	$("#ddcList").query("F", "ddccx");
}

/**
 * 打开电动车信息
 * @param {} opertype
 * @param {} ddcid
 */
function openDdcInfoWin(opertype,ddcid){
	var path = contextPath + "/zagl/ddccj/toDdcCjPage.action?a=1";
	if(opertype){
		path += "&operType=" + opertype;
	}
	if(ddcid){
		path += "&ddc.ddcid=" + ddcid;
	}
	
	$.openWindow({
			url : path,
			width : 1020,
			height : 600
	});
}

/**
 * 导出电动车Excel
 */
function downloadDdcExcel(){
	
	var size = $("#ddcList").getTotalSize();
	var ddccjbeans = $("#ddcList").getSelected();
	if (ddccjbeans.length==0 && size == 0){
		alert("请选择要导出的记录");
	}
	if(ddccjbeans.length==0 && size>60000){
		alert("一次最多只能导出60000条记录");
	}
	
	if(ddccjbeans.length==0 && size>0 && size <=60000){
		if (confirm("你确定导出满足条件的所有数据吗？"))
			{
				$("#ddccx").attr("target","exportiframe");
				$("#ddccx").attr("action",contextPath + "/zagl/ddccj/dowloadExcel.action");
				$("#ddccx").submit();
			}
	}
	if (ddccjbeans.length >60000){
		alert("一次最多只能导出60000条记录");
	}
	if(ddccjbeans.length>0 && ddccjbeans.length <= 60000){
		if (ddccjbeans.length > 0)
		{
			if (confirm("你确定导出选择的记录吗？"))
			{
				 var v_ddcids = [];			 			 
				 $.each(ddccjbeans,function(i){
					 	var ddccjbean = ddccjbeans[i];
					 	v_ddcids.push(ddccjbean["ddcid"]);	 	
					 });	
				var v_ddcidsstr = v_ddcids.join(",");
				$("#v_ddcid").val(v_ddcidsstr);	
				
				$("#ddccx").attr("target","exportiframe");
				$("#ddccx").attr("action",contextPath + "/zagl/ddccj/downloadDdccjxzExcel.action");
				$("#ddccx").submit();
			 }
		}
		
	}		
}