<%@ page language="java"
	contentType="application/msexcel; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@page import="java.net.URLEncoder"%>
<%
	String fileName = URLEncoder.encode("市级治安保卫重点单位发案情况明细表", "UTF-8");
	response.setHeader("Content-disposition", "inline; filename="
			+ fileName + ".xls");
%>

<html>
	<head>
		<style>
<!--
table {
	mso-displayed-decimal-separator: "\.";
	mso-displayed-thousand-separator: "\,";
}

.font526468 {
	color: windowtext;
	font-size: 9.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
}

.xl10126468 {
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
	mso-number-format: "\@";
	text-align: general;
	vertical-align: bottom;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10226468 {
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
	mso-number-format: "\@";
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10326468 {
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
	mso-number-format: "\@";
	text-align: general;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10426468 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 14.0pt;
	font-weight: 700;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
	mso-number-format: "\@";
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10526468 {
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
	mso-number-format: "\@";
	text-align: general;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10626468 {
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
	mso-number-format: "\@";
	text-align: general;
	vertical-align: middle;
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


		<div id="市级单位发案统计样表（9.28-10.9）_26468" align=center
			x:publishsource="Excel">

			<table border=0 cellpadding=0 cellspacing=0 width=1104
				style='border-collapse: collapse; table-layout: fixed; width: 829pt'>
				<col class=xl10626468 width=48
					style='mso-width-source: userset; mso-width-alt: 1536; width: 36pt'>
				<col class=xl10626468 width=82 span=2
					style='mso-width-source: userset; mso-width-alt: 2624; width: 62pt'>
				<col class=xl10626468 width=44
					style='mso-width-source: userset; mso-width-alt: 1408; width: 33pt'>
				<col class=xl10626468 width=76 span=3
					style='mso-width-source: userset; mso-width-alt: 2432; width: 57pt'>
				<col class=xl10626468 width=44
					style='mso-width-source: userset; mso-width-alt: 1408; width: 33pt'>
				<col class=xl10126468 width=72 span=8 style='width: 54pt'>
				<tr height=25 style='height: 18.75pt'>
					<td colspan=8 height=25 class=xl10426468 width=528
						style='height: 18.75pt; width: 397pt'>
						市级治安保卫重点单位发案情况明细表
					</td>
				</tr>
				<tr height=19 style='height: 14.25pt'>
					<td rowspan=2 height=38 class=xl10226468
						style='height: 28.5pt; border-top: none'>
						序号
					</td>
					<td rowspan=2 class=xl10226468 style='border-top: none'>
						单位名称
					</td>
					<td rowspan=2 class=xl10226468 style='border-top: none'>
						抢劫抢夺
					</td>
					<td colspan=3 class=xl10226468 style='border-left: none'>
						盗窃
					</td>
					<td rowspan=2 class=xl10226468 style='border-top: none'>
						其他案件
					</td>
					<td rowspan=2 class=xl10226468 style='border-top: none'>
						合计
					</td>
				</tr>
				<tr height=19 style='height: 14.25pt'>
					<td height=19 class=xl10326468
						style='height: 14.25pt; border-top: none; border-left: none'>
						扒窃
					</td>
					<td class=xl10326468 style='border-top: none; border-left: none'>
						入室盗窃
					</td>
					<td class=xl10326468 style='border-top: none; border-left: none'>
						其他盗窃
					</td>
				</tr>
				<c:forEach items="${zddwfatj}" var="zddwfa" varStatus="s">
				<tr height=19 style='height: 14.25pt'>
					<td height=19 class=xl10526468
						style='height: 14.25pt; border-top: none'>
						${s.index + 1}&nbsp;
					</td>
					<td class=xl10526468 style='border-top: none; border-left: none'>
						${zddwfa.dwmc}&nbsp;
					</td>
					<td class=xl10526468 style='border-top: none; border-left: none'>
						${zddwfa.qjqd}&nbsp;
					</td>
					<td class=xl10526468 style='border-top: none; border-left: none'>
						${zddwfa.pq}&nbsp;
					</td>
					<td class=xl10526468 style='border-top: none; border-left: none'>
						${zddwfa.rsdq}&nbsp;
					</td>
					<td class=xl10526468 style='border-top: none; border-left: none'>
						${zddwfa.qtdq}&nbsp;
					</td>
					<td class=xl10526468 style='border-top: none; border-left: none'>
						${zddwfa.qtaj}&nbsp;
					</td>
					<td class=xl10526468 style='border-top: none; border-left: none'>
						${zddwfa.hj}&nbsp;
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</body>

</html>
