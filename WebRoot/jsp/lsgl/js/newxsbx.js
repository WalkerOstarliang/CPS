
function changeGyry(value)
{
	if (value == "1")
	{
		$("tr[id^='row_gyry_']").show();
	}
	else
	{
		$("tr[id^='row_gyry_']").hide();
		//清空
		$("#xsbxxxtable").find("tr[id^=row_gyry_]").each(function(i){
			$(this).find(":input").val("");
		});
	}
}
function changeHjylcs(value)
{
	if (value == "1")
	{
		$("tr[id^='hjylcs_row_']").show();
	}
	else
	{
		$("tr[id^='hjylcs_row_']").hide();
		$("#xsbxxxtable").find("tr[id^=hjylcs_row_]").each(function(i){
			$(this).find(":input").val("");
		});
	}
}

function changeSfygdzy(value)
{
	if (value == "1")
	{
		$("tr[id^='ywgdzy_row_']").show();
	}
	else
	{
		$("tr[id^='ywgdzy_row_']").hide();
		$("#xsbxxxtable").find("tr[id^=ywgdzy_row_]").each(function(i){
			$(this).find(":input").val("");
		});
	}
}

function changeSfgzsjc(value)
{
	if (value == "1")
	{
		$("tr[id^='sfgzsjc_row_']").show();
	}
	else
	{
		$("tr[id^='sfgzsjc_row_']").hide();
		$("#xsbxxxtable").find("tr[id^=sfgzsjc_row_]").each(function(i){
			$(this).find(":input").val("");
		});
	}
}

function changeSfgzfc(value)
{
	if (value == "1")
	{
		$("tr[id^='sfgzfc_row_']").show();
	}
	else
	{
		$("tr[id^='sfgzfc_row_']").hide();
		$("#xsbxxxtable").find("tr[id^=sfgzfc_row_]").each(function(i){
			$(this).find(":input").val("");
		});
	}
}

function resetXsbxForm(){
	$("#rkxxform").get(0).reset();
} 

function fullXsbxForm(tr,data){
	$.each(data,function(key,value){
		if(key == 'sfzh'){
			$("#xsbs_sfzh").val(value);
		}else if(key == 'jlbh'){
			$("#xsbs_jlbh").val(value);
		}else if(key == 'rybh'){
			$("#xsbs_rybh").val(value);
		}else{
			$("#" + key).val(value);
		}
	});
	var sfcqhjyfzcs = $("#sfcqhjyfzcs").val();
	var sfygdzy = $("#sfygdzy").val();
	var sfgzsjc = $("#sfgzsjc").val();
	var sfgzfc =  $("#sfgzfc").val();
	var sfzyry = $("#sfzyry").val();
	changeGyry(sfzyry);
	changeHjylcs(sfcqhjyfzcs);
	changeSfygdzy(sfygdzy);
	changeSfgzsjc(sfgzsjc);
	changeSfgzfc(sfgzfc);
}

$(function(){
	var sfcqhjyfzcs = $("#sfcqhjyfzcs").val();
	var sfygdzy = $("#sfygdzy").val();
	var sfgzsjc = $("#sfgzsjc").val();
	var sfgzfc =  $("#sfgzfc").val();
	changeHjylcs(sfcqhjyfzcs);
	changeSfygdzy(sfygdzy);
	changeSfgzsjc(sfgzsjc);
	changeSfgzfc(sfgzfc);
})

//导出在控登记信息
function downloadZkxx(){
	
	var xzbx = $("#lsxsbslist").getSelected();
	if(xzbx.length <1){
		alert("请选择需要导出的记录.")
		return;
	}
	else{
		var url = contextPath + "/lsgl/zdry/downloadZkdj.action?t="+new Date().getTime()+"&xsbxBean.jlbh=" + xzbx[0].jlbh;
		$("#download").attr("action",url);
		$("#download").attr("method",'post');
		$("#download").get(0).submit();
	}
}

