var year = '';
var month = '';
var day = '';

$(function(){
	init();
	initEvent();
});

function init(){
	var d = new Date();
	year = d.getFullYear();
	month = d.getMonth()+1;
	day = d.getDate();
	if(month<10){
		var kssj = year+'-0'+month+'-01';
	}else{
		var kssj = year+'-'+month+'-01';
	}
	if($('#kssj').val() == ''){
		$('#kssj').val(kssj)
	}
}

function initEvent(){
	$('#otherM').bind('click', function(){
		time_show();
	});
	$('#lastM').bind('click', function(){
		if(month-1>0 && month-1<10){
			var kssj = year+'-0'+(month-1)+'-01';
			if(month<10){
				var jssj = year+'-0'+month+'-01';
			}else{
				var jssj = year+'-'+month+'-01';
			}
		}else if(month-1 <= 0){
			var kssj = (year-1)+'-12'+'-01';
			var jssj = year+'-01'+'-01';
		}else if(month-1 >= 10){
			var kssj = year+'-'+month-1+'-01';
			if(month<10){
				var jssj = year+'-0'+month+'-01';
			}else{
				var jssj = year+'-'+month+'-01';
			}
		}
		$('#kssj').val(kssj);
		$('#jssj').val(jssj);
		time_hide();
	});
	$('#thisM').bind('click', function(){
		if(month<10){
			var kssj = year+'-0'+month+'-01';
			var jssj = year+'-0'+month+'-'+day;
		}else{
			var kssj = year+'-'+month+'-01';
			var jssj = year+'-'+month+'-'+day;
		}
		$('#kssj').val(kssj);
		$('#jssj').val(jssj);
		time_hide();
	});
	chickRadio();
}

function chickRadio(){
	var key = $('#_key').val();
	if(key == 'this'){
		$('#thisM').click();
	}
	if(key == 'last'){
		$('#lastM').click();
	}
	if(key == 'other' || key == ''){
		$('#otherM').click();
	}
}

function time_hide(){

	$('#_time1').hide();
	$('#kssj').hide();
	$('#_time3').hide();
	$('#jssj').hide();
	$('#_time5').hide();
	
	//$('#time').hide();
}

function time_show(){

	$('#_time1').show();
	$('#kssj').show();
	$('#_time3').show();
	$('#jssj').show();
	$('#_time5').show();

	//$('#time').show();
}

function submitForm(){
	$('#org_code').val('');
	$('#p_code').val('');
	$('#last_code').val('');
	$('#leve').val('3');
	$('#queryFormId').attr("action",contextPath + "/xfdw/hztj/toHztjList.action");
	$('#queryFormId').submit();
}
/*
查询下一级统计结果
*/
function queryNext(_id){
	$('#queryFormId').attr("action",contextPath + "/xfdw/hztj/toHztjList.action");
	if(_id != 'Total'){
		if($('#leve').val() <= '5'){
			var last_code = $('#p_code').val();
			var code = $('#'+_id).val();
			if(last_code == ''){
				last_code = '430100000000';
			}
			$('#p_code').val(last_code);
			if($('#leve').val() == '5'){
				code = code.substr(0,8)+'3100'
				$('#p_code').val(code.substr(0,6)+'000000');
			}
			$('#org_code').val(code);
			//alert($('#leve').val()+'   '+$('#p_code').val()+'   '+$('#org_code').val());
			$('#queryFormId').submit();
		}
	}
}
/*
查询上一级统计结果
*/
function lastSubmitForm(){
	//history.go(-1);
	$('#queryFormId').attr("action",contextPath + "/xfdw/hztj/toHztjList.action");
	var last_code = $('#p_code').val();
	var leve = $('#leve').val();
	if(leve == '6'){
		$('#p_code').val('');
	}
	$('#leve').val(leve - 2);
	$('#org_code').val(last_code);
	//alert($('#leve').val()+'   '+$('#p_code').val()+'   '+$('#org_code').val());
	$('#queryFormId').submit();
}
/*
打开统计详情
*/
function queryXq(code,dj){
	var kssj = $('#kssj').val();
	var jssj = $('#jssj').val();
	var p_code = $('#p_code').val();
	if(code != 'Total'){
		var data = {
			"tjBean.kssj": kssj,
			"tjBean.jssj":jssj,
			"tjBean.org_code":code,
			"tjBean.p_code":p_code,
			"tjBean.hzdj":dj
			};
		$.openWindow({
			url : contextPath + "/xfdw/hztj/toHzxqList.action",
			data :data,
			width : 1150,
			height : 800,
			callback:function(){
				
			}
		});
	}
}
/*
打开火灾详情
*/
function openDeail(trObj,rowdataobj){
	var hzxh = rowdataobj["hzxh"];
	var data = {"queryBean.hzxh":hzxh,"czType":"1"};
	$.openWindow({
		url : contextPath + "/xfdw/hzld/toHzldDeailPage.action?t=" + new Date().getTime(),
		data :data,
		width : 960,
		height : 600,
		callback:function(){
			
		}
	});
}
/*
导出统计数据
*/
function exportHztj(){
	if($('#exportform').attr('name') == undefined){
		$('#queryFormId').append('<form id="exportform" name="exportform" method="post" action="' + contextPath + '/xfdw/export/export.action"></form>');
		$('#exportform').append('<input type="hidden" id="exportData" name="exportData" value="" />');
	}
	report.exportData('tableHztj');
}

function reLoadPage(){
}

