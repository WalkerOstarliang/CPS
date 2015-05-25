<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/zyzgl.js"></script>
<creator:tbar id="addzcxxtbar">				
	 <cps:button value="保&nbsp;存" onclick="saveZc()"></cps:button>
	 <cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="zyzzcxx" title="志愿者专长信息" tbarId="addzcxxtbar">
<form method="post" action="<c:url value='/qzgl/zyzgl/saveZyzzc.action'/>" id="zcForm">
<input value="${operType}" name="operType" id="operType" type="hidden"/>
<input value="${zyzzcxxBean.zyzbh}" name="zyzzcxxBean.zyzbh" type="hidden"/>
<input type="hidden" value="${zyzzcxxBean.bh }" name="zyzzcxxBean.bh"  id="bh"/>
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%">专长：</cps:tdLabel>
			<cps:tdContent width="25%">
				<s:select list="zcList" id="zc" 
					 listKey="dm" listValue="mc"
					headerKey="" headerValue="--请选择--" cssClass="cps-select" name="zyzzcxxBean.zcdm" ></s:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="10%">经验说明：</cps:tdLabel>
			<cps:tdContent width="25%">
				<s:textarea id="jysm" name="zyzzcxxBean.jysm" rows="5" cssStyle="width:70%;" cssClass="validate[maxSize[150]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</form>
</creator:panel>
</creator:view>