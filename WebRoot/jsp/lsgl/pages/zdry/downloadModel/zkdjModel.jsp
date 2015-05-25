<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="xm" value="${rkBean.jbxxBean.xm}" scope="session"></c:set>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode(request.getSession().getAttribute("xm") + "_在控登记信息", "UTF-8");
  response.setContentType("application/msword");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".doc"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
	<head>
		<style type="text/css">
			table{border:1px solid #000000}
			td{border-right:1px solid #000000;border-bottom:1px solid #000000}
			body{font-family:"宋体";font-size:14px;}
			th{text-align:left;border-right:1px solid #000000;border-bottom:1px solid #000000;font-size:14px;}
		</style>
	</head>
	<body>
		<div style="text-align:center">
			<h1>重点人员现实表现情况维护记录</h1>
		</div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
			<tr>
				<th>姓名</th>
				<td>${rkBean.jbxxBean.xm}&nbsp;</td>
				<th>身份证号码</th>
				<td>${rkBean.jbxxBean.sfzh}&nbsp;</td>
				<th>在控状态</th>
				<td colspan="4">${xsbxBean.zkztmc}&nbsp;</td>
			</tr>
			<tr>
				<th>是否长期有家不归</th>
				<td>${xsbxBean.sfcqyjbg=='0'?'否':'是'}&nbsp;</td>
				<th>居住起始时间</th>
				<td>${xsbxBean.jzqssj}&nbsp;</td>
				<th>住所详址</th>
				<td colspan="4">${rkBean.jbxxBean.xzzxz}&nbsp;</td>
			</tr>
			<tr>
				<th>是否长期混<br/>迹于复杂场所</th>
				<td>${xsbxBean.sfcqhjyfzcs=='0'?'否':'是'}&nbsp;</td>
				<th>复杂场所代码</th>
				<td>${xsbxBean.csdm}&nbsp;</td>
				<th>复杂场所名称</th>
				<td colspan="4">${xsbxBean.csmc}&nbsp;</td>
			</tr>
			<tr>
				<th>是否有固定职业</th>
				<td>${xsbxBean.sfygdzy=='0'?'否':'是'}&nbsp;</td>
				<th>单位名称</th>
				<td>${xsbxBean.gzdwmc}&nbsp;</td>
				<th>单位详址</th>
				<td colspan="4">${xsbxBean.gzdwxz}&nbsp;</td>
			</tr>
			<tr>
				<th>是否经济拮据</th>
				<td>${xsbxBean.sfjjjj=='0'?'否':'是'}&nbsp;</td>
				<th>月收入</th>
				<td>${xsbxBean.ysr}&nbsp;</td>
				<th>判断依据</th>
				<td colspan="4">${xsbxBean.jjjjpdyj}&nbsp;</td>
			</tr>
			<tr>
				<th>是否多家庭<br/>成员无固定收入</th>
				<td>${xsbxBean.sfdjtwgdsy=='0'?'否':'是'}&nbsp;</td>
				<th>判断依据</th>
				<td colspan="6">${xsbxBean.wgdsrpdyy}&nbsp;</td>
			</tr>
			<tr>
				<th>日常消费明<br/>显大于收入</th>
				<td>${xsbxBean.rcxfsfmxdysr=='0'?'否':'是'}&nbsp;</td>
				<th>判断依据</th>
				<td colspan="6">${xsbxBean.xfdrsrpdyj}&nbsp;</td>
				
			</tr>
			<tr>
				<th>近期是否有违<br/>法犯罪的可能</th>
				<td>${xsbxBean.jqsfycwwffzxyrdkn=='0'?'否':'是'}&nbsp;</td>
				<th>判断依据</th>
				<td colspan="6">${xsbxBean.cwwfzxyrpdyj}&nbsp;</td>
			</tr>
			<tr>
				<th width="13%">是否购置私家车</th>
				<td width="12%">${xsbxBean.sfgzsjc=='0'?'否':'是'}&nbsp;</td>
				<th width="12%">购车时间</th>
				<td width="13%">${xsbxBean.gcsj}&nbsp;</td>
				<th width="8%">车牌号</th>
				<td width="12%">${xsbxBean.cphm}&nbsp;</td>
				<th width="12%">私车价值（数字）</th>
				<td width="12%">${xsbxBean.cjcjz}&nbsp;</td>
				<td width="8%">万元</td>
			</tr>
			<tr>
				<th>是否购置房产</th>
				<td>${xsbxBean.sfgzfc=='0'?'否':'是'}&nbsp;</td>
				<th>房产地址</th>
				<td colspan="3">${xsbxBean.fwdz}&nbsp;</td>
				<th>房产价值（数字）</th>
				<td>${xsbxBean.fcjz}&nbsp;</td>
				<td>万元</td>
			</tr>
			<tr>
				<th>购房时间</th>
				<td colspan="8">${xsbxBean.gfsj}&nbsp;</td>
			</tr>
			<tr>
				<th>现实情况描述</th>
				<td colspan="8" style="height:60px;" valign="top">${xsbxBean.xsqkms}&nbsp;</td>
			</tr>
			<tr>
				<th>走访民警</th>
				<td>${xsbxBean.hsmjxm}&nbsp;</td>
				<th>走访时间</th>
				<td colspan="6">${xsbxBean.hssj}&nbsp;</td>
			</tr>
		</table>
	</body>
</html>