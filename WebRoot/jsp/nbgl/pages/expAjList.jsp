<%@ page language="java" contentType="application/msexcel; charset=gb2312"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%
	String fileName = URLEncoder.encode("案件信息", "UTF-8");
	response.setHeader("Content-disposition", "inline; filename=" + fileName + ".xls");
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<link rel=File-List href="111.files/filelist.xml">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.xl6526427
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6626427
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6726427
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6826427
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6926427
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7026427
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7126427
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;}
-->
</style>
</head>
<body>
<div>
<table border=0 cellpadding=0 cellspacing=0 width=2299 style='border-collapse:
 collapse;table-layout:fixed;width:1727pt'>
 <col class=xl6526427 width=44 style='mso-width-source:userset;mso-width-alt:
 1408;width:33pt'>
 <col class=xl6526427 width=209 style='mso-width-source:userset;mso-width-alt:
 6688;width:157pt'>
 <col class=xl6526427 width=129 style='mso-width-source:userset;mso-width-alt:
 4128;width:97pt'>
 <col class=xl6526427 width=82 span=2 style='mso-width-source:userset;
 mso-width-alt:2624;width:62pt'>
 <col class=xl6526427 width=129 style='mso-width-source:userset;mso-width-alt:
 4128;width:97pt'>
 <col class=xl6526427 width=84 style='mso-width-source:userset;mso-width-alt:
 2688;width:63pt'>
 <col class=xl6526427 width=82 style='mso-width-source:userset;mso-width-alt:
 2624;width:62pt'>
 <col class=xl6526427 width=157 style='mso-width-source:userset;mso-width-alt:
 5024;width:118pt'>
 <col class=xl6526427 width=797 style='mso-width-source:userset;mso-width-alt:
 25504;width:598pt'>
 <col class=xl6526427 width=72 span=7 style='mso-width-source:userset;
 mso-width-alt:2304;width:54pt'>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl6626427 width=44 style='height:14.25pt;width:33pt'>序号</td>
  <td class=xl6726427 width=209 style='width:157pt'>案件编号</td>
  <td class=xl6726427 width=129 style='width:97pt'>案件名称</td>
  <td class=xl6726427 width=82 style='width:62pt'>案件类型</td>
  <td class=xl6726427 width=82 style='width:62pt'>立案日期</td>
  <td class=xl6726427 width=129 style='width:97pt'>发案社区</td>
  <td class=xl6726427 width=84 style='width:63pt'>关键词</td>
  <td class=xl6726427 width=82 style='width:62pt'>是否核实</td>
  <td class=xl6826427 width=157 style='width:118pt'>是否重点单位发案</td>
  <td class=xl6726427 width=797 style='width:598pt'>简要案情</td>
 </tr>
<c:forEach items="${ajList}" var="ajxx" varStatus="s" >
 <tr height=84 style='mso-height-source:userset;height:63.0pt'>
  <td height=84 class=xl6926427 style='height:63.0pt'>${s.index + 1}</td>
  <td class=xl7026427>${ajxx.ajbh}</td>
  <td class=xl7026427>${ajxx.ajmc}</td>
  <td class=xl7026427>${ajxx.ajlx}</td>
  <td class=xl7026427>${ajxx.larq}</td>
  <td class=xl7026427>${ajxx.fasqmc}&nbsp;</td>
  <td class=xl7026427>${ajxx.gjc}</td>
  <td class=xl7026427>${ajxx.sfhs_ms}</td>
  <td class=xl7026427>${ajxx.sfzddwfams}</td>
  <td class=xl7126427 width=797 style='width:598pt'>${ajxx.jyaq}</td>
 </tr>
 </c:forEach> 
</table>
</div>
</body>

</html>

