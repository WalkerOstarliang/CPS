function queryList()
{
	$("#rktablegrid").query("F","queryForm");
}


function openRkInfoDetail(operType,rkid,rybh,rylb)
{
	var newrkid = (rkid == undefined || rkid == null) ? "" : rkid;
	var newrybh = (rybh == undefined || rybh == null) ? "" : rybh;
	$.openWindow({
		name : "rkwin",
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {
			"operType" : operType,
			"queryBean.rkid":newrkid,
			"queryBean.rybh" : newrybh,
			"queryBean.rylb" :rylb,
			t:new Date().getTime()
		},
		width : 1000,
		height : 760
	});
}
//批量打印人口基本信息
function toPrintRkxxInfoPage(tableid){
	var bhs = [];
	var _tableid = "#"+tableid;
	var selecteds = $(_tableid).getSelected();
	if(selecteds.length == 0){
		alert('请选择要打印的人员')
		return false;
	}
	$.each(selecteds,function(i,obj){
		bhs.push(obj["rybh"]);
	})
	/*
	$.openWindow({
		name : "rkwin",
		type:'POST',
		url : contextPath + "/lsgl/rk/queryRkjbxxByRybhs.action",
		data : {
			"rybhs" :bhs.join(","),
			t:new Date().getTime()
		},
		width : 1000,
		height : 760
	});
	*/
	 $("#wordform").attr("action",contextPath + "/lsgl/rk/queryRkjbxxByRybhs.action");
	 $("#rybhs").val(bhs.join(","));
	 $("#wordform").submit();
}


function openRkInfo(operType,rkid,rybh,rylb,rkfwglid)
{
	var newrkid = (rkid == undefined || rkid == null) ? "" : rkid;
	var newrybh = (rybh == undefined || rybh == null) ? "" : rybh;
	var rkfwglid = (rkfwglid == undefined || rkfwglid == null) ? "" : rkfwglid;
	if (rylb != "4")
	{	
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/lsgl/rk/toRyInfoUpdatePage.action",
			data : {
				"operType" : operType,
				"queryBean.rkid":newrkid,
				"queryBean.rybh" : newrybh,
				"queryBean.rylb" :rylb,
				"queryBean.rkfwglid" : rkfwglid,
				t:new Date().getTime()
			},
			width : 1000,
			height : 760
		});
	}
	else
	{
		$.openWindow({
			name : "rkwin",
			url : contextPath + "/lsgl/rk/toRkInfoPage.action",
			data : {
				"operType" : operType,
				"queryBean.rkid":newrkid,
				"queryBean.rybh" : newrybh,
				"queryBean.rylb" :rylb,
				"queryBean.rkfwglid" : rkfwglid,
				t:new Date().getTime()
			},
			width : 1000,
			height : 760
		});
	}
}

function openSyrkInfoPage(operType, rybh, rylb)
{
	var rybh = rybh == undefined ? "" : rybh;
	$.openWindow({
		url : contextPath + "/lsgl/rk/toRkInfoPage.action",
		data : {"operType" : operType,"queryBean.rybh" : rybh,"queryBean.rylb" :rylb,  t:new Date().getTime()},
		width : 1000,
		height : 760
	});
}

function openSyrkRkInfo(operType,hideSfzh,rylb)
{
	$.openWindow({
		name : "syrkwin",
		url : contextPath + "/lsgl/rk/toSyrkInfoPage.action",
		data : {
			operType : operType,
			"queryBean.rylb":rylb,
			"queryBean.hideSfzh":hideSfzh,
			t:new Date().getTime()
		},
		width : 1000,
		height : 760
	}).foucs();
}



function openGajgjg(countrydm)
{
	var rootOrgCode = "430000000000";
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       if (orgBean != null)
       {
    	   $("#ssgajgjgdm").val(orgBean["id"]);
    	   $("#ssgajgjgmc").val(orgBean["name"]);
       }
    });
}

