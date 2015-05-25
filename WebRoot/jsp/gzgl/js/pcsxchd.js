//保存派出所宣传活动
function savePcsXcHd(){
	if($.validateform("pcsxchdform")){
		$("#saveButton").attr("disabled","disabled");
		$("#pcsxchdform").ajaxSubmit({
			type:"post",
			dataType : "json",
			url : contextPath + "/gzgl/pcsxchd/savePcsXcHd.action?t="+new Date().getTime(),
			success : function(result) {
				if(result){
					$("#id").val(result.id);
					$("#imgButton").show();
					alert("保存成功.")
				}else{
					alert("保存失败.")
				}
				$("#saveButton").removeAttr("disabled");
			}
		});
	}
}



var index = null;
$(function(){
	var button = $('#imgButton');
	var fileUp =  new AjaxUpload(button, {
			action: contextPath + "/gzgl/pcsxchd/saveHdzp.action", 
			name: 'xchd.zpList[0].zp',
			responseType: "json",
			autoSubmit : true,
			onSubmit : function(file, ext){
				var param = {"xchd.zpList[0].hdid" : $("#id").val()};
				fileUp.setData(param);
				if(ext && (/^(jpg|png|jpeg|gif|bmp)$/.test(ext) || /^(JPG|PNG|JPEG|GIF|BMP)$/.test(ext)))
				{
					index = layer.load(0);
					return true;
				}
				else
				{
					alert("只能上传格式为*.jpg;*.png;*.gif;*.jpeg;*.bmp的图片.");
					return false;
				}
			},
			onComplete: function(file, zpId)
			{
				if (zpId)
		    	{
	    			$("#xyzpdiv").append("<span zpid=\""+ zpId + "\" style=\"margin:2px;cursor: pointer;\"></span>");
	    			$("#xyzpdiv").find("span[zpid='" + zpId + "']").first().append("<img width=\"145\" height=\"170\" src=\"" + contextPath + "/gzgl/pcsxchd/showHdZp.action?zpid=" +zpId + "\"/>");
	    			$("#xyzpdiv").find("span[zpid='" + zpId + "']").first().bind("dblclick",function(){
	    				deleteHdZp(this,zpId);
	    			});
		    	}
		    	layer.close(index);  
			}
		});
});

function deleteHdZp(obj,zpid)
{
	if (confirm("删除照片后将无法找回，你确定要删除吗？"))
	{
		$.ajax({
			url : contextPath + "/gzgl/pcsxchd/deleteZpById.action",
			data : {
				"zpid" : zpid
			},
			dataType : "json",
			success : function(result) 
			{
				if (result == true)
				{
					$(obj).remove();
				}
				else
				{
					alert("删除照片失败,请稍后再试.");
				}
				
			}
		});
	}
}
