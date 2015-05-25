$(function(){
	$("#sfzh").keyup(function(){
		var sfzh = $(this).val();
		if(sfzh && (sfzh.length == 18 || sfzh.length ==
		 15)){
			ajaxLoadInfo(sfzh);
		}else{
			clearSqTab();
		}
	});
	init();
});

/**
申请提交
*/
function applicationSubmit(){
	$("#applicationForm").ajaxSubmit({
		url:  contextPath + '/zdry/collect_insertLksqlzxx.action',
		type: 'post',
		success: function(data){
			if(data==false){
				alert("该人员已经列控，请勿重复列控!!");
				return ;
			}
			alert('操作成功!!!');
			//设置值传给父窗体
			$.setResultValue(data)
			closeWind();
		}
	});
}

/**
审批提交 
*/
function approvalFormSubmit(){
	$("#approvalForm").ajaxSubmit({
		url:  contextPath + '/zdry/collect_pcsApproval.action',
		type: 'POST',
		success: function(data){
			if(data==false || data == 'false'){
				alert("操作失败，请重试!!");
				return ;
			}
			alert('操作成功!!!');
			//设置值传给父窗体
			$.setResultValue(data)
			closeWind();
		}
	});
}

function ckApprovalFormSubmit(){
	$("#approvalForm").ajaxSubmit({
		url:  contextPath + '/zdry/collect_ckPcsApproval.action',
		type: 'POST',
		success: function(data){
			if(data==false || data == 'false'){
				alert("操作失败，请重试!!");
				return ;
			}
			alert('操作成功!!!');
			//设置值传给父窗体
			$.setResultValue(data)
			closeWind();
		}
	});
}

//撤控提交
function takeControlFormSubmit(){
	$("#approvalForm").ajaxSubmit({
		url:  contextPath + '/zdry/collect_takeControl.action',
		type: 'POST',
		success: function(data){
			if(data==false || data == 'false'){
				alert("操作失败，请重试!!");
				return ;
			}
			alert('操作成功!!!');
			//设置值传给父窗体
			$.setResultValue(data)
			closeWind();
		}
	});
}

function opendwselecttree(rootOrgCode)
{
	openDwSelect({
		rootOrgCode : rootOrgCode,
     		mutilSelect : false,
      		nodeSelectedType : "ps",
      		nodeNotSelectedType : "ps"
	},function(orgbeans){
		if(orgbeans){
			$("#jbshdwdm").val(orgbeans.id);
			$("#jbshdwmc").val(orgbeans.name);
		}
	});
}

function init(){
	setYear();
	setMonth();
	setDay();
	var date = new Date();
	var year = date.getYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	$("#jbsj").val(year+"-"+month+"-"+day);
}

function setYear(){
	var initYear = 1900;
	var newYear = (new Date()).getYear(); 
	var count = newYear-initYear;
	for(var i=newYear; i >= initYear; i--){
		$("select[id$=year]").append("<option value="+i+">"+i+"</option>");
	}
}

function setMonth(){
	var newMonth = (new Date()).getMonth()+1; 
	var _month = $("select[id$=month]");
	for(var i=1; i <= 12; i++){
		_month.append("<option value="+i+">"+i+"</option>");
	}
	_month.attr("value",newMonth);
}

function setDay(){
	var newDay = (new Date()).getDate(); 
	var _day = $("select[id$=day]");
	for(var i=1; i <= 31; i++){
		_day.append("<option value="+i+">"+i+"</option>");
	}
	_day.attr("value",newDay);
}

function clearSqTab(){
	$("#xm").val("");
	$("#xb").attr("value","");
	$("#jtzz").val("");
}

function ajaxLoadInfo(sfzh){
	$.ajax({
		url			:contextPath + "/zdry/collect_loadLksqlzxxInfo.action", 
		dataType	:"json", 
		type		:"post", 
		data		:"sfzh="+sfzh, 
		beforeSend	:function (XMLHttpRequest) {
			//loadingImg(_ei);
		}, success	:function (json) {
			if(json==false){
				alert("该人员已经列控，请勿重复列控!!");
				$("#xm").val("");
				$("#xb").attr("value","");
				$("#jtzz").val("");
			}else{
				if(json && json != null){
					$("#xm").val(json.xm);
					$("#xb").attr("value",json.xb);
					$("#jtzz").val(json.zzxz);
				}
			}
		}, error	:function (XMLHttpRequest, textStatus, errorThrown) {
		
		}
	});
}


function closeWind(){
	this.window.close();
}

/*******************************数据验证*****************************************/