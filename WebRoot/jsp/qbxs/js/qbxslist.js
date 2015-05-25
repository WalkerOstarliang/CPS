function qbxsQuery(){
	$("#qbxslist").query("F","queryform");
}

/**
 * 打开情报线索页面
 */
function openQbxsWin(operType,id){
	var url = contextPath + "/qbxs/toQbxsxx.action?operType=" + operType ;
	if(id){
		url += "&qbxs.id=" + id;
	}
	$.openWindow({
		url : url + "&t=" + new Date().getTime(),
		width:950,
		height:650,
		callback : function(resultObj)
		{
			qbxsQuery();
		}
	});
}

/**
 * 打开情报线索续报
 */
function openQbxsXbWin(operType,yldxxbh,bgcx){
	$.openWindow({
		url : contextPath + "/qbxs/toQbxsxx.action?operType=" + operType + "&qbxs.yldxxbh=" + yldxxbh + "&qbxs.bgcx=" + bgcx + "&t=" + new Date().getTime(),
		width:900,
		height:650,
		callback : function(resultObj)
		{
			qbxsQuery();
		}
	});
}

/**
*保存情报线索干部信息
*/
function saveQbxsGgxx(){
	if($.validateform("qbxsform")){
		$("#qbxsform").ajaxSubmit({
			type : "post",
			url : contextPath + "/qbxs/saveQbxsGgxxBean.action?t=" + new Date().getTime(),
			dataType : "json",
			success : function(msg){
				if(msg){
					alert("保存成功!");
					window.close();
				}else{
					alert("保存失败!");
				}
			}
		});
	}	
}

function  loadRkxxBean(sfzh){
	queryRkBean(sfzh,function(rkJbxxBean){
		if(rkJbxxBean!=null)
		{
			$("#xm").val(rkJbxxBean["xm"]);
			$("#xb").val(rkJbxxBean["xb"]);
			var inputxb =$("#xb").attr("inputid");
			if(inputxb != undefined && inputxb!= null && inputxb!=''){
				var text = $("#xb").find("option:selected").text();
			    $("#"+inputxb).val(text);
			}
			$("#csrq").val(rkJbxxBean["csrq"]);
			$("#gj").val(rkJbxxBean["gj"]);
			$("#bmhch").val(rkJbxxBean["bmch"]);
			$("#mz").val(rkJbxxBean["mz"]);
			$("#hjd").val(rkJbxxBean["hjdqh"]);
			$("#hjdqhmc").val(rkJbxxBean["hjdqhmc"]);
			$("#xzd").val(rkJbxxBean["xzzqh"]);
			$("#xzdmc").val(rkJbxxBean["xzzqhms"]);
			$("#sjhm").val(rkJbxxBean["lxdh"]);
			$("#xzdxz").val(rkJbxxBean["xzzxz"]);
		}
		else
		{
			alert("未找到人员信息");
		}
	});
}