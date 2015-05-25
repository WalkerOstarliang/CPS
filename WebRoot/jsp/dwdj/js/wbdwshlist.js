//查询危爆单位审核列表
function queryWbdwshList(){
	$("#wbdwshList").query("F","wbdwShQuery");
}

//打开审核信息
function openWbdwShWin(shid){
	var url = contextPath + "/sydw/wbdwgl/toWbdwShInfoPage.action";
	$.openWindow({
		url:url,
		data:{"wbdwshQuery.id":shid},
		width:"500px",
		height:"350px"
	});
}

//单位详情
function openDwDetail(jgbh)
{
	$.openWindow({
		name : "dwwin",
		url : contextPath + "/sydw/dwgl/toDwInfoPage.action",
		data : {
			"operType" : "detail",
			"queryBean.jgbh" :  jgbh
		},
		width:1000,
		height:700
	})
}

//危爆单位审核
function wbdwSh(shzt){
	$("#shzt").val(shzt);
	if(confirm("确认操作?")){
		$("#wbdwShForm").ajaxSubmit({
			type : "post",
			url : contextPath + "/sydw/wbdwgl/wbdwSh.action",
			dataType : "json",
			success:function(result){
				if(result == true){
					alert("审核成功.");
					$("#shButon1").hide();
					$("#shButon2").hide();
				}
			}
		});
	}
}