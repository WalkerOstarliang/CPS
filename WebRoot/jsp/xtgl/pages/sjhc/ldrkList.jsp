<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:panel id="ldrkPanel" title="流动人口延期或注销">
	<cps:tableGrid url="/xtgl/sjhc/queryLdrk.action"
		id="dataList" autoload="false" pageSize="10" width="99.8%"
		usepager="true" autothead="false" mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<c:if test="${loginInfo.leve == 5}">
			<cps:column title="操作" rowcallback="ldrkCz"  expand="false"  align="left" ></cps:column>
		</c:if>
		<cps:column title="姓名" field="xm" align="left"  maxlength="15"></cps:column>
		<cps:column title="性别 " field="xbmc" align="left"></cps:column>
		<cps:column title="身份证号" field="sfzh" align="left"></cps:column>
		<cps:column title="联系电话" field="lxdh" align="left"></cps:column>
		<cps:column title="户籍地详址" field="hjdxz" align="left" maxlength="10"></cps:column>
		<cps:column title="现住地详址" field="zzdxz" align="left" maxlength="10"></cps:column>
		<cps:column title="责任民警" field="zrmjxm" align="left" ></cps:column>
		<cps:column title="办理期限" field="blqx"></cps:column>
	</cps:tableGrid>
</creator:panel>