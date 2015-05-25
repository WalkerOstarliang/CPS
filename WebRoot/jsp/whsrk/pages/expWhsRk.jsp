<%@ page language="java"
	contentType="application/msexcel; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%
	String fileName = URLEncoder.encode("whsrk", "UTF-8");
	response.setHeader("Content-disposition", "inline; filename="
			+ fileName + ".xls");
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<style id="whsrk_30696_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.xl6530696
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
.xl6630696
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
.xl6730696
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
.xl6830696
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
.xl6930696
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
<div id="whsrk_30696" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1773 style='border-collapse:
 collapse;table-layout:fixed;width:1332pt'>
 <col class=xl6530696 width=45 style='mso-width-source:userset;mso-width-alt:
 1440;width:34pt'>
 <col class=xl6530696 width=76 style='mso-width-source:userset;mso-width-alt:
 2432;width:57pt'>
 <col class=xl6530696 width=182 style='mso-width-source:userset;mso-width-alt:
 5824;width:137pt'>
 <col class=xl6530696 width=114 style='mso-width-source:userset;mso-width-alt:
 3648;width:86pt'>
 <col class=xl6530696 width=446 style='mso-width-source:userset;mso-width-alt:
 14272;width:335pt'>
 <col class=xl6530696 width=478 style='mso-width-source:userset;mso-width-alt:
 15296;width:359pt'>
 <col class=xl6530696 width=72 span=6 style='mso-width-source:userset;
 mso-width-alt:2304;width:54pt'>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl6630696 width=45 style='height:14.25pt;width:34pt'>序号</td>
  <td class=xl6730696 width=76 style='width:57pt'>姓名</td>
  <td class=xl6730696 width=182 style='width:137pt'>身份证号</td>
  <td class=xl6730696 width=114 style='width:86pt'>联系电话</td>
  <td class=xl6730696 width=446 style='width:335pt'>户籍地详址</td>
  <td class=xl6730696 width=478 style='width:359pt'>现住地详址</td>
 </tr>
 <c:forEach items="${rkList}" var="rk" varStatus="s">
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl6830696 style='height:14.25pt'>${s.index + 1}</td>
  <td class=xl6930696>${rk.xm}&nbsp;</td>
  <td class=xl6930696>${rk.sfhm}&nbsp;</td>
  <td class=xl6930696>${rk.lxfs}&nbsp;</td>
  <td class=xl6930696>${rk.hjdxz}&nbsp;</td>
  <td class=xl6930696>${rk.zzxz}&nbsp;</td>
 </tr>
  </c:forEach>
</table>
</div>
</body>
</html>

