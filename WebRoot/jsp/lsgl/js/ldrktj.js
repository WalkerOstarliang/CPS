/**
*钻取机构
*/
function Zqorgcode(orgcode,leve){
	var hjdqh = $("#hjdqh").val();
	var mz = $("#mz").find("option:selected").val();
	var djsj_start = $("#djsj_start").val();
	var djsj_end = $("#djsj_end").val();
	if(orgcode == "" && leve ==""){
		var orgcode = $("#orgcode").val();
		var leve =$("#leve").val();
		$("#moveLeve").val("");
	}else{
		++leve;
		$("#moveLeve").val(leve);
	}
	var url = contextPath+"/lsgl/jzzxx/queryLdrkTjList.action";
 	var data = {
		"queryBean.hjdqh":hjdqh,
		"queryBean.mz":mz,
		"queryBean.djsj_start":djsj_start,
		"queryBean.djsj_end":djsj_end,
		"queryBean.orgcode":orgcode,
		"queryBean.leve":leve
	}
	$.post(url,data,function(htmldata){
		$("#bgdiv").empty();
		$("#bgdiv").html(htmldata);
	});
}

function  backLastLeve(){
	var hjdqh = $("#hjdqh").val();
	var mz = $("#mz").find("option:selected").val();
	var djsj_start = $("#djsj_start").val();
	var djsj_end = $("#djsj_end").val();
	var moveLeve = $("#moveLeve").val();
	var leve = $("#leve").val();
	var moveOrgcode = $("#moveOrgcode").val();
	if(moveLeve > leve){
		if("2" == moveLeve){
			moveOrgcode = moveOrgcode.substr(0,4)+'00000000';
		}else if("3" == moveLeve){
			moveOrgcode = moveOrgcode.substr(0,6)+'000000';
		}else if("4" == moveLeve){
			moveOrgcode = moveOrgcode.substr(0,8)+'0000';
		}else if("5" == moveLeve){
			moveOrgcode = moveOrgcode.substr(0,10)+'00';
		}
		--moveLeve;
		$("#moveLeve").val(moveLeve);
	}
	var url = contextPath+"/lsgl/jzzxx/queryLdrkTjList.action";
	var data = {
		"queryBean.hjdqh":hjdqh,
		"queryBean.mz":mz,
		"queryBean.djsj_start":djsj_start,
		"queryBean.djsj_end":djsj_end,
		"queryBean.orgcode":moveOrgcode,
		"queryBean.leve":moveLeve
	}
	$.post(url,data,function(htmldata){
		$("#bgdiv").empty();
		$("#bgdiv").html(htmldata);
	});	
}

function chongzhi(){
	$("#queryldrktj").get(0).reset();
}


function exportLdrkTjxx(){
	if (confirm("你确定导出数据吗?"))
	{
		$("#queryldrktj").attr("target","exportiframe");
		$("#queryldrktj").attr("action",contextPath + "/lsgl/jzzxx/exportLdrkTjxx.action");
		$("#queryldrktj").submit();
	}
}

function openSelectXzqh(rootOrgCode,callback)
{
	openXzqhTree({
		rootOrgCode : rootOrgCode,
        mutilSelect : false,
        isAsyn : true,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(xzqhBean){
		callback(xzqhBean);
	})
}

function callbackHjdqh(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#hjdqh").val(xzqhBean["id"]);
		$("#hjdqhmc").val(xzqhBean["name"]);
	}
}