function openPcswin(pcsdm)
{
	var rootOrgCode = "430000000000";
	var gajgjgdm = $("#ssgagjgjdm").val();
	if(!$.isBlank(gajgjgdm))
	{
		rootOrgCode = gajggjdm;
	}
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       if (orgBean != null)
       {
    	   $("#sspcsdm").val(orgBean["id"]);
    	   $("#sspcsmc").val(orgBean["name"]);
       }
    });
}

function openZrdw(jwsqdm)
{
	var rootOrgCode = "430000000000";
	var sspcsdm = $("#sspcsdm").val();
	if (!$.isBlank(sspcsdm))
	{
		rootOrgCode = sspcsdm;
	}
	openDwSelect({ 
		rootOrgCode : rootOrgCode,
        mutilSelect : false
    },function(orgBean){
       if (orgBean != null)
       {
    	   $("#zrdwdm").val(orgBean["id"]);
    	   $("#zrdwmc").val(orgBean["name"]);
       }
    });
}

function rowCallbackCz(tdObj, rowdata)
{
	var html = "";
	html += "<span onclick=\"openSyrkInfoPage('rydaxx','" + rowdata["rybh"] + "','" + rowdata["rylb"] + "')\"  style=\"color:green\"  class=\"cps_span_href\">详情</span>";
	return html;
}

function toJwrkSelectFwWin(hideSfzh,rylb,selectType)
{
	layer.load(0);
	document.location.href = contextPath + "/lsgl/jwrk/toJwrkfwSelectPage.action";
}

function openSelectFwWin(hideSfzh,rylb,selectType)
{
 
	$.openWindow({
		name : "dzwin",
		url : contextPath + "/lsgl/fw/toSelectFwWin.action",
		width:900,
		height:650,
		data : 
		{
			"queryBean.rylb":rylb,
			"queryBean.hideSfzh" : hideSfzh, 
			"queryBean.selectType" : selectType,
			"queryBean.czType" : "syrk",
			t: new Date().getTime()
		}
	});
}

function openNewRkFwSelectWin(hideSfzh,sfzh,selectType)
{
	$.ajax({
		url : contextPath + "/lsgl/rk/checkRKisExists.action",
		type : "post",
		data : "queryBean.sfzh="+sfzh,
		dataType : "json",
		success:function(dzmc)
		{
			if (dzmc == null || dzmc == "")
			{
				$.openWindow({
					name : "dzwin",
					url : contextPath + "/lsgl/fw/toSelectFwWin.action",
					width:900,
					height:650,
					data : 
					{
						"queryBean.sfzh":sfzh,
						"queryBean.hideSfzh" : hideSfzh, 
						"queryBean.selectType" : selectType,
						t: new Date().getTime()
					}
				});
			}
			else
			{
				var hint = "当前实有人口已经在辖区内登记，住址为【" +dzmc + "】.确定要继续登记？"
				if (confirm(hint))
				{
					$.openWindow({
						name : "dzwin",
						url : contextPath + "/lsgl/fw/toSelectFwWin.action",
						width:900,
						height:650,
						data : 
						{
							"queryBean.sfzh":sfzh,
							"queryBean.hideSfzh" : hideSfzh, 
							"queryBean.selectType" : selectType,
							t: new Date().getTime()
						}
					});
				}
				else
				{
					$.closeWindow();
				}
			}
		}
	});
	
}



function clearQueryCondition()
{
	$("#queryForm").find(":input").each(function(){
		var id = $(this).attr("id");
		if (id != "rylb")
		{
			$(this).val("");
		}
	})
}

function changeRylb(rylb)
{
	if (rylb != "4")
	{
		$("#jwrkquerycondition").find(":input").val("");
		$("#jwrkquerycondition").hide();
	}
	else
	{
		$("#jwrkquerycondition").show();
	}
	queryList();
}


/**
 * 人口选择
 */
function rkSelect(trObj,rowdataobj){
	$.setResultValue(rowdataobj);
	$.closeWindow();
}


/**
 * 打开省市县
 */
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

function dblclickSetResult(trObj,rowdata)
{
	$.setResultValue(rowdata);
	$.closeWindow();
}

function selectRadio(value){
	//1 年龄
	if("1" == value){
		$("#birthContent").hide();
		$("#ageContent").show();
	}
	//0 出生日期
	else{
		$("#birthContent").show();
		$("#ageContent").hide();
	}
}

