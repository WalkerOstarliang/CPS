<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("数据周采集情况表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName);   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%><html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <!--[if gte mso 9]>
   <xml>
    <o:DocumentProperties>
     <o:Author>Administrator</o:Author>
     <o:Created>2012-06-06T09:30:27</o:Created>
     <o:LastSaved>2015-05-12T17:05:29</o:LastSaved>
    </o:DocumentProperties>
    <o:CustomDocumentProperties>
     <o:KSOProductBuildVer dt:dt="string">2052-9.1.0.4468</o:KSOProductBuildVer>
    </o:CustomDocumentProperties>
   </xml>
  <![endif]-->
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
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
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
	{mso-number-format:"0%";
	mso-style-name:"Percent";
	mso-style-id:5;}
.style20
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0_ \;_ \0022\00A5\0022* \\-\#\,\#\#0_ \;_ \0022\00A5\0022* \0022-\0022_ \;_ \@_ ";
	mso-style-name:"Currency[0]";
	mso-style-id:7;}
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
.xl22
	{mso-style-parent:style0;
	font-size:11.0pt;}
.xl23
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	text-align:right;
	white-space:normal;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
 -->  </style>
  <!--[if gte mso 9]>
   <xml>
    <x:ExcelWorkbook>
     <x:ExcelWorksheets>
      <x:ExcelWorksheet>
       <x:Name>Sheet1</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>270</x:DefaultRowHeight>
        <x:Selected/>
        <x:LeftColumnVisible>33</x:LeftColumnVisible>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>2</x:ActiveCol>
          <x:ActiveRow>2</x:ActiveRow>
          <x:RangeSelection>C3:BD3</x:RangeSelection>
         </x:Pane>
        </x:Panes>
        <x:ProtectContents>False</x:ProtectContents>
        <x:ProtectObjects>False</x:ProtectObjects>
        <x:ProtectScenarios>False</x:ProtectScenarios>
        <x:PageBreakZoom>100</x:PageBreakZoom>
        <x:Print>
         <x:ValidPrinterInfo/>
         <x:PaperSizeIndex>9</x:PaperSizeIndex>
        </x:Print>
       </x:WorksheetOptions>
      </x:ExcelWorksheet>
      <x:ExcelWorksheet>
       <x:Name>Sheet2</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>285</x:DefaultRowHeight>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>0</x:ActiveCol>
          <x:ActiveRow>0</x:ActiveRow>
         </x:Pane>
        </x:Panes>
        <x:ProtectContents>False</x:ProtectContents>
        <x:ProtectObjects>False</x:ProtectObjects>
        <x:ProtectScenarios>False</x:ProtectScenarios>
        <x:PageBreakZoom>100</x:PageBreakZoom>
        <x:Print>
         <x:ValidPrinterInfo/>
         <x:PaperSizeIndex>9</x:PaperSizeIndex>
        </x:Print>
       </x:WorksheetOptions>
      </x:ExcelWorksheet>
      <x:ExcelWorksheet>
       <x:Name>Sheet3</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>285</x:DefaultRowHeight>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>0</x:ActiveCol>
          <x:ActiveRow>0</x:ActiveRow>
         </x:Pane>
        </x:Panes>
        <x:ProtectContents>False</x:ProtectContents>
        <x:ProtectObjects>False</x:ProtectObjects>
        <x:ProtectScenarios>False</x:ProtectScenarios>
        <x:PageBreakZoom>100</x:PageBreakZoom>
        <x:Print>
         <x:ValidPrinterInfo/>
         <x:PaperSizeIndex>9</x:PaperSizeIndex>
        </x:Print>
       </x:WorksheetOptions>
      </x:ExcelWorksheet>
     </x:ExcelWorksheets>
     <x:ProtectStructure>False</x:ProtectStructure>
     <x:ProtectWindows>False</x:ProtectWindows>
     <x:WindowHeight>10180</x:WindowHeight>
     <x:WindowWidth>21600</x:WindowWidth>
    </x:ExcelWorkbook>
    <x:SupBook>
     <x:Path>D:\Documents\Desktop\</x:Path>
    </x:SupBook>
   </xml>
  <![endif]-->
 </head>
 <body link="blue" vlink="purple" class="xl22">
  <table width="3479" border="0" cellpadding="0" cellspacing="0" style='width:2609.25pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="59" class="xl22" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="71" class="xl22" style='mso-width-source:userset;mso-width-alt:2272;'/>
   <col width="59" span="6" class="xl22" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="61" class="xl22" style='mso-width-source:userset;mso-width-alt:1952;'/>
   <col width="59" span="46" class="xl22" style='mso-width-source:userset;mso-width-alt:1888;'/>
   <col width="63" class="xl22" style='mso-width-source:userset;mso-width-alt:2016;'/>
   <col width="51" class="xl22" style='mso-width-source:userset;mso-width-alt:1632;'/>
   <col width="53" span="2" class="xl22" style='mso-width-source:userset;mso-width-alt:1696;'/>
   <col width="72" span="197" class="xl22" style='width:54.00pt;'/>
   <tr height="18" style='height:13.50pt;'>
    <td class="xl23" height="54" width="59" rowspan="3" style='height:40.50pt;width:44.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>单<br/>位</td>
    <td class="xl23" width="71" rowspan="3" style='width:53.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>总<br/>数</td>
    <td class="xl24" width="533" colspan="9" style='width:399.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第一周(${fn:substring(weekBean.onestart,4,8)}-${fn:substring(weekBean.oneend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.firstweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl24" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第二周(${fn:substring(weekBean.twostart,4,8)}-${fn:substring(weekBean.twoend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.secondweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第三周(${fn:substring(weekBean.threestart,4,8)}-${fn:substring(weekBean.threeend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.thirdweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第四周(${fn:substring(weekBean.fourstart,4,8)}-${fn:substring(weekBean.fourend,4,6)})
    	<c:choose>
    		<c:when test="${weekBean.fourthweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第五周(${fn:substring(weekBean.fivestart,4,8)}-${fn:substring(weekBean.fiveend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.fifthweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="535" colspan="9" style='width:401.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第六周(${fn:substring(weekBean.sixstart,4,8)}-${fn:substring(weekBean.sixend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.sixthweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl23" width="51" rowspan="3" style='width:38.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>警务<br/>区数</td>
    <td class="xl23" width="53" rowspan="3" style='width:39.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>任务为<br/>完成警<br/>务区数</td>
    <td class="xl23" width="53" rowspan="3" style='width:39.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>任务未<br/>完成周<br/>次数</td>
   </tr>
   <tr height="18" style='height:13.50pt;'>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
   </tr>
   <tr height="18" style='height:13.50pt;'>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
    <td class="xl25">总数</td>
    <td class="xl25">社区</td>
    <td class="xl25">农村</td>
   </tr>
   <c:forEach items="${weektableBeans}" var="bean">
	   <tr height="18" style='height:13.50pt;'>
		   <td class="xl26" height="18" style='height:13.50pt;'>${bean.orgname }</td>
		    
		    <td class="xl27">${bean.zcjs}</td>
		    
		    <td class="xl27">${bean.onezs}</td>
		    <td class="xl27">${bean.onesqs}</td>
		    <td class="xl27">${bean.onencs}</td>
		    <td class="xl27">${bean.onerhzfzs }</td>
		    <td class="xl27">${bean.onerhzfsqs }</td>
		    <td class="xl27">${bean.onerhzfncs }</td>
		    <td class="xl27">${bean.onezaxlzs }</td>
		    <td class="xl27">${bean.onezaxlsqs }</td>
		    <td class="xl27">${bean.onezaxlncs }</td>
		    
		    <td class="xl27">${bean.twozs}</td>
		    <td class="xl27">${bean.twosqs}</td>
		    <td class="xl27">${bean.twoncs}</td>
		    <td class="xl27">${bean.tworhzfzs }</td>
		    <td class="xl27">${bean.tworhzfsqs }</td>
		    <td class="xl27">${bean.tworhzfncs }</td>
		    <td class="xl27">${bean.twozaxlzs }</td>
		    <td class="xl27">${bean.twozaxlsqs }</td>
		    <td class="xl27">${bean.twozaxlncs }</td>
		    
		    <td class="xl27">${bean.threezs}</td>
		    <td class="xl27">${bean.threesqs}</td>
		    <td class="xl27">${bean.threencs}</td>
		    <td class="xl27">${bean.threerhzfzs }</td>
		    <td class="xl27">${bean.threerhzfsqs }</td>
		    <td class="xl27">${bean.threerhzfncs }</td>
		    <td class="xl27">${bean.threezaxlzs }</td>
		    <td class="xl27">${bean.threezaxlsqs }</td>
		    <td class="xl27">${bean.threezaxlncs }</td>
		    
		    
		    <td class="xl27">${bean.fourzs}</td>
		    <td class="xl27">${bean.foursqs}</td>
		    <td class="xl27">${bean.fourncs}</td>
		    <td class="xl27">${bean.fourrhzfzs }</td>
		    <td class="xl27">${bean.fourrhzfsqs }</td>
		    <td class="xl27">${bean.fourrhzfncs }</td>
		    <td class="xl27">${bean.fourzaxlzs }</td>
		    <td class="xl27">${bean.fourzaxlsqs }</td>
		    <td class="xl27">${bean.fourzaxlncs }</td>
		    
		    
		    <td class="xl27">${bean.fivezs}</td>
		    <td class="xl27">${bean.fivesqs}</td>
		    <td class="xl27">${bean.fivencs}</td>
		    <td class="xl27">${bean.fiverhzfzs }</td>
		    <td class="xl27">${bean.fiverhzfsqs }</td>
		    <td class="xl27">${bean.fiverhzfncs }</td>
		    <td class="xl27">${bean.fivezaxlzs }</td>
		    <td class="xl27">${bean.fivezaxlsqs }</td>
		    <td class="xl27">${bean.fivezaxlncs }</td>
		    
		    <td class="xl27">${bean.sixzs}</td>
		    <td class="xl27">${bean.sixsqs}</td>
		    <td class="xl27">${bean.sixncs}</td>
		    <td class="xl27">${bean.sixrhzfzs }</td>
		    <td class="xl27">${bean.sixrhzfsqs }</td>
		    <td class="xl27">${bean.sixrhzfncs }</td>
		    <td class="xl27">${bean.sixzaxlzs }</td>
		    <td class="xl27">${bean.sixzaxlsqs }</td>
		    <td class="xl27">${bean.sixzaxlncs }</td>
		    
		    <td class="xl27">${bean.jwqzs}</td>
		    <td class="xl27">${bean.wwcrwjwqs}</td>
		    <td class="xl27">${bean.wwczcjrwcs}</td>
	   </tr>
   </c:forEach>
  </table>
 </body>
</html>