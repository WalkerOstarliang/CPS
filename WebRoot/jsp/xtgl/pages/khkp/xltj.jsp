<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<input type="hidden" id="param_tjyf" value="${query.tjsj}" />
<input type="hidden" id="param_tjjd" value="${query.tjsjfw}" />
<cps:table id="xl_head">
	<cps:row>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center;" width="30">序<br/>号</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="220">单位名称</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="35">总分</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="35">排名</cps:tdLabel>
		<cps:tdLabel colspan="4" cssStyle="text-align:center">两实信息采集维护<br/>25分</cps:tdLabel>
		<cps:tdLabel colspan="7" cssStyle="text-align:center">重点人员动态管控<br/>20分</cps:tdLabel>
		<cps:tdLabel colspan="5" cssStyle="text-align:center">八进社区工作<br/>20分</cps:tdLabel>
		<cps:tdLabel colspan="2" cssStyle="text-align:center">群众工作<br/>入户走访<br/>20分</cps:tdLabel>
		
		<%-- 新增 --%>
		<cps:tdLabel colspan="2" cssStyle="text-align:center">情报信息<br/>收集报送<br/>5分</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="50">安全<br/>防范<br/>日常<br/>管理<br/>5分</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="50">防控<br/>刑事<br/>治安<br/>案件</br>5分</cps:tdLabel>
	</cps:row>
	<cps:row>
		<cps:tdLabel cssStyle="text-align:center" width="50">基础<br/>信息<br/>采集<br/>数量<br/>3分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">信息<br/>维护<br/>11分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">信息<br/>质量<br/>10分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">境外<br/>人员<br/>管理<br/>1分</cps:tdLabel>
		
		<cps:tdLabel cssStyle="text-align:center;" width="40">下发<br/>数据<br/>维护<br/>6分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;" width="40">委托<br/>签收<br/>管理<br/>2分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;" width="40">在控<br/>登记<br/>质量<br/>5分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;" width="40">重点<br/>人员<br/>重新<br/>违法<br/>犯罪<br/>2分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;" width="40">取保<br/>候审<br/>监视<br/>居住<br/>管理<br/>2分</cps:tdLabel>
		
		<cps:tdLabel cssStyle="text-align:center;" width="40">社区<br/>矫正<br/>对象<br/>管理<br/>2分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center;" width="40">稳控<br/>对象<br/>管理<br/>1分</cps:tdLabel>
		
		<cps:tdLabel cssStyle="text-align:center" width="40">消防<br/>基础<br/>工作<br/>5分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">治安<br/>基础<br/>工作<br/>7分</cps:tdLabel>
		<%-- 
		<cps:tdLabel cssStyle="text-align:center" width="40">国保<br/>基础<br/>工作<br/>3分</cps:tdLabel>
		--%>
		<cps:tdLabel cssStyle="text-align:center" width="40">网技<br/>基础<br/>工作<br/>3分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">内保<br/>基础<br/>工作<br/>2分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">禁毒<br/>基础<br/>工作<br/>3分</cps:tdLabel>
		
		<%-- 群众工作入户走访 新增 --%>
		<cps:tdLabel cssStyle="text-align:center" width="40">一般性 <br/>走访<br/>16分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">入室<br/>盗窃<br/>回访</br>4分</cps:tdLabel>
		
		<cps:tdLabel cssStyle="text-align:center" width="40">情报<br/>收集<br/>2分</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="40">情报<br/>运用<br/>3分</cps:tdLabel>
	</cps:row>
	
	<c:forEach items="${khkpDataList}" var="xl" varStatus="s">
		<cps:row>
			<cps:tdContent align="center">${s.index + 1}</cps:tdContent>
			<cps:tdContent width="220">${xl.orgname}</cps:tdContent>
			<cps:tdContent align="center">${xl.zfz}</cps:tdContent>
			<cps:tdContent align="center">${xl.pm}</cps:tdContent>
			
			<c:choose>
				<c:when test="${query.tjjb == '5'}">
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.jcxxcjslfz}','lsgl_cjsl','${xl.orgcode}')">${xl.jcxxcjslfz}</span></cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.xxwffz}','lsgl_xxwh','${xl.orgcode}')">${xl.xxwffz}</span></cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.xxzlfz}','lsgl_xxzl','${xl.orgcode}')">${xl.xxzlfz}</span></cps:tdContent>
					<%-- 境外人员管理 新增 --%>
					<cps:tdContent align="center">${xl.jwrygl}</cps:tdContent>
					<%-- 
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.jwrygl}','lsgl_xxzl','${xl.orgcode}')">${xl.jwrygl}</span></cps:tdContent>
					--%>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.xfsjwffz}','zdry_xfsjwh','${xl.orgcode}')">${xl.xfsjwffz}</span></cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.wtqsglfz}','zdry_wtqs','${xl.orgcode}')">${xl.wtqsglfz}</span></cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.zkdjzlfz}','zdry_zkdjzl','${xl.orgcode}')">${xl.zkdjzlfz}</span></cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.zdrycxwffz}','zdry_cxwffz','${xl.orgcode}')">${xl.zdrycxwffz}</span></cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.qbhsjsjzgl}','zdry_qbhsjsjzgl','${xl.orgcode}')">${xl.qbhsjsjzgl}</span></cps:tdContent>
					<cps:tdContent align="center">${xl.sqjzdxgl}</cps:tdContent>
					<cps:tdContent align="center">${xl.wkdxgl}</cps:tdContent>
				</c:when>
				<c:otherwise>
					<cps:tdContent align="center">${xl.jcxxcjslfz}</cps:tdContent>
					<cps:tdContent align="center">${xl.xxwffz}</cps:tdContent>
					<cps:tdContent align="center">${xl.xxzlfz}</cps:tdContent>
					<%-- 境外人员管理 新增 --%>
					<cps:tdContent align="center">${xl.jwrygl}</cps:tdContent>
					<cps:tdContent align="center">${xl.xfsjwffz}</cps:tdContent>
					<cps:tdContent align="center">${xl.wtqsglfz}</cps:tdContent>
					<cps:tdContent align="center">${xl.zkdjzlfz}</cps:tdContent>
					<cps:tdContent align="center">${xl.zdrycxwffz}</cps:tdContent>
					<cps:tdContent align="center">${xl.qbhsjsjzgl}</cps:tdContent>
					<cps:tdContent align="center">${xl.sqjzdxgl}</cps:tdContent>
					<cps:tdContent align="center">${xl.wkdxgl}</cps:tdContent>
				</c:otherwise>
			</c:choose>
			
			<cps:tdContent align="center">${xl.xfjcgzfz}</cps:tdContent>
			<cps:tdContent align="center">${xl.zajcgzfz}</cps:tdContent>
			<%-- 国保 取消考核
			<cps:tdContent align="center">${xl.gbjcgzfz}</cps:tdContent>
			--%>
			<cps:tdContent align="center">${xl.wjjcgzfz}</cps:tdContent>
			<c:choose>
				<c:when test="${query.tjjb == '5'}">
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.nbjcgzfz}','bjsq_nbjcgz','${xl.orgcode}')">${xl.nbjcgzfz}</span></cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.jdjcgzfz}','bjsq_jdjcgz','${xl.orgcode}')">${xl.jdjcgzfz}</span></cps:tdContent>
					
					<cps:tdContent align="center">${xl.ybxzf}</cps:tdContent>
					<cps:tdContent align="center">${xl.rsdqhf}</cps:tdContent>
					
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.qbsjfz}','qbxs_sj','${xl.orgcode}')">${xl.qbsjfz}</span></cps:tdContent>
					<cps:tdContent align="center">${xl.qbyyfz}</cps:tdContent>
				</c:when>
				<c:otherwise>
					<cps:tdContent align="center">${xl.nbjcgzfz}</cps:tdContent>
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.jdjcgzfz}','bjsq_jdjcgz','${xl.orgcode}')">${xl.jdjcgzfz}</span></cps:tdContent>
					<%-- 群众走访          新增 --%>
					<cps:tdContent align="center">${xl.ybxzf}</cps:tdContent>
					<cps:tdContent align="center">${xl.rsdqhf}</cps:tdContent>
					<cps:tdContent align="center">${xl.qbsjfz}</cps:tdContent>
					<cps:tdContent align="center">${xl.qbyyfz}</cps:tdContent>
				</c:otherwise>
			</c:choose>	
			
			
			<c:choose>
				<c:when test="${query.tjjb == '5'}">
					<cps:tdContent align="center"><span class="cps_span_href" style="color:green;cursor:hand;" onclick="openKfxq('${xl.aqffzf}','aqff','${xl.orgcode}')">${xl.aqffzf}</span></cps:tdContent>
				</c:when>
				<c:otherwise>
					<cps:tdContent align="center">${xl.fkxszaajzf}</cps:tdContent>
				</c:otherwise>
			</c:choose>	
			<cps:tdContent align="center">${xl.fkxszaajzf}</cps:tdContent>
		</cps:row>
	</c:forEach>
</cps:table>