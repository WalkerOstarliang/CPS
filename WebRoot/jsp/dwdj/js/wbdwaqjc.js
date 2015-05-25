$(function(){
	if($("#opertype").val() == 'detail'){
		$("#_div").displayInputForText();
	}
});

function submitWbdwForm(){
	var msg = "是否确定修改此安全检查记录？";
	if($.validateform("wbdwform")){
		if($('#id').val()==''){
			msg = "是否确定新增安全检查记录？";	
		}
		if(confirm(msg)){
			$("#wbdwform").ajaxSubmit({
				type   : "post",
				success: function(result){
					var flag = eval(result);
					if(flag){
						alert("保存成功");
						$("#queryWbdw").query("F", "wbdwform");
					}else{
						alert("保存失败");
					}
				}
			});
		}
	}
}

function resetForm(){
	$(':input','#wbdwform')
	.not(':button,:submit,:reset,:hidden,:radio')
	.val('');
	$('#wbdwform')
	.find('input[type=radio]')
	.removeAttr('checked');
}


function wbdwRowClickCallback(trObj,data){
	setData(data, 'wbdwform');
}
function setData(data, _formId){
	$.each($('#' + _formId).find('textarea'), function(i, v){
		setObjVal($(this),data);
	});
	$.each($('#' + _formId).find('input[type=hidden]'), function(i, v){
		setObjVal($(this),data);
	});
	$.each($('#' + _formId).find('input[type=text]'), function(i, v){
		setObjVal($(this),data);
	});	
	$.each($('#' + _formId).find('input[type=radio]'), function(i, v){
		var _key = getObjName($(this));
		if($(this).val() == data[_key]){
			$(this).attr('checked','checked');
		}
	});
}
function setObjVal(_obj,data){
	_obj.val(data[_obj.attr('id')]);
}
function getObjName(_obj){
	var _name = _obj.attr("name");
	var _key = _name.substr(_name.indexOf('.') + 1,_name.length);
	return _key;
}