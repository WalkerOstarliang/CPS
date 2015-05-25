function saveCyryBean()
{
	$("#savebtn").attr("disabled","disabled");
	var fknr = $("#fknr").val();
	if (fknr != null && fknr !="")
	{
		$("#cyryform").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveCyryfkxx.action",
			success : function(result){
				if (result == "true")
				{
					alert("信息反馈成功.");
					parent.closeLayer();
					parent.window.close();
				}
				else
				{
					alert("信息反馈失败，请重新再试.")
				}
				$("#savebtn").removeAttr("disabled");
			}
		})
	}
	else
	{
		$("#savebtn").removeAttr("disabled");
	}
}