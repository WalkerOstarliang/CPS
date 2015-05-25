// JavaScript Document
var scrollHeight = 0;
function shownoneDiv(divName){
	$("#"+divName).toggle("normal");
}

//文本框输入字符验证
function textValidation(obj){
	var objStr = $(obj).val();
	var reg;
	//字段调整添加字符：添加-1状态
	if($(obj).attr("name") == "addIndex"){
		reg = /^((\d+)|(-1)|(-))$/;
	}else{
		reg = /^\+?[0-9]*[0-9][0-9]*$/;
	}
	var r = objStr.match(reg);
	if(r == null){
		$(obj).val("");
	}
}

function trimStr(val){
	return val.replace(/(^\s*)|(\s*$)/g, "");
}
	
/*
	rowNumber;//每页显示记录数
	rowCount; //总条数
	pageNo=1;//当前页码
	pageCount;//页数统计
*/
function pages(rowCount,pageNo,pageCount,ajaxMod){
	var pageStr = "<div><input type='hidden' name='pageNo' value='"+pageNo+"'>";
	pageStr += "共"+rowCount+"条记录&nbsp;&nbsp;";
	pageStr += "第"+pageNo+"页/";
	pageStr += "共"+pageCount+"页&nbsp;&nbsp;";
	if(pageNo>1){
		pageStr += "<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick=\"gotoPages(1,"+pageCount+",'"+ajaxMod+"',this);\">首  页</a>&nbsp;&nbsp;";
		pageStr += "<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick=\"gotoPages("+(Number(pageNo)-1)+","+pageCount+",'"+ajaxMod+"',this);\">上一页</a>&nbsp;&nbsp;";
	}else{
		pageStr += "首  页&nbsp;&nbsp;";
		pageStr += "上一页&nbsp;&nbsp;";
	}
	if(Number(pageNo)<Number(pageCount)){
		pageStr += "<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick=\"gotoPages("+(Number(pageNo)+1)+","+pageCount+",'"+ajaxMod+"',this);\">下一页</a>&nbsp;&nbsp;";
		pageStr += "<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick=\"gotoPages("+pageCount+","+pageCount+",'"+ajaxMod+"',this);\">尾  页</a>&nbsp;&nbsp;";
	}else{
		pageStr += "下一页&nbsp;&nbsp;";
		pageStr += "尾  页&nbsp;&nbsp;";
	}
	
	pageStr += "跳转到 <input type='text' style='width:30px;' onkeyup=\"value=value.replace(/\\D+/g,'')\" name='pagesNumber' value='' /> 页&nbsp;<a href='javascript:void(-1);' onclick=\"gotoPages(0,"+pageCount+",'"+ajaxMod+"',this);\">GO</a>&nbsp;&nbsp;&nbsp;";
	pageStr += "</div>";
	//设置滚动条高度
	udf_setScrollTop(scrollHeight)
	return pageStr;
}

function gotoPages(pageNo,pageCount,ajaxMod,o){
	if(pageNo == "0"){
		pageNo = $(o).parent().find("input[name=pagesNumber]").val();
	}
	if(pageNo == "" || pageNo<1){
		pageNo = 1;
	}
	if(pageNo > pageCount){
		pageNo = pageCount;
	}
	//获取滚动条高度
	scrollHeight = udf_getScrollTop();
	$(o).parent().find("input[name='pageNo']").val(pageNo);
	eval(ajaxMod+"('"+pageNo+"')");
}

function udf_isIE(){
	var w3c = (document.getElementById) ? true : false;
	var agt = navigator.userAgent.toLowerCase();
	return ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1) && (agt.indexOf("omniweb") == -1));
}

function udf_ieTrueBody(){
	return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body;
}

/**
* 获得滚动条位置
* 一般ie6用document.body.scrollTop
*/
function udf_getScrollTop(){
	return udf_isIE() ? udf_ieTrueBody().scrollTop : window.pageYOffset;
}

/**
* 设置滚动
* 一般ie6用document.body.scrollTop=0;
* @param {Object} h 
*/
function udf_setScrollTop(h){
	if (udf_isIE()) {
		udf_ieTrueBody().scrollTop = h;
	}else {
		window.pageYOffset = h;
	}
}


var monthCal;//日历数组，每个对象对应日历中相应位置的日期信息

/*
 * 初始化日历数组信息
 */
function initCal(){
	monthCal = new Array();
	for(var i = 0; i < 6; i ++){//每月日期最多对应6周
		var weekCal = new Array();
		for(var j = 0; j < 7; j ++){//每周7天
			weekCal[j] = "&nbsp;";
		}
		monthCal[i] = weekCal;
	}
}


/*
 * 获取日历信息
 * param： 
 *	year-年；month-月；specType-需要额外获取的数据（duty-勤务；sched-日程）；func:回调函数对象
 */
function getMonthCalInfo(year, month, specType, func){
	var url = contextPath + "/calendar/getMonthCalendar.action";//取数据的url
	var param = 'year=' + year + '&month=' + month + "&specType=" + specType;//参数信息
	ajaxSubmit(url, param, func);//获取指定的日历信息，并生成html
}

/*
 * 刷新日历数组信息
 */
function renewCalendarArr(resData){
	var weekNum = 0;//周数
	var wi = 0;
	for(var i = 0; i < resData.length; i ++){
		if(weekNum == 0){//第一条记录
			monthCal[wi][resData[i].weekday - 1] = resData[i];//修改日历信息数组里对应位置
			weekNum = resData[i].week;//设置实际周数
		}else{//不是第一条
			//周数无变化，表示还是同一周，日历信息行数不变；否则表示不是同一周，日历信息行数下移，同时改变周数信息
			if(weekNum != resData[i].week){//周数变化
				wi += 1;//行数下移
				weekNum = resData[i].week;//记录新周数
			}
			monthCal[wi][resData[i].weekday - 1] = resData[i];//修改日历信息数组里对应位置
		}
	}
}

function ajaxSubmit(url, param, func){
	$.ajax({
		url : url,
		type : 'POST',
		data : param,
		dataType : 'text',
		error : function(XMLHttpRequest, textStatus, errorThrown){
			alert("系统错误：" + XMLHttpRequest.redayState + "|" + textStatus + "|" + errorThrown);
		},
		success : function(resData){
			eval("func(" + resData + ")");//传入func为函数对象
			//eval(func + "(" + resData + ")");//传入func为函数名称
		}
	});
}

//添加拖动效果(handerId: 可触发拖动效果的位置id， moveDivId: 被拖动的层id)
function addMove(handerId,  moveDivId){
	var pos = {
		x : 0,
		y : 0
	};
	var moveDiv = document.getElementById(moveDivId);
	var handDiv = document.getElementById(handerId);
	handDiv.style.cursor = "move";
	handDiv.onmousedown = function(e) {
		e = e || window.event;

		pos.x = e.clientX - moveDiv.offsetLeft;
		pos.y = e.clientY - moveDiv.offsetTop;
		document.onmousemove = function(e) {
			e = e || window.event;
			if (e) { 
					moveDiv.style.left = (e.clientX - pos.x) + "px"; 
					moveDiv.style.top = (e.clientY - pos.y) + "px";
			}
		};
	};
	document.onmouseup = function() {
		document.onmousemove = null;
		//document.body.focus();
	};
}
