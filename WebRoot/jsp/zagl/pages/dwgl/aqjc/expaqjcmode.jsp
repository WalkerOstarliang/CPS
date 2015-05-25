<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("安全检查", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type content="text/html;">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.font520518
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl1520518
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
.xl6320518
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:700;
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
.xl6420518
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
<div align=center>

<table border=0 cellpadding=0 cellspacing=0 width=1560 style='border-collapse:
 collapse;table-layout:fixed;width:1172pt'>
 <col width=72 span=2 style='width:54pt'>
 <col width=88 style='mso-width-source:userset;mso-width-alt:2816;width:66pt'>
 <col width=72 span=2 style='width:54pt'>
 <col width=138 style='mso-width-source:userset;mso-width-alt:4416;width:104pt'>
 <col width=57 span=2 style='mso-width-source:userset;mso-width-alt:1824;
 width:43pt'>
 <col width=72 span=4 style='width:54pt'>
 <col width=104 span=2 style='mso-width-source:userset;mso-width-alt:3328;
 width:78pt'>
 <col width=121 style='mso-width-source:userset;mso-width-alt:3872;width:91pt'>
 <col width=72 style='width:54pt'>
 <col width=42 style='mso-width-source:userset;mso-width-alt:1344;width:32pt'>
 <col width=57 style='mso-width-source:userset;mso-width-alt:1824;width:43pt'>
 <col width=72 span=2 style='width:54pt'>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6320518  style='height:13.5pt;width:54pt'>序号</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>机构编号</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>单位名称</td>
  <td class=xl6320518  style='border-left:none;width:66pt'>检查人姓名</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>检查单位</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>检查日期</td>
  <td class=xl6320518  style='border-left:none;width:104pt'>被检查单位负责人</td>
  <td class=xl6320518  style='border-left:none;width:43pt'>见证人</td>
  <td class=xl6320518  style='border-left:none;width:43pt'>记录人</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>检查内容</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>检查部位</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>检查情况</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>发现问题</td>
  <td class=xl6320518  style='border-left:none;width:78pt'>检查处理情况</td>
  <td class=xl6320518  style='border-left:none;width:78pt'>限期整改日期</td>
  <td class=xl6320518  style='border-left:none;width:78pt'>处理意见</td>
  <td class=xl6320518  style='border-left:none;width:91pt'>被检查单位意见</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>整改结果</td>
  <td class=xl6320518  style='border-left:none;width:32pt'>备注</td>
  <td class=xl6320518  style='border-left:none;width:43pt'>录入人</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>录入单位</td>
  <td class=xl6320518  style='border-left:none;width:54pt'>录入时间</td>
 </tr>
 <c:forEach items="${aqjcList}" var="aqjc" varStatus="s">
 <tr height=18 style='height:13.5pt'>
 
  <td height=18 class=xl6420518 style='height:13.5pt;border-top:none'>${s.index + 1}&nbsp;</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jgbh}&nbsp;</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.dwmc}&nbsp;</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcryxm}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcdwmc}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcsj}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.bjcdwfzr}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcjzr}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcjlr}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcnr}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcbw}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcqk}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.fxwt}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcclqkmc}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcxqzgrq}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jcclyj}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.bjcdwyj}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.jczgjg}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.bz}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.djrxm}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.djdwmc}&nbsp;　</td>
  <td class=xl6420518 style='border-top:none;border-left:none'>${aqjc.djsj}&nbsp;　</td>
 </tr>
 </c:forEach>
</table>
</div>
</body>
</html>
