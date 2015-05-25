<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:panel id="cyryPanel" title="从业人员登记反馈">
	<cps:tableGrid url="/xtgl/sjhc/queryCyry.action"
			id="dataList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" autothead="false" mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<c:if test="${loginInfo.leve == 5}">
			<cps:column title="操作" expand="false" rowcallback="cyryCz" align="left" ></cps:column>
		</c:if>
		<cps:column title="姓名" field="xm" align="left"  maxlength="15"></cps:column>
		<cps:column title="性别 " field="xbmc" align="left"></cps:column>
		<cps:column title="身份证号" field="sfzh"></cps:column>
		<cps:column title="联系电话" field="sjhm"></cps:column>
		<cps:column title="工作单位" field="dwmc" align="left"></cps:column>
		<cps:column title="居住地社区" field="jzdsqmc" align="left"></cps:column>
		<cps:column title="登记人" field="djrxm" align="left" ></cps:column>
		<cps:column title="办理期限" field="blqx"></cps:column>
	</cps:tableGrid>
</creator:panel>