/**
 * 选择社区
 */
function openSqxxSelectWin(flag)
{
	$.openDialogWindow({
		url : contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if (sqjbxxBean)
			{
				if("0" == flag){
					$("#sssqbh").val(sqjbxxBean.sqbh);
					$("#sssqmc").val(sqjbxxBean.sqmc);
				}else if("1" == flag){
					$("#sssqbh").val(sqjbxxBean.sqbh);
					$("#sssqmc").val(sqjbxxBean.sqmc);
					$("#ssxzqh").val(sqjbxxBean.ssxzqh);
					$("#ssxzqhmc").val(sqjbxxBean.ssxzqhmc);
					$("#ssjdxz").val(sqjbxxBean.ssjdxz);
					$("#ssjdxzmc").val(sqjbxxBean.ssjdxzmc);
				}
			}
		}
	});
}

/**
 * 打开网络社区界面
 * @param {} opertype 操作类型
 * @param {} wlsqbh 网络社区编号
 */
function openWlsqView(opertype,wlsqbh){
	var url = contextPath + "/zagl/wlsq/toWlsq.action?t=" + new Date().getTime() +
			"&wlsq.opertype=" + opertype;
	if(wlsqbh){
		url += "&wlsq.wlsqbh=" +  wlsqbh;
	}		
	$.openWindow({
		url : url,
		width : 900,
		height : 500,
		callback : function() {
			wlsqcx();
		}
	});
}

/**
 * 添加网络社区项目
 * @param {} button 触发事件的按钮
 * @param {} table_id 存放项目的table_id
 * @param {} nameAttr input标签中name属性
 * @param {} item_id 项目ID
 */
function addWlsqItem(button,table_id,nameAttr,item_id){
	var item_index = parseInt($(button).attr("id").split("_")[1]);
	if(item_index == 0){
		item_index = $("#" + table_id).find("tr").length - 2;
	}
	
	var sqwz = $("#"+item_id).clone();
	sqwz.find("input").each(function(index,obj){
		$(obj).attr("id",item_id+"_" + $(obj).attr("name") + "_" + item_index);
		
		var name = nameAttr + "["+item_index+"]." + $(obj).attr("name");
		$(obj).attr("name",name);
	});
	sqwz.find("input").removeAttr("disabled");
	sqwz.removeAttr("style");
	
	$("#" + table_id).append(sqwz);
	item_index = item_index + 1;
	$(button).attr("id",item_id + "_" +item_index);
}

/**
 * 删除网络社区项目
 * @param {} obj 需要删除的项目
 */
function deleteWlsqItem(obj){
	var td = obj.parentNode;
	var tr = td.parentNode;
	var table = tr.parentNode;
	table.removeChild(tr);
}

/**
 * 保存网络社区
 */
function saveWlsq(){
	var eventSrcObj = event.srcElement?$(event.srcElement):$(event.target);
	if ($.validateform("wlsqForm")) {
		eventSrcObj.attr("disabled","disabled");
		$("#wlsqForm").ajaxSubmit({
			type : "post",
			success : function(result) {
				if(result != null && result != "" && result != "null"){
					eval("var wlsq = "+result)
					$("#wlsqbh").val(wlsq.wlsqbh);
					alert("保存成功!");
				}else{
					alert("保存失败!");
				}
				eventSrcObj.removeAttr("disabled");
			}
		});
	}
}

/**
 * 删除网络社区
 * @param {} wlsqbh 网络社区编号
 */
function delWlsq(wlsqbh){
	var data = "";
	if(wlsqbh){
		data = wlsqbh;
	}else{
		var selecteds = $("#wlsqList").getSelected();
		if(selecteds.length < 1) {
			alert("请选择需要删除的记录!");
			return false;
		}else{
			$.each(selecteds, function(index, wlsq) {
				if(index < selecteds.length -1){
					data += wlsq.wlsqbh + ",";
				}else{
					data += wlsq.wlsqbh;
				}
			});
		}	
	}
	
	var check = confirm("确定删除记录?");
	if(check){
		var url = contextPath + "/zagl/wlsq/deleteWlsq.action?t=" + new Date().getTime() + "&wlsq.wlsqbh=" + data;
		$.ajax({
			url:url,
			type : "post",
			success:function(result){
				alert(eval(result));
				wlsqcx();
			}
		});
	}
}

/**
 * 网络社区查询
 */
function wlsqcx() {
	$("#wlsqList").query("F", "searchform");
}

$(function(){
	var opertype = $("#opertype").val();
	if(opertype == 'detail'){
		$("#wlsq_div").displayInputForText();
	}
});