function minAge(value){
	
	var age_end =parseInt($("#age_end").val());
	if(age_end !="" && value !="" && value > age_end){
		alert("输入的值不能比后面的值大,请重新输入!");
		$("#age_start").val("");
	}
}

function maxAge(value){
	var age_start =parseInt($("#age_start").val());
	if(age_start !="" && value!="" && value < age_start ){
		alert("输入的值不能比前面的值小,请重新输入!");
		$("#age_end").val("");
	}
}


function openLdrkJzzxxWin(){
	var selecteds = $("#rktablegrid").getSelected();
	if(selecteds.length == 1)
	{
		if(selecteds[0]["zxbs"] != "1")
		{
			var rybh = selecteds[0]["rybh"];
			var zzbh = selecteds[0]["zzbh"];
			$.openWindow({
				name : "jzzxxWin",
				url : contextPath + "/lsgl/jzzxx/toAddJzzxxPage.action",
				width:1000,
				height:600,
				data : 
				{
					"bean.jzzrybh":rybh,
					"zzbh":zzbh
				}
			});
		} 
		else
		{
			if (confirm("人员已经注销不能再进行居住证登记只能进行查看是否继续?"))
			{
				var rybh = selecteds[0]["rybh"];
				var zzbh = selecteds[0]["zzbh"];
				$.openWindow({
					name : "jzzxxWin",
					url : contextPath + "/lsgl/jzzxx/toAddJzzxxPage.action",
					width:1000,
					height:600,
					data : 
					{
						"operType" : "detail",
						"bean.jzzrybh":rybh,
						"zzbh":zzbh
					}
				});
			}
		}
	}else{
		alert("必须且只能选一条数据.");	
	}
}
function openLdrkYQWin(){
	var selecteds = $("#rktablegrid").getSelected();
	if(selecteds.length == 1 ){
		var rybh = selecteds[0]["rybh"];
		var zzbh = selecteds[0]["zzbh"];
		$.openWindow({
			name : "YqxxWin",
			url : contextPath + "/lsgl/rk/toLdrkYanQi.action",
			width:900,
			height:350,
			data : 
			{
				"rkBean.ldrkBean.rybh":rybh,
				"zzbh":zzbh,
				t: new Date().getTime()
			}
		});
	}else{
		alert("必须且只能选一条数据.");	
	}
}

/** 弹出批量注销   流动 寄住 境外 常住*/
function openBathchlogoutRkInfoPage(){
	var bhs = []; 
	var selects  =  $("#rktablegrid").getSelected();
	var rylb = "";
	if(selects.length > 0){
		if(confirm("确定要注销这条记录吗?")){
			rylb = selects[0]["rylb"];
			$.each(selects,function(i,obj){
				if("1" == rylb){
					bhs.push(obj["czrkbh"]);
				}else if("2" == rylb){
					bhs.push(obj["zzbh"]);
				}
				else if("3" ==  rylb){
					bhs.push(obj["wlhrkbh"]);
				}
				else if("4" == rylb){
					bhs.push(obj["jwbh"]);
				}else if("5" == rylb){
					bhs.push(obj["jzbh"]);
				}
			})
			$.openDialogWindow({
				url:contextPath+"/lsgl/rk/toBatchLogoutRkInfoPage.action",
				width:600,
				height:250,
				data:{
					"bhs": bhs.join(","),
					"rylb":rylb,
					"t":new Date().getTime()
				},
				callback:function(msg){
					queryList();
				}
			});
		}
	}else{
		alert("请选择需要注销的数据.");
	}
}

/** 处理批量注销功能  流动人口*/
function newbatchLogoutRkInfo(){
	if($.validateform("batchlogoutform"))
	{
		$("#batchlogoutform").ajaxSubmit({
			url:contextPath + "/lsgl/rk/batchLogoutRkInfo.action",
			type:"post",
			dataType:"json",
			success: function(msg){
				if(msg)
				{
					alert("注销成功,请查询.");
					$.closeWindow();
				}
				else
				{
					alert("操作失败,请重试.");
				}
			}
		})
	}	
}


