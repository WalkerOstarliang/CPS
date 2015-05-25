
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
			url: contextPath+"/dzgl/dzxx/saveDzxxBean.action",
			type:"post",
			dataType:"json",
			success :function(dzxxBean){
				if(dzxxBean != null)
				{
					$("#dzid").val(dzxxBean["dzid"]);
					alert("地址信息保存成功！");
				}
				else
				{
					alert("地址信息保存失败！");
				}	
			}		
		});
	}
}

function saveStxxBean()
{
	var xqz = $("#xqmc").val();
	var jlxdm = $("#jlxdm").val();
	var ldxz = $("#ldxz").val();
	var mph = $("#mph").val();
	// 新增实体时门牌号、小区组或者楼栋详址三个必须填写一个
	if (!$.isBlank(jlxdm) || !$.isBlank(xqz)  || !$.isBlank(ldxz) || !$.isBlank(mph))
	{
		if ($.validateform("stxxform"))
		{
			$("#stxxform").ajaxSubmit({
				url: contextPath+"/dzgl/dzxx/saveStxxBean.action",
				type:"post",
				dataType:"json",
				success :function(stxxBean){
					if(stxxBean != null)
					{
						$("#stid").val(stxxBean["id"]);
						$("#stid_hidden").val(stxxBean["id"]);
						$("#stbm").val(stxxBean["stbm"]);
						alert("实体信息保存成功！");
					}
					else
					{
						alert("实体信息保存失败！");
					}	
				}		
			});
		}
	}
	else
	{
		alert("街路巷、门牌号、小区组、楼栋详址至少填写一个.");
	}
}
 
function callbackDzmc()
{
	var xjxzqh = $("#xzqh").find("option:selected").text();
	var jdxzdm = $("#jdxzdm").find("option:selected").text();
	var sqmc= $("#sqdm").find("option:selected").text();
	var dyhmc = $("#dyh").find("option:selected").text();
	var jlxmc = $("#jlxmc").val();
	var mph = $("#mph").val();
	var xqmc = $("#xqmc").val();
	var ldxz = $("#ldxz").val();
	var dyh = $("#dyh").val();
	var lch = $("#lch").val();
	var fjh = $("#fjh").val();
	var fsdz = $("#fsdz").val();
	var dzmc = "";
	
	if (xjxzqh != null && $.trim(xjxzqh) != "")
	{
		dzmc += $.trim(xjxzqh);
	}
	if (jdxzdm !=null && $.trim(jdxzdm) != "")
	{
		dzmc += $.trim(jdxzdm);
	}
	if (sqmc != null && $.trim(sqmc) != "")
	{
		dzmc += $.trim(sqmc);
	}
	if (jlxmc != null && $.trim(jlxmc) != "")
	{
		dzmc += jlxmc;
	}
	if (mph != null && $.trim(mph) != "")
	{
		dzmc += mph + "号";
	}
	if (xqmc != null && $.trim(xqmc) != "")
	{
		dzmc += xqmc;
	}
	if (ldxz != null && $.trim(ldxz) != "")
	{
		dzmc += ldxz;
	}
	if (dyhmc != null && $.trim(dyhmc) != "" )
	{
		dzmc += $.trim(dyhmc);
	}
	if (lch != null && $.trim(lch) != "")
	{
		var lchz = $("#lchz").find("option:selected").text();
		dzmc += lch + lchz;
	}
	if (fjh != null && $.trim(fjh) != "")
	{
		var shhz = $("#shhz").find("option:selected").text();
		dzmc += fjh + shhz;
	}
	if (fsdz != null && $.trim(fsdz!=""))
	{
		dzmc += fsdz;
	}
	
	$("#dzmc").val(dzmc);
}



function openJlxSelectWinxx(bslx)
{
	var sqdm = $("#sqdm").val();
	openAddSelectJlxWin(sqdm,bslx,function(commonDZJlx){
		$("#jlxdm").val(commonDZJlx["dm"]);
		$("#jlxmc").val(!$.isBlank(commonDZJlx["jc"]) ? commonDZJlx["jc"] : commonDZJlx["mc"]);
		callbackDzmc();
	});
}

function openXqzSelectWin()
{

	var sqdm = $("#sqdm").val();
	if (sqdm != null && sqdm != "")
	{
		openXqzSelectWinInfo(sqdm,function(xqzBean){
			var xqmc = xqzBean["xqmc"];
			$("#xqmc").val(xqmc);
		});
	}
	else
	{
		alert("必须先选择社区/村.")
	}
	
	
}

