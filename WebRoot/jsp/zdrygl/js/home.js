$(function(){
	getData(contextPath + '/zdry/index_queryLgdqtx.action','',$("#lgdqtxTable"));
	getData(contextPath + '/zdry/index_queryLgsqtx.action','',$("#lgsptxTable"));
	initZdryLxChart();
	initZdryGkChart();
});

function initZdryGkChart(){
	var data = $('#zdrylxrygkForm').serialize();
	$.ajax({
		type	:"POST",
		data	:data,
		url		:contextPath + "/zdry/statistics_indexZdryGk.action?t="+ new Date(),
		success	:function(data){
			var obj = $("#zdrygkStatistics");
			if(data){
				creatChart('zdrygkStatistics',obj.width(),obj.height(),data,contextPath + '/FusionCharts/Charts/FCF_MSColumn2D.swf');
			}
		}
	});
}

function initZdryLxChart(){
	var data = $('#zdrylxrylxForm').serialize();
	$.ajax({
		type	:"POST",
		url		:contextPath + "/zdry/statistics_indexZdryLx.action",
		data	:data,
		success	:function(data){
			var obj = $("#zdrylxStatistics");
			if(data){
				creatChart('zdrylxStatistics',obj.width(),obj.height(),data,contextPath + '/FusionCharts/Charts/FCF_Column2D.swf');
			}
		}
	});
}

//打开审批界面
function openSpWindow(sqxxbh,lgsqlx){
	$.openDialogWindow({
		url 		: contextPath + "/zdry/collect_toCollectLgsq.action",
		width 		: 900,
		height		: 710,
		data 		: {t:new Date().getTime(),sqxxbh:sqxxbh,lcgsqlx:lgsqlx}, 
		scroll 		: false,
		callback 	: function(data){
			if(data==true || data == 'true'){
				getData(contextPath + '/zdry/index_queryLgsqtx.action','',$("#lgsptxTable"));
			}
		}
	});
}
