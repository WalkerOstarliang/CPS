<%@ page language="java" pageEncoding="UTF-8" contentType="application/msword" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  String fileName = URLEncoder.encode("日志汇总", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".doc");
  response.setContentType("application/msword");
%> 

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Generator" content="Microsoft Word 11 (filtered)">
		<title>日志汇总</title>
		<style>
			<!-- /* Font Definitions */
			@font-face {
				font-family: 宋体;
				panose-1: 2 1 6 0 3 1 1 1 1 1;
			}
			
			@font-face {
				font-family: "\@宋体";
				panose-1: 2 1 6 0 3 1 1 1 1 1;
			}
			
			/* Style Definitions */
			p.MsoNormal,li.MsoNormal,div.MsoNormal {
				margin: 0cm;
				margin-bottom: .0001pt;
				text-align: justify;
				text-justify: inter-ideograph;
				font-size: 10.5pt;
				font-family: "Times New Roman";
			}
			
			p.MsoHeader,li.MsoHeader,div.MsoHeader {
				margin: 0cm;
				margin-bottom: .0001pt;
				text-align: center;
				layout-grid-mode: char;
				border: none;
				padding: 0cm;
				font-size: 9.0pt;
				font-family: "Times New Roman";
			}
			
			p.MsoFooter,li.MsoFooter,div.MsoFooter {
				margin: 0cm;
				margin-bottom: .0001pt;
				layout-grid-mode: char;
				font-size: 9.0pt;
				font-family: "Times New Roman";
			}
			
			/* Page Definitions */
			@page Section1 {
				size: 595.3pt 841.9pt;
				margin: 72.0pt 90.0pt 72.0pt 90.0pt;
				layout-grid: 15.6pt;
			}
			
			div.Section1 {
				page: Section1;
			}
			-->
		</style>
	</head>
	<body lang="ZH-CN" style='text-justify-trim: punctuation'>
		<div class="Section1" style='layout-grid: 15.6pt'>
			<div align="center">
				<table class="MsoTableGrid" border="1" cellspacing="0" cellpadding="0"
					width="686"
					style='width: 514.5pt; border-collapse: collapse; border: none'>
					<tr style='height: 18.85pt'>
						<td width="150"
							style='width: 112.6pt; border: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.85pt'>
							<p class="MsoNormal" align="center" style='text-align: center'>
								<b><span style='font-family: 宋体'>汇总时间</span>
								</b>
							</p>
						</td>
						<td width="247"
							style='width: 185.25pt; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.85pt'>
							<p class="MsoNormal" align="left" style='text-align: left'>
								<span lang='EN-US'>${rzhz.hzsj} </span>
							</p>
						</td>
						<td width=77
							style='width: 57.75pt; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.85pt'>
							<p class="MsoNormal" align="center" style='text-align: center'>
								<b><span style='font-family: 宋体'>填写人</span>
								</b>
							</p>
						</td>
						<td width=212
							style='width: 158.9pt; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.85pt'>
							<p class="MsoNormal" align=left style='text-align: left'>
								<span lang='EN-US'>${rzhz.gzmjxm}(${ rzhz.gzmjjh})</span>
							</p>
						</td>
					</tr>
					<tr style='height: 19.7pt'>
						<td width=150
							style='width: 112.6pt; border: solid windowtext 1.0pt; border-top: none; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.7pt'>
							<p class="MsoNormal" align="center" style='text-align: center'>
								<b><span style='font-family: 宋体'>汇总单位</span>
								</b>
							</p>
						</td>
						<td width=536 colspan=3
							style='width: 401.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.7pt'>
							<p class="MsoNormal" align=left style='text-align: left'>
								<span lang='EN-US'>${rzhz.hzdw}</span>
							</p>
						</td>
					</tr>
					<c:forEach items="${rzhz.rzList}" var="rz">
						<tr style='height: 18.85pt'>
							<td width=150
								style='width: 112.6pt; border: solid windowtext 1.0pt; border-top: none; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.85pt'>
								<p class="MsoNormal" align="center" style='text-align: center'>
									<b><span style='font-family: 宋体'>工作时间</span>
									</b>
								</p>
							</td>
							<td width=536 colspan=3
								style='width: 401.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.85pt'>
								<p class="MsoNormal" align="center" style='text-align: center'>
									<b><span style='font-family: 宋体'>工作内容描述</span>
									</b>
								</p>
							</td>
						</tr>
						<tr style='height: 104.4pt'>
							<td width=150
								style='width: 112.6pt; border: solid windowtext 1.0pt; border-top: none; padding: 0cm 5.4pt 0cm 5.4pt; height: 104.4pt'>
								<p class="MsoNormal" align="center" style='text-align: center'>
									<span lang='EN-US'>${rz.gzrq}</span>
								</p>
								<p class="MsoNormal" align="center" style='text-align: center'>
									<span lang='EN-US'>${rz.week}</span>
								</p>
							</td>
							<td width=536 colspan=3 valign=top
								style='width: 401.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 104.4pt'>
								<p class="MsoNormal" align=left style='text-align: left'>
									<span lang='EN-US'>${rz.gznr}</span>
								</p>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>

