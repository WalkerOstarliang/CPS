function queryData(){
	$("#tzmbxzItem").query("F","tzmbxzForm");
}

function scmb(){
	url = contextPath +"/gzgl/gztzgl/toScmbPage.action";
	$.openDialogWindow({
		url : url,
		width : 700,
		height : 400,
		callback : function(){
				queryData();
			
		}
	});
}

function submitFormTzmbInfo(){
	var tzmbUploads=$("#tzmbUploads").val();
	if ($.validateform("tzmbForm"))
	{
		if(tzmbUploads!=""){
		$("#tzmbForm").ajaxSubmit({
			url : contextPath + "/gzgl/gztzgl/saveTzmbxx.action",
			type : "post",
			dataType : "json",
			success :function(result)
			{
				if (result)
				{
					alert("数据保存成功");
					window.close();
					
				}
				else
				{
					alert("数据保存失败.");
				}
			}
		});
		}else{
			alert("请选择文件");
		}
	}
}

function downloadFjxx(bh){
	window.location= contextPath + "/gzgl/gztzgl/downloadFjxx.action?id="+bh;
}


function addFjscTr(){
	var htmldata="";
    htmldata+= "<tr class='fjscmode'>";
   	htmldata+="<td><input type='file' name='tzmbUploads' class='cps-file'/></td>";
    htmldata+="<td><button type='button' value='删除' onclick='deleteFjscTr(this)' class='cps-btn' title='删除'><span><em>删除</em></span></button></td>";
    htmldata+="</tr>";
	var trobj = $("#tzmbtable").find("tr:last");
	$("#tzmbtable").find("tr:last").after(htmldata);
	
}

function deleteFjscTr(obj,id){
	if (!$.isBlank(id))
	{
		
		$.ajax({
			url : contextPath + "/gzgl/gztzgl/deleteTzmbxx.action",
			data : {"id" : id},
			dataType : "json",
			success : function(result)
			{
				if(result){
				  alert("删除成功！");
				  queryData();
				  }else{
				  	alert("删除失败！");
				  }
			}
		});
		
	}
	else
	{
				$(obj).parent().parent().remove();
	}
}

function deletecallback(trObj,rowdataobj){
	var html = "";
	html += "<span onclick=\"deleteFjscTr('"+trObj+"','" + rowdataobj["id"] + "')\" style=\"color:green\"  class=\"cps_span_href\">删除</span>&nbsp;";
	return html;
}

function downloadcallback(trObj,rowdataobj){
	var html = "";
	wjm = encodeURIComponent(rowdataobj["tzmc"])
	html +="<span onclick=\"dbFileDown('t_gzgl_tzmb','id','tzmb','"+ rowdataobj["id"]+"','"+ wjm +"')\"  style=\"color:green\"  class=\"cps_span_href\">下载</span>";
	return html;
}