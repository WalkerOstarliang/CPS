<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div>
	<cps:table>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center;" width="30">序号</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;" width="210">单位名称</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;" width="35">总分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;" width="40">排名</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;" >两实信息<br/>采集维护25分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">重点人员<br/>动态管控20分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">八进社区<br/>工作20分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">群众工作<br/>入户走访</br>20分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">情报信息<br/>收集报送5分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">安全防范<br/>日常管理5分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">防控刑事<br/>治安案件5分</cps:tdLabel>
		</cps:row>
		<c:forEach items="${khkpDataList}" var="dl" varStatus="s">
			<cps:row>
				<cps:tdContent align="center" >${s.index + 1}</cps:tdContent>
				<cps:tdContent >${dl.orgname}</cps:tdContent>
				<cps:tdContent align="right">${dl.zfz}</cps:tdContent>
				<cps:tdContent align="center">${dl.pm}</cps:tdContent>
				<cps:tdContent align="center">${dl.lszf}</cps:tdContent>
				<cps:tdContent align="center">${dl.zdryzf}</cps:tdContent>
				<cps:tdContent align="center">${dl.xgjzzf}</cps:tdContent>
				<cps:tdContent align="center">${dl.qzzfzf}</cps:tdContent>
				<cps:tdContent align="center">${dl.qbzf}</cps:tdContent>
				<cps:tdContent align="center">${dl.aqffzf}</cps:tdContent>
				<cps:tdContent align="center">${dl.fkxszaajzf}</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
</div>
