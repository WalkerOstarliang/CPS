<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
		{font-family:"\@黑体";
		panose-1:2 1 6 0 3 1 1 1 1 1;}
	@font-face
		{font-family:"\@宋体";
		panose-1:2 1 6 0 3 1 1 1 1 1;}
	 /* Style Definitions */
	 p.MsoNormal, li.MsoNormal, div.MsoNormal
		{margin:0cm;
		margin-bottom:.0001pt;
		text-align:justify;
		text-justify:inter-ideograph;
		font-size:10.5pt;
		font-family:"Times New Roman";}
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
<div class="Noprint" style="text-align: left;width:80%">
	<cps:button value="打印" onclick="dypage()"></cps:button>
	<hr/>
</div>
<div style="width:100%;">
<c:forEach items="${rkBeans}" var="rkBean">
	<div class="PageNext" style="layout-grid:15.6pt;">
		<table class="MsoTableGrid" border="1" cellspacing="0" cellpadding="0" width="649"
		 style="width:486.85pt;margin-left:-21.6pt;border-collapse:collapse;border:
		 none">
		 <tr style="height:31.0pt">
		  <td width="649" colspan="15" style="width:486.75pt;border:none;border-bottom:
		  solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.0pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><b><span
		  style="font-size:22.0pt;font-family:黑体">流动人口基本信息表</span></b></p>
		  </td>
		 </tr>
		 <tr style="height:22.5pt">
		  <td width="48" rowspan="6" style="width:36.05pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span style="font-family:宋体">基</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span style="font-family:宋体">本</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span style="font-family:宋体">情</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span  style="font-family:宋体">况</span></p>
		  </td>
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  	<p class="MsoNormal" align="center" style="text-align:center"><span style="font-family:宋体">姓名</span></p>
		  </td>
		  <td width="72" colspan="2" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" style="margin-left:-5.35pt;text-indent:5.25pt"><span
		  style="font-family:宋体">${rkBean.jbxxBean.xm}</span></p>
		  </td>
		  <td width="72" colspan="2" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">性别</span></p>
		  </td>
		  <td width="84" style="width:63.1pt;border-top:none;border-left:none;border-bottom:
		  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
		  height:22.5pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.xbms}</span></p>
		  </td>
		  <td width="72" colspan="2" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">民族</span></p>
		  </td>
		  <td width="72" colspan="4" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.mzms}</span></p>
		  </td>
		  <td width="120" colspan="2" rowspan="4" style="width:90.15pt;border-top:none;
		  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">
		  <img width="105" height="130" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${rkBean.jbxxBean.sfzh}"></span></p>
		  </td>
		 </tr>
		 <tr style="height:23.5pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">曾用名</span></p>
		  </td>
		  <td width="72" colspan="2" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.5pt">
		  <p class="MsoNormal" align="left" style="text-align:left"><span lang="EN-US">${rkBean.jbxxBean.bmch}</span></p>
		  </td>
		  <td width="72" colspan="2" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.5pt">
		  <p class="MsoNormal"><span style="font-family:宋体">出生日期</span></p>
		  </td>
		  <td width="228" colspan="7" style="width:171.25pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.5pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.csrq}</span></p>
		  </td>
		 </tr>
		 <tr style="height:22.4pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">身份证号</span></p>
		  </td>
		  <td width="228" colspan="5" style="width:171.25pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.jbxxBean.sfzh}</span></p>
		  </td>
		  <td width="72" colspan="2" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt">
		  <p class="MsoNormal"><span style="font-family:宋体">婚姻状况</span></p>
		  </td>
		  <td width="72" colspan="4" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.hyzkms}</span></p>
		  </td>
		 </tr>
		 <tr style="height:22.65pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.65pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">户口详址</span></p>
		  </td>
		  <td width="373" colspan="11" style="width:279.45pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.65pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.hjdxz}</span></p>
		  </td>
		 </tr>
		 <tr style="height:22.95pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.95pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">籍贯</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.95pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.hjdqhmc}</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.95pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">出生地</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.95pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.hjdqhmc}</span></p>
		  </td>
		 </tr>
		 <tr style="height:21.85pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">文化程度</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.whcdms}</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">宗教信仰</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.zzxyms}</span></p>
		  </td>
		 </tr>
		 <tr style="height:22.5pt">
		  <td width="48" rowspan="9" style="width:36.05pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">居</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">住</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">情</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">况</span></p>
		  </td>
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">居住事由</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.ldrkBean.zzsyms}</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">来本地日期</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.lbdrq}</span></p>
		  </td>
		 </tr>
		 <tr style="height:23.45pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">居住处所</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.ldrkBean.zzcsms}</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">联系电话</span></p>
		  </td>
		  <td width="84" colspan="3" style="width:63.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.jbxxBean.lxdh}</span></p>
		  </td>
		  <td width="72" colspan="4" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">电话备注</span></p>
		  </td>
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.jbxxBean.lxdhbz}</span></p>
		  </td>
		 </tr>
		 <tr style="height:21.65pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.65pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">居住地址</span></p>
		  </td>
		  <td width="493" colspan="13" style="width:369.55pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.65pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.jbxxBean.xzzxz}</span></p>
		  </td>
		 </tr>
		 <tr style="height:23.35pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">居住证号</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.zzzbh}</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">发证日期</span></p>
		  </td>
		  <td width="84" colspan="3" style="width:63.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.zzzqfrq}</span></p>
		  </td>
		  <td width="72" colspan="4" style="width:54.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">有效期限</span></p>
		  </td>
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.njzqxms}</span></p>
		  </td>
		 </tr>
		 <tr style="height:22.95pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.95pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">服务处所</span></p>
		  </td>
		  <td width="493" colspan="13" style="width:369.55pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.95pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.jbxxBean.fwcs}</span></p>
		  </td>
		 </tr>
		 <tr style="height:21.85pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">注销日期</span></p>
		  </td>
		  <td width="60" style="width:45.05pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.zxsj}</span></p>
		  </td>
		  <td width="73" colspan="2" style="width:54.65pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal"><span style="font-family:宋体">注销原因</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.zxyy}</span></p>
		  </td>
		  <td width="66" style="width:49.8pt;border-top:none;border-left:none;border-bottom:
		  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
		  height:21.85pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">去向</span></p>
		  </td>
		  <td width="198" colspan="7" style="width:148.55pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:21.85pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:23.6pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.6pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">函调时间</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.6pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.6pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.6pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:22.45pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.45pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">变动时间</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.45pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.45pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:22.45pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:23.45pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">职业</span></p>
		  </td>
		  <td width="133" colspan="3" style="width:99.7pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.jbxxBean.zydm}</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.45pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:23.15pt">
		  <td width="48" rowspan="4" style="width:36.05pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">随同亲友</span></p>
		  </td>
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><b><span
		  style="font-family:宋体">关系</span></b></p>
		  </td>
		  <td width="60" style="width:45.05pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><b><span
		  style="font-family:宋体">姓名</span></b></p>
		  </td>
		  <td width="73" colspan="2" style="width:54.65pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><b><span
		  style="font-family:宋体">性别</span></b></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><b><span
		  style="font-family:宋体">出生日期</span></b></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><b><span
		  style="font-family:宋体">身份证号码</span></b></p>
		  </td>
		 </tr>
		 <tr style="height:23.15pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="60" style="width:45.05pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="73" colspan="2" style="width:54.65pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:23.15pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="60" style="width:45.05pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="73" colspan="2" style="width:54.65pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:23.15pt">
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="60" style="width:45.05pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="73" colspan="2" style="width:54.65pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		  <td width="264" colspan="8" style="width:198.3pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:23.15pt">
		  <p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:20.95pt">
		  <td width="48" rowspan="2" style="width:36.05pt;border:solid windowtext 1.0pt;
		  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:20.95pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">房屋责任人情况</span></p>
		  </td>
		  <td width="108" style="width:81.15pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:20.95pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">房主姓名</span></p>
		  </td>
		  <td width="60" style="width:45.05pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:20.95pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.ldrkBean.fzxm}</span></p>
		  </td>
		  <td width="73" colspan="2" style="width:54.65pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:20.95pt">
		  <p class="MsoNormal"><span style="font-family:宋体">房屋类别</span></p>
		  </td>
		  <td width="95" colspan="2" style="width:71.55pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:20.95pt">
		  <p class="MsoNormal"><span style="font-family:宋体">${rkBean.fwxxBean.fwlbms}</span></p>
		  </td>
		  <td width="96" colspan="4" style="width:72.1pt;border-top:none;border-left:none;
		  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:20.95pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">身份证号码</span></p>
		  </td>
		  <td width="168" colspan="4" style="width:126.2pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:20.95pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.fzsfzh}</span></p>
		  </td>
		 </tr>
		 <tr style="height:30.65pt">
		  <td width="168" colspan="2" style="width:126.2pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span
		  style="font-family:宋体">工作单位或住址</span></p>
		  </td>
		  <td width="294" colspan="9" style="width:220.3pt;border:none;border-bottom:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt">
		  <p class="MsoNormal"><span style="font-family:宋体">&nbsp;</span></p>
		  </td>
		  <td width="139" colspan="3" style="width:104.2pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="height:50.1pt">
		  <td width="48" style="width:36.05pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:50.1pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span style="font-family:宋体">备</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  <p class="MsoNormal" align="center" style="text-align:center"><span style="font-family:宋体">注</span></p>
		  </td>
		  <td width="462" colspan="11" valign="top" style="width:346.5pt;border:none;
		  border-bottom:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:116.1pt">
		  <p class="MsoNormal"><span lang="EN-US">${rkBean.ldrkBean.bz}</span></p>
		  </td>
		  <td width="139" colspan="3" style="width:104.2pt;border-top:none;border-left:
		  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
		  padding:0cm 5.4pt 0cm 5.4pt;height:116.1pt">
		  <p class="MsoNormal" align="center" style="text-align:center"><span lang="EN-US">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr height="0">
		  <td width="48" style="border:none"></td>
		  <td width="108" style="border:none"></td>
		  <td width="60" style="border:none"></td>
		  <td width="12" style="border:none"></td>
		  <td width="61" style="border:none"></td>
		  <td width="11" style="border:none"></td>
		  <td width="84" style="border:none"></td>
		  <td width="66" style="border:none"></td>
		  <td width="6" style="border:none"></td>
		  <td width="12" style="border:none"></td>
		  <td width="12" style="border:none"></td>
		  <td width="29" style="border:none"></td>
		  <td width="19" style="border:none"></td>
		  <td width="12" style="border:none"></td>
		  <td width="108" style="border:none"></td>
		 </tr>
		</table>
			<p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
		</div>
		<hr class="Noprint" style="width:80%"/>
	</c:forEach>
</div>
</center>
</creator:view>
