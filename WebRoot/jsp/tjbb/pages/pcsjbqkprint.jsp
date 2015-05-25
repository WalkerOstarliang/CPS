<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
@page
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
	{color:#000000;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font2
	{color:#000000;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font3
	{color:#000000;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font4
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-font-charset:134;}
.font5
	{color:#000000;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Arial Unicode MS";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font6
	{color:#000000;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font7
	{color:#000000;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Arial Unicode MS";
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
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	font-weight:700;
	border:.5pt solid windowtext;}
.xl23
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:top;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
.xl24
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:top;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	white-space:normal;
	color:#000000;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	mso-number-format:"0\.00%";
	white-space:normal;
	text-align:center;
	color:#000000;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:top;
	white-space:normal;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:top;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
</style>
<style type="text/css">
	 div{
	 	font-weight: bold;
	 }
	 html { -webkit-text-size-adjust:none }

</style>
<style type="text/css" media="print">
	.Noprint
	{
		display:none;
	} 
	.PageNext
	{
		page-break-after: always;
	} 
</style>
<script type="text/javascript">
		var HKEY_Root,HKEY_Path,HKEY_Key; 
		HKEY_Root= "HKEY_CURRENT_USER"; 
		HKEY_Path= "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"; 
		//设置网页打印的页眉页脚为空 
		function PageSetup_Null() 
		{ 
			try 
			{ 
				var Wsh=new ActiveXObject("WScript.Shell"); 
				HKEY_Key="header"; 
				Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
				HKEY_Key="footer"; 
				Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
			} 
			catch(e)
			{
				alert("打印控件被禁用,请先启用控件.");
			} 
		} 
		
	$(function(){ 
		PageSetup_Null();
		document.all.WebBrowser.ExecWB(6,6);
		window.close();
	});
</script> 
</head>
<body>
	<table width="955" border="0" cellpadding="0" cellspacing="0" style='width:716.25pt;border-collapse:collapse;table-layout:fixed;'>
	   <col width="25" style='mso-width-source:userset;mso-width-alt:800;'/>
	   <col width="142" style='mso-width-source:userset;mso-width-alt:4544;'/>
	   <col width="39" style='mso-width-source:userset;mso-width-alt:1248;'/>
	   <col width="32" style='mso-width-source:userset;mso-width-alt:1024;'/>
	   <col width="39" style='mso-width-source:userset;mso-width-alt:1248;'/>
	   <col width="53" style='mso-width-source:userset;mso-width-alt:1696;'/>
	   <col width="39" style='mso-width-source:userset;mso-width-alt:1248;'/>
	   <col width="32" style='mso-width-source:userset;mso-width-alt:1024;'/>
	   <col width="31" style='mso-width-source:userset;mso-width-alt:992;'/>
	   <col width="32" span="3" style='mso-width-source:userset;mso-width-alt:1024;'/>
	   <col width="25" style='mso-width-source:userset;mso-width-alt:800;'/>
	   <col width="32" span="4" style='mso-width-source:userset;mso-width-alt:1024;'/>
	   <col width="31" style='mso-width-source:userset;mso-width-alt:992;'/>
	   <col width="45" style='mso-width-source:userset;mso-width-alt:1440;'/>
	   <col width="32" style='mso-width-source:userset;mso-width-alt:1024;'/>
	   <col width="18" style='mso-width-source:userset;mso-width-alt:576;'/>
	   <col width="53" style='mso-width-source:userset;mso-width-alt:1696;'/>
	   <col width="32" span="2" style='mso-width-source:userset;mso-width-alt:1024;'/>
	   <col width="31" style='mso-width-source:userset;mso-width-alt:992;'/>
	   <tr height="19" style='height:14.25pt;'>
	    	<td class="xl22" height="19" width="955" colspan="25" style='height:14.25pt;width:716.25pt;border-right:.5pt solid #000000;border-bottom:none;'>${pcsqkBean.orgname}基础情况统计表</td>
	   </tr>
	   <tr height="19" style='height:14.25pt;'>
    <td class="xl23" height="133" rowspan="7" style='height:99.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>序<br/>号</td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>单位<font class="font5"><br/></font><font class="font6">名称</font></td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>总<font class="font5"><br/></font><font class="font6">警</font><font class="font5"><br/></font><font class="font6">力</font></td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>派<font class="font5"><br/></font><font class="font6">出</font><font class="font5"><br/></font><font class="font6">所</font><font class="font5"><br/></font><font class="font6">总</font><font class="font5"><br/></font><font class="font6">数</font></td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>派<font class="font5"><br/></font><font class="font6">出</font><font class="font5"><br/></font><font class="font6">所</font><font class="font5"><br/></font><font class="font6">警</font><font class="font5"><br/></font><font class="font6">力</font><font class="font5"><br/></font><font class="font6">数</font></td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>派出<font class="font5"><br/></font><font class="font6">所警</font><font class="font5"><br/></font><font class="font6">力占</font><font class="font5"><br/></font><font class="font6">总警</font><font class="font5"><br/></font><font class="font6">力数</font><font class="font5"><br/></font><font class="font6">比</font></td>
    <td class="xl24" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>派出所辅助人员</td>
    <td class="xl24" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>警务区辅助人员</td>
    <td class="xl24" colspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>警务区/室</td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>社区<font class="font5"><br/></font><font class="font6">(驻村)</font><font class="font5"><br/></font><font class="font6">民警</font><font class="font5"><br/></font><font class="font6">占派</font><font class="font5"><br/></font><font class="font6">出所</font><font class="font5"><br/></font><font class="font6">警力</font><font class="font5"><br/></font><font class="font6">比</font></td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>警务<font class="font5"><br/></font><font class="font6">室联</font><font class="font5"><br/></font><font class="font6">公安</font><font class="font5"><br/></font><font class="font6">内网</font><font class="font5"><br/></font><font class="font6">数</font><font class="font5"><br/></font></td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>社区<font class="font5"><br/></font><font class="font6">警务</font><font class="font5"><br/></font><font class="font6">室联</font><font class="font5"><br/></font><font class="font6">网数</font></td>
    <td class="xl23" rowspan="7" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>农村<font class="font5"><br/></font><font class="font6">警务</font><font class="font5"><br/></font><font class="font6">室联</font><font class="font5"><br/></font><font class="font6">网数</font></td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>总<br/>数</td>
    <td class="xl25" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>辅<font class="font7"><br/></font><font class="font3">警<br/>数</font></td>
    <td class="xl25" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>流<font class="font7"><br/></font><font class="font3">口<br/>协</font><font class="font7"><br/></font><font class="font3">管<br/>员</font><font class="font7"><br/></font><font class="font3">数</font></td>
    <td class="xl25" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡<font class="font7"><br/></font><font class="font3">防<br/>队</font><font class="font7"><br/></font><font class="font3">员<br/>数</font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>总<br/>数</td>
    <td class="xl28" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>辅<br/>警<br/>数</td>
    <td class="xl25" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>流<font class="font7"><br/></font><font class="font3">口<br/>协</font><font class="font7"><br/></font><font class="font3">管<br/>员</font><font class="font7"><br/></font><font class="font3">数</font></td>
    <td class="xl25" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡<font class="font7"><br/></font><font class="font3">防<br/>队</font><font class="font7"><br/></font><font class="font3">员<br/>数</font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>警<font class="font5"><br/></font><font class="font6">务</font><font class="font5"><br/></font><font class="font6">区</font><font class="font5"><br/></font><font class="font6">总</font><font class="font5"><br/></font><font class="font6">数</font><font class="font5"><br/></font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>警<font class="font5"><br/></font><font class="font6">务</font><font class="font5"><br/></font><font class="font6">室</font><font class="font5"><br/></font><font class="font6">总</font><font class="font5"><br/></font><font class="font6">数</font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>社<font class="font5"><br/></font><font class="font6">区</font><font class="font5"><br/></font><font class="font6">警</font><font class="font5"><br/></font><font class="font6">务</font><font class="font5"><br/></font><font class="font6">室</font><font class="font5"><br/></font><font class="font6">数</font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>农村<font class="font5"><br/></font><font class="font6">警</font><font class="font5"><br/></font><font class="font6">务</font><font class="font5"><br/></font><font class="font6">室</font><font class="font5"><br/></font><font class="font6">数</font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>社区<font class="font5"><br/></font><font class="font6">(驻村)</font><font class="font5"><br/></font><font class="font6">民警</font><font class="font5"><br/></font><font class="font6">总数</font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>社<font class="font5"><br/></font><font class="font6">区</font><font class="font5"><br/></font><font class="font6">民</font><font class="font5"><br/></font><font class="font6">警</font><font class="font5"><br/></font><font class="font6">数</font></td>
    <td class="xl23" rowspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>驻<font class="font5"><br/></font><font class="font6">村</font><font class="font5"><br/></font><font class="font6">民</font><font class="font5"><br/></font><font class="font6">警</font><font class="font5"><br/></font><font class="font6">数</font></td>
   </tr>
	   <tr height="19" style='height:14.25pt;'/>
	   <tr height="19" style='height:14.25pt;'/>
	   <tr height="19" style='height:14.25pt;'/>
	   <tr height="19" style='height:14.25pt;'/>
	   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'/>
	   <c:forEach items="${pcsqkBean.pcsJbqkList}" var="jbqkBean" varStatus="st">
			<tr>
				<td class="xl26">${st.index + 1}</td>
				<td class="xl26">&nbsp;${jbqkBean.orgname}</td>
				<td class="xl26" align="right">${jbqkBean.zjls}</td>
				<td class="xl26" align="right">${jbqkBean.pcszs}</td>
				<td class="xl26" align="right">${jbqkBean.pcsjls}</td>
				<td class="xl26" align="right">${jbqkBean.pcsjlszzjlsb}&nbsp;</td>
				
				<td class="xl26" align="right">${jbqkBean.pcszfjs}</td>
				<td class="xl26" align="right">${jbqkBean.pcszfbzfjs}</td>
				<td class="xl26" align="right">${jbqkBean.pcsldrkxgys}</td>
				<td class="xl26" align="right">${jbqkBean.pcsxfdys}</td>
				<td class="xl26" align="right">${jbqkBean.sqjwsfjs}</td>
				<td class="xl26" align="right">${jbqkBean.sqjwspbzfbzfjs}</td>
				<td class="xl26" align="right">${jbqkBean.sqjwspblkxgys}</td>
				<td class="xl26" align="right">${jbqkBean.sqjwspbxfdys}</td>
				
				<td class="xl26" align="right">${jbqkBean.sqjwss}</td>
				<td class="xl26" align="right">${jbqkBean.jwszs}</td>
				
				<td class="xl26" align="right">${jbqkBean.jsqjwss}</td>
				<td class="xl26" align="right">${jbqkBean.ncjwss}</td>
				<td class="xl26" align="right">${jbqkBean.sqzcmjzs}</td>
				
				<td class="xl26" align="right">${jbqkBean.sqmjs}</td>
				<td class="xl26" align="right">${jbqkBean.zcmjs}</td>
				
				<td class="xl26" align="right">${jbqkBean.zcmjzpcsjlb}&nbsp;</td>
				<td class="xl26" align="right">${jbqkBean.jwslganws}</td>
				<td class="xl26" align="right">${jbqkBean.sqjwslws}</td>
				<td class="xl26" align="right">${jbqkBean.ncjwslws}</td>
			</tr>
		</c:forEach>
  	</table>
</body>
</html>