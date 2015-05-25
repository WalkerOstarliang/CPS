$(document).ready(function()
	{
	    var bh = $("#bh").val();
	    var operType = $("#operType").val();
		$('#fileInput').uploadify({  
	 		'uploader':'/CPS/uploadify/uploadify.swf',
	        'script':'/CPS/qzgl/gyhdgl/uploadFile.action',   //指定服务端处理类的入口
	        'scriptData':{'bh':bh,'operType':operType},
	        'folder':'UploadFile',
	        'multi':true,
	        'simUploadLimit': 10,
	        'sizeLimit':10485760,
	 		'cancelImg':'/CPS/uploadify/cancel1.png',
	        'fileDataName':'fileInput', //和input的name属性值保持一致就好，Struts2就能处理了 
	        'fileDesc':'请选择文件',
	        'fileExt':'*.*',
	        'queueID':'fileQueue',  
	        'auto':false,//是否选取文件后自动上传  
	        'buttonImg'   : '/CPS/uploadify/1_conew1.jpg',
	        'width':98,
	        'height':27,
	        'method':'get',
			onCancel : function(event, ID, fileObj) { 
	  			return true;
		    } 
	  	});
  	});
  	
  	function submitSave(){
	if ($.validateform("gyhdInfoform"))
	{
		$("#gyhdInfoform").ajaxSubmit({
			type : "post",
			success : function()
			{
				if($("#operType").val()=="add"){
					alert("新增成功！");
					window.close();
				}
				else if($("#operType").val()=="update"){
					alert("修改成功！");
					window.close(); 
				}
			}
		});
	}
}


function cleargyhdForm(){
	$("#hdzt").val("");
	$("#hdsj").val("");
	$("#hddz").val("");
	$("#cydw").val("");
	$("#cyry").val("");
	$("#hdnr").val("");
	$("#fileInput").val("");
}
function addFjTrObj(){
	var trhtml = "";
	trhtml +="<tr>";
	trhtml += "<td width='80%' align='center'><input type='file' id='upload' name='upload'  class='validate[required] cps-file'></td>";
	trhtml +=" <td align='center' width='20%'><button type='button' onclick='deleteFjTrObj(this);' class='cps-btn'>&nbsp;删除&nbsp;</button></td>";
	trhtml +="</tr>";
	$("#fjtable").append(trhtml);
}
function deleteTjTrObj(btnobj,fjid,operType)
{
	if (operType == "add")
	{
		$(btnobj).parent().parent().remove();
	}
	else if ("update" == operType)
	{
		$.ajax({
			url : contextPath + "/qzgl/gyhdgl/deleteFjxx.action",
			data : "bh=" + fjid,
			dataType : "json",
			success : function(result)
			{
				if (result)
				{
					alert("附件删除成功.");
					$(btnobj).parent().parent().remove();
				}
				else
				{
					alert("附件删除失败.");
				}
			}
		});
	}
}

function deleteFjTrObj(btnobj){
	$(btnobj).parent().parent().remove();
}