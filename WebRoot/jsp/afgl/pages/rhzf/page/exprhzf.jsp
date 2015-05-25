<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("入户走访", "UTF-8");
  response.setHeader("Content-disposition","attachment; filename=" + fileName + ".xls"); 
%> 
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">

<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.font511004
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl1511004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
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
.xl6311004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6411004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6511004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
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
.xl6611004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:general;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6711004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6811004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:left;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6911004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7011004
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
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
	<div id="rhzf" align=center x:publishsource="Excel">
		<table border=0 cellpadding=0 cellspacing=0 width=2408 style='border-collapse:
		 collapse;table-layout:fixed;width:1809pt'>
			 <col width=42 style='mso-width-source:userset;mso-width-alt:1344;width:32pt'>
			 <col width=72 style='width:54pt'>
			 <col width=42 style='mso-width-source:userset;mso-width-alt:1344;width:32pt'>
			 <col width=102 style='mso-width-source:userset;mso-width-alt:3264;width:77pt'>
			 <col width=76 style='mso-width-source:userset;mso-width-alt:2432;width:57pt'>
			 <col class=xl6511004 width=152 style='mso-width-source:userset;mso-width-alt:
			 4864;width:114pt'>
			 <col width=102 style='mso-width-source:userset;mso-width-alt:3264;width:77pt'>
			 <col width=422 style='mso-width-source:userset;mso-width-alt:13504;width:317pt'>
			 <col width=531 style='mso-width-source:userset;mso-width-alt:16992;width:398pt'>
			 <col width=304 style='mso-width-source:userset;mso-width-alt:9728;width:228pt'>
			 <col width=287 style='mso-width-source:userset;mso-width-alt:9184;width:215pt'>
			 <col width=102 span=2 style='mso-width-source:userset;mso-width-alt:3264;
			 width:77pt'>
			 <col width=72 style='width:54pt'>
			 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
				  <td height=26 class=xl6911004 width=42 style='height:19.5pt;width:32pt'>序号</td>
				  <td class=xl6911004 width=72 style='border-left:none;width:54pt'>调查属性</td>
				  <td class=xl6911004 width=42 style='border-left:none;width:32pt'>分组</td>
				  <td class=xl6911004 width=102 style='border-left:none;width:77pt'>ID</td>
				  <td class=xl6911004 width=76 style='border-left:none;width:57pt'>姓名</td>
				  <td class=xl7011004 width=152 style='border-left:none;width:114pt'>身份证</td>
				  <td class=xl6911004 width=102 style='border-left:none;width:77pt'>电话</td>
				  <td class=xl6911004 width=422 style='border-left:none;width:317pt'>户籍地</td>
				  <td class=xl6911004 width=531 style='border-left:none;width:398pt'>现住地</td>
				  <td class=xl6911004 width=304 style='border-left:none;width:228pt'>所属社区</td>
				  <td class=xl6911004 width=287 style='border-left:none;width:215pt'>所属警务区</td>
				  <td class=xl6911004 width=102 style='border-left:none;width:77pt'>所属派出所</td>
				  <td class=xl6911004 width=102 style='border-left:none;width:77pt'>所属分县局</td>
				  <td class=xl6911004 width=72 style='border-left:none;width:54pt'>社区民警</td>
			 </tr>
			 
			 <c:forEach items="${expList}" var="rhzf" varStatus="s">
			 <tr height=18 style='height:13.5pt'>
				  <td height=18 class=xl6311004 align=right style='height:13.5pt;border-top:
				  none'>${s.index + 1}</td>
				  <td class=xl6311004 align=right style='border-top:none;border-left:none'>${rhzf.sx}&nbsp;</td>
				  <td class=xl6311004 align=right style='border-top:none;border-left:none'>${rhzf.fz}&nbsp;</td>
				  <td class=xl6411004 align=right width=102 style='border-top:none;border-left:
				  none;width:77pt'>${rhzf.id}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.xm}&nbsp;</td>
				  <td class=xl6611004 style='border-top:none;border-left:none'>${rhzf.sfzh}&nbsp;</td>
				  <td class=xl6311004 align=right style='border-top:none;border-left:none'>${rhzf.lxdh}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.hjdxz}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.xzzxz}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.sssq}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.ssjwq}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.pcs}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.fxj}&nbsp;</td>
				  <td class=xl6311004 style='border-top:none;border-left:none'>${rhzf.sqmj}&nbsp;</td>
			 </tr>
			 </c:forEach>
		</table>
	</div>
</body>
</html>
