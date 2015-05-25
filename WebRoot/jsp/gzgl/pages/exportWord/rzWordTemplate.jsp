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
	 /* Font Definitions */
	 @font-face
		{font-family:宋体;
		panose-1:2 1 6 0 3 1 1 1 1 1;
		mso-font-alt:SimSun;
		mso-font-charset:134;
		mso-generic-font-family:auto;
		mso-font-pitch:variable;
		mso-font-signature:3 135135232 16 0 262145 0;}
	@font-face
		{font-family:黑体;
		panose-1:2 1 6 0 3 1 1 1 1 1;
		mso-font-alt:SimHei;
		mso-font-charset:134;
		mso-generic-font-family:auto;
		mso-font-pitch:variable;
		mso-font-signature:1 135135232 16 0 262144 0;}
	@font-face
		{font-family:Calibri;
		panose-1:2 15 5 2 2 2 4 3 2 4;
		mso-font-charset:0;
		mso-generic-font-family:swiss;
		mso-font-pitch:variable;
		mso-font-signature:-1610611985 1073750139 0 0 159 0;}
	@font-face
		{font-family:"\@宋体";
		panose-1:2 1 6 0 3 1 1 1 1 1;
		mso-font-charset:134;
		mso-generic-font-family:auto;
		mso-font-pitch:variable;
		mso-font-signature:3 135135232 16 0 262145 0;}
	@font-face
		{font-family:"\@黑体";
		panose-1:2 1 6 0 3 1 1 1 1 1;
		mso-font-charset:134;
		mso-generic-font-family:auto;
		mso-font-pitch:variable;
		mso-font-signature:1 135135232 16 0 262144 0;}
	 /* Style Definitions */
	 p.MsoNormal, li.MsoNormal, div.MsoNormal
		{mso-style-parent:"";
		margin:0cm;
		margin-bottom:.0001pt;
		text-align:justify;
		text-justify:inter-ideograph;
		mso-pagination:none;
		font-size:10.5pt;
		mso-bidi-font-size:12.0pt;
		font-family:"Times New Roman";
		mso-fareast-font-family:宋体;
		mso-font-kerning:1.0pt;}
	p.MsoHeader, li.MsoHeader, div.MsoHeader
		{mso-style-noshow:yes;
		mso-style-link:"Header Char";
		margin:0cm;
		margin-bottom:.0001pt;
		text-align:center;
		mso-pagination:none;
		tab-stops:center 207.65pt right 415.3pt;
		layout-grid-mode:char;
		border:none;
		mso-border-bottom-alt:solid windowtext .75pt;
		padding:0cm;
		mso-padding-alt:0cm 0cm 1.0pt 0cm;
		font-size:9.0pt;
		font-family:Calibri;
		mso-fareast-font-family:宋体;
		mso-bidi-font-family:"Times New Roman";
		mso-font-kerning:1.0pt;}
	p.MsoFooter, li.MsoFooter, div.MsoFooter
		{mso-style-noshow:yes;
		mso-style-link:"Footer Char";
		margin:0cm;
		margin-bottom:.0001pt;
		mso-pagination:none;
		tab-stops:center 207.65pt right 415.3pt;
		layout-grid-mode:char;
		font-size:9.0pt;
		font-family:Calibri;
		mso-fareast-font-family:宋体;
		mso-bidi-font-family:"Times New Roman";
		mso-font-kerning:1.0pt;}
	span.HeaderChar
		{mso-style-name:"Header Char";
		mso-style-noshow:yes;
		mso-style-locked:yes;
		mso-style-link:页眉;
		mso-ansi-font-size:9.0pt;
		mso-bidi-font-size:9.0pt;
		font-family:"Times New Roman";
		mso-bidi-font-family:"Times New Roman";}
	span.FooterChar
		{mso-style-name:"Footer Char";
		mso-style-noshow:yes;
		mso-style-locked:yes;
		mso-style-link:页脚;
		mso-ansi-font-size:9.0pt;
		mso-bidi-font-size:9.0pt;
		font-family:"Times New Roman";
		mso-bidi-font-family:"Times New Roman";}
	 /* Page Definitions */
	 @page
		{mso-page-border-surround-header:no;
		mso-page-border-surround-footer:no;
		mso-footnote-separator:url("值班日志.files/header.htm") fs;
		mso-footnote-continuation-separator:url("值班日志.files/header.htm") fcs;
		mso-endnote-separator:url("值班日志.files/header.htm") es;
		mso-endnote-continuation-separator:url("值班日志.files/header.htm") ecs;}
	@page Section1
		{size:595.3pt 841.9pt;
		margin:72.0pt 90.0pt 72.0pt 90.0pt;
		mso-header-margin:42.55pt;
		mso-footer-margin:49.6pt;
		mso-paper-source:0;
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
	<object id="WebBrowser" width="0" height="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>
	<center>
	<div class="Noprint" style="text-align:left;width:80%">
		<cps:button value="打印" onclick="dypage()"/>
		<hr/>
	</div>
	<div class="Section1" lang='ZH-CN' style='tab-interval:21.0pt;text-justify-trim:punctuation'>
	
		<p class='MsoNormal' align='center' style='text-align:center'><b><span
		style='font-size:22.0pt;mso-bidi-font-size:18.0pt;font-family:宋体;mso-hansi-font-family:
		"Times New Roman"'>值 班 日 志<span lang="EN-US"><o:p></o:p></span></span></b></p>
	
		<p class='MsoNormal' align='center' style='text-align:center'><span lang='EN-US'
		style='font-size:18.0pt;font-family:黑体'><o:p>&nbsp;</o:p></span></p>
	
	<table class='MsoNormalTable' border='1' cellspacing='0' cellpadding='0'
	 style='border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
	 	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;mso-border-insideh:.5pt solid windowtext;
		 mso-border-insidev:.5pt solid windowtext'>
	 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:30.0pt'>
	  <td width='43' style='width:32.4pt;border:solid windowtext 1.0pt;mso-border-alt:
	  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
	  <p class='MsoNormal' align='center' style='text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>日期</span></p>
	  </td>
	  <td width='140' colspan='3' style='width:105.3pt;border:solid windowtext 1.0pt;
	  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
	  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
	  <p class='MsoNormal' style='text-indent:18.5pt;mso-char-indent-count:3.0'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>${year}年</span><span lang='EN-US'><span
	  style='mso-spacerun:yes'>&nbsp; </span></span><span style='font-family:宋体;
	  mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${month }月</span><span
	  lang='EN-US'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>${day }日</span></p>
	  </td>
	  <td width='48' style='width:36.0pt;border:solid windowtext 1.0pt;border-left:
	  none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
	  <p class='MsoNormal' align='center' style='text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>值班</span></p>
	  <p class='MsoNormal' align=center style='text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>领导</span></p>
	  </td>
	  <td width='72' valign='top' style='width:54.0pt;border:solid windowtext 1.0pt;
	  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
	  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='54' colspan='2' valign='top' style='width:40.8pt;border:solid windowtext 1.0pt;
	  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
	  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
	  <p class='MsoNormal'><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	  mso-hansi-font-family:"Times New Roman"'>值班</span></p>
	  <p class='MsoNormal'><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	  mso-hansi-font-family:"Times New Roman"'>民警</span></p>
	  </td>
	  <td width='201' colspan='2'  style='width:150.9pt;border:solid windowtext 1.0pt;
	  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
	  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>${rizhiBean.gzmjxm }</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:1;page-break-inside:avoid;height:30.4pt'>
	  <td width='43' style='width:32.4pt;border:solid windowtext 1.0pt;border-top:
	  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:30.4pt'>
	  <p class='MsoNormal'><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	  mso-hansi-font-family:"Times New Roman"'>值班</span></p>
	  <p class='MsoNormal'><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	  mso-hansi-font-family:"Times New Roman"'>交接</span></p>
	  <p class='MsoNormal'><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	  mso-hansi-font-family:"Times New Roman"'>情况</span></p>
	  </td>
	  <td width='261' colspan='6' style='width:195.6pt;border-top:none;border-left:
	  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.4pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='54' style='width:40.5pt;border-top:none;border-left:none;border-bottom:
	  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
	  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
	  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.4pt'>
	  <p class='MsoNorma' align='center' style='text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>值班<br/>领导<br/>意见</span></p>
	  </td>
	  <td width='201' colspan='2' style='width:150.9pt;border-top:none;border-left:
	  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.4pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:2;page-break-inside:avoid;height:21.15pt'>
	  <td width=43 rowspan=2 valign=top style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:21.15pt'>
	  <p class='MsoNormal' align='center' style='text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>序号</span></p>
	  </td>
	  <td width=68 rowspan=2 valign='top' style='width:51.3pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:21.15pt'>
	  <p class='MsoNormal' style='text-indent:10.5pt;mso-char-indent-count:1.0'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>时</span> <span style='font-family:宋体;mso-ascii-font-family:
	  "Times New Roman";mso-hansi-font-family:"Times New Roman"'>间</span></p>
	  <p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	  mso-hansi-font-family:"Times New Roman"'>（时分）</span></p>
	  </td>
	  <td width=388 colspan=7 valign=top style='width:290.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:21.15pt'>
	  <p class=MsoNormal align='center' style='text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>值</span> <span style='font-family:宋体;mso-ascii-font-family:
	  "Times New Roman";mso-hansi-font-family:"Times New Roman"'>班</span> <span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>事</span> <span style='font-family:宋体;mso-ascii-font-family:
	  "Times New Roman";mso-hansi-font-family:"Times New Roman"'>项</span></p>
	  </td>
	  <td width=60 rowspan=2 valign=top style='width:45.0pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:21.15pt'>
	  <p class=MsoNormal align=center style='text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>备注</span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:3;page-break-inside:avoid;height:15.75pt'>
	  <td width=48 valign=top style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:15.75pt'>
	  <p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	  mso-hansi-font-family:"Times New Roman"'>类别</span></p>
	  </td>
	  <td width=340 colspan=6 valign=top style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:15.75pt'>
	  <p class=MsoNormal align=center style='margin-left:10.35pt;text-align:center'><span
	  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
	  "Times New Roman"'>简要内容及办理情况</span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:4;height:27.45pt'>
	  <td width=43 valign=top style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=68 valign=top style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=48 valign=top style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=340 colspan=6 valign=top style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=60 valign=top style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:5;height:25.75pt'>
	  <td width=43 valign=top style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class='MsoNormal'><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=60 valign=top style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class='"MsoNormal"'><span lang='"EN-US"'><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:6;height:24.75pt'>
	  <td width=43 valign=top style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:24.75pt'>
	  <p class='"MsoNormal"'><span lang='"EN-US"'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=68 valign=top style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.75pt'>
	  <p class='"MsoNormal"'><span lang='"EN-US"'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=48 valign=top style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.75pt'>
	  <p class='"MsoNormal"'><span lang='"EN-US"'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=340 colspan=6 valign=top style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.75pt'>
	  <p class='"MsoNormal"'><span lang='"EN-US"'><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width=60 valign=top style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.75pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:7;height:23.0pt'>
	  <td width=43 valign=top style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:23.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:8;height:23.35pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:9;height:28.1pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:28.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:28.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:28.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:28.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:28.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:10;height:25.75pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.75pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:11;height:24.05pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:24.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:12;height:23.05pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:23.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.05pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:13;height:29.1pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:29.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:29.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:29.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:29.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:29.1pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:14;height:32.25pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:32.25pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.25pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.25pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.25pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.25pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:15;height:26.7pt'>
	  <td width=43 valign=top style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:26.7pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.7pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.7pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.7pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.7pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:16;height:25.0pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:25.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:25.0pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:17;height:23.35pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:23.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:18;height:22.35pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:22.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:22.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:22.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:22.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:22.35pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr style='mso-yfti-irow:19;mso-yfti-lastrow:yes;height:20.65pt'>
	  <td width='43' valign='top' style='width:32.4pt;border:solid windowtext 1.0pt;
	  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
	  padding:0cm 5.4pt 0cm 5.4pt;height:20.65pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='68' valign='top' style='width:51.3pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:20.65pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='48' valign='top' style='width:36.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:20.65pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='340' colspan='6' valign='top' style='width:254.7pt;border-top:none;
	  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:20.65pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	  <td width='60' valign='top' style='width:45.0pt;border-top:none;border-left:none;
	  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
	  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
	  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:20.65pt'>
	  <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
	  </td>
	 </tr>
	 <tr height='0'>
	  <td width='43' style='border:none'></td>
	  <td width='68' style='border:none'></td>
	  <td width='48' style='border:none'></td>
	  <td width='24' style='border:none'></td>
	  <td width='48' style='border:none'></td>
	  <td width='72' style='border:none'></td>
	  <td width='0' style='border:none'></td>
	  <td width='54' style='border:none'></td>
	  <td width='141' style='border:none'></td>
	  <td width='60' style='border:none'></td>
	 </tr>
	</table>
	
	<p class="MsoNormal" style='margin-left:101.0pt;text-indent:-21.0pt;mso-char-indent-count:
	-2.0'><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
	mso-hansi-font-family:"Times New Roman"'>注：此日志主要记载值班期间的日常事务，如通知、来访、移交事项等，已记入有关台帐的可不重复记载。</span></p>
	<p class="MsoNormal"><span lang='EN-US'><o:p>&nbsp;</o:p></span></p>
	</div>
	</center>
</creator:view>