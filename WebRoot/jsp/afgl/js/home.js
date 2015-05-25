/**
 * 加载数据
 */
$(document).ready(function(){
	//加载卡口分布情况数据
	kkfbqklist('','');
});

function kkfbqklist(dwdm, dwlevel){
	$.ajax({
		type:"POST",
		url:contextPath + "/home/homeKkfbqk.action?dwdm=" + dwdm + "&dwlevel=" + dwlevel,
		success:function(data){
			var obj = $("#kkfbqk_div");
			if(data){
				var swf = contextPath + '/FusionCharts/Charts/Column2D.swf';
				var chart = new FusionCharts(swf, "kkfbqk_div", obj.width(),obj.height());
				chart.setDataXML(data);
				chart.setTransparent(false);
				chart.render("kkfbqk_div");
			}
		}
	});
}