
function updateCoords(c)
{
	$("#x").val(c.x);
	$("#y").val(c.y);
	$("#w").val(c.w);
	$("#h").val(c.h);
};


function saveCutImageCoords()
{
	if(parseInt($("#w").val()))
	{
		$("#cutimageform").ajaxSubmit({
			dataType : "json",
			success : function(zpid)
			{
				if(zpid != null && zpid != "")
				{
					alert("照片裁剪并保存成功.");
					$("#insertimgdiv").empty();
					$("#xyzpdiv").append("<span zpid=\"" + zpid +"\" style=\"margin: 5px;cursor: pointer;background: #CCCCCC\"><img width=\"150\" height=\"170\" src=\"" + contextPath + "/lsgl/rk/showRkzpImage.action?queryBean.zpid=" + zpid + "\"/></span>");
					$("#xyzpdiv").find("span:last").click(function(){
						clickShowRkzp(zpid);
					});
				}
				else
				{
					alert("照片裁剪失败.请重新再试.");
				}
			}
		});
	}
	else
	{
		alert("请先对图片进行裁剪");
	}
}

function saveRemoteZpxx()
{
	var length = $("#xyzpdiv").find("img[YCFWZP='1']").length;
	if(length <= 0)
	{
		$.ajax({
			type : "post",
			dataType : "json",
			url : contextPath + "/rk/rxgl/saveRemoteZpxx.action",
			data : {
				rybh : $("#rybh").val(),
				sfzh : $("#sfzh").val()
			},
			success : function(zpid)
			{
				if(zpid != null && zpid != "")
					{
						alert("获取并保存远程服务照片成功.");
						$("#insertimgdiv").empty();
						$("#xyzpdiv").append("<span zpid=\"" + zpid + "\" style=\"margin: 5px;cursor: pointer;background: #CCCCCC\"><img YCFWZP=\"1\" width=\"140\" height=\"170\" src=\"" + contextPath + "/lsgl/rk/showRkzpImage.action?queryBean.zpid=" + zpid + "\"/></span>");
						$("#xyzpdiv").find("span:last").click(function(){
							clickShowRkzp(zpid);
						});
					}
					else
					{
						alert("获取远程服务照片失败，照片可能不存在。");
					}
			}
		});
	}
	else
	{
		alert("远程服务照片已经存在无需再次保存.");
	}
}

function clickShowRkzp(zpid)
{
	$("#insertimgdiv").empty();
	$("#insertimgdiv").append("<img id=\"insertimg\" width=\"100%\" height=\"98%\" src=\"" + contextPath + "/lsgl/rk/showRkzpImage.action?queryBean.zpid=" + zpid + "\"/>");
	$("#zpid").val(zpid);
}

function deleteRkzpxxBean()
{
	var zpid = $("#zpid").val();
	if (zpid != null && zpid != "")
	{
		$.ajax({
			type : "post",
			dataType : "json",
			url : contextPath + "/rk/rxgl/deleteRkzpImage.action",
			data : 
			{
				zpid : zpid	
			},
			success : function(result)
			{
				if (result==true)
				{
					alert("删除照片信息成功.");
					$("#xyzpdiv").find("span[zpid='" + zpid + "']").remove();
					$("#insertimgdiv").empty();
				}
				else
				{
					alert("删除照片信息失败.")
				}
			}
		});
	}
	else
	{
		alert("请选择要删除的照片.");
	}
}
var index = null;
$(function(){
	var button = $('#bdzpcs');
	new AjaxUpload(button, {
			action: contextPath + '/rk/rxgl/uploadFile.action', 
			name: 'uploads',
			autoSubmit : true,
			responseType: "json",
			onSubmit : function(file, ext){
				if(ext && /^(jpg|png|jpeg|gif|bmp|jpeg)$/.test(ext.toLowerCase()))
				{
					index = layer.load(0);
					return true;
				}
				else
				{
					alert("只能上传格式为*.jpg;*.png;*.gif;*.jpeg;*.bmp的图片.");
					return false;
				}
			},
			onComplete: function(file, serverDataStr)
			{
				if (serverDataStr == "sizeisnull")
				{
					alert("图片文件大小为空不能进行上传");
				}
				else if (serverDataStr == "updateerror")
				{
					alert("文件上传时候发生错误,请稍后再试.");
				}
				else if (serverDataStr != null && serverDataStr != "")
		    	{
		    		var serverData = eval("(" + serverDataStr + ")");
		    		$("#ycfwzp").val("0");
		    		$("#insertimgdiv").empty();
		    		$("#insertimgdiv").append("<img id='insertimg' src='" +serverData["tempAccessPath"] + "'/>");
		    		$("#saveFileName").val(serverData["saveFileName"]);
		    		$("#insertimg").Jcrop({
						aspectRatio: 0.8,
						onSelect:updateCoords,
						boxWidth: 400,
	    				boxHeight: 400
					});
		    	}
		    	layer.close(index);  
			}
		});
	
});

