<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:panel id="cyryPanel" title="路面盘查数据信息质量">
	<cps:tableGrid url="/xtgl/sjhc/queryLmpc.action"
			id="dataList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" autothead="false" mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="pcCz" ></cps:column>
		<cps:column title="被盘查人姓名" field="pcdxxm" align="left"  maxlength="15"></cps:column>
		<cps:column title="身份证号" field="pcdxsfzh" align="left"></cps:column>
		<cps:column title="盘查地点" field="pcdd"></cps:column>
		<cps:column title="盘查原因" field="pcyyms"></cps:column>
		<cps:column title="盘查结果" field="cljgms" maxlength="20" align="left"></cps:column>
		<cps:column title="盘查时间" field="pcsj" align="left"></cps:column>
		<cps:column title="登记人" field="djrxm" align="left" ></cps:column>
	</cps:tableGrid>
</creator:panel>