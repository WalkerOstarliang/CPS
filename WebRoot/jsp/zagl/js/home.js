/**工作台管理**/
$(document).ready(function(){
	/**加载单位检查提醒**/
	
	/**加载单位分布情况**/
	orgStatistics();
	
	/**加载数据更新异常提醒**/
	
	/**加载单位类别分布情况**/
	orgTypeStatistics();
});

/**
 * 单位类别分布情况
 */
function orgTypeStatistics(){
	$.ajax({
		url:contextPath + "/zagl/workbenchmanage/getOrgTypeStatistics.action?t=" + new Date().getTime(),
		cache:"false",
		type:"post",
		success:function(result){
			if(result == null || result == ""){
				alert("查询单位类别分布情况失败!");				
			}else{
				var obj = $("#orgTypeStatistics");
				creatChart('orgTypeStatistics',obj.width(),obj.height(),result,contextPath + '/FusionCharts/Charts/FCF_Pie3D.swf');
			}
		},
		error:function(){
			alert("单位类别分布情况请求错误!");
		}
	});
}

/**
 * 单位分布情况统计   （注意：函数名称不能改，要修改的话必须修改对应的SQL）
 * @param {} orgCode
 */
function orgStatistics(orgCode){
	var url = "";
	if(orgCode == "" || orgCode == null || orgCode == undefined){
		url = contextPath + "/zagl/workbenchmanage/getOrgStatistics.action?t=" + new Date().getTime();
	}else{
		url = contextPath + "/zagl/workbenchmanage/getOrgStatistics.action?orgCode=" + orgCode.toString();
	}
	
	$.ajax({
		url:url,
		cache:"false",
		type:"post",
		success:function(result){
			if(result == null || result == ""){
				alert("查询单位分布情况失败!");				
			}else{
				var obj = $("#orgStatistics");
				creatChart('orgStatistics',obj.width(),obj.height(),result,contextPath + '/FusionCharts/Charts/FCF_Pie3D.swf');
			}
		},
		error:function(){
			alert("单位分布情况请求失败!");
		}
	});
}

function creatChart(el, w, h, xml, swf) {
	var chart = new FusionCharts(swf, el, w, h);
	chart.setDataXML(xml);
	chart.setTransparent(false);
	chart.render(el);
}