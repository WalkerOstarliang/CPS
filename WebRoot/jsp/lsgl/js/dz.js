
function queryDate(){
	$("#dzList").query("F", "dzQuery");
}

function openDzInfoWin(operType,dzid){
	$.openWindow({
		url : contextPath + "/lsgl/dz/toDzxxDetail.action",
		data : {"operType":operType,"dzxx.dzid":dzid,t:new Date().getTime()},
		dataType:"json",
		width : 980,
		height : 700 
	});
}

function saveDzBean(){
	if ($.validateform("dzxxform"))
	{
		$("#dzxxform").ajaxSubmit({
			url: contextPath+"/lsgl/dz/saveDzxx.action",
			type:"post",
			dataType:"json",
			success :function(msg){
				if(msg)
				{
					alert("保存成功！");
				}else{
					alert("保存不成功！");
				}	
			}		
		});
	}
}
 
function callbackDzmc()
{
	var xjxzqh = $("#xzqh").find("option:selected").text();
	var jdxzdm = $("#jdxzdm").find("option:selected").text();
	var sqdm = $("#sqdm").find("option:selected").text();
	var jlxmc = $("#jlxmc").val();
	var mph = $("#mph").val();
	var xqmc = $("#xqmc").val();
	var ldh = $("#ldxz").val();
	var dyh = $("#dyh").val();
	var lc = $("#lc").val();
	var fjh = $("#fjh").val();
	
	var dzmc = "";
	
	if (xjxzqh != " ")
	{
		dzmc += xjxzqh;
	}
	if (jdxzdm != " ")
	{
		dzmc += jdxzdm;
	}
	if (sqdm != " ")
	{
		dzmc += sqdm;
	}
	if (jlxmc != null && jlxmc != "")
	{
		dzmc += jlxmc;
	}
	if (mph != null && mph != "")
	{
		dzmc += mph + "号";
	}
	if (xqmc != null && xqmc != "")
	{
		dzmc += xqmc;
	}
	if (ldh != null && ldh != "")
	{
		dzmc += ldh;
	}
	if (dyh != null && dyh != "")
	{
		dzmc += dyh;
	}
	if (lc != null && lc != "")
	{
		dzmc += lc;
	}
	if (fjh != null && fjh != "")
	{
		dzmc += fjh;
	}
	
	$("#dzmc").val(dzmc);

}

function openJlxSelectWinxx(bslx){
	var sqdm = $("#sqdm").val();
	if (!$.isBlank(sqdm))
	{
		openAddSelectJlxWin(sqdm,bslx,function(commonDZJlx){
			$("#jlxdm").val(commonDZJlx["dm"]);
			$("#jlxmc").val(!$.isBlank(commonDZJlx["jc"]) ? commonDZJlx["jc"] : commonDZJlx["mc"]);
			callbackDzmc();
		});
	}
	else
	{
		alert("添加街路巷前请选择社区.");
	}
}

function openDictionarySelectRowWin(callback){
	var url= contextPath+"/cps/dzjlx/toDzJlxPageInfo.action?t="+ new Date().getTime();
	var orgInfo = openModalDialog(url,650,550,"cc","no");
	if(orgInfo){
		if($.isFunction(callback)){
			callback(orgInfo);
		}
	}
}

function initDzxx()
{
	var sjxzqh = $("#sjxzqhhidden").val();
	if (sjxzqh != null && sjxzqh != "")
	{
			doubleSelectCountry(sjxzqh,'xjxzqh',function(){
				setTimeout(function() { 
					var xjxzqh = $("#xjxzqhhidden").val();
					$("#xjxzqh").val(xjxzqh);
				},1);
			});
	}
	
	var xjxzqh = $("#xjxzqhhidden").val();
	if (xjxzqh != null && xjxzqh != "")
	{
			doubleSelectJdxz(xjxzqh,'jdxzdm',function(){
				setTimeout(function() { 
					var jdxzdm = $("#jdxzdmhidden").val();
					$("#jdxzdm").val(jdxzdm);
				},1);
			});
	}
	
	var jdxzdm = $("#jdxzdmhidden").val();
	if (jdxzdm != null && jdxzdm != "")
	{	
		
			doubleSelectSqByJdxzdm(jdxzdm,'sqdm',function(){
				setTimeout(function() { 
					var sqdm = $("#sqdmhidden").val();
					$("#sqdm").val(sqdm)
				},1);
			});
		
	}
	
}

$(function(){
	initDzxx();
});