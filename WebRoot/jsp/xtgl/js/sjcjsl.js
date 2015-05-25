/** 机构选择* */
function selectOrg(orgcode, dm, mc,leve) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode.substr(0,4) + "00000000",
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + dm).val(orgbeans.id);
					$("#" + mc).val(orgbeans.name);
					$("#" + leve).val(orgbeans.leve);
				}
			});
	} else {
		alert("无效的机构代码")
	}
}

function query() {
	if($.validateform("cjsjcx")){
		$("#sjcjslList").query("F", "cjsjcx");
	}
}

/**
 * 导出本月数据采集数量
 */
function downLoadSjcssl(){
	$("#cjsjcx").attr("action",contextPath+"/xtgl/khkp/downloadCjsl.action");
	$("#cjsjcx").submit();
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