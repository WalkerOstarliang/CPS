<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
		function tjajbydwfl(){
			$("#tjform").submit();
		}
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="统计" onclick="tjajbydwfl()"></cps:button>
		</cps:tbar>
		<cps:panel title="统计条件">
			<form id="tjform" action="${contextPath}/nbgl/fatj/toAjtjByDwflData.action" target="dataArea">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="25%">统计日期：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="query.ksrq" dateFmt="yyyyMMdd" minDate="20140101" cssStyle="width:180px" />&nbsp;至
								<cps:date name="query.jzrq" dateFmt="yyyyMMdd" maxDate="sydate" cssStyle="width:180px" />&nbsp;至
							</cps:tdContent>
						</cps:row>
					</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<iframe name="dataArea" frameborder="0" height="500px" scrolling="no" width="100%" src="${contextPath}/nbgl/fatj/toAjtjByDwflData.action"></iframe>
</creator:view>