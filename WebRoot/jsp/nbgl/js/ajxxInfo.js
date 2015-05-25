/**
 * 打开内保单位选择页面
 */
function openNbdwSelectWin(fasqdm){
	$.openDialogWindow({
		url:contextPath + "/nbgl/ajhs/toNbdwSelectPage.action?query.fasqdm=" + fasqdm,
		width:"750px",
		height:"600px",
		callback:function(nbdw){
			if(nbdw != null){
				$("#zddwmc").val(nbdw.dwmc);
				$("#zddwdm").val(nbdw.jgbh);
			}
		}
	});
}

/**
 * 案件核实
 */
function ajhs(){
	if ($.validateform("ajhsForm")) {
		if($("#sfzddwfa option:selected").val() == '1'){
			if($("#zddwdm").val() == ""){
				alert("请选择单位.");
				return;
			}
		}
		
		$("#ajhsForm").ajaxSubmit({
	        type:"post",
	        dataType : "json",
	        url : contextPath + "/nbgl/ajhs/ajHs.action?t="+new Date().getTime(),
	        success : function(result) 
	        {
	            if(result){
	                alert("保存成功.");
	            }else{
	                alert("保存失败.");
	            }
	        }
	    });
	}
}

/**
 * 清除选择的内保单位 
 */
function clearNbdwSelect(){
	$("#zddwmc").val("");
	$("#zddwdm").val("");	
}

/**
 * 是否重点单位发案change
 * @param {} value
 */
function sfzddwfaChange(value){
	if(value=="0"){
		$("#zddwmc").attr("disabled","disabled");	
	}else{
		$("#zddwmc").removeAttr("disabled");	
	}
}