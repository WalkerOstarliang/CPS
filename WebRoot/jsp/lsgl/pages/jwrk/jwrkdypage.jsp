<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--   
  //独立打开excel软件   
  response.setHeader("Content-disposition","attachment; filename=jwrkjbxx.doc");   
//嵌套在ie里打开excel   
//response.setHeader("Content-disposition","inline; filename="MyExcel.xls");   
//Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
--%>  
<creator:view width="99.8%">
	<creator:Script src="/template/default/js/jquery-1.6.min.js"></creator:Script>
	<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
	<creator:Script src="/jsp/common/js/jquery.PrintArea.js"></creator:Script>
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
	 <style type="text/css">
	 /* Font Definitions */
	 @font-face
		{font-family:宋体;
		panose-1:2 1 6 0 3 1 1 1 1 1;}
	@font-face
		{font-family:黑体;
		panose-1:2 1 6 0 3 1 1 1 1 1;}
	@font-face
		{font-family:"\@宋体";
		panose-1:2 1 6 0 3 1 1 1 1 1;}
	@font-face
		{font-family:"\@黑体";
		panose-1:2 1 6 0 3 1 1 1 1 1;}
	@font-face
		{font-family:仿宋_GB2312;
		panose-1:2 1 6 9 3 1 1 1 1 1;}
	@font-face
		{font-family:"\@仿宋_GB2312";
		panose-1:2 1 6 9 3 1 1 1 1 1;}
	@font-face
		{font-family:Calibri;
		panose-1:2 15 5 2 2 2 4 3 2 4;}
	 /* Style Definitions */
	 p.MsoNormal, li.MsoNormal, div.MsoNormal
		{margin:0cm;
		margin-bottom:.0001pt;
		text-align:justify;
		text-justify:inter-ideograph;
		font-size:10.5pt;
		font-family:Calibri;}
	p.MsoHeader, li.MsoHeader, div.MsoHeader
		{margin:0cm;
		margin-bottom:.0001pt;
		text-align:justify;
		text-justify:inter-ideograph;
		layout-grid-mode:char;
		border:none;
		padding:0cm;
		font-size:9.0pt;
		font-family:"Times New Roman";}
	p.MsoFooter, li.MsoFooter, div.MsoFooter
		{margin:0cm;
		margin-bottom:.0001pt;
		layout-grid-mode:char;
		font-size:9.0pt;
		font-family:Calibri;}
	 /* Page Definitions */
	 @page Section1
		{size:595.3pt 841.9pt;
		margin:72.0pt 90.0pt 72.0pt 90.0pt;
		layout-grid:15.6pt;}
	div.Section1
		{page:Section1;}
	</style>
	<script type="text/javascript">
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
	function dypage()
	{
		PageSetup_Null();
 		document.all.WebBrowser.ExecWB(6,6);
 		window.close();
	}
	$(function(){
		if (confirm("是否要直接打印页面?"))
		{
 			PageSetup_Null();
 			document.all.WebBrowser.ExecWB(6,6);
 			window.close();
 		}
 	});
	</script>
	<object id="WebBrowser" width="10" height="10" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>
	<center>
	<div class="Noprint" style="text-align:left;width:80%">
		<cps:button value="打印" onclick="dypage()"/>
		<hr/>
	</div>
	<div class="PageNext" style="layout-grid:15.6pt;" >
		<table class="MsoNormalTable border="0 cellspacing="0 cellpadding="0
		 style="border-collapse:collapse">
		 <tr style="height:22.5pt">
		  <td width="639" colspan="6" style="width:479.2pt;padding:0cm 5.4pt 0cm 5.4pt;
		  height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center">
		  <b>
		  <span style="font-size:18.0pt;font-family:黑体">境外人员信息采集表</span>
		  </b>
		  </p>
		  </td>
		 </tr>
		<tr style='height:22.5pt'>
		  <td width="639" colspan="6" style="width:479.2pt;border:none;border-bottom:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal"><u><span lang="EN-US" style='font-size:12.0pt;font-family:
		  宋体'>&nbsp;&nbsp;&nbsp;${loginInfo.ssgajgjgjc}&nbsp;&nbsp;&nbsp; </span></u><span
		  style='font-size:12.0pt;font-family:宋体'>分（县、市）局<u><span lang="EN-US" style='font-size:12.0pt;font-family:
		  宋体'>&nbsp;&nbsp;&nbsp;${loginInfo.pcsjc}&nbsp;&nbsp;&nbsp;
		  </span></u>派出所<u><span lang="EN-US" style='font-size:12.0pt;font-family:
		  宋体'>&nbsp;&nbsp;&nbsp;${loginInfo.jwsqjc}&nbsp;&nbsp;&nbsp;
		  </span></u>社区<span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </span></span></p>
		  </td>
		 </tr>
		 <tr style="height:36.75pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">英文姓名<span lang="EN-US">*</span></span></p>
		  </td>
		  <td width="493" colspan="4" style="width:370.1pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt;">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:10.0pt;font-family:仿宋_GB2312">&nbsp;&nbsp;&nbsp;${jwrkBean.ywm}.${jwrkBean.ywx}</span></p>
		  </td>
		 </tr>
		 <tr style="height:36.75pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">中文姓名</span></p>
		  </td>
		  <td width="107" style="width:80.4pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US"
		  style="font-size:10.0pt;font-family:仿宋_GB2312">${jwrkBean.zwm}</span></p>
		  </td>
		  <td width="127" style="width:95.4pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">国家或地区<span lang="EN-US">*</span></span></p>
		  </td>
		  <td width="259" colspan="2" style="width:194.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US"
		  style="font-size:10.0pt;font-family:仿宋_GB2312">${jwrkBean.gjms}</span></p>
		  </td>
		 </tr>
		 <tr style="height:36.75pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">性别<span lang="EN-US">*</span></span></p>
		  </td>
		  <td width="107" style="width:80.4pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">
		   <c:choose>
		  	<c:when test="${jwrkBean.xb == '1'}">
		  		男●&nbsp;
		  	</c:when>
		  	<c:otherwise>
		  		男○<br>
		  	</c:otherwise>
		  </c:choose>
		   <c:choose>
		  	<c:when test="${jwrkBean.xb == '2'}">
		  		女●
		  	</c:when>
		  	<c:otherwise>
		  		女○
		  	</c:otherwise>
		  </c:choose>
		 </span>
		  </p>
		  </td>
		  <td width="386" colspan="3" style="width:289.7pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal"><span lang="EN-US" style="font-size:10.0pt;font-family:仿宋_GB2312">
		  </span><span style="font-size:10.0pt;font-family:仿宋_GB2312">
		  <c:choose>
		  	<c:when test="${jwrkBean.jwrylx == '0'}">
		  		 ■常住（居住6个月以上）□临住
		  	</c:when>
		  	<c:otherwise>
		  		 □常住（居住6个月以上）■临住
		  	</c:otherwise>
		  </c:choose>
		  </span></p>
		  </td>
		 </tr>
		 <tr style="height:28.5pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:28.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">出生日期<span lang="EN-US">*</span></span></p>
		  </td>
		  <td width="493" colspan="4" style="width:370.1pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:28.5pt">
		  <p class="MsoNormal"><span style="font-size:10.0pt;
		  font-family:仿宋_GB2312">&nbsp;&nbsp; ${jwrkBean.csrq}</span></p>
		  </td>
		 </tr>
		 <tr style="height:25.5pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:25.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">联系电话</span></p>
		  </td>
		  <td width="493" colspan="4" style="width:370.1pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:25.5pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:10.0pt;font-family:仿宋_GB2312">&nbsp;&nbsp;&nbsp;${jwrkBean.lxdh}</span></p>
		  </td>
		 </tr>
		 <tr style="height:30.0pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">所持证件种类<span lang="EN-US">*</span></span></p>
		  </td>
		  <td width="493" colspan="4" style="width:370.1pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 0pt 0cm 0pt;height:30.0pt">
		  <p class="MsoNormal>
		  <span style="font-size:10.0pt;font-family:仿宋_GB2312" style="text-align:left">
		  &nbsp;&nbsp;&nbsp;
		  <c:choose>
		  	<c:when test="${(jwrkBean.zjzl == '213') 
		  					|| (jwrkBean.zjzl == '211')
		  					|| (jwrkBean.zjzl == '214')
		  					|| (jwrkBean.zjzl == '270')
		  					|| (jwrkBean.zjzl == '212')
		  					|| (jwrkBean.zjzl == '271') }">
		  		●护照
		  	</c:when>
		  	<c:otherwise>
		  		○护照
		  	</c:otherwise>
		  </c:choose>
		  <c:choose>
		  	<c:when test="${jwrkBean.zjzl == '221'}">
		  		●港澳居民通行证
		  	</c:when>
		  	<c:otherwise>
		  		○港澳居民通行证
		  	</c:otherwise>
		  </c:choose>
		  <c:choose>
		  	<c:when test="${jwrkBean.zjzl == '216'}">
		  		●台胞证
		  	</c:when>
		  	<c:otherwise>
		  		○台胞证
		  	</c:otherwise>
		  </c:choose>
		  <c:choose>
		  	<c:when test="${jwrkBean.zjzl == '111'
		  					||jwrkBean.zjzl == '215'
		  					||jwrkBean.zjzl == '230'
		  					||jwrkBean.zjzl == '990'}">
		  		●其它
		  	</c:when>
		  	<c:otherwise>
		  		○其它
		  	</c:otherwise>
		  </c:choose>
		  </span>
		  </p>
		  <p class="MsoNormal align="center" style="text-align:center"><span lang="EN-US"
		  style="font-size:10.0pt;font-family:仿宋_GB2312">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:28.5pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:28.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">所持证件号码</span><span lang="EN-US">*</span></span></p>
		  </td>
		  <td width="493" colspan="4" style="width:370.1pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:28.5pt">
		  <p class="MsoNormal"><span lang="EN-US" style="font-size:10.0pt;font-family:仿宋_GB2312">&nbsp;&nbsp;&nbsp;${jwrkBean.zjhm}</span></p>
		  </td>
		 </tr>
		 <tr style="height:36.75pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">居住地址<span lang="EN-US">*</span></span></p>
		  </td>
		  <td width="493" colspan="4" style="width:370.1pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:36.75pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:10.0pt;font-family:仿宋_GB2312">&nbsp;&nbsp;&nbsp;${jwrkBean.xzzxz}</span></p>
		  </td>
		 </tr>
		 <tr style="height:34.5pt">
		  <td width="145" colspan="2" style="width:109.1pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">备注</span></p>
		  </td>
		  <td width="493" colspan="4" style="width:370.1pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:34.5pt">
		  <p class="MsoNormal"><span lang="EN-US" style="font-size:10.0pt;font-family:仿宋_GB2312">&nbsp;&nbsp;&nbsp;${jwrkBean.bz}</span></p>
		  </td>
		 </tr>
		 <tr style="height:15.0pt">
		  <td width="43" style="width:32.25pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
		  height:15.0pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:12.0pt;font-family:宋体">&nbsp;</span></p>
		  </td>
		  <td width="210" colspan="2" style="width:157.25pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
		  height:15.0pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span style="font-size:
		  12.0pt;font-family:仿宋_GB2312">申报人（代办人）签名：</span></p>
		  </td>
		  <td width="127" style="width:95.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
		  height:15.0pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:12.0pt;font-family:仿宋_GB2312">&nbsp;</span></p>
		  </td>
		  <td width="104" style="width:77.75pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
		  height:15.0pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:12.0pt;font-family:仿宋_GB2312">&nbsp;</span></p>
		  </td>
		  <td width="155" style="width:116.55pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
		  height:15.0pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US"
		  style="font-size:12.0pt;font-family:仿宋_GB2312">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:14.25pt">
		  <td width="43" style="width:32.25pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:12.0pt;font-family:宋体">&nbsp;</span></p>
		  </td>
		  <td width="210" colspan="2" style="width:157.25pt;padding:0cm 5.4pt 0cm 5.4pt;
		  height:14.25pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:10.0pt;font-family:仿宋_GB2312">*</span><span
		  style="font-size:10.0pt;font-family:仿宋_GB2312">为必须录入项目</span></p>
		  </td>
		  <td width="127" style="width:95.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US"
		  style="font-size:12.0pt;font-family:仿宋_GB2312">&nbsp;</span></p>
		  </td>
		  <td width="104" style="width:77.75pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span style="font-size:
		  12.0pt;font-family:仿宋_GB2312">填报日期：</span></p>
		  </td>
		  <td width="155" style="width:116.55pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		   lang="EN-US" style="font-size:12.0pt;font-family:仿宋_GB2312">${nowDate}</span></p>
		  </td>
		 </tr>
		 <tr height="0">
		  <td width="43" style="border:none"></td>
		  <td width="102" style="border:none"></td>
		  <td width="107" style="border:none"></td>
		  <td width="127" style="border:none"></td>
		  <td width="104" style="border:none"></td>
		  <td width="155" style="border:none"></td>
		 </tr>
		</table>
		<p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
	</div>
	</center>
</creator:view>