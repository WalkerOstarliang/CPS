<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/sjzapctb.js">
	
</script>
		<table  style="table-layout:fixed;" width="99.8%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0" >
			<tr>
				<th colspan="41">
					<Strong> 全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表 </Strong>
				</th>
			</tr>
			<tr>
				<th colspan="41" id="title" >
					${zapcquery.titless}
				</th>
			</tr>
			<tr>
				<th rowspan="3" style="width:100px" colspan="2">
					填报<br/>单位<br/>名称
				</th>
				<th colspan="11">
					<Strong> 排查发现可能引发个人极端暴力犯罪的线索数 </Strong>
				</th>
				<th colspan="14">
					<Strong> 治安系统化解处置个人极端暴力犯罪案事件数 </Strong>
				</th>
				<th rowspan="3">
					<Strong> 移交其<br/>
					他警种<br/>
					和政府<br/>
					有关部<br/>
					门</Strong>
					<br/>(起) 
				</th>
				<th colspan="13">
					<Strong> 稳控打击有个人极端暴力犯罪倾向的重点人数 </Strong>
				</th>
			</tr>
			<tr>
				<th rowspan="2">
					合
					<br/>
					计
					<br/>
					(条)
				</th>
				<th colspan="6">
					原因分析
				</th>
				<th colspan="4">
					线索来源渠道分析
				</th>
				
				<th rowspan="2">
					合
					<br/>
					计
					<br/>
					(起)
				</th>
				<th colspan="7">
					预谋实施的场所部位分析
				</th>
				<th colspan="6">
					使用工具情况分析
				</th>
				
				<th rowspan="2">
					合
					<br/>
					计
					<br/>
					(人)
				</th>
				<th colspan="4">
					年龄阶段分析
				</th>
				<th colspan="5">
					重点人群分析
				</th>
				<th colspan="3">
					采取处置措施情况
				</th>
				
			</tr>
			<tr>
				<th>
					邻里纠纷
					<br/>(条)
				</th>
				<th>
					征地拆迁
					<br/>(条)
				</th>
				<th>
					拖欠工资
					<br/>(条)
				</th>
				<th>
					非正常死亡
					<br/>(条)
				</th>
				<th>
					涉法涉诉
					<br/>(条)
				</th>
				<th>
					其他
					<br/>(条)
				</th>
				<th>
					民警排查发现
					<br/>(条)
				</th>
				<th>
					互联网截获
					<br/>(条)
				</th>
				<th>
					110接报
					<br/>(条)
				</th>
				<th>
					群众举报
					<br/>(条)
				</th>
				
				
				<th>
					企事<br/>业单<br/>位
					<br/>(起)
				</th>
				<th>
					党政<br/>机关
					<br/>(起)
				</th>
				<th>
					学校
					<br/>(起)
				</th>
				<th>
					机场<br/>车站<br/>码头<br/>地铁
					<br/>(起)
				</th>
				<th>
					广场、商<br/>业网点等<br/>人员密集<br/>公共场所
					<br/>(起)
				</th>
				<th>
					进京
					<br/>(起)
				</th>
				<th>
					其他
					<br/>(起)
				</th>
				<th>
					爆炸<br/>物品
					<br/>(起)
				</th>
				<th>
					枪支
					<br/>(起)
				</th>
				<th>
					汽油等<br/>易燃<br/>物品
					<br/>(起)
				</th>
				<th>
					剧毒化<br/>学品
					<br/>(起)
				</th>
				<th>
					刀具
					<br/>(起)
				</th>
				<th>
					其他
					<br/>(起)
				</th>
			
				<th>
					20岁以<br/>下
					<br/>(人)
				</th>
				<th>
					20-40<br/>岁
					<br/>(人)
				</th>
				<th>
					41-50<br/>岁
					<br/>(人)
				</th>
				<th>
					51岁以<br/>上
					<br/>(人)
				</th>
				<th>
					无业<br/>人员
					<br/>(人)
				</th>
				<th>
					外来务<br/>工人员
					<br/>(人)
				</th>
				<th>
					上访人<br/>员
					<br/>(人)
				</th>
				<th>
					精神病<br/>人
					<br/>(人)
				</th>
				<th>
					其他
					<br/>(人)
				</th>
				<th>
					治安处<br/>罚
					<br/>(人)
				</th>
				<th>
					刑事处<br/>罚
					<br/>(人)
				</th>
				<th>
					日常稳<br/>控
					<br/>(人)
				</th>
			</tr>
			
			<c:forEach items="${mingxiZapctbList}" var="st" varStatus="s">
				<tr>
					<td colspan="2" onclick="queryMxi('${st.djdwdm}','${st.tjyf}')"><a ><font color="#00FF00">${st.djdwmc}</font></a></td>
					<td>${st.hja}</td>
					<td>${st.lljf}</td>
					<td>${st.zdcq}</td>
					<td>${st.tqgz}</td>
					<td>${st.fzcsw}</td>
					<td>${st.sfss}</td>
					<td>${st.qtyy}</td>
					<td>${st.mjpcfx}</td>
					<td>${st.hlwjh}</td>
					<td>${st.dhjb}</td>
					<td>${st.qzjb}</td>
					<td>${st.hjb}</td>
					<td>${st.qsydw}</td>
					<td>${st.dzjg}</td>
					<td>${st.xx}</td>
					<td>${st.jccz}</td>
					<td>${st.gc}</td>
					<td>${st.jj}</td>
					<td>${st.qtbw}</td>
					<td>${st.bzwp}</td>
					<td>${st.qz}</td>
					<td>${st.qy}</td>
					<td>${st.jd}</td>
					<td>${st.dj}</td>
					<td>${st.qtgj}</td>
					<td>${st.yjqtjz}</td>
					<td>${st.hjc}</td>
					<td>${st.esyx}</td>
					<td>${st.eszss}</td>
					<td>${st.syzws}</td>
					<td>${st.ssyys}</td>
					<td>${st.wyry}</td>
					<td>${st.wlwgry}</td>
					<td>${st.sfry}</td>
					<td>${st.jsbr}</td>
					<td>${st.qtrq}</td>
					<td>${st.zacf}</td>
					<td>${st.xscf}</td>
					<td>${st.rcwk}</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<div id="bzshuoming">
			注：&nbsp;1、填报“化解处置个人极端暴力犯罪案事件数”后，务必逐案填报《排查化解处置个人极端暴力犯罪案事件案例信息报送表》；<br/>
     					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、在开展此项工作中收缴物品工具情况：
     					收缴炸药<input type="text" id="sjzy" value="${stzapcbean.sjzy}" style="text-align:center;width:4%" readonly="readonly">公斤，
     					雷管<input type="text" id="lg"  value="${stzapcbean.lg}"  style="text-align:center;width:4%"  readonly="readonly">枚，
     					剧毒化学品<input type="text" id="jdhxp"  value="${stzapcbean.jdhxp}"  style="text-align:center;width:4%"  readonly="readonly">克，
     					枪支<input type="text" id="qzb"  value="${stzapcbean.qzb}"  style="text-align:center;width:4%"  readonly="readonly">把，
     					子弹<input type="text" id="zdb"  value="${stzapcbean.zdb}"  style="text-align:center;width:4%"  readonly="readonly">发，
     					汽油等易燃物品<input type="text" id="qyb"  value="${stzapcbean.qyb}"  style="text-align:center;width:4%"  readonly="readonly">升；<br/>
     					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、该表由各省区市公安厅、局治安总队牵头汇总填报。
			
		</div>
</creator:view>