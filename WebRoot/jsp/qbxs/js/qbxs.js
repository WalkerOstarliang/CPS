/**
 * 保存情报线索
 */
function saveQbxs(){
	if($.validateform("qbxs_form")){
		$("#qbxs_form").ajaxSubmit({
			type : "post",
			url : contextPath + "/qbxs/saveQbxsxx.action?t=" + new Date().getTime(),
			dataType : "json",
			success : function(qbxs){
				if(qbxs == null){
					alert("保存失败!");
				}else{
					$("#id").val(qbxs.id);
					$("#ldxxbh").val(qbxs.ldxxbh);
					$("#sjid").val(qbxs.id);
					$("#yldxxbh").val(qbxs.yldxxbh);
					alert("保存成功!");
				}
			}
		});
	}	
}

/**
 * 行政区划选择
 */
function xzqhSelect(showId,hiddenId){
	openXzqhTree({
		rootOrgCode : 0,
        mutilSelect : false,
        isAsyn : true,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(xzqhBean){
		$("#" + showId).val(xzqhBean.name);
		$("#" + hiddenId).val(xzqhBean.id);
	})
}

/**
 * 发生状态改变
 */

var sasfsdsxq;
var sasfsdsxqmc;
function fsztChange(value){
	if(value=="1"){
		$("#sasfsdsxq").val(sasfsdsxq);
		$("#fsdssssmc").val(sasfsdsxqmc);
		
		$("#fssj").removeAttr("disabled");
		$("#asjfsdlb").removeAttr("disabled");
		$("#sasfsdsxq").removeAttr("disabled");
		$("#fsdssssmc").removeAttr("disabled");
		$("#fsdxz").removeAttr("disabled");
	}else{
		$("#fssj").attr("disabled","disabled");
		$("#asjfsdlb").attr("disabled","disabled");
		$("#sasfsdsxq").attr("disabled","disabled");
		$("#fsdssssmc").attr("disabled","disabled");
		$("#fsdxz").attr("disabled","disabled");
		
		$("#fssj").val("");
		$("#asjfsdlb").val("");
		$("#sasfsdsxq").val("");
		$("#fsdssssmc").val("");
		$("#fsdxz").val("");
	}
}

$(function(){
	if($("#operType").val() == "add"){
		sasfsdsxqmc = $("#fsdssssmc").val();
		sasfsdsxq = $("#sasfsdsxq").val();
		
		$("#fsdssssmc").val("");
		$("#sasfsdsxq").val("");
		
		$("#fssj").attr("disabled","disabled");
		$("#asjfsdlb").attr("disabled","disabled");
		$("#sasfsdsxq").attr("disabled","disabled");
		$("#fsdssssmc").attr("disabled","disabled");
		$("#fsdxz").attr("disabled","disabled");
	}else if($("#operType").val() == 'detail'){
		$("#qbxs_div").displayInputForText();
	}
});


/**
*打开骨干信息界面
*
*/

function  openQbxsGgxxWin(operType,id){
	var sjid = $("#id").val();
	var ldxxbh = $("#ldxxbh").val();
	var yldxxbh = $("yldxxbh").val();
	var ldxxbh = (ldxxbh == undefined || ldxxbh == null) ? "" : ldxxbh;
	var yldxxbh = (yldxxbh == undefined || yldxxbh == null) ? "" : yldxxbh;
	if(sjid==null || sjid ==''){
		alert("请先保存情报线索基本信息.");
		return ;
	}
	$.openDialogWindow({
		name : "ggxxWin",
		url : contextPath + "/qbxs/toQbxxGgxxPage.action",
		data : {
			operType : operType,
			"ggxxBean.id":id,
			"ggxxBean.sjid":sjid,
			"ggxxBean.ldxxbh":ldxxbh,
			"ggxxBean.yldxxbh":yldxxbh,
			t:new Date().getTime()
		},
		width : 900,
		height : 500,
		callback:function(){
			$("#qbxsggxxlist").query("F","qbxs_form");
		}
	});
}

function  deleteQbxsGgxxBean(id){
	if(confirm("确定要删除该条数据么?")){
		$.ajax({
			url:contextPath + "/qbxs/deleteQbxsGgxxBean.action",
			type:"post",
			dataType:"json",
			data:{
				"ggxxBean.id":id
			},
			success:function(msg){
				if(msg){
					alert("删除成功！");	
					$("#qbxsggxxlist").query("F","qbxs_form")
				}else{
					alert("操作失败,请重试.");
				}		
			}
		});
	}
}