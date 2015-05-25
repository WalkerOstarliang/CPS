/**
 * 人员接管
 */
function ryjg(){
	if($.validateform("tgxx_form")){
		$("#tgxx_form").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/ryjg.action",
			type : "post",
			dataType : "json",
			success :function(bean){
				if(bean != null){
					alert("接管成功.");
					window.close();
				}else{
					alert("接管失败!");
				}
			}
		});
	}
}

/**
 * 托管退回
 */
function tgth(){
	var thyy = $("#thyy").val();
	if(thyy == ""){
		alert("请填写退回原因.");
		return;
	}
	
	if($.validateform("tgxx_form")){
		$("#tgxx_form").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/wtzdryth.action",
			type : "post",
			dataType : "json",
			success :function(bean){
				if(bean != null){
					alert("托管退回成功.");
					window.close();
				}else{
					alert("托管退回失败!");
				}
			}
		});
	}

}

$(document).ready(function(){
	if($("#opertype").val() == "detail"){
			
	}
});
