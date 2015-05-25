﻿<%@page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/template/default/js/jquery-1.6.min.js"></creator:Script>
<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
<creator:Script src="/jsp/common/js/jquery.PrintArea.js"></creator:Script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<title>居住证批量打印</title>
<head>
	<style type="text/css">
		html 
		{ 
		 	-webkit-text-size-adjust:none 
		 }
		 div
		 {
		 	font-weight: bold;
		 }
	</style>
	<style type="text/css" media="print">
		.Noprint
		{
			display:none;
		} 
		.PageNext
		{
			page-break-after: always;
		} 
	</style>
	
	<script type="text/javascript">
		var contextPath = "${contextPath}";
		function afterPrint()
		{
			var jzzbhs = "${jzzbhs}";
			var rybhs = "${rybhs}";
			var dyzt = "${dyzt}";
			$.ajax({
				url: contextPath+"/lsgl/jzzxx/jzzBatchPrint.action",
				type:"post",
				dataType:"json",
				data:{
					"rybhs":rybhs,
					"jzzbhs":jzzbhs,
					"dyzt":dyzt
				},
				success:function()
				{
				}
			});
		}
	
		var HKEY_Root,HKEY_Path,HKEY_Key; 
		HKEY_Root= "HKEY_CURRENT_USER"; 
		HKEY_Path= "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"; 
		//设置网页打印的页眉页脚为空 
		function PageSetup_Null() 
		{ 
			try 
			{ 
				var Wsh=new ActiveXObject("WScript.Shell"); 
				HKEY_Key="header"; 
				Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
				HKEY_Key="footer"; 
				Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
			} 
			catch(e)
			{
				alert("打印控件被禁用,请先启用控件.");
			} 
		} 
		
		var autoprint = false;
		//系统打印函数
		function printActivi()
		{
			document.all.WebBrowser.ExecWB(6,6)
		}
		//系统打印设置
		function printSet()
		{
			document.all.WebBrowser.ExecWB(8,1)
		}
	 	
	 	//打印预览
	 	function printView()
	 	{
	 		document.all.WebBrowser.ExecWB(7,1)
	 	}
	 	
	 	$(function(){
	 		PageSetup_Null();
	 		document.all.WebBrowser.ExecWB(6,6);
	 		afterPrint();
	 		window.close();
	 	});
	</script> 
	
</head>
<body style="margin: 0px;padding: 0px" >
<object id="WebBrowser" width="0" height="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>
<c:forEach items="${jzzList}" var="jzz" varStatus="st">
	<div id="maxDiv" class="${st.last == false?'PageNext':''}" style="width: 310px;height: 192px;background-color:#FFFFFF;border: 0px solid red;" >
		<div style="width:309px;border: 0px solid red;">
			<div style="float: left;width: 190px;">
				<div style="height:20px;padding-left: 64px;"></div>
				<div style="font-family: 黑体;font-size: 12px;font-weight: normal;height:24px;padding-left: 64px;padding-top: 2px;">${jzz.jbxxBean.xm}</div>
				<div style="height:22px;padding-left: 64px;">
					<div  style="font-family: 黑体;font-size: 12px;font-weight: normal;float: left;padding-top: 5px;">${jzz.jbxxBean.xbms}</div>
					<div  style="font-family: 黑体;font-size: 12px;font-weight: normal;text-align:left; padding-left:60px;padding-top: 5px;" >${jzz.jbxxBean.mzms}</div>
				</div>
				<div style="font-family: 黑体;font-size: 12px;font-weight: normal;height:23px;padding-left: 92px;padding-top: 7px;">${jzz.jbxxBean.sfzh}</div>
				<div style="font-family: 黑体;font-size: 12px;font-weight: normal;height:24px;padding-left: 64px; width: 100%">
					<div style="font-family: 黑体;font-size: 12px;font-weight: normal;float: left;padding-top: 9px;padding-left: 5px;">${jzz.year}</div>
					<div style="font-family: 黑体;font-size: 12px;font-weight: normal;float: right;padding-right: 33px;padding-top: 9px;">${jzz.day}</div>
					<div style="font-family: 黑体;font-size: 12px;font-weight: normal;float: right;margin-right: 22px;padding-top: 9px;  ">${jzz.month}</div>
				</div>
				<div style="height:34px;padding-left: 83px;padding-top: 10px;font-family: 黑体;font-size: 12px;font-weight: normal;">${jzz.jzzBean.yxqxms}</div>
			</div>
			<div style="padding: 10px;float: right; padding-top: 35px; ">
				<img border="0" id="zpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${jzz.jbxxBean.sfzh}" width="80px" height="97px" title="全国人口库照片" alt="全国人口库照片" />
			</div>
		</div>
		<div style="height:20px;width: 309px;padding-left: 70px;padding-top: 5px;border: 0px solid red;font-family: 黑体;font-size: 10px;font-weight: normal;">${jzz.jbxxBean.hjdxz}</div>
		<div style="height:25px;width: 309px;padding-left: 70px;padding-top: 3px;border: 0px solid red;font-family: 黑体;font-size: 10px;font-weight: normal;">${jzz.jzzBean.xzzxz}</div>
	</div>
</c:forEach>
</body>
</html>





