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
	 <style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	font-family:"Times New Roman";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:center;
	layout-grid-mode:char;
	border:none;
	padding:0cm;
	font-size:9.0pt;
	font-family:Calibri;}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{margin:0cm;
	margin-bottom:.0001pt;
	layout-grid-mode:char;
	font-size:9.0pt;
	font-family:Calibri;}
span.HeaderChar
	{font-family:"Times New Roman";}
span.FooterChar
	{font-family:"Times New Roman";}
 /* Page Definitions */
 @page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	layout-grid:15.6pt;}
div.Section1
	{page:Section1;}
-->
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
	<object id="WebBrowser" width="0" height="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>
	<center>
	<div class="Noprint" style="text-align:left;width:80%">
		<cps:button value="打印" onclick="dypage()"/>
		<hr/>
	</div>
	

<div class=Section1 style='layout-grid:15.6pt' lang="ZH-CN" >

<p class="MsoNormal" align=center style='text-align:center'><a name=调解纠纷登记表><b><span
style='font-size:18.0pt;font-family:宋体'>治安纠纷调解情况登记表</span></b></a></p>

<p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>

<p class="MsoNormal" style='margin-right:21.0pt;text-indent:10.5pt;word-break:
break-all'><span style='font-family:宋体'>时间：</span><span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='font-family:宋体'>年</span><span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='font-family:宋体'>月</span><span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='font-family:宋体'>日</span><span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='font-family:宋体'>编号：</span><span lang="EN-US">&nbsp; </span></p>

<table class="MsoNormal"Table border=1 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none'>
 <tr style='height:30.75pt'>
  <td width=103 style='width:77.4pt;border:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:30.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span
  style='font-family:宋体'>名</span><span lang="EN-US">&nbsp;&nbsp;&nbsp; </span><span
  style='font-family:宋体'>称</span></p>
  </td>
  <td width=181 colspan=2 style='width:135.6pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0cm 5.4pt 0cm 5.4pt;height:30.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
  <td width=95 style='width:71.4pt;border:solid windowtext 1.0pt;border-left:
  none;padding:0cm 5.4pt 0cm 5.4pt;height:30.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span
  style='font-family:宋体'>承办民警</span></p>
  </td>
  <td width=189 style='width:141.7pt;border:solid windowtext 1.0pt;border-left:
  none;padding:0cm 5.4pt 0cm 5.4pt;height:30.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
 </tr>
 <tr style='page-break-inside:avoid;height:6.75pt'>
  <td width=151 colspan=2 rowspan=3 style='width:4.0cm;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:6.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span
  style='font-family:宋体'>当事人姓名、住址</span></p>
  </td>
  <td width=417 colspan=3 style='width:312.7pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:6.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
 </tr>
 <tr style='page-break-inside:avoid;height:13.5pt'>
  <td width=417 colspan=3 style='width:312.7pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.5pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
 </tr>
 <tr style='page-break-inside:avoid;height:9.0pt'>
  <td width=417 colspan=3 style='width:312.7pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:9.0pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
 </tr>
 <tr style='page-break-inside:avoid;height:12.75pt'>
  <td width=151 colspan=2 rowspan=3 style='width:4.0cm;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:12.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span
  style='font-family:宋体'>当事人姓名、住址</span></p>
  </td>
  <td width=417 colspan=3 style='width:312.7pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:12.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
 </tr>
 <tr style='page-break-inside:avoid;height:15.75pt'>
  <td width=417 colspan=3 style='width:312.7pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:15.75pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
 </tr>
 <tr style='page-break-inside:avoid;height:17.25pt'>
  <td width=417 colspan=3 style='width:312.7pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.25pt'>
  <p class="MsoNormal" align=center style='text-align:center'><span lang="EN-US">&nbsp;</span></p>
  </td>
 </tr>
 <tr style='height:209.1pt'>
  <td width=568 colspan=5 valign=top style='width:426.1pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:209.1pt'>
  <p class="MsoNormal"><span style='font-family:宋体'>纠纷简要情况：</span></p>
  </td>
 </tr>
 <tr style='height:187.05pt'>
  <td width=568 colspan=5 valign=top style='width:426.1pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:187.05pt'>
  <p class="MsoNormal"><span style='font-family:宋体'>调解结果：</span></p>
  </td>
 </tr>
 <tr style='height:64.65pt'>
  <td width=568 colspan=5 valign=top style='width:426.1pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:64.65pt'>
  <p class="MsoNormal"><span style='font-family:宋体'>备</span><span lang="EN-US">&nbsp;
  </span><span style='font-family:宋体'>注</span></p>
  </td>
 </tr>
 <tr height=0>
  <td width=103 style='border:none'></td>
  <td width=48 style='border:none'></td>
  <td width=133 style='border:none'></td>
  <td width=95 style='border:none'></td>
  <td width=189 style='border:none'></td>
 </tr>
</table>

<p class="MsoNormal"><b><span lang="EN-US">&nbsp;</span></b></p>

</div>

	</center>
</creator:view>