/** 批量删除人口信息   流口 寄住 境外 */
function batchDeleteRkInfo(operType,bh,rylb){
		if(confirm("确定要删除这条记录吗?")){
			$.ajax({
				url:contextPath+"/lsgl/rk/deleteRkxx.action",
				type:"post",
				dataType:"json",
				data:{
					"bhs": bh,
					"rylb":rylb
				},
				success: function(msg){
					if(msg){
						queryList();
					}
				}
				
			});
		}
}

function batchRecoveryDate(){
	var bhs = [];
	var rylb = "";
	var selects  =  $("#rktablegrid").getSelected();
	if(selects.length > 0){
		if(confirm("确定要恢复这条记录吗?")){
			rylb = selects[0]["rylb"];
			$.each(selects,function(i,obj){
				if("1" == rylb){
					bhs.push(obj["czrkbh"]);
				}else if("2" == rylb){
					bhs.push(obj["zzbh"]);
				}else if("4" == rylb){
					bhs.push(obj["jwbh"]);
				}else if("5" == rylb){
					bhs.push(obj["jzbh"]);
				}else if("3" == rylb){
					bhs.push(obj["wlhrkbh"]);
				}
			});
		}
	}
	$.ajax({
		url:contextPath+"/lsgl/rk/recoveryRkInfo.action",
		type:"post",
		dataType:"json",
		data:{
			"bhs": bhs.join(","),
		    "rylb":rylb
		},
		success : function(msg){
			if(msg){
				queryList();
			}
		}
	})
}


function batchLogoutRkInfo(operType,sfzh,rylb,bh,rybh){
		$.openWindow({
			name : "logoutWin",
			url : contextPath + "/lsgl/rk/toLogoutPage.action",
			width:900,
			height:500,
			data : 
			{
				"sfzh":sfzh,
				"rylb":rylb,
				"bhs":bh,
				"queryBean.rybh":rybh,
				t: new Date().getTime()
			}
		});
}


/** 单个注销 */
function logoutRkInfo(){
 	var rylb = $("#rylb").val();
  	if($.validateform("logoutform")){
  		$("#logoutform").ajaxSubmit({
			url : contextPath + "/lsgl/rk/logoutRkxx.action",
			type : "post",
			dataType : "json",
			success: function(msg){
				if(msg){
					alert("注销成功.");
					$.closeWindow();
				}else{
					alert("操作失败,请重试.");
				}
			}			
  		});
  	}
}

/** 恢复 */
function recovery(bh,rylb){
	if(confirm("是否恢复本条已注销的数据?")){
		$.ajax({
			url :contextPath + "/lsgl/rk/recoveryRkInfo.action",
			type:"post",
			dataType :"json",
			data:{
				"rylb":rylb,
				"bhs":bh
			},
			success : function(msg){
				if(msg){
					alert("成功恢复,请查询 .");
					queryList();
				}else{
					alert("操作失败,请重试 .");
				}
			}
		});
	}
}

/**  弹出计划生育的功能 */
function openJhsyPage(operType,id){
	if('add' == operType){
		var selects  =  $("#rktablegrid").getSelected();
		if(selects.length == 1){
			if(selects[0]["xb"] =='2'){
				var csrq = selects[0]["csrq"];
				var rybh = selects[0]["rybh"];
				var sfzh = selects[0]["sfzh"];
				var age =daysBetween(csrq);
				if(age >= 16 && age <=49 ){
					$.openDialogWindow({
						url : contextPath +"/lsgl/rk/toRkJhsyPage.action",
						width:900,
						height:250,
						data:{
							"jhsyBean.rybh":rybh,
							"sfzh":sfzh,
							"operType":operType
						},
						callback:function(){
						}
					});
				}else{
					alert("必须是16~49岁之间的女性.");
				}
			}else{
				alert("选择人员性别必须为女性.");
				return ;
			}
		}else{
			alert("必须且只能选择一条记录.");
		}
	}else{
		$.openDialogWindow({
			url : contextPath +"/lsgl/rk/toRkJhsyPage.action",
			width:900,
			height:250,
			data:{
				"jhsyBean.id":id,
				"operType":operType
			},
			callback:function(){
				if(operType != 'detail'){
					$("#jhsytablegrid").query("F","queryForm");
				}
			}
		});
	}
}

