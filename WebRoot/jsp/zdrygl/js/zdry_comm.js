
/**
根据表单输入条件查询
*/
function querytable(tableGrid, searchform) {
	$("#" + tableGrid).query("F", searchform);
}
/**
打开列管申请
*/
function openApplication() {
	$.openDialogWindow({
		url 		: contextPath + "/zdry/collect_toCollectLgsq.action",
		width 		: 900,
		height		: 710,
		data 		: {t:new Date().getTime()}, 
		scroll 		: false,
		callback 	: function(data){
			if(data==true || data == 'true'){
				querytable('zdryInfo','searchform');
			}
		}
	});
}

function openCkWindow(sqxxbh,lcgzt){
	if(!sqxxbh){
		alert('操作有误，请重新操作!!');
		return;
	}
	
	if(lcgzt == '1'){
		alert('请先审批完再做撤管操作！');
		return;
	}
	if(lcgzt == '3'){
		alert('已经进入撤管审批中，请勿重复点击！');
		return;
	}
	if(lcgzt == '4'){
		alert('已撤管，请勿重复点击！');
		return;
	}
	if(lcgzt == '5'){
		alert('请勿撤管未列管人员！');
		return;
	}
	
	//打开审批界面
	$.openDialogWindow({
		url 		: contextPath + "/zdry/collect_toCollectLgsq.action",
		width 		: 900,
		height		: 710,
		data 		: {t:new Date().getTime(),sqxxbh:sqxxbh,lcgsqlx:'2',isck:'1'}, 
		scroll 		: false,
		callback 	: function(data){
			if(data==true || data == 'true'){
				querytable('zdryInfo','searchform');
			}
		}
	});
}
/**
打开列管流转信息
*/
function openLzxx() {
	$.openWindow({name:"\u7533\u8bf7", url:contextPath + "/zdry/comm_openForwardPage.action?method=toLzxxPage", width:900, height:800});
}
function creatChart(el, w, h, xml, swf) {
	var chart = new FusionCharts(swf, el, w, h);
	chart.setDataXML(xml);
	chart.setTransparent(false);
	chart.render(el);
}
/**
打开人员考察
*/
function openStatistics(sfzh) {
	if(!sfzh){
		var selectes = $('#zdryInfo').getSelected();
		if (selectes.length > 0){
			$.each(selectes, function(i, obj){
				sfzh = obj["sfzh"];
				$.openWindow({name:"\u4eba\u5458\u8003\u5bdf", url:contextPath + "/zdry/staffsurvey_toStaffsurveyJbxxPage.action?sfzh=" + sfzh, width:900, height:700});
			});
		}
		else
		{
			alert("请选择要考察的人员!");
		}
	}else{
		$.openWindow({name:"\u4eba\u5458\u8003\u5bdf", url:contextPath + "/zdry/staffsurvey_toStaffsurveyJbxxPage.action?sfzh=" + sfzh, width:900, height:700});
	}
	
}

function loadingImg(_ei) {
	var colspanSize = _ei.find("thead>tr").find("th").length;
	var xmldata = "<tr><td rowspan=\"8\" colspan=\"" + colspanSize + "\"><div align=\"center\"><img src=\"../template/cps/images/loading_detail.gif\"></img></div></td></tr>";
	_ei.find("tbody").empty();
	_ei.find("tbody").append(xmldata);
}

function nodata(_ei) {
	var colspanSize = _ei.find("thead>tr").find("th").length;
	var xmldata = "<tr><td rowspan=\"8\" colspan=\"" + colspanSize + "\" class=\"centerText\">\u65e0\u76f8\u5173\u6570\u636e...</td></tr>";
	_ei.find("tbody").empty();
	_ei.find("tbody").append(xmldata);
}
function getData(url, param, _ei) {
	
	$.ajax({url:url, dataType:"json", type:"post", data:param, beforeSend:function (XMLHttpRequest) {
		loadingImg(_ei);
	
	}, complete:function (XMLHttpRequest, textStatus) { //请求完成之后(不管成功或者失败)调用

		hoverRowsColor(_ei);
	
	}, success:function (json) {
		if (json && json.datas && json.datas.length > 0) {
			callbackTab(json.datas,_ei);
		} else {
			nodata(_ei);
		}
	
	}, error:function (XMLHttpRequest, textStatus, errorThrown) {
		var str = XMLHttpRequest.responseText;
		alert("ajax\u8bf7\u6c42\u9519\u8bef:" + str);
		/*
			if(str.indexOf("login.jsp")>0){
				alert("会话过期，请重新登陆!");
				top.location = "../login.jsp";
			}
			*/
	}});
}
function callbackTab(data,_ei) {
	//清空加载进度条
	var _tbody = _ei.find("tbody");
	_tbody.empty();
	
	var isShowRowNumbers = _ei.attr("rownumbers");
	//循环数据拼接显示td
	for (var i = 0; i < data.length; i++) {
		var row = _ei.find("thead tr").clone();
		var html = "<tr>";
		if(isShowRowNumbers){
			html += "<td>"+(i+1)+"</td>";
		}
		
		row.find("th").each(function (j,v) {
			if(j==0 && isShowRowNumbers){
				return;
			}
			var tempVal = "";
			var field = $(this).attr("field");
			var exp = "data[" + i + "]." + field;
			tempVal = eval(exp);
			tempVal = strTrim(tempVal);
			html += "<td>"+tempVal+"</td>";
		});
		html += "</tr>";
		_tbody.append(html);
	}
}

