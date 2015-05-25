function czRowCallback(trObj, rowDataObj)
{
    var bh = $("#bh").val();
	var result = "";
	result += "<span onclick=\"add('update','"+bh+"','" + rowDataObj["bh"] + "')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;";
	result += "<span onclick=\"deletehbgz('" + rowDataObj["bh"] + "')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;";
	return result;
}

function submitSave(){
	if ($.validateform("hbgzform"))
	{
		$("#hbgzform").ajaxSubmit({
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


function SaveAndyhr(){
	if ($.validateform("hbgzform"))
	{
		$("#hbgzform").ajaxSubmit({
			success : function(bh)
			{
			   if(res){
				window.location.href=contextPath + "/qzgl/hbgzgl/tohbgzCyr.action?bh="+eval(bh)+"&t="+new Date().getTime();
				}
			}
		});
	}
}
function OpenWin(bh){
	$.openDialogWindow({
		url : contextPath + "/qzgl/hbgzgl/tohbgzCyr.action",
		data : {bh:bh,t:new Date().getTime()},
		width : 900,
		height : 450
	});
}
function addCyrxx() {
	if ($.validateform("hbgzcyrform"))
	{
		$("#hbgzcyrform").ajaxSubmit({
			success : function()
			{
				alert("新增成功！");
				$("#xm").val("");
				$("#lxdh").val("");
				$("#dwmc").val("");
				$("#zw").val("");
				jxquery();
			}
		});
	}
}

function jxquery(){
	$("#cyrlist").query("","");
}

function deleteInfoByBh(bh,bgbh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/hbgzgl/deleteHbgzYhr.action",
			data : "cyrbh=" + bh + "&bh=" + bgbh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					jxquery();
				}
			}
		});
	}
}

function add(operType,bh,cyrbh){
	$.openDialogWindow({
		url : contextPath + "/qzgl/hbgzgl/tohbgzCyr.action",
		data : {"operType":operType,"bh" : bh ,"cyrbh":cyrbh,t:new Date().getTime()},
		width : 600,
		height : 300,
		callback : function()
		{
				jxqueryhbgz();
		}
	});
}
function jxqueryhbgz(){
	$("#cyrlist").query("F","hbgzform");
}
function deletehbgz(obj){
	$("#zcTable tr:eq("+obj+")").remove(); 
}
function savehbgz(){
	if ($.validateform("hbgzform"))
	{
		$("#hbgzform").ajaxSubmit({
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
function deletehbgzxx(obj,bh){
		if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/hbgzgl/deletehbgzyhrxx.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					deletehbgz(obj);
				}
			}
		});
	}
}

function deletehbgz(bh){
	if (confirm("你确定要删除该信息吗？"))
	{
		$.ajax({
			url : contextPath + "/qzgl/hbgzgl/deleteHbgzyhr.action",
			data : "bh=" + bh,
			dataType : "json",
			success : function(res)
			{
				if (res)
				{
					alert("成功删除该汇报工作相关信息.");
					jxqueryhbgz();
				}
			}
		});
	}
}

/**var i = ${size};
function add(operType){
 	$.openDialogWindow({
		url : contextPath + "/qzgl/hbgzgl/tohbgzCyr.action",
		data : {operType:operType,t:new Date().getTime()},
		width : 700,
		height : 300,
		callback : function(cyrxx)
		{
			if(cyrxx) 
			{
				var json = eval(cyrxx);
				var zcTableHtml = "<tr>";
				zcTableHtml += "<td align='center'>"+cyrxx.xm+"<input type='hidden' value='"+cyrxx.xm+"' name='bean.yhrList["+i+"].xm'/></td>";
				zcTableHtml += "<td align='center'>"+cyrxx.lxdh+"<input type='hidden' value='"+cyrxx.lxdh+"' name='bean.yhrList["+i+"].lxdh'/></td>";
				zcTableHtml += "<td align='center'>"+cyrxx.dwmc+"<input type='hidden' value='"+cyrxx.dwmc+"' name='bean.yhrList["+i+"].dwmc'/></td>";
				zcTableHtml += "<td align='center'>"+cyrxx.zw+"<input type='hidden' value='"+cyrxx.zw+"' name='bean.yhrList["+i+"].zw'/></td>";
				zcTableHtml += "<td align='center'><a href='javascript:void(0);' onclick='deletehbgz(this.parentElement.parentElement.rowIndex)'>删除</a><input type='hidden' value='"+cyrxx.operType+"' name='bean.yhrList["+i+"].operType' /></td>";
				zcTableHtml += "</tr>";
				$("#zcListTh").append(zcTableHtml);
				i = i+1;
			}
		}
	});	
}**/
 function save(){
	 	if ($.validateform("hbgzcyrform"))
	{
		$("#hbgzcyrform").ajaxSubmit({
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
/**function save(operType){
       var xm = $("#xm").val();
	   var lxdh = $("#lxdh").val();
       var dwmc = $("#dwmc").val();
       var zw = $("#zw").val();
	   var objArr = {"xm":xm, "lxdh":lxdh, "dwmc":dwmc,"zw":zw,"operType":operType};
	   window.returnValue = objArr;
	   window.close();
	   
}	*/
 
function resethbgz(){
	$("#bggzzt").val("");
	$("#zcrxm").val("");
	$("#zcrlxdh").val("");
	$("#bgsj").val("");
	$("#bggzdd").val("");
	$("#bgnr").val("");
	$("#qzjy").val("");
	$("#fj").val("");
}