<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:panel id="stPanel" title="实体未在PGIS地图标注">
	<cps:tableGrid url="/xtgl/sjhc/querySt.action"
		id="dataList" autoload="false" pageSize="10" width="99.8%"
		usepager="true" autothead="false" mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<c:if test="${loginInfo.leve == 5}">
			<cps:column title="操作" rowcallback="stCz"  align="left" ></cps:column>
		</c:if>
		<cps:column title="实体名称 " field="stmc" align="left"  maxlength="15"></cps:column>
		<cps:column title="乡镇街道 " field="jdxzmc" align="left"></cps:column>
		<cps:column title="社区村" field="sqmc" align="left" maxlength="10"></cps:column>
		<cps:column title="街路巷" field="jlxmc" align="left"></cps:column>
		<cps:column title="门牌号" field="mph" ></cps:column>
		<cps:column title="小区组" field="xqz" align="left"></cps:column>
		<cps:column title="实体地址" field="stdz" align="left" maxlength="15"></cps:column>
		<cps:column title="登记人" field="djrxm" align="left" ></cps:column>
		<cps:column title="办理期限" field="blqx"></cps:column>
	</cps:tableGrid>
</creator:panel>