function setSelectJlxValue(jlxBean)
{
	if( jlxBean != undefined && jlxBean != null)
	{
		$("#jlxdm").val(jlxBean["dm"]);
		$("#jlxmc").val((jlxBean["jc"]!=null && jlxBean["jc"]!="")?jlxBean["jc"]:jlxBean["mc"]);
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

function openSydw(){
	var selectData = $("#fwtablegrid").getSelected();
	if(selectData.length > 0){
		openDwInfo({
			"dw.fwBean.fwid" : selectData[0].fwid,
			"dw.fwBean.dzid" : selectData[0].dzid,
			"operType" : "add"
		});
		
		
//		$.openDialogWindow({
//			url : contextPath + "/zagl/dw/toSydwcx.action",
//			height : 500,
//			width : 900,
//			data : {
//				"dw.fwBean.fwid" : selectData[0].fwid,
//				"dw.fwBean.dzid" : selectData[0].dzid,
//				t : new Date().getTime()
//			},
//			scroll : false
//		});
	}else{
		alert("请选择房屋!");
	}
}

function openDwInfo(params)
{
	var url = contextPath + "/zagl/dw/toDwInfoPage.action?t=" + new Date().getTime();
	$.openWindow({
		url : url,
		width : 1020,
		height : 900,
		data : params
	});
}

function openSyrkRkInfo(operType, rylb)
{
	var selectData = $("#fwtablegrid").getSelected();
	if (selectData.length > 0)
	{
		var fwid = selectData[0]["fwid"];
		if (rylb != "4")
		{
			$.openWindow({
				name : "win",
				url : contextPath + "/lsgl/rk/toSyrkInfoPage.action",
				width : 1000,
				height : 760,
				data : {
					operType : operType,
					"queryBean.rylb":rylb,
					"queryBean.fwid":fwid,
					"queryBean.sfzh":$("#sfzh").val() != undefined && $("#sfzh").val()!=null ? $("#sfzh").val() : "",
					t:new Date().getTime()
				}
			});
		}
		else
		{
			$.openWindow({
				name : "win",
				url : contextPath + "/lsgl/jwrk/toJwrkQueryPage.action",
				width : 1000,
				height : 760,
				data : {
					operType : operType,
					"queryBean.rylb":rylb,
					"queryBean.fwid":fwid,
					t:new Date().getTime()
				}
			});
			/***
			$.openDialogWindow({
				url : contextPath + "/lsgl/rk/toRkInfoPage.action",
				data : {
					operType : operType,
					"queryBean.rylb":rylb,
					"queryBean.fwid":fwid,
					t:new Date().getTime()
				},
				width : 1000,
				height : 760
			});
			**/
		}
	}
	else
	{
		alert("请选择一条地址");
	}
}

function openAddFwInfoWin(operType)
{
	var stid = $("#stid").val();
	if(stid =='' || stid ==null){
		alert("请先保存实体基本信息");
		return;
	}
	$.openDialogWindow({
		name : "fwwin",
		url : contextPath + "/lsgl/fw/toFwInfoPage.action",
		width:1000,
		height:720,
		data : {
			operType : operType,
			"queryBean.sfczw" : "0",
			"queryBean.stid" : stid
		},
		callback : function()
		{
			queryFwTable();
		}
		
	});
}


function openAddFwInfoNotMapWin(operType)
{
	var stid = $("#stid").val();
	if(stid =='' || stid ==null){
		alert("请先保存实体基本信息");
		return;
	}
	$.openWindow({
		name : "fwwin",
		url : contextPath + "/lsgl/fw/toFwInfoPage.action",
		width:1000,
		height:720,
		data : {
			operType : operType,
			"queryBean.sfczw" : "0",
			"queryBean.stid" : stid
		}
	});
}


function openFwInfo(operType, fwid,sfczw)
{
	if (operType == "add")
	{
		$.openWindow({
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			height : 720,
			width : 1000,
			scroll : false,
			data : {
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				"queryBean.sfczw" : sfczw                                                                                  
			}
		});
	}
	else if (operType=="detail")
	{
		$.openWindow({
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			data : {
				operType : operType, 
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : sfczw, 
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				t : new Date().getTime()
			},
			height : 760,
			width : 1000
		});
	}
	else
	{
		$.openDialogWindow({
			url : contextPath + "/lsgl/fw/toFwInfoPage.action",
			data : {
				operType : operType, 
				"queryBean.fwid" : fwid,
				"queryBean.sfczw" : sfczw, 
				"queryBean.czType" : $("#czType").val() != undefined && $("#czType").val() != null ? $("#czType").val():"",
				t : new Date().getTime()
			},
			height : 760,
			width : 1000,
			scroll : false,
			callback : function()
			{
				queryFwTable();
			}
		})
	}
}


$(function(){
	initDzxx();
	var operType = $("#operType").val();
	if('detail' == operType)
	{
		$("#dzpanel").displayInputForText();
		$("#notmapdzxxtable").displayInputForText();
	}
});