function NewDate(str) { 
	str = str.split('-'); 
	var date = new Date(); 
	date.setUTCFullYear(str[0], str[1] - 1, str[2]); 
	date.setUTCHours(0, 0, 0, 0); 
	return date; 
}

function daysBetween(DateTwo){   
 	var now = new Date();
  	var OneYear = now.getFullYear();
  	var OneMonth = now.getMonth()+1;
  	var OneDay = now.getDate();
  
    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
  
    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000/365);   
  	var age = Math.abs(cha)+1+"";
  	
    return age.split(".")[0];
}

function savaRkjhsy(){
	if($.validateform("jhsyform")){
		$("#jhsyform").ajaxSubmit({
			url:contextPath+"/lsgl/rk/savaJhsyBean.action",
			type :"post",
			dataType:"json",
			success:function(msg){
				if(msg){
					alert("保存数据成功");
					window.close();
				}else{
					alert("操作失败，请重试.");
				}
			}
					
		})
	}
}

function deleteJhsyBean(id){
	if(confirm("确认要删除该数据吗?")){
		$.ajax({
			url:contextPath+"/lsgl/rk/deleteJhsyBean.action",
			type:"post",
			dataType:"json",
			data:{
				"jhsyBean.id":id
			},
			success:function(msg){
				if(msg){
					alert("删除成功.");
					$("#jhsytablegrid").query("F","queryForm");
				}
				else{
					alert("删除失败，请重试.");
				}
			}
			
			
		})
	}
	
}

function ldrkExportWord()
{
	var ldrkbeans = $("#rktablegrid").getSelected();
	if (ldrkbeans.length==1)
	{
		var rylb = ldrkbeans[0]["rylb"];
		var rybhs = [];
		 $.each(ldrkbeans,function(i){
		 	var ldrkBean = ldrkbeans[i];
		 	rybhs.push(ldrkBean["rybh"]);
		 });
		 var rybhstr = rybhs.join(",");
		 $("#selectedrybhs").val(rybhstr);///rk/toLdrkListWordPage,
		 $.openWindow({
		 	name : "exportwin",
		 	url : contextPath + "/lsgl/jzzxx/toLdrkExportWordPage.action",
		 	data : {selectedrybhs:rybhstr,"rkBean.rylb" : rylb},
		 	width:900,
		 	height:700
		 });
		// $("#exportform").attr("action",contextPath + "/lsgl/jzzxx/toLdrkExportWordPage.action");
		// $("#exportform").submit();
	}
	else if (ldrkbeans.length > 1)
	{
		alert("每次只能打印一条记录.")
	}
	else
	{
		alert("请选择要导出的人口记录.");
	}
}

function ldrkExportExcel()
{
	var ldrkbeans = $("#rktablegrid").getSelected();
	if (ldrkbeans.length > 0)
	{
		if (confirm("你确定导出选择的记录吗？"))
		{
			 $("#exportform").attr("action",contextPath + "/lsgl/rk/toLdrkListExcelPage.action");
			 var ldrkids = [];
			 $.each(ldrkbeans,function(i){
			 	var ldrkBean = ldrkbeans[i];
			 	ldrkids.push(ldrkBean["zzbh"]);
			 });
			 var ldrkidsstr = ldrkids.join(",");
			 $("#ldrkids").val(ldrkidsstr);
			 $("#exportform").attr("target","exportiframe");
			 $("#exportform").submit();
		 }
	}
	else
	{
		if (confirm("你确定导出满足条件的所有数据吗？"))
		{
			$("#queryForm").attr("target","exportiframe");
			$("#queryForm").attr("action",contextPath + "/lsgl/rk/toLdrkListExcelPage.action");
			$("#queryForm").submit();
		}
	}
}

