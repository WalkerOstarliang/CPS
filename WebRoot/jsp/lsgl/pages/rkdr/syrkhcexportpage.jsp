<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("实有人口错误信息导出.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <style>
  @page
	{margin:0.75in 0.71in 0.75in 0.71in;
	mso-header-margin:0.32in;
	mso-footer-margin:0.32in;}
	
	tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:#000000;
	font-size:11.0pt;
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
	background:#666699;
	color:#CCFFCC;
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
	background:#FFCC99;
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
	{color:#333399;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"标题";}
.style24
	{mso-pattern:auto none;
	background:#FFFFFF;
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
	background:#FFFFCC;
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
	background:#FFFFFF;
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
	background:#33CCCC;
	color:#CCFFCC;
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
	color:#CCFFCC;
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
	background:#C0C0C0;
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
	background:#FFFF99;
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
	background:#C0C0C0;
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
	background:#FFCC99;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"40% - 强调文字颜色 6";}
.style40
	{color:#333399;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid #33CCCC;
	mso-style-name:"标题 3";}
.style41
	{mso-pattern:auto none;
	background:#33CCCC;
	color:#CCFFCC;
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
	{color:#333399;
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
	color:#CCFFCC;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 2";}
.style45
	{mso-pattern:auto none;
	background:#FFFF99;
	color:#CCFFCC;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 3";}
.style46
	{mso-pattern:auto none;
	background:#FFFFFF;
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
	background:#C0C0C0;
	color:#CCFFCC;
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
	color:#CCFFCC;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 5";}
.style49
	{mso-pattern:auto none;
	background:#FFCC99;
	color:#CCFFCC;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	mso-style-name:"60% - 强调文字颜色 6";}
.style50
	{color:#333399;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #33CCCC;
	mso-style-name:"标题 1";}
.style51
	{color:#333399;
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
	border-top:.5pt solid #33CCCC;
	border-right:none;
	border-bottom:2.0pt double #33CCCC;
	mso-style-name:"汇总";}
.style54
	{mso-pattern:auto none;
	background:#FFFFFF;
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
	color:#CCFFCC;
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
	color:#CCFFCC;
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
	color:#CCFFCC;
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
	color:#CCFFCC;
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
	color:#000000;
	font-size:11.0pt;
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
	mso-number-format:"\@";}
.xl65
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";}
.xl66
	{mso-style-parent:style0;
	text-align:center;
	color:windowtext;
	font-size:12.0pt;
	border:.5pt solid windowtext;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	border:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	mso-number-format:"\@";
	color:windowtext;
	font-size:12.0pt;
	border:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";
	color:windowtext;
	font-size:12.0pt;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	mso-number-format:"\@";
	border:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";
	border:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	font-size:12.0pt;
	border:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	text-align:center;
	font-size:12.0pt;
	border:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
  </style>
  <!--[if gte mso 9]>
   <xml>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>270</x:DefaultRowHeight>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>1</x:SplitHorizontal>
     <x:TopRowBottomPane>1</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveCol>5</x:ActiveCol>
       <x:ActiveRow>10</x:ActiveRow>
       <x:RangeSelection>F11</x:RangeSelection>
      </x:Pane>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>200</x:HorizontalResolution>
      <x:VerticalResolution>200</x:VerticalResolution>
     </x:Print>
    </x:WorksheetOptions>
    <x:DataValidation>
     <x:Range>$I$2:I4</x:Range>
     <x:Type>List</x:Type>
     <x:CellRangeList/>
     <x:Value>&quot;01-雇员与员工,02-承租人,03-亲属,04-非亲属,101-本人,102-户主,120-子,111-夫,112-妻,130-女,150-父母,170-兄弟姐妹,99-其他&quot;</x:Value>
    </x:DataValidation>
    <x:DataValidation>
     <x:Range>$H$2:H4</x:Range>
     <x:Type>List</x:Type>
     <x:CellRangeList/>
     <x:Value>&quot;00-暂住处所不详,01-宾馆,02-公寓,03-旅馆,04-旅店,05-招待所,11-医院,12-疗养院,13-康复中心,21-机关,22-团体,23-部队,24-学校,25-企事业单位内部,26-宗教场所,27-外地常驻机构,31-居民家中,32-自建房屋,33-购买房屋,34-租赁房屋,41-流动性施工单位,42-临时工棚,43-水上船舶,51-个体摊点,61-收容站,62-遣送站,99-其他暂住处所&quot;</x:Value>
    </x:DataValidation>
    <x:DataValidation>
     <x:Range>$G$2:G4</x:Range>
     <x:Type>List</x:Type>
     <x:CellRangeList/>
     <x:Value>&quot;00-事由不详,01-内部单位合同工,02-企事业雇用临时工,03-建筑民工,04-装卸运输工,05-办厂,06-务农,07-养殖,09-其他劳务,11-单位经商,12-个体户经商,19-其他经营,37-保姆,39-其他服务,49-其他经济型,53-寄读、借读,57-婚入,80-夫妻投靠,81-子女投靠父母,82-父母投靠子女,83-其他投靠亲友,100-房屋拆迁,400-投靠亲友,500-分配调动工作,600-分换房屋&quot;</x:Value>
    </x:DataValidation>
    <x:DataValidation>
     <x:Range>$J$2:J4</x:Range>
     <x:Type>List</x:Type>
     <x:CellRangeList/>
     <x:Value>&quot;1-一个月,2-三个月,3-六个月,4-一年,5-两年,6-三年&quot;</x:Value>
    </x:DataValidation>
   </xml>
  <![endif]-->
  <script language="JavaScript">
	if (window.name!="frSheet")
		window.location.replace("../实有人口批量采集表格.htm");
	else
		parent.fnUpdateTabs(0);
</script>
 </head>
 <body link="blue" vlink="purple">
  <table width="1354" border="0" cellpadding="0" cellspacing="0" style='width:1015.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="45" class="xl63" style='mso-width-source:userset;mso-width-alt:1440;'/>
   <col width="280" class="xl63" style='mso-width-source:userset;mso-width-alt:8960;'/>
   <col width="72" style='width:54.00pt;'/>
   <col width="163" class="xl64" style='mso-width-source:userset;mso-width-alt:5216;'/>
   <col width="92" style='mso-width-source:userset;mso-width-alt:2944;'/>
   <col width="79" class="xl65" style='mso-width-source:userset;mso-width-alt:2528;'/>
   <col width="168" style='mso-width-source:userset;mso-width-alt:5376;'/>
   <col width="97" style='mso-width-source:userset;mso-width-alt:3104;'/>
   <col width="98" span="2" style='mso-width-source:userset;mso-width-alt:3136;'/>
   <col width="90" style='mso-width-source:userset;mso-width-alt:2880;'/>
   <col width="72" style='width:54.00pt;'/>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl66" height="19" width="45" style='height:14.25pt;width:33.75pt;'>序号</td>
    <td class="xl66" width="280" style='width:210.00pt;'>房屋地址</td>
    <td class="xl67" width="72" style='width:54.00pt;'>姓名</td>
    <td class="xl68" width="163" style='width:122.25pt;'>身份证号码</td>
    <td class="xl67" width="92" style='width:69.00pt;'>电话号码</td>
    <td class="xl69" width="79" style='width:59.25pt;'>居住时间</td>
    <td class="xl67" width="168" style='width:126.00pt;'>居住事由</td>
    <td class="xl67" width="97" style='width:72.75pt;'>居住处所</td>
    <td class="xl67" width="98" style='width:73.50pt;'>与户主关系</td>
    <td class="xl67" width="98" style='width:73.50pt;'>拟居住期限</td>
    <td class="xl74" width="90" style='width:67.50pt;'>备注</td>
    <td class="xl75" width="72" style='width:54.00pt;'>错误信息</td>
   </tr>
   <c:forEach items="${syrkBeans}" var="bean" varStatus="st">
	   <tr height="18" style='height:13.50pt;'>
		    <td class="xl70" height="18" style='height:13.50pt;'>${st.index + 1 }</td>
		    <td class="xl70" algin="left">${bean.dzmc }</td>
		    <td class="xl71">${bean.xm }</td>
		    <td class="xl72">${bean.sfzh }</td>
		    <td class="xl71" align="right">${bean.lxdh }</td>
		    <td class="xl73" align="right">${bean.jzsj }</td>
		    <td class="xl71">${bean.jzsy }</td>
		    <td class="xl71">${bean.jzcs }</td>
		    <td class="xl71">${bean.yhzgx }</td>
		    <td class="xl71">${bean.njzqx }</td>
		    <td class="xl71">${bean.bz }</td>
		    <td class="xl76"><font color="red">${bean.errorInfo}</font></td>
	   </tr>
	</c:forEach>
  </table>
 </body>
</html>
