<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("从业人员错误信息导出.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
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
	mso-number-format:"\[DBNum20\]\[$-804\]General";
	text-align:center;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	mso-number-format:"\[DBNum20\]\[$-804\]General";
	text-align:center;
	font-size:12.0pt;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;}
.xl67
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	mso-number-format:"\@";
	border:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d";
	text-align:center;
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
       <x:ActiveCol>3</x:ActiveCol>
       <x:ActiveRow>8</x:ActiveRow>
       <x:RangeSelection>D9</x:RangeSelection>
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
     <x:Range>$I$4:I65474,$I$1</x:Range>
     <x:InputTitle>请输入居住地派出所：</x:InputTitle>
     <x:InputMessage>如：430102410000-长沙市公安局芙蓉分局都正街派出所；见派出所代码名称</x:InputMessage>
    </x:DataValidation>
    <x:DataValidation>
     <x:Range>$H$2:H3,$G$1:G65474</x:Range>
     <x:Type>Date</x:Type>
     <x:Qualifier>Greater</x:Qualifier>
     <x:Value>2</x:Value>
     <x:InputTitle>请输入日期格式的：</x:InputTitle>
     <x:InputMessage>如：2015-01-05</x:InputMessage>
     <x:ErrorMessage>日期格式错误</x:ErrorMessage>
    </x:DataValidation>
    <x:DataValidation>
     <x:Range>$F$1:F65474</x:Range>
     <x:Type>List</x:Type>
     <x:CellRangeList/>
     <x:Value>&quot;01-法人代表,02-治安责任人,04-治保人员,05-娱乐场所营销部经理,06-特种行业登记员,07-特种行业估价员,08-长期服务人员,09-临时服务人员,21-代表,30-经理助理,32-技术人员,33-职员,34-保卫干部,36-保安,37-武警,98-其他部门负责人,99-其他人员&quot;</x:Value>
     <x:InputTitle>请选择下拉字典：</x:InputTitle>
     <x:InputMessage>如：01-法人代表</x:InputMessage>
    </x:DataValidation>
   </xml>
  <![endif]-->
 </head>
 <body link="blue" vlink="purple">
  <table width="1466" border="0" cellpadding="0" cellspacing="0" style='width:1099.50pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="41" class="xl63" style='mso-width-source:userset;mso-width-alt:1312;'/>
   <col width="103" class="xl63" style='mso-width-source:userset;mso-width-alt:3296;'/>
   <col width="74" class="xl64" style='mso-width-source:userset;mso-width-alt:2368;'/>
   <col width="165" class="xl64" style='mso-width-source:userset;mso-width-alt:5280;'/>
   <col width="101" class="xl64" style='mso-width-source:userset;mso-width-alt:3232;'/>
   <col width="113" style='mso-width-source:userset;mso-width-alt:3616;'/>
   <col width="84" class="xl63" style='mso-width-source:userset;mso-width-alt:2688;'/>
   <col width="81" class="xl63" style='mso-width-source:userset;mso-width-alt:2592;'/>
   <col width="386" class="xl64" style='mso-width-source:userset;mso-width-alt:12352;'/>
   <col width="138" class="xl64" style='mso-width-source:userset;mso-width-alt:4416;'/>
   <col width="90" span="2" class="xl64" style='mso-width-source:userset;mso-width-alt:2880;'/>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl65" height="19" width="41" style='height:14.25pt;width:30.75pt;' x:str>序号</td>
    <td class="xl65" width="103" style='width:77.25pt;' x:str>单位名称</td>
    <td class="xl66" width="74" style='width:55.50pt;' x:str>姓名</td>
    <td class="xl66" width="165" style='width:123.75pt;' x:str>身份证号码</td>
    <td class="xl66" width="101" style='width:75.75pt;' x:str>电话号码</td>
    <td class="xl66" width="113" style='width:84.75pt;' x:str>职务</td>
    <td class="xl66" width="84" style='width:63.00pt;' x:str>入职时间</td>
    <td class="xl66" width="81" style='width:60.75pt;' x:str>离职时间</td>
    <td class="xl66" width="386" style='width:289.50pt;' x:str>居住地派出所</td>
    <td class="xl66" width="138" style='width:103.50pt;' x:str>居住地址</td>
    <td class="xl66" width="90" style='width:67.50pt;' x:str>备注</td>
    <td class="xl66" width="90" style='width:67.50pt;' x:str>错误信息</td>
   </tr>
   <c:forEach items="${cyryBeans}" var="bean" varStatus="st">
   	 <tr height="18" style='height:13.50pt;'>
		    <td class="xl67" height="18" style='height:13.50pt;' x:num>${st.index+1 }</td>
		    <td class="xl67" x:str>${bean.dwmc }</td>
		    <td class="xl68" x:str>${bean.xm }</td>
		    <td class="xl68" x:str>${bean.sfzh }</td>
		    <td class="xl68" x:str>${bean.lxdh }</td>
		    <td class="xl69" x:str>${bean.zw }</td>
		    <td class="xl70" x:num>${bean.rzsj }</td>
		    <td class="xl70" x:num>${bean.lzsj }</td>
		    <td class="xl69" x:str>${bean.jzdpcs }</td>
		    <td class="xl68" x:str>${bean.jzdz }</td>
		    <td class="xl68" x:str>${bean.bz }</td>
		    <td class="xl68" x:str>${bean.errorInfo }</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>