<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<cps:table id="xl_head">
	<cps:row>
		<cps:tdLabel colspan="6" cssStyle="text-align:center;height:45px;font-size:14px" >
		入室盗立破案数统计表
		</cps:tdLabel>
	</cps:row>
	<cps:row>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="50">序号</cps:tdLabel>
		<cps:tdLabel rowspan="2" cssStyle="text-align:center" width="300">单位名称</cps:tdLabel>
		<cps:tdLabel colspan="2" cssStyle="text-align:center" width="350">立案</cps:tdLabel>
		<cps:tdLabel colspan="2" cssStyle="text-align:center" width="350">破案</cps:tdLabel>
	</cps:row>
	<cps:row>
		<cps:tdLabel cssStyle="text-align:center" width="150">刑事案件总数</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="150">入室盗窃</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="150">刑事案件总数</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center" width="150">入室盗窃</cps:tdLabel>
	</cps:row>
	
	<c:forEach items="${faTjList}" var="faTjList" varStatus="s">
		<cps:row>
			<cps:tdContent cssStyle="text-align:center">${s.index+1}</cps:tdContent>	
			<cps:tdContent>${faTjList.orgname}</cps:tdContent>	
			<cps:tdContent cssStyle="text-align:center">${faTjList.laxsaj}</cps:tdContent>	
			<cps:tdContent cssStyle="text-align:center">${faTjList.larsdq}</cps:tdContent>	
			<cps:tdContent cssStyle="text-align:center">${faTjList.paxsaj}</cps:tdContent>	
			<cps:tdContent cssStyle="text-align:center">${faTjList.parsdq}</cps:tdContent>		
		</cps:row>
	</c:forEach>
</cps:table>