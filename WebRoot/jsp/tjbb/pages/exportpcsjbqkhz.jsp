<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("派出所基本情况年度汇总统计分析表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
	<head>
		<style type="text/css">
			body{font-family:'宋体';font-size:10.0pt;font-weight:400;}
		</style>
	</head>
	<body>
		<table border="0.5pt" cellpadding="0" cellspacing="0" style="font-size:13px">
			<tr>
				<td style="text-align:center;" colspan="9">
					<h2><span id="title">${pcshz.title}</span>派出所基本情况年度汇总统计分析表</h2>
				</td>
			</tr>
			<tr>
				<td style="text-align:left;" colspan="9">
					填报人：${loginInfo.realname}&nbsp;&nbsp;
					填报时间：${fn:substring(sysdate,0,4)}年${fn:substring(sysdate,4,6)}月${fn:substring(sysdate,6,8)}日&nbsp;&nbsp;
					填报单位：${loginInfo.orgname}&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td style="text-align:center;">单位代码</td>
				<td style="text-align:center;">单位名称</td>
				<td style="text-align:center;">实有数（人）</td>
				<td style="text-align:center;">县级公安<br/>机关总警<br/>力数</td>
				<td style="text-align:center;">派出所实有警<br/>力占县级公安机关<br/>总警力的比例小于<br/>40％的县区局数</td>
				<td style="text-align:center;">当年（统计期）<br/>接受过集中<br/>业务培训的<br/>民警数</td>
				<td style="text-align:center;">派出所数<br/>（个）</td>
				<td style="text-align:center;">城区户籍<br/>所数（个）</td>
				<td style="text-align:center;">20人及以上的<br/>城区派出所<br/>数（个）</td>
			</tr>
			<tr>
					<td style="text-align:center;" id="orgcode">${pcshz.orgcode}&nbsp;</td>
					<td style="text-align:center;" id="orgname">${pcshz.orgname}&nbsp;</td>
					<td style="text-align:center;" id="syrs">${pcshz.syrs}&nbsp;</td>
					<td style="text-align:center;" id="xjgajgzjls">${pcshz.xjgajgzjls}&nbsp;</td>
					<td style="text-align:center;" id="syjlzxjlbl">${pcshz.syjlzxjlbl}&nbsp;</td>
					<td style="text-align:center;" id="cjpxmjs">${pcshz.cjpxmjs}&nbsp;</td>
					<td style="text-align:center;" id="pcss">${pcshz.pcss}&nbsp;</td>
					<td style="text-align:center;" id="cqhjs">${pcshz.cqhjs}&nbsp;</td>
					<td style="text-align:center;" id="cqs">${pcshz.cqs}&nbsp;</td>
			</tr>		
			<tr>
				<td style="text-align:center;">建制镇<br/>派出所数（个）</td>
				<td style="text-align:center;">10人及以上<br/>的建制镇<br/>派出所数（个）</td>
				<td style="text-align:center;">建制乡<br/>派出所数(个)</td>
				<td style="text-align:center;">5人及以上<br/>的建制乡派<br/>出所数（个）</td>
				<td style="text-align:center;">治安派<br/>出所数</td>
				<td style="text-align:center;">水上派<br/>出所数</td>
				<td style="text-align:center;">一级派<br/>出所数（个）</td>
				<td style="text-align:center;">二级派<br/>出所数（个）</td>
				<td style="text-align:center;">三级派<br/>出所数（个）</td>
			</tr>
			<tr>
				<td style="text-align:center;" id="zpcs1">${pcshz.zpcs1}&nbsp;</td>
				<td style="text-align:center;" id="zpcs2">${pcshz.zpcs2}&nbsp;</td>
				<td style="text-align:center;" id="xpcs">${pcshz.xpcs}&nbsp;</td>
				<td style="text-align:center;" id="xpcs2">${pcshz.xpcs2}&nbsp;</td>
				<td style="text-align:center;" id="zas">${pcshz.zas}&nbsp;</td>
				<td style="text-align:center;" id="sss">${pcshz.sss}&nbsp;</td>
				<td style="text-align:center;" id="yijs">${pcshz.yijs}&nbsp;</td>
				<td style="text-align:center;" id="erjs">${pcshz.erjs}&nbsp;</td>
				<td style="text-align:center;" id="sanjs">${pcshz.sanjs}&nbsp;</td>
			</tr>		
				
			<tr>	
				<td style="text-align:center;">四级派<br/>出所数（个）</td>
				<td style="text-align:center;">五级派<br/>出所数（个）</td>
				<td style="text-align:center;">汽车（辆）</td>
				<td style="text-align:center;">无车<br/>派出所数</td>
				<td style="text-align:center;">计算机（台）</td>
				<td style="text-align:center;">无电脑<br/>派出所数</td>
				<td style="text-align:center;">防弹头盔<br/>（顶）</td>
				<td style="text-align:center;">未装备防<br/>弹头盔的<br/>派出所数</td>
				<td style="text-align:center;">防弹背心<br/>（件）</td>
			</tr>
			<tr>
				<td style="text-align:center;" id="sijs">${pcshz.sijs}&nbsp;</td>
				<td style="text-align:center;" id="wujs">${pcshz.wujs}&nbsp;</td>
				<td style="text-align:center;" id="qcs">${pcshz.qcs}&nbsp;</td>
				<td style="text-align:center;" id="wcpcs">${pcshz.wcpcs}&nbsp;</td>
				<td style="text-align:center;" id="jsjs">${pcshz.jsjs}&nbsp;</td>
				<td style="text-align:center;" id="wjsjs">${pcshz.wjsjs}&nbsp;</td>
				<td style="text-align:center;" id="fdtks">${pcshz.fdtks}&nbsp;</td>
				<td style="text-align:center;" id="wfdtkpcss">${pcshz.wfdtkpcss}&nbsp;</td>
				<td style="text-align:center;" id="fdbxs">${pcshz.fdbxs}&nbsp;</td>
			</tr>	
				
			<tr>
				<td style="text-align:center;">未装备防<br/>弹背心的<br/>派出所数</td>
				<td style="text-align:center;">防刺背心<br/>（件）</td>
				<td style="text-align:center;">未装备防<br/>刺背心的<br/>派出所数</td>
				<td style="text-align:center;">所长数</td>
				<td style="text-align:center;">副科级<br/>以下</td>
				<td style="text-align:center;">副科级</td>
				<td style="text-align:center;">正科级</td>
				<td style="text-align:center;">副处级</td>
				<td style="text-align:center;">副处级<br/>以上</td>
			</tr>
			<tr>
				<td style="text-align:center;" id="wfdbxpcss">${pcshz.wfdbxpcss}&nbsp;</td>
				<td style="text-align:center;" id="fcbxs">${pcshz.fcbxs}&nbsp;</td>
				<td style="text-align:center;" id="wfcbxpcss">${pcshz.wfcbxpcss}&nbsp;</td>
				<td style="text-align:center;" id="szs">${pcshz.szs}&nbsp;</td>
				<td style="text-align:center;" id="fkjyx">${pcshz.fkjyx}&nbsp;</td>
				<td style="text-align:center;" id="fkj">${pcshz.fkj}&nbsp;</td>
				<td style="text-align:center;" id="zkj">${pcshz.zkj}&nbsp;</td>
				<td style="text-align:center;" id="fcj">${pcshz.fcj}&nbsp;</td>
				<td style="text-align:center;" id="fcjys">${pcshz.fcjys}&nbsp;</td>
			</tr>	
				
			<tr>
				<td style="text-align:center;">已建社区<br/>警务室数<br/>（个）</td>
				<td style="text-align:center;">社区民警（人）</td>
				<td style="text-align:center;">社区民警<br/>中专职<br/>社区民警数</td>
				<td style="text-align:center;">社区数（个）</td>
				<td style="text-align:center;">已建农村<br/>警务室数（个）</td>
				<td style="text-align:center;">驻村民警</td>
				<td style="text-align:center;">驻村民警<br/>中专职驻村<br/>民警数</td>
				<td style="text-align:center;">行政村数<br/>（个）</td>
				<td style="text-align:center;">警务区数<br/>（个）</td>
			</tr>
			<tr>
				<td style="text-align:center;" id="jljwqs">${pcshz.jljwqs}&nbsp;</td>
				<td style="text-align:center;" id="sqmjs">${pcshz.sqmjs}&nbsp;</td>
				<td style="text-align:center;" id="zzmjs">${pcshz.zzmjs}&nbsp;</td>
				<td style="text-align:center;" id="sqs">${pcshz.sqs}&nbsp;</td>
				<td style="text-align:center;" id="ncjwss">${pcshz.ncjwss}&nbsp;</td>
				<td style="text-align:center;" id="zcmjs">${pcshz.zcmjs}&nbsp;</td>
				<td style="text-align:center;" id="zczzmjs">${pcshz.zczzmjs}&nbsp;</td>
				<td style="text-align:center;" id="xzcs">${pcshz.xzcs}&nbsp;</td>
				<td style="text-align:center;" id="jwqs">${pcshz.jwqs}&nbsp;</td>
			</tr>
			
			<tr>
				<td style="text-align:center;">填报<br/>人</td>
				<td style="text-align:center;">填报<br/>时间</td>
				<td style="text-align:center;">填报<br/>单位</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:center;">${loginInfo.realname}&nbsp;</td>
				<td style="text-align:center;">${fn:substring(sysdate,0,4)}年${fn:substring(sysdate,4,6)}月${fn:substring(sysdate,6,8)}日&nbsp;</td>
				<td style="text-align:center;">${loginInfo.orgname}&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
				<td style="text-align:center;">&nbsp;</td>
			</tr>
			
		</table>
	</body>
</html>