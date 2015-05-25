/**
 * 打开保卫机构
 * @param {} url 地址
 * @param {} opertype 操作类型
 */
function openBwjg(url,opertype,pk){
	var jgbh = $("#jgbh").val();
	if(opertype != 'detail'){
		$.openDialogWindow({
			url : contextPath + "/zagl/dw/" + url + ".action",
			width:600,
			height:300,
			data : {"jgbh":jgbh,"operType":opertype,"dw.bwjg.bwjgbh":pk,
					"dw.bwzd.zdbh":pk,"dw.bwjys.jysbh":pk,"t": new Date().getTime()},
			callback : function(result){
				ajaxLoadDwPageInfo("toBwjgList");
			}
		});
	}else{
		$.openWindow({
			url : contextPath + "/zagl/dw/" + url + ".action",
			width:900,
			height:400,
			data : {"jgbh":jgbh,"operType":opertype,"dw.bwjg.bwjgbh":pk,
					"dw.bwzd.zdbh":pk,"dw.bwjys.jysbh":pk,"t": new Date().getTime()},
			callback : function(result){
			}
		});
	}
	
}
//删除保卫机构
function delBwjg(bwjgbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBwjg.action?dw.bwjg.bwjgbh=" + bwjgbh,
			type:"post",
			success:function(){
				ajaxLoadDwPageInfo('toBwjgList');
				alert("删除成功!");
			}
		});
	}
}

//删除保卫制度
function delBwzd(zdbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBwzd.action?dw.bwzd.zdbh=" + zdbh,
			type:"post",
			success:function(){
				ajaxLoadDwPageInfo('toBwjgList');
				alert("删除成功!");
			}
		});
	}
}

//删除保卫建议书
function delBwjys(jysbh){
	if(window.confirm("确认删除？")){
		$.ajax({
			url:contextPath + "/zagl/dw/delBwjys.action?dw.bwjys.jysbh=" + jysbh,
			type:"post",
			success:function(){
				ajaxLoadDwPageInfo('toBwjgList');
				alert("删除成功!");
			}
		});
	}
}