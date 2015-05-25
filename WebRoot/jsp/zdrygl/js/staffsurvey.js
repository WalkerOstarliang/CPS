
function saveValue(formId,modth){
	var data = $('#'+formId).serialize();
	ajaxSaveValue(modth,data);
}

function ajaxSaveValue(modth,data){
	$.ajax({url			: contextPath + "/zdry/staffsurvey_saveStaffsurvey.action?modth="+ modth, 
			dataType	: "json", 
			type		: "post", 
			data		: data, 
			success	:function (json) {
				if(json && json == true){
					alert('保存成功！');
				}else{
					alert('保存失败！');
				}
			}
	});
}

function ajaxSaveValueQuery(obj,searchform){
	var data = $('#'+obj+'Form').serialize();
	$.ajax({url			: contextPath + "/zdry/staffsurvey_saveStaffsurvey.action?modth="+ obj, 
			dataType	: "json", 
			type		: "post", 
			data		: data, 
			success	:function (json) {
				if(json && json == true){
					alert('保存成功！');
					querytable(obj+'Info',searchform);
				}else{
					alert('保存失败！');
				}
			}
	});
}

function ajaUploadFile(formName){
	$("#"+formName).ajaxSubmit({
		dataType	: "json", 
		type : "post",
		success 	: function(result){
			if(result){
				alert('保存成功！');
			}else{
				alert('保存失败！');
			}
		},
		error: function (a,b){
			alert(a+"----"+b);
		}
	});
}

function saveWffzjl(){
	var _ieForm = $('#wffzjlTable');
	var flag = isEmptyForm(_ieForm);
	if(flag){
		ajaxSaveValueQuery('wffzjl','searchform');
	}else{
		alert('请输入相关信息！');		
	}
	
}

function showWffzjl(trObj, rowDataObj){
	var _ei = $('#wffzjlTable');
	setTableV(_ei, rowDataObj);
	
}

function addWffzjl(){
	var _ei = $('#wffzjlTable');
	clearTable(_ei);
}

function updateWffzjl(){
	var id = $('#id').val();
	if (id){
		var _ei = $('#wffzjlTable');
		clearDisabled(_ei);
	}else{
		alert("请选择要修改的违法犯罪经历记录!");	
	}
	
}

function delWffzjl(){
	var selectes = $('#wffzjlInfo').getSelected();
	if (selectes.length > 0){
		var verify = confirm("确认删除数据?");
		if(verify){
			$.each(selectes, function(i, obj){
				deleteValue(obj["id"],'wffzjl','wffzjlInfo','searchform');
				var _ei = $('#wffzjlTable')
				clearTable(_ei);
			});
		}
	}
	else
	{
		alert("请选择要删除的违法犯罪经历记录!");
	}
}


function saveXsbx(){
	var _ieForm = $('#xsbxTable');
	var flag = isEmptyForm(_ieForm);
	
	if(flag){
		ajaxSaveValueQuery('xsbx','searchform');
	}else{
		alert('请输入相关信息！');		
	}
}

function isEmptyForm(_ei){
	var flag = false;
	$.each(_ei.find('input'),function(){
		if($(this).val()){
			flag = true;
		}
	});
	$.each(_ei.find('select'),function(){
		if($(this).val()){
			flag = true;
		}
	});
	$.each(_ei.find('textarea'),function(){
		if($(this).val()){
			flag = true;
		}
	});
	
	return flag;
}

function showXsbx(trObj, rowDataObj){
	var _ei = $('#xsbxTable');
	setTableV(_ei, rowDataObj);
	
}

function addXsbx(){
	var _ei = $('#xsbxForm');
	clearTable(_ei);
}

function updateXsbx(){
	var id = $('#id').val();
	if (id){
		var _ei = $('#xsbxTable');
		clearDisabled(_ei);
	}else{
		alert("请选择要修改的违法犯罪经历记录!");	
	}
	
}

function delXsbx(){
	var selectes = $('#xsbxInfo').getSelected();
	if (selectes.length > 0){
		var verify = confirm("确认删除数据?");
		if(verify){
			$.each(selectes, function(i, obj){
				deleteValue(obj["id"],'xsbx','xsbxInfo','searchform');
				var _ei = $('#xsbxTable')
				clearTable(_ei);
			});
		}
	}
	else
	{
		alert("请选择要删除的现实状况记录!");
	}
}


function showZpxx(id){
	var divHtml = "<div id='showImgDiv' style='width:120px; height:90px; border:solid 1px red;'></div>";
	var imgHtml = "<img src='"+ contextPath +"/zdry/staffsurvey_showZpxxImg.action?id="+ id +"' width='101' height='141' />";
	if($('#showImgDiv').attr('id')){
		$('#showImgDiv').html('');
	}else{
		$("body").append(divHtml);
	}
	$("#showImgDiv").append(imgHtml);
}

function delZpxx(_ei,id){
	var verify = confirm("确认删除数据?");
	if(verify){
		deleteValue(id,'delZpxx');
		$(_ei).parent().parent().empty();
	}
}

function addZpxx(){
	var zpxxHtml = "<tr>";
	zpxxHtml += "<td><input type='text' id=\"xm\" name=\"zpms\" value=\"\" class='cps-input' style='width: 128px;'  /></td>";
	zpxxHtml += "<td><input name='pzrq' id='pzrq' type='text' class='cps-input' value='' style='width: 128px;' onfocus=\"WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})\"/></td>";
	zpxxHtml += "<td><input type=\"file\" name=\"upload\" id=\"upload\" class=\"input160\"/></td>";
	zpxxHtml += "<td><input type=\"button\" onclick=\"delTabJwry(this);\" value=\"删除\" class=\"sqjw_an\" /></td>";
	zpxxHtml += "</tr>";
	$('#zpxxTable').append(zpxxHtml);
}