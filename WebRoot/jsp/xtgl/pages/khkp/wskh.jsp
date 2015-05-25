<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div style="overflow:auto;">
	<cps:table id="wskh_head">
		<cps:row>
			<cps:tdLabel cssStyle="width:30px;text-align:center;" rowspan="2">序号</cps:tdLabel>
			<cps:tdLabel cssStyle="width:200px;text-align:center;" rowspan="2">单位名称</cps:tdLabel>
			<c:if test="${query.tjjb == '5'}">
				<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:80px;">民警</cps:tdLabel>
			</c:if>
			<cps:tdLabel cssStyle="text-align:center;width:40px;" rowspan="2">总分值</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;" rowspan="2">排名</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;" rowspan="2">两实信息采集维护25分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;" rowspan="2">重点人员动态管控20分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;" rowspan="2">情报信息收集报送5分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;" rowspan="2">治安防范日常管理5分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;" colspan="7">相关警种基础工作20分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;" rowspan="2" width="60">防范入室盗窃案件10分 </cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">消防基础工作5分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">治安基础工作5分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">国保基础工作3分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">网技基础工作2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">内保基础工作2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">禁毒基础工作3分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">小计</cps:tdLabel>
		</cps:row>
		
		<c:forEach items="${sqtjDataList}" var="wskh" varStatus="s">
			<cps:row>
				<cps:tdContent>${s.index + 1}</cps:tdContent>
				<cps:tdContent>${wskh.orgname}</cps:tdContent>
				<c:if test="${query.tjjb == '5'}">
					<cps:tdContent>${wskh.mjxm}</cps:tdContent>
				</c:if>
				<cps:tdContent align="center">${wskh.zfz}</cps:tdContent>
				<cps:tdContent align="center">${wskh.pm}</cps:tdContent>
				<cps:tdContent align="center">${wskh.a00000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.b00000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.d00000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.e00000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.c10000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.c20000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.c30000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.c50000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.c60000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.c70000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.c00000}</cps:tdContent>
				<cps:tdContent align="center">${wskh.f00000}</cps:tdContent>
			</cps:row>
		</c:forEach>
		
	</cps:table>
