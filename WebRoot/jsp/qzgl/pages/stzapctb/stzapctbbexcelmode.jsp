<%@ page language="java" pageEncoding="UTF-8"  contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  //String fileName = URLEncoder.encode("ddc", "UTF-8");
  String fileName = URLEncoder.encode("全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel" 改为contentType="application/msword"  
%> 
<html>
	<head>
		
	</head>
	<body>
	<div>
		<table  class="cps-tablegrid" border="1">
			<tr>
				<th colspan="28">
					<Strong> 全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表 </Strong>
				</th>
			</tr>
			<tr>
				<th colspan="4"  align="left">
					填报单位：${stzapcbean.tbdwmc} 
				</th>
				<th colspan="22" id="title" >
					${stzapcbean.titless} 
				</th>
				<th colspan="2"  align="right">
					填报人：${stzapcbean.tbrxm} 
				</th>
			</tr>
			<tr>
				<th rowspan="4" style="width:100px" colspan="2">
					
				</th>
				<th colspan="11" valign="middle">
					<Strong> 排查发现可能引发个人极端暴力犯罪的线索数 </Strong>
				</th>
				<th colspan="14" valign="middle">
					<Strong> 治安系统化解处置个人极端暴力犯罪案事件数 </Strong>
				</th>
				<th rowspan="3" valign="middle">
					<br/><br/><Strong> 移交其<br/>
					他警种<br/>
					和政府<br/>
					有关部<br/>
					门</Strong>
				</th>
			</tr>
			<tr>
				<th rowspan="2" valign="middle">
					<br/>
					<br/>
					合
					<br/>
					计
				</th>
				<th colspan="6" valign="middle">
					原因分析
				</th>
				<th colspan="4" valign="middle">
					线索来源渠道分析
				</th>
				
				<th rowspan="2" style="avlign:middle;">
					<br/>
					<br/>	
					合
					<br/>
					计
				</th>
				<th colspan="7" valign="middle">
					预谋实施的场所部位分析
				</th>
				<th colspan="6" valign="middle">
					使用工具情况分析
				</th>
				
			</tr>
			<tr>
				<th valign="middle">
					邻里<br/>纠纷
				</th>
				<th valign="middle">
					征地<br/>拆迁
				</th>
				<th valign="middle">
					拖欠<br/>工资
				</th>
				<th valign="middle">
					非正常<br/>死亡
				</th>
				<th valign="middle">
					涉法<br/>涉诉
				</th>
				<th valign="middle">
					其他
				</th>
				<th valign="middle">
					民警<br/>排查<br/>发现
				</th>
				<th valign="middle">
					互联网<br/>截获
				</th>
				<th valign="middle">
					110接报
				</th>
				<th valign="middle">
					群众<br/>举报
				</th>
				
				<th valign="middle">
					企事<br/>业单<br/>位
				</th>
				<th valign="middle">
					党政<br/>机关
				</th>
				<th valign="middle">
					学校
				</th>
				<th valign="middle">
					机场<br/>车站<br/>码头<br/>地铁
				</th>
				<th valign="middle">
					广场、商<br/>业网点等<br/>人员密集<br/>公共场所
				</th>
				<th valign="middle">
					进京
				</th>
				<th valign="middle">
					其他
				</th>
				<th valign="middle">
					爆炸<br/>物品
				</th>
				<th valign="middle">
					枪支
				</th>
				<th valign="middle">
					汽油等<br/>易燃<br/>物品
				</th>
				<th valign="middle">
					剧毒化<br/>学品
					
				</th>
				<th valign="middle">
					刀具
					
				</th>
				<th valign="middle">
					其他
					
				</th>
			</tr>
			<tr>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（条）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
				<th style="avlign:middle;">
					（起）
				</th>
			</tr>
			<c:forEach items="${downloadZapctbList}" var="st" varStatus="s">
				<tr>
					<td colspan="2" align="center">${st.id}</td>
					<td align="center">${st.hja}</td>
					<td align="center">${st.lljf}</td>
					<td align="center">${st.zdcq}</td>
					<td align="center">${st.tqgz}</td>
					<td align="center">${st.fzcsw}</td>
					<td align="center">${st.sfss}</td>
					<td align="center">${st.qtyy}</td>
					<td align="center">${st.mjpcfx}</td>
					<td align="center">${st.hlwjh}</td>
					<td align="center">${st.dhjb}</td>
					<td align="center">${st.qzjb}</td>
					<td align="center">${st.hjb}</td>
					<td align="center">${st.qsydw}</td>
					<td align="center">${st.dzjg}</td>
					<td align="center">${st.xx}</td>
					<td align="center">${st.jccz}</td>
					<td align="center">${st.gc}</td>
					<td align="center">${st.jj}</td>
					<td align="center">${st.qtbw}</td>
					<td align="center">${st.bzwp}</td>
					<td align="center">${st.qz}</td>
					<td align="center">${st.qy}</td>
					<td align="center">${st.jd}</td>
					<td align="center">${st.dj}</td>
					<td align="center">${st.qtgj}</td>
					<td align="center">${st.yjqtjz}</td>
				</tr>
			</c:forEach>
		</table>
	</div>	
		<div>
			<table  class="cps-tablegrid" border="1">
				<tr>
					<th rowspan="4" style="width:100px" colspan="2" align="center">
						
					</th>
					<th colspan="13" align="center">
						<Strong> 稳控打击有个人极端暴力犯罪倾向的重点人数 </Strong>
					</th>
				</tr>
				<tr>
					<th rowspan="2"  style="valign:bottom;">
						合
						<br/>
						计
					</th>
					<th colspan="4" align="center">
						年龄阶段分析
					</th>
					<th colspan="5" align="center">
						重点人群分析
					</th>
					<th colspan="3" align="center">
						采取处置措施情况
					</th>
				</tr>
				<tr>
					<th align="center">
						20岁以<br/>下
					</th>
					<th align="center">
						20-40<br/>岁
					</th>
					<th align="center">
						41-50<br/>岁
					</th>
					<th align="center">
						51岁以<br/>上
					</th>
					<th align="center">
						无业<br/>人员
					</th>
					<th align="center">
						外来务<br/>工人员
					</th>
					<th align="center">
						上访人<br/>员
					</th>
					<th align="center">
						精神病<br/>人
					</th>
					<th align="center">
						其他
					</th>
					<th align="center">
						治安处<br/>罚
					</th>
					<th align="center">
						刑事处<br/>罚
					</th>
					<th align="center">
						日常稳<br/>控
					</th>
				</tr>
				<tr>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
					<th style="avlign:middle;">
						（人）
					</th>
				</tr>
				<c:forEach items="${downloadZapctbList}" var="st" varStatus="s">
					<tr>
						<td colspan="2" align="center">${st.id}</td>
						<td align="center">${st.hjc}</td>
						<td align="center">${st.esyx}</td>
						<td align="center">${st.eszss}</td>
						<td align="center">${st.syzws}</td>
						<td align="center">${st.ssyys}</td>
						<td align="center">${st.wyry}</td>
						<td align="center">${st.wlwgry}</td>
						<td align="center">${st.sfry}</td>
						<td align="center">${st.jsbr}</td>
						<td align="center">${st.qtrq}</td>
						<td align="center">${st.zacf}</td>
						<td align="center">${st.xscf}</td>
						<td align="center">${st.rcwk}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br/>
		<div id="bzshuoming">
			注：&nbsp;1、填报“化解处置个人极端暴力犯罪案事件数”后，务必逐案填报《排查化解处置个人极端暴力犯罪案事件案例信息报送表》；<br/>
     					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、在开展此项工作中收缴物品工具情况：
     					收缴炸药${stzapcbean.sjzy}公斤，
     					雷管${stzapcbean.lg}枚，
     					剧毒化学品${stzapcbean.jdhxp}克，
     					枪支${stzapcbean.qzb}把，
     					子弹${stzapcbean.zdb}发，
     					汽油等易燃物品${stzapcbean.qyb}升；<br/>
     					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、该表由各省区市公安厅、局治安总队牵头汇总填报。
			
		</div>
	</body>
</html>