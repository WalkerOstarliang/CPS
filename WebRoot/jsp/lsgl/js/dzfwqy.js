function dzfwqyupdate(operType,fwid){
	if(confirm("确认要迁移合并至该房屋吗?")){
	  // alert($("#oldfwid").val());
		$.ajax({
			url:contextPath +"/lsgl/fw/dzfwqyupdate.action",
			type:"post",
			dataType:"json",
			data:{
				"fwdzqyBean.fwid":fwid,
				"fwdzqyBean.oldfwid":$("#oldfwid").val()
			},
			success:function(msg){
				if(msg){
					alert("迁移合并成功.")
				}else{
					alert("迁移失败.");
				}
			}
		})
	}
}