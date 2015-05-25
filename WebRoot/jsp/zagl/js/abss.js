//保存安保设施
function saveAbss(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("abssform")){
		eventSrcObj.attr("disabled","disabled");
		$("#abssform").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveAbss.action",
			dataType : "json",
			success : function(result){
				alert("保存成功.")
				ajaxLoadDwPageInfo('toAbss');
			}
		});
	}
}

//删除安保设施
function delAbss(ssbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delAbss.action?dw.abss.ssbh=" + ssbh,
			type:"post",
			success:function(){
				ajaxLoadDwPageInfo('toAbss');
				alert("删除成功!")
			}
		});
	}
}

//入侵子系统
function rqxtChange(value){
	if(value == "1"){
		$("#rqxtlwqk").removeAttr("disabled");
		$("#tcqsl").removeAttr("disabled");
		$("#gdmbs").removeAttr("disabled");
		$("#ydmbs").removeAttr("disabled");
	}else if(value=='0'){
		$("#rqxtlwqk").attr("disabled","true");
		$("#tcqsl").attr("disabled","true");
		$("#gdmbs").attr("disabled","true");
		$("#ydmbs").attr("disabled","true");
	}
}

//视频监控系统
function spjkxtChange(value){
	if(value == "1"){
		$("#sgdw").removeAttr("disabled");
		$("#sxjsl").removeAttr("disabled");
		$("#spjkxtlwqk").removeAttr("disabled");
		$("#txbcts").removeAttr("disabled");
		$("#yxqk").removeAttr("disabled");
		$("#xtzj").removeAttr("disabled");
	}else if(value='0'){
		$("#sgdw").attr("disabled","true");
		$("#sxjsl").attr("disabled","true");
		$("#spjkxtlwqk").attr("disabled","true");
		$("#txbcts").attr("disabled","true");
		$("#yxqk").attr("disabled","true");
		$("#xtzj").attr("disabled","true");
		
	}
}

function loadAfxtxx(tr,data){
	$.each(data,function(key,value){
		if(key == "jgbh"){
			$("#abss_jgbh").val(value);
		}else if(key == "afglsx"){
			$("#afglsxdl").val(data["afglsxdl"]);
			$("#afglsx").val(value);
		}else if(key != "afglsxdl"){
			$("#" + key).val(value);
			
			if(key=="ywrqbjzxt" ){
				$("input[name='dw.abss.ywrqbjzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
				if(value=='1'){
					$("input[name='dw.abss.ywrqbjzxt']")
					$("#rqxtlwqk").removeAttr("disabled");
					$("#tcqsl").removeAttr("disabled");
					$("#gdmbs").removeAttr("disabled");
					$("#ydmbs").removeAttr("disabled");
				}
			}
			if(key=="ywspjkzxt" ){
				$("input[name='dw.abss.ywspjkzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
				if(value=="1"){
					$("#sgdw").removeAttr("disabled");
					$("#sxjsl").removeAttr("disabled");
					$("#spjkxtlwqk").removeAttr("disabled");
					$("#txbcts").removeAttr("disabled");
					$("#yxqk").removeAttr("disabled");
					$("#xtzj").removeAttr("disabled");
				}
			}
			if(key == "ywcrkjkzxt"){
				$("input[name='dw.abss.ywcrkjkzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
			}
			if(key == "ywdzxcxt"){
				$("input[name='dw.abss.ywdzxcxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
			}
			if(key == "ywtckglzxt"){
				$("input[name='dw.abss.ywtckglzxt']").each(function(){
					if($(this).val()==value){
						$(this).attr('checked','true');
					}
				});
			}
		}
	});
}

