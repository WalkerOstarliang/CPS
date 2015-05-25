/**
 * 选择单位
 */
 function openDwSelect()
{
	$.openDialogWindow({
		url : contextPath + "/zagl/dw/toDwselect.action?isdblclick=true&t=" + new Date().getTime(),
		width : 1000,
		height : 700,
		callback : function(dwBean) 
		{
			if (dwBean != null)
			{
				$("#dwmc").val(dwBean.dwmc);
				$("#dwdz").val(dwBean.dwdz);
			}
		}
	});
}

/*根据身份查询人员信息*/
function queryRyBysfz(sfzh,xmId,lxfsId){
	if(sfzh){
		queryRkBean(sfzh, function(czrkxxBean) {
			if (czrkxxBean != null) 
			{
				$("#"+xmId).val(czrkxxBean.xm);
				$("#"+lxfsId).val(czrkxxBean.lxdh);
			}
		});
	}
}

/**
 * 保存电动车
 */
function saveDdcInfo(){
		if ($.validateform("ddcform")) {
			$("#ddcform").ajaxSubmit({
				type:"post",
				dataType : "json",
				url : contextPath + "/zagl/ddccj/saveDdc.action?t="+new Date().getTime(),
				success : function(result) {
					if(result != null){
						$("#ddcid").val(result.ddcid);
						alert("保存成功!");
					}else{
						alert("保存失败.");
					}
				}
			});
			
		}
}

$(function(){
	if($("#opertype").val() == "detail"){
		$("#ddc_div").displayInputForText();
	}
});