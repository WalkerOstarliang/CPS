/**
 * 列表查询
 */
function queryList(){
	$("#queryFwjcpzList").query("F","fwjcpzQueryForm");
}

/**
 * 打开编辑窗口
 */
function openFwjcWin(operType,id){
	$.openDialogWindow({
		url:contextPath+"/xtgl/fwjcpz/toFwjcpzInfo.action",
		data:{"operType":operType,"fwjcpzBean.id":id,t:new Date().getTime()},
		width:800,
		height:300,
		callback : function(){
			if(operType != "detail"){
				queryList();
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
		var selectObj = $("#queryFwjcpzList").getSelected();
		$.each(selectObj,function(index,fwjcpzBean){
			if(index < selectObj.length - 1){
				idList += fwjcpzBean.id + ",";
			}else{
				idList += fwjcpzBean.id;
			}
		});
	}
	if(idList){
		var verify = confirm("确认删除数据?");
		if(verify){
			$.ajax({
				type : "post",
				url :  contextPath + "/xtgl/fwjcpz/batchDelFwjcpzBean.action?fwjcpzBean.id=" + idList,
				success : function(result){
					queryList();
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
	var fwzdlb= $("#fwzdlb").val();
	alert(fwzdlb);
	var operType = $("#operType").val();
	if(operType=='add'){
		if($.validateform("fwjcpzpz_form")){
			$.ajax({
				type:"post",
				url:contextPath+"/xtgl/fwjcpz/isExistPzdm.action",
				data:{"fwjcpzBean.fwzdlb":fwzdlb},
				dataType:"json",
				success:function(msg){
					if(msg){
						alert("该房屋重点类别已经配置，请查询！");
						return ;
					}else{
						$("#fwjcpzpz_form").ajaxSubmit({
							url:contextPath+"/xtgl/fwjcpz/saveFwjcpzBean.action",
							type:"post",
							dataType:"json",
							success : function(result) {
								if(result){
									alert("保存成功!");
									window.close();
								}else{
									alert("操作错误，请重试！");
								}
							}
						});
					}
				}
			});
		}
	}else{
		$("#fwjcpzpz_form").ajaxSubmit({
			url:contextPath+"/xtgl/fwjcpz/saveFwjcpzBean.action",
			type:"post",
			dataType:"json",
			success : function(result) {
				if(result != "" && result != "null" && result != null){
					alert("保存成功!");
					window.close();
				}else{
					alert("操作错误，请重试！");
				}
			}
		});
	}
}


function fwjcpzCallback(tr,data){
	var html = "";
	html += "<span class=\"cps_span_href\" onclick=\"openFwjcWin('update','"+data.id+"')\">修改</span>";
	html += "&nbsp;|&nbsp;";
	html += "<span class=\"cps_span_href\" onclick=\"openFwjcWin('detail','"+data.id+"')\">详情</span>";
	return html;
}

$(function(){
	if($("#operType").val() == 'detail'){
		$("#fwjcpz_div").displayInputForText();
	}
});