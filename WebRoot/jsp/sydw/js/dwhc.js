//保存
function save(){
	if ($.validateform("dwhsfrom")){
		$("#savebutton").attr("disabled","disabled");
		$("#dwhsfrom").ajaxSubmit({
				type : "post",
				url : contextPath + "/sydw/dwgl/dwGlbmHs.action",
				dataType : "json",
				success : function(dwBean){
					if(dwBean){
						alert("保存成功.");
						window.close();
					}else{
						alert("保存失败.");
						window.close();
					}
				}
		});
	}
}

//是否管理值发生改变
function sfglChange(value){
	if(value == "0"){
		//清空后面的选项
		$.each($("#zddwbz").find("option"),function(index,obj){
			if($(obj).val() == ""){
				$(obj).attr("selected","selected");
				return;
			}
		});
		
		$.each($("#dwfl").find("option"),function(index,obj){
			if($(obj).val() == ""){
				$(obj).attr("selected","selected");
				return;
			}
		});
		
		$("#zddwbz").attr("class","cps-select");
		$("#zddwbz").attr("disabled","disabled");
		$("#dwfl").attr("class","cps-select");
		$("#dwfl").attr("disabled","disabled");
	}

	if(value == "1"){
		$("#zddwbz").attr("class","validate[required] cps-select");
		$("#zddwbz").removeAttr("disabled","disabled");
		$("#dwfl").attr("class","validate[required] cps-select");
		$("#dwfl").removeAttr("disabled","disabled");
	}
}