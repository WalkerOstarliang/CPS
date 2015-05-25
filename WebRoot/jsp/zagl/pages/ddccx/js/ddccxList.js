/**
 * 查询
 */
function query(){
	$("#ddccxList").query("F", "ddccx");
	
}

/**
 * 打开电动车信息
 * @param {} opertype
 * @param {} ddcid
 */
function openDdcxInfoWin(car_id){
	var path = contextPath + "/zagl/ddccx/queryByCarid.action?a=1";	
		path += "&ddcjjbean.car_id=" + car_id;	
	$.openWindow({
			url : path,
			width : 1020,
			height : 600
	});
}

/**
 * 导出电动车Excel
 downloadDdcExcel
 */
function downloadDdcExcel(){					
    var size = $("#ddccxList").getTotalSize();
	var ddcjjbeans = $("#ddccxList").getSelected();
	if (ddcjjbeans.length==0 && size == 0){
		alert("请选择要导出的记录");
	}
	if(ddcjjbeans.length==0 && size>60000){
		alert("一次最多只能导出60000条记录");
	}
	
	if(ddcjjbeans.length==0 && size>0 && size <=60000){
		if (confirm("你确定导出满足条件的所有数据吗？"))
			{
				$("#ddccx").attr("target","exportiframe");
				$("#ddccx").attr("action",contextPath + "/zagl/ddccx/downloadDdcExcel.action");
				$("#ddccx").submit();
			}
	}
	if (ddcjjbeans.length >60000){
		alert("一次最多只能导出60000条记录");
	}
	if(ddcjjbeans.length>0 && ddcjjbeans.length <= 60000){
		if (ddcjjbeans.length > 0)
		{
			if (confirm("你确定导出选择的记录吗？"))
			{
				 var v_car_ids = [];			 			 
				 $.each(ddcjjbeans,function(i){
					 	var ddcjjbean = ddcjjbeans[i];
					 	v_car_ids.push(ddcjjbean["car_id"]);	 	
					 });	
				var v_car_idsstr = v_car_ids.join(",");
				$("#v_car_id").val(v_car_idsstr);	
				
				$("#ddccx").attr("target","exportiframe");
				$("#ddccx").attr("action",contextPath + "/zagl/ddccx/downloadDdcxzExcel.action");
				$("#ddccx").submit();
			 }
		}
		
	}
		
}