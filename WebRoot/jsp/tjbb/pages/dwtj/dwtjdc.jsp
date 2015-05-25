<%@page contentType="application/msexcel; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%
	response.setHeader("Content-disposition","inline; filename=dwtj.xls");  
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <style>
<!-- @page
	{margin:0.98in 0.75in 0.98in 0.75in;
	mso-header-margin:0.51in;
	mso-footer-margin:0.51in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.font0
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font1
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font2
	{color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font3
	{color:#003366;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font4
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font5
	{color:#000000;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font6
	{color:#003366;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font7
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font8
	{color:#003366;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font9
	{color:#993300;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font10
	{color:#FF9900;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font11
	{color:#333399;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font12
	{color:#333333;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font13
	{color:#800080;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font14
	{color:#808080;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font15
	{color:#FF9900;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font16
	{color:#008000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font17
	{color:#003366;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.style0
	{mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Normal";
	mso-style-id:0;}
.style16
	{mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"Comma";
	mso-style-id:3;}
.style17
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0\.00_ \;_ \0022\00A5\0022* \\-\#\,\#\#0\.00_ \;_ \0022\00A5\0022* \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"Currency";
	mso-style-id:4;}
.style18
	{mso-number-format:"_ * \#\,\#\#0_ \;_ * \\-\#\,\#\#0_ \;_ * \0022-\0022_ \;_ \@_ ";
	mso-style-name:"Comma[0]";
	mso-style-id:6;}
.style19
	{mso-pattern:auto none;
	background:#800080;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"强调文字颜色 4";}
.style20
	{mso-number-format:"0%";
	mso-style-name:"Percent";
	mso-style-id:5;}
.style21
	{mso-pattern:auto none;
	background:#FF99CC;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"20% - 强调文字颜色 2";}
.style22
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0_ \;_ \0022\00A5\0022* \\-\#\,\#\#0_ \;_ \0022\00A5\0022* \0022-\0022_ \;_ \@_ ";
	mso-style-name:"Currency[0]";
	mso-style-id:7;}
.style23
	{color:#003366;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"标题";}
.style24
	{mso-pattern:auto none;
	background:#CCCCFF;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"20% - 强调文字颜色 1";}
.style25
	{mso-pattern:auto none;
	background:#FFCC99;
	color:#333399;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:.5pt solid #808080;
	mso-style-name:"输入";}
.style26
	{mso-pattern:auto none;
	background:#CCFFCC;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"20% - 强调文字颜色 3";}
.style27
	{mso-pattern:auto none;
	background:#CC99FF;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"20% - 强调文字颜色 4";}
.style28
	{mso-pattern:auto none;
	background:#333399;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"强调文字颜色 1";}
.style29
	{mso-pattern:auto none;
	background:#CCFFFF;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"20% - 强调文字颜色 5";}
.style30
	{mso-pattern:auto none;
	background:#FF0000;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"强调文字颜色 2";}
.style31
	{color:#FF9900;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double #FF9900;
	mso-style-name:"链接单元格";}
.style32
	{mso-pattern:auto none;
	background:#FFCC99;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"20% - 强调文字颜色 6";}
.style33
	{mso-pattern:auto none;
	background:#99CCFF;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"40% - 强调文字颜色 1";}
.style34
	{mso-pattern:auto none;
	background:#FF8080;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"40% - 强调文字颜色 2";}
.style35
	{mso-pattern:auto none;
	background:#FF99CC;
	color:#800080;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"差";}
.style36
	{mso-pattern:auto none;
	background:#00FF00;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"40% - 强调文字颜色 3";}
.style37
	{mso-pattern:auto none;
	background:#CC99FF;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"40% - 强调文字颜色 4";}
.style38
	{mso-pattern:auto none;
	background:#99CCFF;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"40% - 强调文字颜色 5";}
.style39
	{mso-pattern:auto none;
	background:#FFCC00;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"40% - 强调文字颜色 6";}
.style40
	{color:#003366;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid #0066CC;
	mso-style-name:"标题 3";}
.style41
	{mso-pattern:auto none;
	background:#0066CC;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 1";}
.style42
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"警告文本";}
.style43
	{color:#003366;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"标题 4";}
.style44
	{mso-pattern:auto none;
	background:#FF8080;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 2";}
.style45
	{mso-pattern:auto none;
	background:#00FF00;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 3";}
.style46
	{mso-pattern:auto none;
	background:#C0C0C0;
	color:#333333;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:.5pt solid #333333;
	mso-style-name:"输出";}
.style47
	{mso-pattern:auto none;
	background:#800080;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 4";}
.style48
	{mso-pattern:auto none;
	background:#33CCCC;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 5";}
.style49
	{mso-pattern:auto none;
	background:#FF9900;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 6";}
.style50
	{color:#003366;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #333399;
	mso-style-name:"标题 1";}
.style51
	{color:#003366;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #C0C0C0;
	mso-style-name:"标题 2";}
.style52
	{mso-pattern:auto none;
	background:#CCFFCC;
	color:#008000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"好";}
.style53
	{color:#000000;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border-left:none;
	border-top:.5pt solid #333399;
	border-right:none;
	border-bottom:2.0pt double #333399;
	mso-style-name:"汇总";}
.style54
	{mso-pattern:auto none;
	background:#C0C0C0;
	color:#FF9900;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:.5pt solid #808080;
	mso-style-name:"计算";}
.style55
	{mso-pattern:auto none;
	background:#969696;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:2.0pt double #333333;
	mso-style-name:"检查单元格";}
.style56
	{color:#808080;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"解释性文本";}
.style57
	{mso-pattern:auto none;
	background:#339966;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"强调文字颜色 3";}
.style58
	{mso-pattern:auto none;
	background:#33CCCC;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"强调文字颜色 5";}
.style59
	{mso-pattern:auto none;
	background:#FF6600;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"强调文字颜色 6";}
.style60
	{mso-pattern:auto none;
	background:#FFFF99;
	color:#993300;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"适中";}
.style61
	{mso-pattern:auto none;
	background:#FFFFCC;
	border:.5pt solid #C0C0C0;
	mso-style-name:"注释";}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;}
.xl63
	{mso-style-parent:style0;
	text-align:center;}
.xl64
	{mso-style-parent:style0;
	text-align:center;}
.xl65
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl67
	{mso-style-parent:style0;
	white-space:normal;
	border:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	border:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	text-align:center;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
 -->  </style>
 </head>
 <body link="blue" vlink="purple">
  <table width="831" border="0" cellpadding="0" cellspacing="0" style='width:623.25pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="72" class="xl63" style='mso-width-source:userset;mso-width-alt:2304;'/>
   <col width="72" style='width:54.00pt;'/>
   <col width="76" style='mso-width-source:userset;mso-width-alt:2432;'/>
   <col width="92" style='mso-width-source:userset;mso-width-alt:2944;'/>
   <col width="72" span="2" style='width:54.00pt;'/>
   <col width="78" style='mso-width-source:userset;mso-width-alt:2496;'/>
   <col width="37" span="6" style='mso-width-source:userset;mso-width-alt:1184;'/>
   <col width="42" class="xl64" style='mso-width-source:userset;mso-width-alt:1344;'/>
   <col width="33" style='mso-width-source:userset;mso-width-alt:1056;'/>
   <tr height="19" style='height:14.25pt;'>
   	 <td class="xl65" height="38" width="72" rowspan="2" style='height:28.50pt;width:54.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>序号</td>
    <td class="xl65" height="38" width="72" rowspan="2" style='height:28.50pt;width:54.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>单位</td>
    <td class="xl65" width="72" rowspan="2" style='width:54.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>总数</td>
    <td class="xl66" width="390" colspan="5" style='width:292.50pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>特种行业</td>
    <td class="xl67" width="37" rowspan="2" style='width:27.75pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>公共场所</td>
    <td class="xl67" width="37" rowspan="2" style='width:27.75pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>内保单位</td>
    <td class="xl67" width="37" rowspan="2" style='width:27.75pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>危险单位</td>
    <td class="xl67" width="37" rowspan="2" style='width:27.75pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>上网场所</td>
    <td class="xl67" width="37" rowspan="2" style='width:27.75pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>涉外单位</td>
    <td class="xl67" width="37" rowspan="2" style='width:27.75pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>商铺门店</td>
    <td class="xl71" width="42" rowspan="2" style='width:31.50pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>物流业</td>
    <td class="xl67" width="33" rowspan="2" style='width:24.75pt;border-right:.5pt solid windowtext;border-bottom:none;' x:str>其他</td>
   </tr>
   <tr height="19" class="xl63" style='height:14.25pt;'>
    <td class="xl66" x:str>旅馆业</td>
    <td class="xl66" x:str>开锁业</td>
    <td class="xl66" x:str>拍卖业</td>
    <td class="xl66" x:str>典当业</td>
    <td class="xl66" x:str>其他</td>
   </tr>
   <c:forEach items="${dwList}" var="dw" varStatus="s">
	   <tr height="19" style='height:14.25pt;'>
	   		<td class="xl65">${s.index + 1}&nbsp;</td>
		    <td class="xl65">${dw.dwmc}&nbsp;</td>
		    <td class="xl69">${dw.zs}&nbsp;</td>
		    <td class="xl69">${dw.lg}&nbsp;</td>
		    <td class="xl69">${dw.ksdw}&nbsp;</td>
		    <td class="xl69">${dw.pmh}&nbsp;</td>
		    <td class="xl69">${dw.ddh}&nbsp;</td>
		    <td class="xl69">${dw.qtth}&nbsp;</td>
		    <td class="xl70">${dw.ggcs}&nbsp;</td>
		    <td class="xl70">${dw.nbdw}&nbsp;</td>
		    <td class="xl70">${dw.wbdw}&nbsp;</td>
		    <td class="xl70">${dw.wb}&nbsp;</td>
		    <td class="xl70">${dw.swdw}&nbsp;</td>
		    <td class="xl70">${dw.sp}&nbsp;</td>
		    <td class="xl73">${dw.wldw}&nbsp;</td>
		    <td class="xl70">${dw.qtdw}&nbsp;</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>
