<%@ page language="java" contentType="application/msexcel; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%
	String fileName = URLEncoder.encode("入户走访统计", "UTF-8");
	response.setHeader("Content-disposition", "inline; filename=" + fileName + ".xls");
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<style id="rhzftj_17903_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.font517903
	{color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl1517903
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
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6317903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6417903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6517903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:green;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:white;
	mso-pattern:black none;
	white-space:normal;}
.xl6617903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6717903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6817903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6917903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl7017903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl7117903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl7217903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7317903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7417903
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
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

<div id="rhzftj_17903" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1241 style='border-collapse:
 collapse;table-layout:fixed;width:934pt'>
 <col width=46 style='mso-width-source:userset;mso-width-alt:1472;width:35pt'>
 <col width=150 style='mso-width-source:userset;mso-width-alt:4800;width:113pt'>
 <col width=72 span=3 style='width:54pt'>
 <col width=50 style='mso-width-source:userset;mso-width-alt:1600;width:38pt'>
 <col width=61 style='mso-width-source:userset;mso-width-alt:1952;width:46pt'>
 <col width=63 style='mso-width-source:userset;mso-width-alt:2016;width:47pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:1984;width:47pt'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1568;width:37pt'>
 <col width=52 style='mso-width-source:userset;mso-width-alt:1664;width:39pt'>
 <col width=54 style='mso-width-source:userset;mso-width-alt:1728;width:41pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:1984;width:47pt'>
 <col width=80 style='mso-width-source:userset;mso-width-alt:2560;width:60pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:1888;width:44pt'>
 <col width=72 style='width:54pt'>
 <col width=51 style='mso-width-source:userset;mso-width-alt:1632;width:38pt'>
 <col width=52 style='mso-width-source:userset;mso-width-alt:1664;width:39pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:1984;width:47pt'>
 <tr class=xl1517903 height=19 style='height:14.25pt'>
  <td colspan=19 height=19 class=xl7217903 width=1241 style='border-right:.5pt solid black;
  height:14.25pt;width:934pt'>入户走访统计</td>
 </tr>
 <tr class=xl1517903 height=19 style='height:14.25pt'>
  <td rowspan=2 height=57 class=xl6717903 width=46 style='border-bottom:.5pt solid black;
  height:42.75pt;border-top:none;width:35pt'>序号</td>
  <td rowspan=2 class=xl6717903 width=150 style='border-bottom:.5pt solid black;
  border-top:none;width:113pt'>单位</td>
  <td rowspan=2 class=xl6717903 width=72 style='border-bottom:.5pt solid black;
  border-top:none;width:54pt'>街道/乡镇干部</td>
  <td colspan=3 class=xl6917903 width=194 style='border-right:.5pt solid black;
  border-left:none;width:146pt'>辖区干部</td>
  <td colspan=4 class=xl6917903 width=235 style='border-right:.5pt solid black;
  border-left:none;width:177pt'>企事业单位人员</td>
  <td rowspan=2 class=xl6717903 width=52 style='border-bottom:.5pt solid black;
  border-top:none;width:39pt'>人大代表</td>
  <td rowspan=2 class=xl6717903 width=54 style='border-bottom:.5pt solid black;
  border-top:none;width:41pt'>政协委员</td>
  <td rowspan=2 class=xl6717903 width=62 style='border-bottom:.5pt solid black;
  border-top:none;width:47pt'>物管负责人</td>
  <td rowspan=2 class=xl6717903 width=80 style='border-bottom:.5pt solid black;
  border-top:none;width:60pt'>业主委员会成员</td>
  <td rowspan=2 class=xl6717903 width=59 style='border-bottom:.5pt solid black;
  border-top:none;width:44pt'>楼栋长</td>
  <td colspan=3 class=xl6917903 width=175 style='border-right:.5pt solid black;
  border-left:none;width:131pt'>入户走访</td>
  <td rowspan=2 class=xl6717903 width=62 style='border-bottom:.5pt solid black;
  border-top:none;width:47pt'>合计</td>
 </tr>
 <tr class=xl1517903 height=38 style='height:28.5pt'>
  <td height=38 class=xl6317903 width=72 style='height:28.5pt;width:54pt'>社区/村干部</td>
  <td class=xl6317903 width=72 style='width:54pt'>小区/组干部</td>
  <td class=xl6317903 width=50 style='width:38pt'>合计</td>
  <td class=xl6317903 width=61 style='width:46pt'>法人</td>
  <td class=xl6317903 width=63 style='width:47pt'>办公室主任</td>
  <td class=xl6317903 width=62 style='width:47pt'>安保负责人</td>
  <td class=xl6317903 width=49 style='width:37pt'>合计</td>
  <td class=xl6317903 width=72 style='width:54pt'>入室盗窃回访</td>
  <td class=xl6317903 width=51 style='width:38pt'>一般走访</td>
  <td class=xl6317903 width=52 style='width:39pt'>合计</td>
 </tr>
  <c:forEach items="${tjList}" var="tj" varStatus="s">
 <tr class=xl1517903 height=19 style='height:14.25pt'>
  <td height=19 class=xl6417903 width=46 style='height:14.25pt;width:35pt'>${s.index + 1}&nbsp;</td>
  <td class=xl6517903 width=150 style='width:113pt'>${tj.dwmc}&nbsp;</td>
  <td class=xl6617903 width=72 style='width:54pt'>${tj.jdgb}&nbsp;</td>
  <td class=xl6617903 width=72 style='width:54pt'>${tj.sqgb}&nbsp;</td>
  <td class=xl6617903 width=72 style='width:54pt'>${tj.xqgb}&nbsp;</td>
  <td class=xl6617903 width=50 style='width:38pt'>${tj.sqgb + tj.xqgb}&nbsp;</td>
  <td class=xl6617903 width=61 style='width:46pt'>${tj.dwfr}&nbsp;</td>
  <td class=xl6617903 width=63 style='width:47pt'>${tj.bgszr}&nbsp;</td>
  <td class=xl6617903 width=62 style='width:47pt'>${tj.zbry}&nbsp;</td>
  <td class=xl6617903 width=49 style='width:37pt'>${tj.dwfr + tj.zbry + tj.bgszr}&nbsp;</td>
  <td class=xl6617903 width=52 style='width:39pt'>${tj.rddb}&nbsp;</td>
  <td class=xl6617903 width=54 style='width:41pt'>${tj.zxwy}&nbsp;</td>
  <td class=xl6617903 width=62 style='width:47pt'>${tj.wgfzr}&nbsp;</td>
  <td class=xl6617903 width=80 style='width:60pt'>${tj.ywhcy}&nbsp;</td>
  <td class=xl6617903 width=59 style='width:44pt'>${tj.ldz}&nbsp;</td>
  <td class=xl6617903 width=72 style='width:54pt'>${tj.rsdqhf}&nbsp;</td>
  <td class=xl6617903 width=51 style='width:38pt'>${tj.ybzf}&nbsp;</td>
  <td class=xl6617903 width=52 style='width:39pt'>${tj.rsdqhf + tj.ybzf}&nbsp;</td>
  <td class=xl6617903 width=62 style='width:47pt'>${tj.hj}&nbsp;</td>
 </tr>
 </c:forEach> 
</table>
</div>
</body>
</html>
