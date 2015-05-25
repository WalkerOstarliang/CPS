<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/gzgl/js/tzmb.js"></creator:Script>
	<creator:box>
	<creator:tbar id="gztzmbtbar">
			<c:if test="${operType=='1'}">
			<cps:button value="上传模板" onclick="scmb();"></cps:button>
			</c:if>
			<cps:button value="查&nbsp;询" onclick="queryData();"></cps:button>
	</creator:tbar>
	<creator:panel id="tzmbxzPanel" title="${operType=='1'?'台账模板上传':'台账模板下载'}" tbarId="gztzmbtbar">
		<form id="tzmbxzForm">
			<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">台账名称：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield   id="tzmc" name="queryBean.tzmc" >
					</cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">上传时间：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:date  name="queryBean.scsj_from"  cssStyle="width:40%" id="scsj_from"></cps:date>&nbsp;-
					<cps:date  name="queryBean.scsj_to" cssStyle="width:40%" id="scsj_to"></cps:date>
				</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</creator:panel>
		
		<c:if test="${operType=='1'}">
		<cps:tableGrid id="tzmbxzItem" title="台账模板列表"
						searchform="tzmbxzForm"  
						url="/gzgl/gztzgl/queryList.action" >
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="deletecallback" width="10%"></cps:column>  
			<cps:column title="台账名称" field="tzmc" width="60%" align="left"></cps:column>
			<cps:column title="上传时间" field="scsj" width="20%"></cps:column>
		</cps:tableGrid>
		</c:if>
		<c:if test="${operType=='2'}">
			<cps:tableGrid id="tzmbxzItem" title="台账模板列表"
							searchform="tzmbxzForm"  
							url="/gzgl/gztzgl/queryList.action" 
							autoload="true"
							width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			
			<cps:column title="台账名称" field="tzmc" width="60%" align="left"></cps:column>
			<cps:column title="上传时间" field="scsj" width="20%"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="downloadcallback" width="10%"></cps:column>  
		</cps:tableGrid>
		</c:if>	
	</creator:box>

</creator:view>