/**
 * 列表查询
 */
function searchInfo(){
	$("#queryResultList").query("F","dwjczQuery");
}

/**
 * 打开编辑窗口
 * id为空新增数据，不为空编辑数据
 */
function openEditWin(opertype , id){
	var	url = contextPath + "/xtgl/dwjcpz/toDwjcpz.action?t=" + new Date().getTime();
	if(opertype){
		url += "&dwjcpz.opertype=" + opertype;
	}
	if(id){
		url += "&dwjcpz.id=" + id;
	}
	$.openDialogWindow({
		url : url,
		width : 800,
		height : 300,
		callback : function(){
			if(opertype != "detail"){
				searchInfo();
			}
		}
	});
}

/**
 * 删除
 * @param ids id
 * id不为空 删除指定数据   id为空删除选择的数据
 */
function del(ids){
	var idList;
	if(ids){
		idList = ids;
	}else{
		idList = "";
		var selectObj = $("#queryResultList").getSelected();
		$.each(selectObj,function(index,dwjcpz){
			if(index < selectObj.length - 1){
				idList += dwjcpz.id + ",";
			}else{
				idList += dwjcpz.id;
			}
		});
	}
	if(idList){
		var verify = confirm("确认删除数据?");
		if(verify){
			$.ajax({
				type : "post",
				url :  contextPath + "/xtgl/dwjcpz/deleteDwjcpz.action?dwjcpz.id=" + idList,
				success : function(result){
					searchInfo();
				}
			});
		}	
	}else{
		alert("请选择需要删除的数据!");
	}
}

/**
 * 保存单位检查
 */
function saveInfo(){
	if($.validateform("dwjcpzpz_form")){
		$("#dwjcpzpz_form").ajaxSubmit({
			type : "post",
			success : function(result) {
				if(result != "" && result != "null" && result != null){
					alert("保存成功!");
				}
			}
		});
	}
}


function hylbChange(){
	var hylb = $("#hylb").val();
	var tdLabel = $("#tdLabel");
	$("#dwxl").val("");
	if(hylb == '01'){
		tdLabel.text("特行类别：");
		$("#dwdl").attr("zdlb","ZAGL_THLB");
		$("#dwxl").attr("zdlb","ZAGL_THLB");
		$("#dwdl").doubleDicSelect();
	}else if(hylb == '02'){
		tdLabel.text("场所类别：");
		$("#dwdl").attr("zdlb","GGCSLB");
		$("#dwxl").attr("zdlb","GGCSLB");
		$("#dwdl").doubleDicSelect();
	}else if(hylb == '03'){
		tdLabel.text("单位分类：");
		$("#dwdl").attr("zdlb","ZDY_DWFL");
		$("#dwxl").attr("zdlb","ZDY_DWFL");
		$("#dwdl").doubleDicSelect();
	}else{
		tdLabel.text("单位分类：");
		$("#dwdl").attr("zdlb","0");
		$("#dwxl").attr("zdlb","0");
		$("#dwdl").doubleDicSelect();
	}
}

function dwjcpzCallback(tr,data){
	var html = "";
	html += "<span class=\"cps_span_href\" onclick=\"openEditWin('update','"+data.id+"')\">修改</span>";
	html += "&nbsp;|&nbsp;";
	html += "<span class=\"cps_span_href\" onclick=\"openEditWin('detail','"+data.id+"')\">详情</span>";
	return html;
}

$(function(){
	if($("#opertype").val() == 'detail'){
		$("#dwjcpz_div").displayInputForText();
	}
});