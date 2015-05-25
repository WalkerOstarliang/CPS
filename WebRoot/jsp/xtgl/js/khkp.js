/**
 * 排名查询
 */
function khkpcx() {
//	if($("#tjsj").val() == "" || $("#tjsjfw_hidden").val() == ""){
//		alert("请选择统计时间和时间段后再查询。");
//		return;
//	}
	var tjlx = $("#tjlb").val();
	$("#dataArea_div").empty();
	ajaxLoadDwPageInfo(tjlx);
}

/**
 * 重置表单
 */
function resetForm(){
	$("#khcx_form").get(0).reset();
}

/** 机构选择* */
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

///**
// * 统计时间范围
// * @param {} tjsjfw
// */
//function changeTjsjfw(tjsjfw){
//	$("#tjsjfw_hidden").val(tjsjfw);
//}
//
//function changeTjlb(tjlb){
//	$("#tjlb_hidden").val(tjlb);
//}


$(function(){
	getDataAreaHeight()
});

//计算数据区域高度
function getDataAreaHeight(){
	var total = $(document).height();
	var cxpanel = $("#khkp_panel").height();
	$("#dataArea_div").height(total - cxpanel -20);
}

//动态加载页面
function ajaxLoadDwPageInfo(tjlx){
	var url = "";
	if(tjlx == "01"){
		url = contextPath + "/xtgl/khkp/queryKhkpDl.action?" + $("#khcx_form").serialize();
	}else if(tjlx == "02"){
		url = contextPath + "/xtgl/khkp/queryKhkpXl.action?" + $("#khcx_form").serialize();
	}
	
	$.post(url,function(htmldata){
			$("#dataArea_div").html(htmldata);
	});
}

//打开扣分详情
function openKfxq(fs,khlx,orgcode)
{	
	var tjyf = $("#param_tjyf").val().replace("-","");
	var tjjd = $("#param_tjjd").val();
	
	$.openWindow({
		url : contextPath + "/xtgl/khkpkfx/createMs.action?t="+new Date().getTime()+"&param.orgcode=" + orgcode 
	    			+ "&param.khlx=" + khlx + "&param.tjyf=" + tjyf + "&param.tjjd=" + tjjd + "&fs=" + fs,
		width:900,
		height:650
	});
	
	/*$.layer({
	    type : 2,
	    title : "分数：<font color='red'>" + fs + "</font>",
	    iframe : {src : contextPath + "/xtgl/khkpkfx/createMs.action?param.orgcode=" + orgcode 
	    			+ "&param.khlx=" + khlx + "&param.tjyf=" + tjyf + "&param.tjjd=" + tjjd},
	    area : ['700px','500px'],
		offset : ['20px',''],
		border :[5,0.3,'#869fe2',true],
		bgcolor : '#869fe2'
	});*/
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
		$("#text").text("派出所分类：");
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

/*自动选择统计时间*/
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

/*下载考核统计排名Excel*/
function downloadKhtjpmExcel(){
	$("#khcx_form").attr("action",contextPath + "/xtgl/khkp/downloadKhtjpm.action");
	$("#khcx_form").submit();
}

