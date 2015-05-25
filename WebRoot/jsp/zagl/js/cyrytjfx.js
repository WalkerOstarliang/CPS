// 从业人员统计
function queryCyrytj(){
	var queryDate = $("#queryCyrytjForm").serialize();
	$.ajax({
		type:"POST",
		data: queryDate,
		url: contextPath + "/zagl/dw/queryCyryTjList.action",
		success:function(datas){
			var jsonObj = eval("("+datas+")");
			var html = "" ;
			var num = 0 ;
			html = html + "<table width=\"49.8%\" class=\"cps-tablegrid\" id=\"table_cyryList\" style=\"width: 80%;\" border=\"0\" cellSpacing=\"0\" cellPadding=\"0\">" ;
			html = html + "<tbody>";
			html = html + "<tr class=\"tablegrid_tbody\"  style=\"background-color: transparent;\" > <td align=\"left\" style=\"width:500px;\" >单位名称</td>" ;
			html = html + "<td  align=\"center\"  style=\"width:100px;\" >数量</td>" ;
			$.each(jsonObj,function(i,item){
				html = html + "<tr class=\"tablegrid_tbody\"  style=\"background-color: transparent;\" > <td align=\"left\" style=\"width:500px;\" >"+item.dwmc+ "</td>" ;
				html = html + "<td  align=\"center\"  style=\"width:100px;\" >" + item.sl+ "</td>" ;
				num = num + 1 ;
			});
			html = html + "</tr></tbody></table>";
			$("#tjjgdiv").html('') ;
			$("#tjjgdiv").html(html) ;
			$("#snum").val(num);
			if(num == 0){
				$("#tjjgdiv").html('') ;
			}
		},
		error:function(){
			alert('系统错误！')
		}
	});
}
// 导出统计结果
function toExportExcelCyrytj(){
	var ins = $("#snum").val() ;
	if(ins == 0){
		alert("没有结果可以导出");
		return false ;
	}
	$("#queryCyrytjForm").attr("target","exportiframe");
	$("#queryCyrytjForm").attr("action",contextPath + "/zagl/dw/toExportExcelCyrytjInfoPage.action");
	$("#queryCyrytjForm").submit();
}