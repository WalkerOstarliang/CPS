$(function(){
	var dwfl_dm = $("#dwfl").val().split("");
	var dwfl_mc = ["生产","储存","运输","销售","使用","处置"];
	var dwfl_show = "";
	for(var i = 0 ; i <= dwfl_dm.length; i++){
		if(dwfl_dm[i] == "1"){
			dwfl_show += " " + dwfl_mc[i];
		}
	}
	$("#dwfl").parent().text(dwfl_show);
});