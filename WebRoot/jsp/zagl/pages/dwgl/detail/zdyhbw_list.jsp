<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/zdyhbw_detail.js"></creator:Script>
	<cps:tableGrid   
				id="zdyhbwList"
				url="/zagl/dw/queryZdyhbwBeans.action?dwcx.jgbh=${dw.dwjbxx.jgbh}"
				autoload="true"
				width="99.5%" 
				pageSize="10" 
				usepager="true"  
		  		mutilSelect="false">
		<cps:column isNumber="true" title="序号" width="5%"></cps:column>
		<cps:column title="操作" rowcallback="zdyhbwClickRowCallback"></cps:column>
		<cps:column title="要害名称" field="bwmc"></cps:column>
		<cps:column title="责任人" field="zrr"></cps:column>
		<cps:column title="联系电话" field="zrrlxfs"></cps:column>
		<cps:column title="经济价值(万元)" field="jjjz"></cps:column>
		<cps:column title="保安人数" field="bars"></cps:column>
		<cps:column title="武警人数" field="wjrs"></cps:column>
	</cps:tableGrid>
</creator:view>	