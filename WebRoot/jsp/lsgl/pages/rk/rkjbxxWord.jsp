<%@page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view width="99.8%">
<title>人员基本信息</title>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>LBDZ</o:Author>
  <o:LastAuthor>User</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>6</o:TotalTime>
  <o:Created>2015-02-04T03:14:00Z</o:Created>
  <o:LastSaved>2015-02-04T03:14:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>35</o:Words>
  <o:Characters>200</o:Characters>
  <o:Lines>1</o:Lines>
  <o:Paragraphs>1</o:Paragraphs>
  <o:CharactersWithSpaces>234</o:CharactersWithSpaces>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
 <o:CustomDocumentProperties>
  <o:KSOProductBuildVer dt:dt="string">2052-9.1.0.4468</o:KSOProductBuildVer>
 </o:CustomDocumentProperties>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:PunctuationKerning/>
  <w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing>
  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:Compatibility>
   <w:SpaceForUL/>
   <w:BalanceSingleByteDoubleByteWidth/>
   <w:DoNotLeaveBackslashAlone/>
   <w:ULTrailSpace/>
   <w:DoNotExpandShiftReturn/>
   <w:AdjustLineHeightInTable/>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:UseFELayout/>
  </w:Compatibility>
  <w:NoLineBreaksAfter Lang="ZH-CN">$([{£¥·‘“〈《「『【〔〖〝﹙﹛﹝＄（．［｛￡￥</w:NoLineBreaksAfter>
  <w:NoLineBreaksBefore Lang="ZH-CN">!%),.:;&gt;?]}¢¨°·ˇˉ―‖’”…‰′″›℃∶、。〃〉》」』】〕〗〞︶︺︾﹀﹄﹚﹜﹞！＂％＇），．：；？］｀｜｝～￠</w:NoLineBreaksBefore>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="true" LatentStyleCount="156">
  <w:LsdException Locked="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="true" Name="No List"/>
 </w:LatentStyles>
