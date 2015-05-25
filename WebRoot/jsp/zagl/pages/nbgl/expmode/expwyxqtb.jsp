<%@ page language="java"
	contentType="application/msexcel; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@page import="java.net.URLEncoder"%>
<%
		String fileName = URLEncoder.encode("全市物业小区侵财案件发案情况通报", "UTF-8");
		response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls");
%>
<html>
	<head>
		<style>
<!--
table {
	mso-displayed-decimal-separator: "\.";
	mso-displayed-thousand-separator: "\,";
}

.font59691 {
	color: windowtext;
	font-size: 9.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
}

.xl1039691 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 12.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl1049691 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 12.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: normal;
}

.xl1059691 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 12.0pt;
	font-weight: 700;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl1069691 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 12.0pt;
	font-weight: 700;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border-top: .5pt solid windowtext;
	border-right: .5pt solid windowtext;
	border-bottom: none;
	border-left: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl1079691 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 12.0pt;
	font-weight: 700;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border-top: .5pt solid windowtext;
	border-right: .5pt solid windowtext;
	border-bottom: none;
	border-left: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: normal;
}

.xl1089691 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 12.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: left;
	vertical-align: top;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

ruby {
	ruby-align: left;
}

rt {
	color: windowtext;
	font-size: 9.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
	mso-char-type: none;
}
-->
</style>
	</head>

	<body>
		<div id="全市物业小区发案情况计算样表(内保)_9691" align=center x:publishsource="Excel">
			<table border=0 cellpadding=0 cellspacing=0 width=811
				style='border-collapse: collapse; table-layout: fixed; width: 608pt'>
				<col class=xl655359691 width=149
					style='mso-width-source: userset; mso-width-alt: 4768; width: 112pt'>
				<col class=xl655359691 width=160
					style='mso-width-source: userset; mso-width-alt: 5120; width: 120pt'>
				<col class=xl655359691 width=200
					style='mso-width-source: userset; mso-width-alt: 6400; width: 150pt'>
				<col class=xl655359691 width=163
					style='mso-width-source: userset; mso-width-alt: 5216; width: 122pt'>
				<col class=xl655359691 width=139
					style='mso-width-source: userset; mso-width-alt: 4448; width: 104pt'>
				<tr height=19 style='height: 14.25pt'>
					<td colspan=5 height=19 class=xl1059691 width=811
						style='height: 14.25pt; width: 608pt'>
						全市物业小区侵财案件发案情况
					</td>
				</tr>
				<tr height=19 style='height: 14.25pt'>
					<td height=19 class=xl1069691
						style='height: 14.25pt; border-top: none'>
						分局
					</td>
					<td class=xl1069691 style='border-top: none; border-left: none'>
						派出所
					</td>
					<td class=xl1069691 style='border-top: none; border-left: none'>
						物业小区
					</td>
					<td class=xl1079691 width=163
						style='border-top: none; border-left: none; width: 122pt'>
						物业公司
					</td>
					<td class=xl1079691 width=139
						style='border-top: none; border-left: none; width: 104pt'>
						发案数
					</td>
				</tr>
				<c:forEach items="${wyxqTb}"  var="wyxq" varStatus="s">
				<tr height=19 style='height: 14.25pt'>
					<td height=19 class=xl1039691 style='height: 14.25pt'>
						${wyxq.qxj}&nbsp;
					</td>
					<td class=xl1039691 style='border-left: none'>
						${wyxq.pcs}&nbsp;
					</td>
					<td class=xl1039691 style='border-left: none'>
						${wyxq.wyxq}&nbsp;
					</td>
					<td class=xl1049691 width=163
						style='border-left: none; width: 122pt'>
						${wyxq.wygs}&nbsp;
					</td>
					<td class=xl1049691 width=139
						style='border-left: none; width: 104pt'>
						${wyxq.fas}&nbsp;
					</td>
				</tr>
				</c:forEach>
				<tr height=19 style='height: 14.25pt'>
					<td colspan=5 height=19 class=xl1089691 style='height: 14.25pt'>
						注：本表需统计全市发案最高的十个物业小区，以及全市十个区县发案最高的十个小区
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