function openZpxxWhWin(rybh,sfzh)
{
	$.openWindow({
		name : "zpwhwin",
		url : contextPath + "/rk/rxgl/toRyzpglPageInfo.action",
		data : {
			rybh : rybh,
			sfzh : sfzh
		},
		width:900,
		height:700
	});
}

function callbackRyzpcz(tdObj,rowdata)
{
	var html = "";
	html += "<span onclick=\"openSyrkInfoPage('rydaxx','" + rowdata["rybh"] + "','" + rowdata["rybh"] + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;";
	html +="<span onclick=\"openZpxxWhWin('" + rowdata["rybh"] + "','" + rowdata["sfzh"]+"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>"
	return html;
}

function queryjhsyList(){
	$("#jhsytablegrid").query("F","queryForm");
}

function setXmtyInfo(obj){
	if ($(obj).attr("checked") == "checked"){
		$(obj).val("1");
	}else{
		$(obj).val("2");
	}
}

function toExportPrintSyrkInfoPage(rylb)
{
	var selectes = $("#rktablegrid").getSelected();
	if (selectes.length==1)
	{
		var rkids = null;
		//常驻人口
		if (rylb == "1")
		{
			rkids = selectes[0]["czrkbh"];
		}
		//寄住人口
		else if (rylb == "5")
		{
			rkids = selectes[0]["jzbh"];
		}
		$.openWindow({
			name : "dywin",
			url : contextPath + "/lsgl/rk/toExportPrintSyrkInfoPage.action",
			width:900,
			height:700,
			data : 
			{
				rkids : rkids,
				selectedrybhs : selectes[0]["rybh"],
				"queryBean.rylb" : rylb
			}
		});
	}
	else if (selectes.length > 1)
	{
		alert("每次只能打印一条记录");
	}
	else
	{
		alert("请选择要打印的实有人口记录");
	}
}

function toExportExcelSyrkInfo(rylb)
{
	var size = $("#rktablegrid").getTotalSize();
	if (size <= 5000 && size > 0)
	{
		var syrkbeans = $("#rktablegrid").getSelected();
		if (syrkbeans.length > 0)
		{
			if (confirm("你确定导出选择的记录吗？"))
			{
				 $("#exportform").attr("action",contextPath + "/lsgl/rk/toExportExcelSyrkInfoPage.action");
				 var rkids = [];
				 //常驻人口
				 if(rylb == "1")
				 {
					 $.each(syrkbeans,function(i){
					 	var syrkbean = syrkbeans[i];
					 	rkids.push(syrkbean["czrkbh"]);
					 });
				 }
				 else if (rylb == "5")
				 {
				 	$.each(syrkbeans,function(i){
					 	var syrkbean = syrkbeans[i];
					 	rkids.push(syrkbean["jzbh"]);
					 });
				 }
				 else if(rylb =="select"){
					 $.each(syrkbeans,function(i){
					 	var syrkbean = syrkbeans[i];
					 	rkids.push(syrkbean["rkid"]);
					 });
				 }
				 var rkidsstr = rkids.join(",");
				 $("#rkids").val(rkidsstr);
				 $("#exportform").attr("target","exportiframe");
				 $("#exportform").submit();
			 }
		}
		else
		{
			if (confirm("你确定导出满足条件的所有数据吗？"))
			{
				$("#queryForm").attr("target","exportiframe");
				$("#queryForm").attr("action",contextPath + "/lsgl/rk/toExportExcelSyrkInfoPage.action");
				$("#queryForm").submit();
			}
		}
	}
	else
	{
		alert("数据查询结果为0或者大于5000条，系统无法导出。");
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


/*实体选择*/
function openSelectStxxBean()
{
	$.openDialogWindow({
		url : contextPath + "/dzgl/dzxx/toStxxBeanSelectPage.action?t="+new Date().getTime(),
		width:1000,
		height:600,
		callback: function(stxxBean)
		{
			if (stxxBean != null)
			{
				$("#stid").val(stxxBean["id"]);
				$("#stmc").val(stxxBean["stmc"]);
			}
		}
	})
}

/*清除实体*/
function clearSt(){
	$("#stid").val("");
	$("#stmc").val("");
}
 