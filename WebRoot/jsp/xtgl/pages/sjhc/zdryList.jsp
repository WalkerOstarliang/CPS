<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:panel id="zdryPanel" title="${title}">
	<cps:tableGrid url="/xtgl/sjhc/queryZdry.action"
			id="dataList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" autothead="false" mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<c:if test="${loginInfo.leve == 5}">
			<cps:column title="操作"  rowcallback="zdryCz"  align="left" ></cps:column>
		</c:if>
		
		<cps:column title="姓名 " field="xm" align="left"></cps:column>
		<cps:column title="身份证号" field="sfzh" align="left"></cps:column>
		<cps:column title="重点人员类别 " field="zdryxlmc" align="left" maxlength="10"></cps:column>
		<cps:column title="户籍地详址" field="hjdxz" maxlength="8"></cps:column>
		<cps:column title="现住址详址" field="xzzxz" align="left" maxlength="8"></cps:column>
		<cps:column title="责任单位" field="sszrdwmc" align="left" maxlength="8"></cps:column>
		<c:if test="${query.khlx == '202'}">
			<cps:column title="托管时间" field="wtsj" align="left" ></cps:column>
		</c:if>
		<cps:column title="办理期限" field="blqx"></cps:column>
	</cps:tableGrid>
</creator:panel>