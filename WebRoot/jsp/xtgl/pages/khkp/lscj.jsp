<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	<cps:table cssStyle="width:1550px">
		<cps:row>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:30px;">序号</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:200px;">单位名称</cps:tdLabel>
			<c:if test="${query.tjjb == '5'}">
				<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:80px;">民警</cps:tdLabel>
			</c:if>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:40px;">总分值</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:40px;">排名</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:40px;">采集数量5分</cps:tdLabel>
			<cps:tdLabel colspan="8" cssStyle="text-align:center;">信息维护10分</cps:tdLabel>
			<cps:tdLabel colspan="8" cssStyle="text-align:center;">信息质量10分</cps:tdLabel>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center;width:80px;">流动人口延期或主动注销2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:80px;">流动人口系统自动注销1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:70px;">从业人员提醒处理1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:70px;">常口异动提醒处理2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:70px;">境外人员提醒处理1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:50px;">出租屋巡查2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:80px;">出租房屋登记提醒处理1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">小计</cps:tdLabel>
			
			<cps:tdLabel cssStyle="text-align:center;width:60px;">两实信息质量1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:60px;">实有人口逻辑错误1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:60px;">单位信息质量1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:80px;">实体标注和地址关联1分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:80px;">信息数据重复录入2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:80px;">信息应采未采系统比对2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:80px;">电话号码采集率2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;width:40px;">小计</cps:tdLabel>
		</cps:row>
		
		<c:forEach items="${sqtjDataList}" var="lscj" varStatus="s">
			<cps:row>
				<cps:tdContent>${s.index + 1}</cps:tdContent>
				<cps:tdContent>${lscj.orgname}</cps:tdContent>
				<c:if test="${query.tjjb == '5'}">
					<cps:tdContent>${lscj.mjxm}</cps:tdContent>
				</c:if>
				<cps:tdContent  align="center">${lscj.a00000}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.pm}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a10000}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20001}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20002}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20003}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20004}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20005}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20006}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20007}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a20000}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30001}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30002}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30003}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30004}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30005}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30006}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30007}</cps:tdContent>
				<cps:tdContent  align="center">${lscj.a30000}</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
