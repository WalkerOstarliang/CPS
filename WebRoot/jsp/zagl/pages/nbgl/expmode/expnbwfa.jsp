<%@ page language="java" contentType="application/msexcel; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@page import="java.net.URLEncoder"%>

<%
	String fileName = URLEncoder.encode("全市市级治安保卫重点单位刑事案件情况统计表",
			"UTF-8");
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

.font518563 {
	color: windowtext;
	font-size: 9.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
}

.xl1518563 {
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
	text-align: general;
	vertical-align: bottom;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10118563 {
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
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10218563 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 10.0pt;
	font-weight: 400;
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

.xl10318563 {
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

.xl10418563 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 9.0pt;
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

.xl10518563 {
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
	text-align: general;
	vertical-align: bottom;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10618563 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 11.0pt;
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

.xl10718563 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 20.0pt;
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

.xl10818563 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 12.0pt;
	font-weight: 700;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
	mso-number-format: "m\0022月\0022d\0022日\0022";
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10918563 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
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
	white-space: normal;
}

.xl11018563 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 10.0pt;
	font-weight: 400;
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

.xl11118563 {
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
	text-align: center;
	vertical-align: bottom;
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
		<div id="市级单位发案统计样表（9.28-10.9）_18563" align=center
			x:publishsource="Excel">
			<table border=0 cellpadding=0 cellspacing=0 width=966
				style='border-collapse: collapse; table-layout: fixed; width: 727pt'>
				<col width=60
					style='mso-width-source: userset; mso-width-alt: 1920; width: 45pt'>
				<col width=82
					style='mso-width-source: userset; mso-width-alt: 2624; width: 62pt'>
				<col width=38
					style='mso-width-source: userset; mso-width-alt: 1216; width: 29pt'>
				<col width=64 span=2
					style='mso-width-source: userset; mso-width-alt: 2048; width: 48pt'>
				<col width=45 span=2
					style='mso-width-source: userset; mso-width-alt: 1440; width: 34pt'>
				<col width=64
					style='mso-width-source: userset; mso-width-alt: 2048; width: 48pt'>
				<col width=56
					style='mso-width-source: userset; mso-width-alt: 1792; width: 42pt'>
				<col width=64
					style='mso-width-source: userset; mso-width-alt: 2048; width: 48pt'>
				<col width=45 span=2
					style='mso-width-source: userset; mso-width-alt: 1440; width: 34pt'>
				<col width=64 span=4
					style='mso-width-source: userset; mso-width-alt: 2048; width: 48pt'>
				<col width=38
					style='mso-width-source: userset; mso-width-alt: 1216; width: 29pt'>
				<tr height=65 style='mso-height-source: userset; height: 48.75pt'>
					<td colspan=17 height=65 class=xl10718563 width=966
						style='height: 48.75pt; width: 727pt'>
						全市市级治安保卫重点单位刑事案件情况统计表
					</td>
				</tr>
				<tr height=26 style='mso-height-source: userset; height: 19.5pt'>
					<td rowspan=3 height=65 class=xl10818563
						style='height: 48.75pt; border-top: none'>
						单位
					</td>
					<td rowspan=3 class=xl10918563 width=82
						style='border-top: none; width: 62pt'>
						共计发案
					</td>
					<td colspan=5 class=xl10618563 style='border-left: none'>
						刑事案件种类
					</td>
					<td colspan=10 class=xl10618563 style='border-left: none'>
						各业务线
					</td>
				</tr>
				<tr height=19 style='mso-height-source: userset; height: 14.25pt'>
					<td colspan=3 height=19 class=xl10218563
						style='height: 14.25pt; border-left: none'>
						盗 窃
					</td>
					<td rowspan=2 class=xl11018563 width=45
						style='border-top: none; width: 34pt'>
						抢 劫
						<span style='mso-spacerun: yes'>&nbsp; </span>抢 夺
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						其他
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						党政机关
					</td>
					<td colspan=2 class=xl10218563 style='border-left: none'>
						学 校
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						医院
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						商场
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						大型企业
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						金融机构
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						三电油气
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						重点工程
					</td>
					<td rowspan=2 class=xl10218563 style='border-top: none'>
						其他
					</td>
				</tr>
				<tr height=20 style='mso-height-source: userset; height: 15.0pt'>
					<td height=20 class=xl10218563
						style='height: 15.0pt; border-top: none; border-left: none'>
						扒窃
					</td>
					<td class=xl10218563 style='border-top: none; border-left: none'>
						入室盗窃
					</td>
					<td class=xl10218563 style='border-top: none; border-left: none'>
						其他盗窃
					</td>
					<td class=xl10218563 style='border-top: none; border-left: none'>
						高校
					</td>
					<td class=xl10218563 style='border-top: none; border-left: none'>
						中小学校
					</td>
				</tr>
				<c:forEach items="${nbdwfatj}" var="nbdwfa">
					<tr height=27 style='mso-height-source: userset; height: 20.25pt'>
						<td height=27 class=xl10418563
							style='height: 20.25pt; border-top: none'>
							${nbdwfa.orgname}
						</td>
						<td class=xl10318563 style='border-top: none; border-left: none'>
							${nbdwfa.fazs}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.pq}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.rsdq}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.qtdq}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.qjqd}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.qtaj}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.dzjg}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.gx}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.zxx}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.yy}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.sc}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.qy}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.yh}
						</td>
						<td class=xl10118563 style='border-top: none; border-left: none'>
							${nbdwfa.sdyq}
						</td>
						<td class=xl10518563 style='border-top: none; border-left: none'>
							${nbdwfa.zdgc}
						</td>
						<td class=xl10518563 style='border-top: none; border-left: none'>
							${nbdwfa.qt}
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</body>
</html>
