// 统计
function querynbdwfatj(){
	var queryData = $("#queryNbdwfatjForm").serialize();
	$.ajax({
		type:"POST",
		data: queryData,
		url: contextPath + "/nbgl/fatj/queryNbdwfaTjList.action",
		success:function(datas){
			var jsonObj = eval("("+datas+")");
			var html = "" ;
			var num = 0 ;
			html = html + "<table  class=\"cps-table-list\"  style=\"width: 100%;\" border=\"0\" cellSpacing=\"0\" cellPadding=\"0\">" ;
			html = html + "<tbody>";
			html = html + "<tr > <th style=\"text-align: center;\"  rowspan=\"2\" >案件类别</th>" ;
			html = html + "<th style=\"text-align: center;\"  colspan=\"4\" >&nbsp;盗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;窃&nbsp;</th>" ;
			html = html + "<th  style=\"text-align: center;\"   rowspan=\"2\" >抢劫</th>" ;
			html = html + "<th  style=\"text-align: center;\"  rowspan=\"2\" >抢夺</th>" ;
			html = html + "<th  style=\"text-align: center;\"  rowspan=\"2\" >电信诈骗</th>" ;
			html = html + "<th  style=\"text-align: center;\"  rowspan=\"2\" >合计</th></tr>" ;
			html = html + "<tr > <th style=\"text-align: center;\"   >扒窃</th>";
			html = html + "<th  style=\"text-align: center;\" >其他盗窃</th>" ;
			html = html + "<th  style=\"text-align: center;\" >其他入室盗窃</th>" ;
			html = html + "<th style=\"text-align: center;\" >入户盗窃</th></tr>" ;  
			$.each(jsonObj,function(i,item){
			if(item.djdwdm.substr(8,2)=='31' && item.djdwdm.substr(9,2) >= '01'  &&  item.djdwdm.substr(9,2)<='99'){
				html = html + "<tr > <td align=\"center\" >"+item.djdwmc+ "</td>" ;
			}else{
				html = html + "<tr > <td align=\"center\"  >"+"<span onclick=\"drillNbdwtj('" + item.djdwdm + "')\" style=\"color:green\" class=\"cps_span_href\">"+item.djdwmc+"</span>&nbsp;"+ "</td>" ;
			}
				html = html + "<td  align=\"center\"  >" + item.pqsl+ "</td>" ;
				html = html + "<td  align=\"center\"  >" + item.qtdqsl+ "</td>" ;
				html = html + "<td  align=\"center\"  >" + item.qtrsdqsl+ "</td>" ;
				html = html + "<td  align=\"center\"   >" + item.rhdqsl+ "</td>" ;
				html = html + "<td  align=\"center\"   >" + item.qjsl+ "</td>" ;
				html = html + "<td  align=\"center\"   >" + item.qdsl+ "</td>" ;
				html = html + "<td  align=\"center\"  >" + item.dxzpsl+ "</td>" ;
				html = html + "<td  align=\"center\"   >" + item.hjsl+ "</td>" ;
				num = num + 1 ;
			});
			html = html + "</tr></tbody></table>";
			$("#tjjgdiv").html('') ;
			$("#tjjgdiv").html(html) ;
			$("#snum").val(num);
			if(num == 0){
				$("#tjjgdiv").html('') ;
			}
		},
		error:function(){
			alert('系统错误！')
		}
	});
}
// 下钻
function drillNbdwtj(djdwdm){
	$("#djdwdm").val(djdwdm);
	querynbdwfatj();
}
// 导出
function toExportExcelnbdwfatj(){
	var ins = $("#snum").val() ;
	if(ins == 0){
		alert("没有结果可以导出");
		return false ;
	}
	$("#queryNbdwfatjForm").attr("target","exportiframe");
	$("#queryNbdwfatjForm").attr("action",contextPath + "/nbgl/fatj/toExportExcelNbdwfatjInfoPage.action");
	$("#queryNbdwfatjForm").submit();
}
// 返回
function rowBackNbdwfatj(){
	var _djdwdm = $("#djdwdm").val();
	if(getOrgcodeLeve(_djdwdm) == '1'){
		querynbdwfatj(); // 市局
	}else if(getOrgcodeLeve(_djdwdm) == '2'){
		$("#djdwdm").val(_djdwdm.substr(0,4)+'00000000');
		querynbdwfatj(); // 分县局返回市局
	}else if(getOrgcodeLeve(_djdwdm) == '3'){
		$("#djdwdm").val(_djdwdm.substr(0,6)+'000000');
		querynbdwfatj(); // 派出所返回分县局
	}else if(getOrgcodeLeve(_djdwdm) == '4'){
		$("#djdwdm").val(_djdwdm.substr(0,8)+'0000');
		querynbdwfatj(); // 警务区返回派出所
	}
}

// 获取单位级别函数 （市局1 ，分县局 2 ，派出所 3 ， 警务区 4）
function getOrgcodeLeve(orgcode){
	var _orgcode = String(orgcode);
	
	if(_orgcode.substr(4,8)=='00000000'){
		return '1' ;
	}else if(_orgcode.substr(4,2) != '00' && _orgcode.substr(6,6) == '000000'){
		return '2' ;
	}else if(_orgcode.substr(4,2) != '00' && _orgcode.substr(6,2) != '00' && _orgcode.substr(8,4) == '0000'){
		return '3' ;
	}else if(_orgcode.substr(4,2) != '00' && _orgcode.substr(6,2) != '00' && _orgcode.substr(8,4) != '0000'){
		return '4' ;
	}
	
}