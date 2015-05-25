<%@ page language="java" contentType="application/msexcel; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.net.URLEncoder" %>

<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("全市物业小区侵财案件发案情况统计表", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 

<html>
<head>
<style>
<!--
table {
	mso-displayed-decimal-separator: "\.";
	mso-displayed-thousand-separator: "\,";
}

.font531074 {
	color: windowtext;
	font-size: 9.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
}

.xl1531074 {
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

.xl10331074 {
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

.xl10431074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 14.0pt;
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

.xl10531074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 14.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border-top: none;
	border-right: none;
	border-bottom: none;
	border-left: 1.0pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10631074 {
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
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10731074 {
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
	mso-number-format: "0\.00_ ";
	text-align: center;
	vertical-align: middle;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl10831074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 14.0pt;
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

.xl10931074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 14.0pt;
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

.xl11031074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 14.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 宋体;
	mso-generic-font-family: auto;
	mso-font-charset: 134;
	mso-number-format: "0\.00_ ";
	text-align: center;
	vertical-align: middle;
	border: .5pt solid windowtext;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl11131074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 14.0pt;
	font-weight: 700;
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

.xl11231074 {
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

.xl11331074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 22.0pt;
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

.xl11431074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 14.0pt;
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

.xl11531074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: black;
	font-size: 14.0pt;
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

.xl11631074 {
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

.xl11731074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 12.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border-top: .5pt solid windowtext;
	border-right: none;
	border-bottom: .5pt solid windowtext;
	border-left: none;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl11831074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 12.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border-top: .5pt solid windowtext;
	border-right: .5pt solid windowtext;
	border-bottom: .5pt solid windowtext;
	border-left: none;
	mso-background-source: auto;
	mso-pattern: auto;
	white-space: nowrap;
}

.xl11931074 {
	padding-top: 1px;
	padding-right: 1px;
	padding-left: 1px;
	mso-ignore: padding;
	color: windowtext;
	font-size: 12.0pt;
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	font-family: 仿宋_GB2312, monospace;
	mso-font-charset: 134;
	mso-number-format: General;
	text-align: center;
	vertical-align: middle;
	border-top: .5pt solid windowtext;
	border-right: none;
	border-bottom: .5pt solid windowtext;
	border-left: .5pt solid windowtext;
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
		<div align=center x:publishsource="Excel">

			<table border=0 cellpadding=0 cellspacing=0 width=933
				style='border-collapse: collapse; table-layout: fixed; width: 701pt'>
				<col width=95
					style='mso-width-source: userset; mso-width-alt: 3040; width: 71pt'>
				<col width=60
					style='mso-width-source: userset; mso-width-alt: 1920; width: 45pt'>
				<col width=54
					style='mso-width-source: userset; mso-width-alt: 1728; width: 41pt'>
				<col width=68 span=2
					style='mso-width-source: userset; mso-width-alt: 2176; width: 51pt'>
				<col width=70 span=2
					style='mso-width-source: userset; mso-width-alt: 2240; width: 53pt'>
				<col width=54
					style='mso-width-source: userset; mso-width-alt: 1728; width: 41pt'>
				<col width=81
					style='mso-width-source: userset; mso-width-alt: 2592; width: 61pt'>
				<col width=75
					style='mso-width-source: userset; mso-width-alt: 2400; width: 56pt'>
				<col width=107
					style='mso-width-source: userset; mso-width-alt: 3424; width: 80pt'>
				<col width=63 style='width: 47pt'>
				<col width=68
					style='mso-width-source: userset; mso-width-alt: 2176; width: 51pt'>
				<tr height=44 style='mso-height-source: userset; height: 33.0pt'>
					<td colspan=11 height=44 class=xl11331074 width=802
						style='height: 33.0pt; width: 603pt'>
						全市物业小区侵财案件发案情况统计表
					</td>
				</tr>
				<tr height=29 style='mso-height-source: userset; height: 21.75pt'>
					<td colspan=11 height=29 class=xl11931074
						style='border-right: .5pt solid black; height: 21.75pt'>
						制表单位：${loginInfo.orgname}&nbsp;&nbsp;
						制表时间：${fn:substring(sysdate,0,4)}年${fn:substring(sysdate,4,6)}月${fn:substring(sysdate,6,8)}日
					</td>
				</tr>
				<tr height=25 style='height: 18.75pt'>
					<td rowspan=2 height=75 class=xl11631074
						style='height: 56.25pt; border-top: none'>
						单位
					</td>
					<td colspan=7 class=xl11531074 style='border-left: none'>
						刑事案件种类
					</td>
					<td rowspan=2 class=xl10431074 width=81
						style='border-top: none; width: 61pt'>
						本月发案总数
					</td>
					<td rowspan=2 class=xl10431074 width=75
						style='border-top: none; width: 56pt'>
						上月发案总数
					</td>
					<td rowspan=2 class=xl10431074 width=107
						style='border-top: none; width: 80pt'>
						环比上月%
					</td>
				</tr>
				<tr height=50 style='height: 37.5pt'>
					<td height=50 class=xl10431074 width=60
						style='height: 37.5pt; border-top: none; border-left: none; width: 45pt'>
						抢劫抢夺
					</td>
					<td class=xl10431074 width=54
						style='border-top: none; border-left: none; width: 41pt'>
						入室盗窃
					</td>
					<td class=xl10431074 width=68
						style='border-top: none; border-left: none; width: 51pt'>
						盗窃机动车
					</td>
					<td class=xl10431074 width=68
						style='border-top: none; border-left: none; width: 51pt'>
						盗窃摩托车
					</td>
					<td class=xl10431074 width=70
						style='border-top: none; border-left: none; width: 53pt'>
						盗窃电动车
					</td>
					<td class=xl10431074 width=70
						style='border-top: none; border-left: none; width: 53pt'>
						盗窃车内财物
					</td>
					<td class=xl10431074 width=54
						style='border-top: none; border-left: none; width: 41pt'>
						其他盗窃
					</td>
				</tr>
				
				<c:forEach items="${wyxqfatj}" var="xqfa">
					<tr height=44 style='mso-height-source: userset; height: 33.0pt'>
						<td height=44 class=xl10831074
							style='height: 33.0pt; border-top: none'>
							${xqfa.orgName}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.qjqd}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.rsdq}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.dqjdc}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.dqmtc}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.dqddc}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.dqcncw}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.qtdq}&nbsp;
						</td>
						<td class=xl10331074 style='border-top: none; border-left: none'>
							${xqfa.byzs}&nbsp;
						</td>
						<td class=xl10931074 style='border-top: none; border-left: none'>
							${xqfa.syzs}&nbsp;
						</td>
						<td class=xl11031074 style='border-top: none; border-left: none'>
							${xqfa.hb}&nbsp;
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>