//人员派发
function rypf(orgcode){
	if(orgcode == $("#gxdwdm").val()){
		alert("请选择下级单位.")
		return;
	}
	if($.validateform("pfxx_form")){
		$("#pfxx_form").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/zdrypf.action",
			type : "post",
			dataType : "json",
			success :function(){
				alert("派发成功.");
				window.close();
			}
		});
	}
}

//人员退回
function ryth(){
	$("#pfth_form").ajaxSubmit({
		url : contextPath + "/lsgl/zdry/zdryth.action",
		type : "post",
		dataType : "json",
		success :function(){
			alert("退回成功.");
			window.close();
		}
	});
}

//机构选择
function selectOrg(orgcode,leve , hiddenfield, showfield) {
	if (orgcode) {
		var code = "";
		if(leve == 2){
			code = orgcode.substring(0,4) + "00000000";
		}else if(leve == 3){
			code = orgcode.substring(0,6) + "000000";
		}
		openDwSelect2({
			rootOrgCode : code,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					if(orgbeans.id == orgcode){
						$("#" + hiddenfield).val("");
						$("#" + showfield).val("");
						alert("请选择下级单位.");
					}else{
						$("#" + hiddenfield).val(orgbeans.id);
						$("#" + showfield).val(orgbeans.name);
					}
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

//选择社区
function openSqxxSelectWin(hiddenid1,hiddenid2,showid1,showid2)
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
				$("#"+hiddenid2).val(sqjbxxBean.gxsqjwsdm);
				$("#"+showid1).val(sqjbxxBean.gxsqjwsmc);
				
				//行政社区
				$("#"+hiddenid1).val(sqjbxxBean.sqbh);
				$("#"+showid2).val(sqjbxxBean.sqmc);
			}
		}
	});
}
