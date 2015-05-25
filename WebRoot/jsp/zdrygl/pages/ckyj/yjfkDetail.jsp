<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zdrygl/js/ckyj.js"></creator:Script>
<creator:tbar id="op">
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>

	<creator:panel id="qsfkxx" title="常控预警信息" tbarId="op">
		<%-- 
		<fieldset>
			<legend>预警信息</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel cssStyle="text-align:center;">预警级别</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">重点人员编号</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">重点人员姓名</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">身份证号码</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">重点人员类别</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">重点人员细类</cps:tdLabel>
				</cps:row>
				<cps:row>
					<cps:tdContent>${ckxx.ckyj.yjjbmc}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${ckxx.ckyj.zdrybh}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.zdryxm}&nbsp;</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center;">${ckxx.ckyj.sfzh}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.zdrylbbjmc}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.zdryxlmc}&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
		--%>
		<%@include file="/jsp/zdrygl/pages/ckyj/ckyjInfo.jsp"%>
		<fieldset>
			<legend>签收信息</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="13%">预警信息编号：</cps:tdLabel>
					<cps:tdContent width="16%">${ckxx.ckyj.yjxxbh}&nbsp;</cps:tdContent>
					
					<cps:tdLabel width="13%">签收人姓名：</cps:tdLabel>
					<cps:tdContent width="16%">${ckxx.yjqs.qsrxm}&nbsp;</cps:tdContent>
					
					<cps:tdLabel width="13%">身份证号码：</cps:tdLabel>
					<cps:tdContent>${ckxx.yjqs.qsrsfzh}&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>签收单位：</cps:tdLabel>
					<cps:tdContent colspan="3">${ckxx.yjqs.qsdw}&nbsp;</cps:tdContent>
					
					<cps:tdLabel>签收时间：</cps:tdLabel>
					<cps:tdContent>${ckxx.yjqs.qssj}&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
		
		<cps:tableGrid list="${ckxx.yjfkList}" id="fkxxList" autoload="true"
			width="99.5%" height="200" isAsynch="false" title="反馈信息列表"
			mutilSelect="false" usepager="false">
			<cps:column isNumber="true" title="序号" width="5%"></cps:column>
			<cps:column title="操作" field="cz" align="left"></cps:column>
			<cps:column title="处置人姓名" field="czzrmjxm" align="left"></cps:column>
			<cps:column title="处置时间" field="czsj" ></cps:column>
			<cps:column title="采取处置措施" field="cqczcsmc" align="left"></cps:column>
			<cps:column title="处置措施细类" field="czcsxlmc" align="left"></cps:column>
			<cps:column title="处置结果" field="czjgmc" align="left"></cps:column>
		</cps:tableGrid>
	</creator:panel>
</creator:view>