//人员托管
function rytg(){
	if($.validateform("tgxx_form")){
		$("#tgxx_form").ajaxSubmit({
			url : contextPath + "/lsgl/zdry/rytg.action",
			type : "post",
			dataType : "json",
			success :function(bean){
				if(bean != null){
					alert("托管成功.");
					window.close();
				}else{
					alert("托管失败!");
				}
			}
		});
	}
}

//选择社区
function openSqxxSelectWin(usercode,hiddenid1,hiddenid2,showid1,showid2)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqjbgl/toSqListSelectWin.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if (sqjbxxBean)
			{
				if(usercode == sqjbxxBean.gxsqjwsdm.substr(0,8) + '0000'){
					alert("同派出所内不能托管.");
					return;
				}else{
					//警务室
					$("#"+hiddenid2).val(sqjbxxBean.gxsqjwsdm);
					$("#"+showid1).val(sqjbxxBean.gxsqjwsmc);
					
					//行政社区
					$("#"+hiddenid1).val(sqjbxxBean.sqbh);
					$("#"+showid2).val(sqjbxxBean.sqmc);
				}
			}
		}
	});
}