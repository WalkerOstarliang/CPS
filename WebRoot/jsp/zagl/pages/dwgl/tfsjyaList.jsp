<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:tbar id="bwjg">
	<cps:button value="登记突发事件预案" onclick="openTfsjya('','add')"></cps:button>
</creator:tbar>
<cps:tableGrid list="${dw.tfsjyaList}" id="tfsjyaList" title="突发事件预案"
	autoload="true" searchform="" pageSize="5" width="99.5%" 
	usepager="false" mutilSelect="false" isAsynch="false" tbarId="bwjg">
	<cps:column isNumber="true" title="序号"></cps:column>
	<cps:column title="操作" field="cz"></cps:column>
	<cps:column title="预案类型" field="yalxmc"></cps:column>
	<cps:column title="修订时间" field="xdsj"></cps:column>
	<cps:column title="登记时间" field="djsj"></cps:column>
	<cps:column title="登记人" field="djrxm"></cps:column>
	<cps:column title="登记单位" field="djdwmc"></cps:column>
</cps:tableGrid>
