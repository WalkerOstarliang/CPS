//表单重置
function resetForm(){
	$("#sqkhcx_form").get(0).reset();
}

//报表查询
function bbcx(){
//	if($("#tjsj").val() == "" || $("#tjsjfw_hidden").val() == ""){
//		alert("请选择统计时间和时间段后再查询。");
//		return;
//	}
	$("#dataArea_panel").empty();
	ajaxLoadDwPageInfo("dataArea_panel");
}


/** 机构选择 **/
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode.substr(0,4) + "00000000",
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


///* 统计时间范围*/
//function changeTjsjfw(tjsjfw){
//	$("#tjsjfw_hidden").val(tjsjfw);
//}

//动态加载页面
function ajaxLoadDwPageInfo(id){
	var url = contextPath + "/xtgl/khkp/querySqkhtj.action?" + $("#sqkhcx_form").serialize();
	$.post(url,function(htmldata){
			$("#" + id).html(htmldata);
	});
}

$(function(){
	var cxpanel = $("#khkp_panel").height();
	var docheight = $(document).height();
	$("#dataArea_panel").height(docheight - cxpanel -20);
})

/*导出excel*/
function downLoadExcel(){
	if($("#dataArea_panel").text() == ""){
		alert("请先查询。")
	}else{
		$("#sqkhcx_form").attr("action",contextPath+"/xtgl/khkp/downLoadExcel.action");
		$("#sqkhcx_form").submit();
	}
}

/*统计级别改变*/
function tjjbChange(value){
	if(value=='5'){
		$("#text").text("警务区分类：");
		$("#jwqfl").show();
		$("#jwqfl").val("");
		$("#jwqfl").removeAttr("disabled");
		
		$("#pcsdj").hide();
		$("#pcsdj").val("");
		$("#pcsdj").attr("disabled","disabled");
	}else if(value=='4'){
		$("#text").text("派出所级别：");
		$("#pcsdj").show();
		$("#pcsdj").val("");
		$("#pcsdj").removeAttr("disabled");
		
		$("#jwqfl").hide();
		$("#jwqfl").val("");
		$("#jwqfl").attr("disabled","disabled");
	}else{
		$("#text").text(" ");
		
		$("#jwqfl").hide();
		$("#jwqfl").val("");
		$("#jwqfl").attr("disabled","disabled");
		
		$("#pcsdj").hide();
		$("#pcsdj").val("");
		$("#pcsdj").attr("disabled","disabled");
	}
}

$(function(){
	var date = new Date();
	var day = date.getDate();
	if(day <= 10){
		$("#jsjd").val(1);
	}else if(day >10 && day <= 20){
		$("#jsjd").val(2);
	}else{
		$("#jsjd").val(3);
	}
});
