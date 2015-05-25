//保存安全检查
function saveAqjc(){
	if ($.validateform("aqjcForm")) {
		$("#savebutton").attr("disabled","disabled");
		$("#aqjcForm").ajaxSubmit({
			type:"post",
			dataType : "json",
			url : contextPath + "/nbdwaqjc/saveAqjc.action?t="+new Date().getTime(),
			success : function(result) {
				if(result){
					$("#aqjc_id").val(result.id);
					$("button[id^='zpsc_']").show();
					$("#aqjclist").query("F", "queryform");
					
					$("#xczprow").show();
					$("#yhzprow").show();
					alert("保存成功.");
					$("#savebutton").removeAttr("disabled");
				}else{
					alert("保存失败.");
					$("#savebutton").removeAttr("disabled");
				}
			}
		});
	}
}

/**
 * 机构人员选择
 * 
 * @param {}
 *            orgcode
 * @param {}
 *            hidden
 * @param {}
 *            show
 */
function orgUserSelect(orgcode, hidden, show) 
{
	if (orgcode) {
		openDwRySelect({
			rootOrgCode : orgcode,
			mutilSelect : false
		}, function(userbean) {
			if (userbean != null) {
				$("#" + hidden).val(userbean.username);
				$("#" + show).val(userbean.realname);
			}
		});

	} else {
		alert("无效的机构代码");
	}
}

function tozpxxPage(v_yydd){
	var yhdd=v_yydd;
	var aqjcid=$("#aqjc_id").val();
	var url = contextPath + "/nbdwaqjc/toShowNbAJZpPagebyAjid.action?nbAjZpBean.aqjcid="+aqjcid+
				"&nbAjZpBean.yhdd="+yhdd + "&nbAjZpBean.jgbh=" + $("#jgbh").val() + "&nbAjZpBean.dwlb=" + $("#dwlb").val();
	$.openWindow({
			url:url,
			width:500,
			height:500
		})
}

$(function(){
	var dwjcid = $("#aqjc_id").val();
	if(dwjcid){
		$("button[id^='zpsc_']").show();
		$("#xczprow").show();
		$("#yhzprow").show();
	}else{
		$("button[id^='zpsc_']").hide();
		$("#xczprow").hide();
		$("#yhzprow").hide();
	}
});


function rowclick(trobj,data){
	var id = data.id;
	var dwlb = data.dwlb;
	window.location.href = contextPath + "/nbdwaqjc/toAqjcPage.action?aqjc.id=" + id 
						 + "&operType=update" + "&dwlb=" + dwlb;
}

function resetform(){
	var id = $("#jgbh").val();
	var dwlb = $("#dwlb").val();
	
	window.location.href = contextPath + "/nbdwaqjc/toAqjcPage.action?jgbh=" 
						+ $("#jgbh").val() + "&dwmc=" + encodeURIComponent($("#dwmc").val()) + "&dwlb=" + dwlb
						+ "&operType=add";
}