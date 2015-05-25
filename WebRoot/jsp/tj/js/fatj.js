/** 
** 统计查询
**/
function tjcx(){
	$("#fatj_form").removeAttr("target");
	$("#fatj_form").removeAttr("method");
	$("#fatj_form").removeAttr("action");

	$("#dataArea_div").empty();
	ajaxLoadTjPageInfo();
}

function expFatj(){
	$("#fatj_form").attr("target","exportiframe");
	$("#fatj_form").attr("method","post");
	$("#fatj_form").attr("action",contextPath + "/lsgl/jzzxx/expFatj.action");
	$("#fatj_form").submit();
}

function ajaxLoadTjPageInfo(){
	var url = "";
	url = contextPath + "/lsgl/jzzxx/queryFatjBean.action?" + $("#fatj_form").serialize();
	$.post(url,function(htmldata){
		$("#dataArea_div").html(htmldata);
	});
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

//$(function(){
//	getDataAreaHeight()
//});

//计算数据区域高度
function getDataAreaHeight(){
	var total = $(document).height();
	var cxpanel = $("#fatj_panel").height();
	$("#dataArea_div").height(total - cxpanel -20);
}

/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield,leve) {
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
					$("#" + leve).val(orgbeans.leve);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}