</xml><![endif]-->
<style>
<!--
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
span.FooterChar
	{mso-style-name:"Footer Char";
	mso-style-noshow:yes;
	mso-style-locked:yes;
	mso-style-link:页脚;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;
	font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
span.HeaderChar
	{mso-style-name:"Header Char";
	mso-style-noshow:yes;
	mso-style-locked:yes;
	mso-style-link:页眉;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;
	font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
 /* Page Definitions */
 @page
	{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:42.55pt;
	mso-footer-margin:49.6pt;
	mso-paper-source:0;
	layout-grid:15.6pt;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:普通表格;
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2050"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
 <style type="text/css">
		html 
		{ 
		 	-webkit-text-size-adjust:none 
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
	
 	window.onload = function(){
 		if (confirm("是否要直接打印页面?"))
		{
			PageSetup_Null();
 			document.all.WebBrowser.ExecWB(6,6);
 			window.close();
 		}
 	}
 	function dypage()
	{
		PageSetup_Null();
 		document.all.WebBrowser.ExecWB(6,6);
 		window.close();
	}
 </script>
 <object id="WebBrowser" width="10" height="10" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>

<center>
<div class="Noprint" style="text-align: left;width:80%">
	<cps:button value="打印" onclick="dypage()"></cps:button>
	<hr/>
</div>
<c:forEach items="${rkjbxxList}" var="ryjbxx" varStatus="st">
<div class=Section1 style='layout-grid:15.6pt'>

<div align=center class="${st.last == false?'PageNext':''}" style="width: 500px;height: 700px;background-color:#FFFFFF;border: 0px solid red;" >

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=543
 style='width:407.5pt;margin-left:-5.3pt;border-collapse:collapse;border:none;
 mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
 mso-border-insideh:.5pt solid windowtext;mso-border-insidev:.5pt solid windowtext'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;page-break-inside:avoid;
  height:30.3pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.3pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>人员类别</span></p>
  </td>
  <td width=221 colspan=2 rowspan=2 style='width:166.05pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.3pt'>
  <p class=MsoNormal align=center style='text-align:center'><b><span
  style='font-size:18.0pt;font-family:宋体;mso-hansi-font-family:"Times New Roman"'>人员基本信息</span></b><b><span
  lang=EN-US style='font-family:宋体;mso-hansi-font-family:"Times New Roman"'><o:p></o:p></span></b></p>
  </td>
  <td width=172 colspan=2 rowspan=3 style='width:128.95pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.3pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>				
  <img border="0" id="zpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${ryjbxx.sfzh}" width="80px" height="97px" title="全国人口库照片" alt="全国人口库照片" />
</span>
 </p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1;page-break-inside:avoid;height:30.3pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:30.3pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>${ryjbxx.rylbms}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2;height:39.55pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:39.55pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>姓</span><span lang=EN-US><span
  style='mso-spacerun:yes'>        </span></span><span style='font-family:宋体;
  mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>名</span></p>
  </td>
  <td width=221 colspan=2 style='width:166.05pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:39.55pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>${ryjbxx.xm}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3;height:30.1pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:30.1pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>曾</span><span lang=EN-US><span style='mso-spacerun:yes'>  
  </span></span><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
  mso-hansi-font-family:"Times New Roman"'>用</span><span lang=EN-US><span
  style='mso-spacerun:yes'>   </span></span><span style='font-family:宋体;
  mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>名</span></p>
  </td>
  <td width=221 colspan=2 style='width:166.05pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.1pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>${ryjbxx.bmch}</span></p>
  </td>
  <td width=78 style='width:58.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.1pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>性别</span></p>
  </td>
  <td width=94 style='width:70.7pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.1pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>${ryjbxx.xbms}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;height:35.55pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:35.55pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>出</span><span lang=EN-US><span style='mso-spacerun:yes'> 
  </span></span><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
  mso-hansi-font-family:"Times New Roman"'>生</span><span lang=EN-US><span
  style='mso-spacerun:yes'>  </span></span><span style='font-family:宋体;
  mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>日</span><span
  lang=EN-US><span style='mso-spacerun:yes'>  </span></span><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>期</span></p>
  </td>
  <td width=221 colspan=2 valign=bottom style='width:166.05pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:35.55pt'>
  <p class=MsoNormal><span lang=EN-US>${ryjbxx.csrq}</span></p>
  </td>
  <td width=78 style='width:58.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:35.55pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>民</span> <span style='font-family:宋体;mso-ascii-font-family:
  "Times New Roman";mso-hansi-font-family:"Times New Roman"'>族</span></p>
  </td>
  <td width=94 style='width:70.7pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:35.55pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>${ryjbxx.mzms}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:5;height:34.25pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:34.25pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>籍贯</span></p>
  </td>
  <td width=148 style='width:111.35pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:34.25pt'>
  <p class=MsoNormal align=left style='margin-left:10.5pt;mso-para-margin-left:
  1.0gd;text-align:left'><span style='font-family:宋体;mso-ascii-font-family:
  "Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.hjdqhmc}</span></p>
  </td>
  <td width=73 style='width:54.65pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:34.25pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>宗教信仰</span></p>
  </td>
  <td width=172 colspan=2 style='width:128.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:34.25pt'>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.zzxyms}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:6;height:32.75pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:32.75pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>公民身份号码</span></p>
  </td>
  <td width=393 colspan=4 style='width:295.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.75pt'>
  <p class=MsoNormal align=left style='text-align:left'><a name="_GoBack"></a><span
  lang=EN-US>${ryjbxx.sfzh}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:7;height:19.95pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>文化程度</span></p>
  </td>
  <td width=148 style='width:111.35pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal align=left style='text-align:left'><span lang=EN-US><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>${ryjbxx.whcdms}</span></p>
  </td>
  <td width=73 style='width:54.65pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>婚姻状况</span></p>
  </td>
  <td width=172 colspan=2 style='width:128.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.hyzkms}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:8;height:19.95pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>身高</span><span lang=EN-US><span
  style='mso-spacerun:yes'>     </span></span></p>
  </td>
  <td width=148 style='width:111.35pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>${ryjbxx.sg}</span></p>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  lang=EN-US><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=73 style='width:54.65pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>血型</span></p>
  </td>
  <td width=172 colspan=2 style='width:128.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.95pt'>
  <p class=MsoNormal align=left style='text-align:left'><span lang=EN-US>${ryjbxx.xxms}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:9;height:27.55pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:27.55pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>兵役状况</span></p>
  </td>
  <td width=148 style='width:111.35pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.55pt'>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.byzkms}</span></p>
  </td>
  <td width=73 style='width:54.65pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.55pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>职业</span></p>
  </td>
  <td width=172 colspan=2 style='width:128.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.55pt'>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.zw}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:10;height:19.9pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.9pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>服务处所</span></p>
  </td>
  <td width=393 colspan=4 style='width:295.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.9pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  lang=EN-US><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.fwcs}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:11;height:29.0pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:29.0pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>户籍地</span></p>
  </td>
  <td width=393 colspan=4 style='width:295.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:29.0pt'>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.hjdxz}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:12;height:27.8pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:27.8pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>现住址</span></p>
  </td>
  <td width=393 colspan=4 style='width:295.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.8pt'>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>${ryjbxx.xzzxz}</span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:13;mso-yfti-lastrow:yes;height:30.25pt'>
  <td width=150 style='width:112.5pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:30.25pt'>
  <p class=MsoNormal style='text-align:justify;text-justify:distribute-all-lines'><span
  style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
  "Times New Roman"'>本市（县）其他住址</span></p>
  </td>
  <td width=393 colspan=4 style='width:295.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.25pt'>
  <p class=MsoNormal align=left style='text-align:left'><span style='font-family:
  宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
  </td>
 </tr>
</table>

</div>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

</div>
</c:forEach>
</center>
</creator:view>
