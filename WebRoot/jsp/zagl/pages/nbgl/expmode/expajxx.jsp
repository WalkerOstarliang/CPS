<%@ page language="java"
	contentType="application/msexcel; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%
	String fileName = URLEncoder.encode("发案详情", "UTF-8");
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

.font530321 {
	color: windowtext;
	font-size: 9.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
}

.font630321 {
	color: windowtext;
	font-size: 9.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
}

.xl1530321 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 10.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: Arial, sans-serif;
	mso-font-charset: 0;
	mso-number-format: General;
	text-align: general;
	vertical-align: bottom;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl5830321 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 10.8pt;
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
	white-space: normal;
}

.xl5930321 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 10.0pt;
	font-weight: 700;
	font-style: normal;
	text-decoration: none;
	font-family: Arial, sans-serif;
	mso-font-charset: 0;
	mso-number-format: General;
	text-align: general;
	vertical-align: bottom;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl6030321 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 10.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: Arial, sans-serif;
	mso-font-charset: 0;
	mso-number-format: General;
	text-align: general;
	vertical-align: bottom;
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
	<div align=center x:publishsource="Excel">
		<table border=0 cellpadding=0 cellspacing=0 width=1088
			style='border-collapse: collapse; table-layout: fixed; width: 818pt'>
			<col width=42
				style='mso-width-source: userset; mso-width-alt: 1536; width: 32pt'>
			<col width=82 span=2
				style='mso-width-source: userset; mso-width-alt: 2998; width: 62pt'>
			<col width=96
				style='mso-width-source: userset; mso-width-alt: 3510; width: 72pt'>
			<col width=102
				style='mso-width-source: userset; mso-width-alt: 3730; width: 77pt'>
			<col width=95
				style='mso-width-source: userset; mso-width-alt: 3474; width: 71pt'>
			<col width=80
				style='mso-width-source: userset; mso-width-alt: 2925; width: 60pt'>
			<col width=92
				style='mso-width-source: userset; mso-width-alt: 3364; width: 69pt'>
			<col width=96
				style='mso-width-source: userset; mso-width-alt: 3510; width: 72pt'>
			<col width=159
				style='mso-width-source: userset; mso-width-alt: 5814; width: 119pt'>
			<col width=162
				style='mso-width-source: userset; mso-width-alt: 5924; width: 122pt'>
			<tr class=xl5930321 height=17 style='height: 12.75pt'>
				<td height=17 class=xl5830321 width=42
					style='height: 12.75pt; width: 32pt'>
					序号
				</td>
				<td class=xl5830321 width=82 style='border-left: none; width: 62pt'>
					案件编号
				</td>
				<td class=xl5830321 width=82 style='border-left: none; width: 62pt'>
					报警时间
				</td>
				<td class=xl5830321 width=82 style='border-left: none; width: 62pt'>
					案发区域
				</td>
				<td class=xl5830321 width=96 style='border-left: none; width: 72pt'>
					案发地点
				</td>
				<td class=xl5830321 width=95 style='border-left: none; width: 71pt'>
					案件类别
				</td>
				<td class=xl5830321 width=80 style='border-left: none; width: 60pt'>
					案件细类
				</td>
				<td class=xl5830321 width=92 style='border-left: none; width: 69pt'>
					电话
				</td>
				<td class=xl5830321 width=96 style='border-left: none; width: 72pt'>
					管辖单位
				</td>
				<td class=xl5830321 width=159
					style='border-left: none; width: 119pt'>
					主要内容
				</td>
			</tr>
			<c:forEach items="${ajxxList}" var="aj" varStatus="s">
				<tr height=17 style='height: 12.75pt'>
					<td height=17 class=xl6030321
						style='height: 12.75pt; border-top: none'>
						${s.index + 1}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.ajbh}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.bjrq}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.faqy}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.faxz}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.dl}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.xl}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.lxdh}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.gxdw}&nbsp;
					</td>
					<td class=xl6030321 style='border-top: none; border-left: none'>
						${aj.jyaq}&nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</body>
</html>