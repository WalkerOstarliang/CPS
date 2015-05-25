/**
 * 保存保卫机构
 */
function saveBwjg(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if($.validateform("bwjg_from")){
		eventSrcObj.attr("disabled","disabled")
		$("#bwjg_from").ajaxSubmit({
			type : "post",
			url : contextPath + "/zagl/dw/saveBwjg.action",
			dataType : "json",
			success : function(result){
				if(result){
					$("#bwjgbh").val(result.bwjg.bwjgbh);
					alert("保存成功!");
				}else{
					alert("保存失败.")
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}


function queryRyBysfz(sfzh,xmId,lxfsId){
	if(sfzh){
		queryRkJbxxBeanBySfzh(sfzh, function(rkJbxxBean) {
			if (rkJbxxBean != null) {
				$("#"+xmId).val(rkJbxxBean.xm);
				$("#"+lxfsId).val(rkJbxxBean.lxdh);
			} else {
				queryRemoteRyxxBean(sfzh, function(czrkBean) {
					if (czrkBean != null) {
						$("#"+xmId).val(czrkBean.xm);
						$("#"+lxfsId).val(czrkBean.lxdh);
					}
				});
			}
		});
	}
}

$(function(){
	if($("#opertype").val() == 'detail'){
		$("#bwjg_div").displayInputForText();
	}
});