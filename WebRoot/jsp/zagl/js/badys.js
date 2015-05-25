function lxChange(value){
	if(value == "01"){
		$("#bxxsdl").removeAttr("disabled");
		$("#bxxs").removeAttr("disabled");
		$("#sdgm").removeAttr("disabled");
	}else{
		$("#bxxsdl").attr("disabled","true");
		$("#bxxs").attr("disabled","true");
		$("#sdgm").attr("disabled","true");
	}
}

//保存不安定因素
function saveBadys(){
	if($("#badys_jgbh").val() == "" || $("#badys_jgbh").val() == null){
		$("#badys_jgbh").val($("#jgbh").val())
	}
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("badys_form")){
		eventSrcObj.attr("disabled","disabled");
		$("#badys_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveBadys.action",
			dataType : "json",
			success : function(result){
				alert("保存成功!");
				ajaxLoadDwPageInfo("toBadys");
			}
		});
	}
}

//删除不安定因素
function delBadys(bh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBadys.action?dw.badys.bh=" + bh,
			type:"post",
			success:function(){
				alert("删除成功!");
				ajaxLoadDwPageInfo("toBadys");
			}
		});
	}
}

//加载不安定因素信息
function onloadBadxx(tr,data){
	var url = contextPath + "/zagl/dw/toBadys.action?t=" + new Date().getTime();
	var param = {"dw.badys.bh":data.bh,"jgbh":data.jgbh};
	$.post(url,param,function(htmldata){
			$("#dwjbxx").hide();
			$("#dwtxxx").hide()
			$("#contentpanel").html(htmldata);
			$("#contentpanel").show();
			
			if($("#lx").val() == '01'){
				$("#bxxsdl").removeAttr("disabled");
				$("#bxxs").removeAttr("disabled");
				$("#sdgm").removeAttr("disabled");
			}else{
				$("#bxxsdl").attr("disabled","true");
				$("#bxxs").attr("disabled","true");
				$("#sdgm").attr("disabled","true");
			}	
		});
}
