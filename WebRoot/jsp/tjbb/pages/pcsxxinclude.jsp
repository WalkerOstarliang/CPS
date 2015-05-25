<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:table width="1400px">
	<cps:row>
		<cps:tdLabel rowspan="2"  cssStyle="text-align:center" >序号</cps:tdLabel>
		<cps:tdLabel rowspan="2"  cssStyle="text-align:center" >分县区局名称</cps:tdLabel>
		<cps:tdLabel rowspan="2"  cssStyle="text-align:center" >派出所名称</cps:tdLabel>
		<cps:tdLabel rowspan="2"  cssStyle="text-align:center" >警务区名称</cps:tdLabel>
		<cps:tdLabel colspan="5"  cssStyle="text-align:center" >社区民警</cps:tdLabel>
		<cps:tdLabel rowspan="2"  cssStyle="text-align:center" >包含社<br/>区（村）</cps:tdLabel>
		<cps:tdLabel rowspan="2"  cssStyle="text-align:center" >警务区<br/>类别</cps:tdLabel>
		<cps:tdLabel rowspan="2"  cssStyle="text-align:center" >配备协<br/>辅警数</cps:tdLabel>
	</cps:row>
	<cps:row>
		<cps:tdLabel cssStyle="text-align:center">姓名</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center">警号</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center">身份证号</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center">年龄</cps:tdLabel>
		<cps:tdLabel cssStyle="text-align:center">手机号码</cps:tdLabel>
	</cps:row>
	<c:if test="${not empty pcsjwqJbqkList}">
		<c:forEach items="${pcsjwqJbqkList}" var="bean" varStatus="st">
			<cps:row>
				<cps:tdContent cssStyle="text-align:center">${st.index + 1}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center" width="50">${bean.fxjmc}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center" width="80">${bean.pcsmc}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.jwqmc}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.realname}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.username}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.sfzh}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.age}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.lxdh}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${fn:substring(bean.gxsq,0,6)}..</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.jwqdjms}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${bean.pbfjs}</cps:tdContent>
			</cps:row>
		</c:forEach>
	</c:if>
</cps:table>