function hoverRowsColor(_ei) {
	/*
	_ei.hover(function () {
		$(this).addClass("color_tr_hover");
	}, function () {
		$(this).removeClass("color_tr_hover");
	});
	*/
}

//字符去空格
function strTrim(_v){
	if(!_v || _v.length <= 0){
		return _v+"&nbsp;";
	}
	
	return _v;
}

//打开犯罪人员详细信息窗口
function openCrimeDetails(id){
	$.openDialogWindow({
		url 		: contextPath + "/zdry/crime_toCrimeDetailsPage.action",
		width 		: 900,
		height		: 710,
		data 		: {t:new Date().getTime(),bh:id}, 
		scroll 		: false,
		callback 	: function(){}
	});
}

function showCrimDetail(trObj, rowDataObj){
	var _ei = $('#personnelInfo');
	setTableValue(rowDataObj,_ei);
}

function setTableValue(rowDataObj,_ei){
	$.each(_ei.find('tr>td'),function(i,v){
		var field = $(v).attr('field');
		if(field){
			var exp = "rowDataObj." + field;
			var tempVal = eval(exp);
			tempVal = tempVal == null ? "&nbsp;" : tempVal;
			$(v).html(tempVal);
		}
	});
}

function crimeTqInfo(bh){
	$.ajax({url			: contextPath + "/zdry/crime_crimeTqInfo.action", 
			dataType	:"json", 
			type		:"post", 
			data		:{bh:bh}, 
			beforeSend	:function (XMLHttpRequest) {
				
			}, success	:function (json) {
				if(json && json == true){
					alert('提取成功！');
					querytable();
				}else{
					alert('提取失败！');
				}
			}
	});
}

function fzryIsrl(obj,rowdataobj){
	var flag = '是';
	if(rowdataobj.isrl != '1'){
		flag = '否'
	}
	return flag;
}

/**
添加主要关系人表格
*/
function addTabJwry(_ei){
	var _tbody = $(_ei).parent().parent().parent();
	var _tr = _tbody.find("tr:first-child").clone();
	_tr.find("td>select").attr('value','');
	_tr.find("input").val('');
	_tr.find("td:last-child").html('<input type="button" onclick="delTabJwry(this);" value="删除" class="sqjw_an" />');
	_tbody.append(_tr);
	$("#gxrCount").val(Number($("#gxrCount").val()) + 1);
}

function delTabJwry(_ei){
	var _tbody = $(_ei).parent().parent();
	_tbody.empty();
	$("#gxrCount").val(Number($("#gxrCount").val()) - 1);
}

//清空对象
function clearTable(_el){
	//清空对象下面的所有文本框
	_el.find('input').val('').removeAttr("disabled");
	//清空对象下面的所有文本域
	_el.find('textarea').val('').removeAttr("disabled");
	//清空对象下面的所有下拉框
	_el.find('select').attr('value','').removeAttr("disabled");
	
	_el.parent().find('button').removeAttr("disabled");
}

function clearDisabled(_el){
	//清空对象下面的所有文本框
	_el.find('input').removeAttr("disabled");
	//清空对象下面的所有文本域
	_el.find('textarea').removeAttr("disabled");
	//清空对象下面的所有下拉框
	_el.find('select').removeAttr("disabled");
	
	_el.parent().find('button').removeAttr("disabled");
}

function setTableV(_ei, rowDataObj){
	$.each(_ei.find("input"),function(i,v){
		var field = $(v).attr('id');
		if(field){
			var exp = "rowDataObj." + field;
			var tempVal = eval(exp);
			$(v).val(tempVal);
			$(v).attr("disabled","true");
		}
	});
	$.each(_ei.find("select"),function(i,v){
		var field = $(v).attr('id');
		if(field){
			var exp = "rowDataObj." + field;
			var tempVal = eval(exp);
			$(v).attr('value',tempVal);
			$(v).attr("disabled","true");
		}
	});
	$.each(_ei.find("textarea"),function(i,v){
		var field = $(v).attr('id');
		if(field){
			var exp = "rowDataObj." + field;
			var tempVal = eval(exp);
			$(v).val(tempVal);
			$(v).attr("disabled","true");
		}
	});
	
	$.each(_ei.parent().find('button'),function(){
		$(this).attr("disabled","true");
	});
}

function deleteValue(id,modth,searchInfo,searchform){
	$.ajax({url			: contextPath + "/zdry/staffsurvey_delStaffsurvey.action?modth="+ modth, 
		dataType	: "json", 
		type		: "post", 
		data		: {id:id}, 
		success	:function (json) {
			if(json && json == true){
				alert('操作成功！');
				if(searchInfo && searchform){
					querytable(searchInfo,searchform);
				}
			}else{
				alert('操作失败！');
			}
		}
	});
}

