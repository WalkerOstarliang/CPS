//保存  jszt 接收状态  0：退回  1：接收
function saveZdryqs(jszt){
	if(jszt == '0'){
		if($("#thyy").val() == "" || $("#thyy").val() == null){
			alert("请填写退回原因.");
			return;
		}
		$("#jszt").val("0");
	}else if(jszt == '1'){
		if($("#sssqdm").val() == "" || $("#sssqdm").val() == null){
			alert("请填写重点人员所属社区.");
			return;
		}
		$("#jszt").val("1");
	}
	
	if($("#jszt").val()){
		if($.validateform("zdryqsform")){
			$("#zdryqsform").ajaxSubmit({
				url : contextPath + "/zdry/zdryqs/zdryQs.action",
				type : "post",
				dataType : "json",
				success :function(errorCode){
					if(errorCode == -1 || errorCode == 2){
						alert("系统错误.")
					}
					if(errorCode == 0){
						alert("操作成功.");
						window.close();
					}
					if(errorCode == 1){
						alert("根据身份证在人口库找不到此人，请退回.");
					}
				}
			});
		}
	}
	
	
}

//社区选择
function openSqselectWin()
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if (sqjbxxBean)
			{
				//警务室
				$("#ssjwqdm").val(sqjbxxBean.gxsqjwsdm);
				$("#ssjwqmc").val(sqjbxxBean.gxsqjwsmc);
				
				//行政社区
				$("#sssqdm").val(sqjbxxBean.sqbh);
				$("#sssqmc").val(sqjbxxBean.sqmc);
			}
		}
	});
}