/* 机构选择 */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

/* 预警信息查询 */
function queryYjxx() {
	$("#ckyjxxList").query("F", "ckyjQueryForm");
}

//查看常控预警详情
function openCjyjDetail(yjxxbh){
	$.openWindow({
		url : contextPath + "/zdry/ckyj/toYjxxDetailPage.action?yjxxbh=" 
				+ yjxxbh + "&t=" + new Date().getTime(),
		width:900,
		height:500
	});
}

//打开预警签收界面
function openYjqsPage(yjxxbh,operType){
	$.openWindow({
		url : contextPath + "/zdry/ckyj/toYjqsPage.action?yjxxbh=" 
				+ yjxxbh + "&operType=" + operType + "&t=" + new Date().getTime(),
		width:900,
		height:530
	});
}

//预警签收
function yjqs(){
	$("#yjqsForm").ajaxSubmit({
		type : "post",
		url : contextPath + "/zdry/ckyj/yjqs.action?t=" + new Date().getTime(),
		dataType : "json",
		success : function(result)
		{
			if(result == null){
				alert("签收失败!");
			}else{
				$("#id").val(result.yjqs.id);
				$("#ldxxbh").val(result.yjqs.ldxxbh);
				$("#yjxxbh").val(result.yjqs.yjxxbh);
				$("#qs_button").hide();
				alert("签收成功！");
			}
		}
	});
}

//打开预警签收反馈信息页面
function openYjqsfk(yjxxbh){
	$.openWindow({
		url : contextPath + "/zdry/ckyj/toYjqsfkPage.action?yjxxbh=" 
				+ yjxxbh + "&t=" + new Date().getTime(),
		width:900,
		height:700
	});
}

//打开反馈信息页面
function openFkxx(id,yjxxbh,operType){
	$.openWindow({
		url : contextPath + "/zdry/ckyj/toFkInfoPage.action?ckxx.yjfk.id=" 
				+ id + "&yjxxbh=" + yjxxbh + "&operType=" + operType + "&t=" + new Date().getTime(),
		width:950,
		height:750
//		callback : function(){
//			window.location.reload();
//		}
	});
}

//机构人员选择
function orgUserSelect(orgcode, hidden, show) 
{
	if (orgcode) {
		openDwRySelect({
			rootOrgCode : orgcode,
			mutilSelect : false
		}, function(userbean) {
			if (userbean != null) {
				$("#" + hidden).val(userbean.sfzh);
				$("#" + show).val(userbean.realname);
			}
		});

	} else {
		alert("无效的机构代码");
	}
}

//机构选择
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect({
			rootOrgCode : orgcode,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

//保存反馈信息
function saveFkxx(){
	//获取事件源
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("fkxxForm")){
		eventSrcObj.attr("disabled","disabled");
		$("#fkxxForm").ajaxSubmit({
			type : "post",
			url : contextPath + "/zdry/ckyj/saveFkxx.action?t=" + new Date().getTime(),
			dataType : "json",
			success : function(result)
			{
				if(result == null){
					alert("保存失败!");
					eventSrcObj.removeAttr("disabled");
				}else{
					$("#id").val(result.yjfk.id);
					$("#ldxxbh").val(result.yjfk.ldxxbh);
					$("#yjxxbh").val(result.yjfk.yjxxbh);
					$("#czfkxxbh").val(result.yjfk.czfkxxbh);
					alert("保存成功!");
					window.location.reload();
				}
			}
		});
	}
}

//重置查询表单
function resetForm(id){
	$("#" + id).get(0).reset();
}

function fullYjfkForm(trObj,data){
	if(data){
		$.each(data,function(key,value){
			$("#" + key).val(value);
		});
	}
}

$(function(){
	var operType = $("#operType").val();
	if(operType == 'detail'){
		$("#yjqs_div").displayInputForText();
		$("#fkxx_div").displayInputForText();
	}
})

