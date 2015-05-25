$(function(){
	var array = ["锁具生产企业","开锁工具经营企业","保险箱柜开锁","机动车开锁","防盗门开锁","一般锁具开锁","锁具修配点","其他"];
	var ksylx = $("#kslx").val().split("");
	var text = " ";
	for(var i=0 ; i < ksylx.length; i++ ){
		if(ksylx[i] == "1"){
			text += array[i] + "；";
		}
	}
	
	$("#kslxTD").text(text);
});