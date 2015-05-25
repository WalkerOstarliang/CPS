function saveform(){
	var mobile = $("#mobile").val();
	var telephone = $("#telephone").val();
	if (!$.isBlank(telephone) || !$.isBlank(mobile))
	{
		if ($.validateform("checkbeforeloginForm"))
		{	
			$("#checkbeforeloginForm").ajaxSubmit({
				type:"post",
				url:contextPath+"/schedule/saveLxfsOrJwsBean.action",
				dataType:"json",
				success :function(msg){
					if(msg)
					{
						alert("成功保存信息，欢迎进入社区警务平台！");
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					}
					else
					{
					
					}
				} 
			})
		}
	}
	else
	{
		alert("电话号码和手机号码必须填写一项。");
	}
}

function removetelephoneRed(){
	if($("#mobile").val().length>0){
		$("#telephone").removeClass();
		$("#telephone").addClass("validate[[custom[phone], maxSize[11]]]  cps-input")
	}
}

function removemobileRed(){
	if($("#telephone").val().length>0){
		$("#mobile").removeClass();
	    $("#mobile").addClass("validate[[custom[mobile], maxSize[20]]]  cps-input")
		
	}
}