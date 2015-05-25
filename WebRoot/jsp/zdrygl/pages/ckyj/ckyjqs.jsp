<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zdrygl/js/ckyj.js"></creator:Script>
	<creator:tbar id="op">
		<c:if test="${!(operType == 'detail')}">
			<cps:button value="签收" onclick="yjqs()" id="qs_button"></cps:button>
		</c:if>
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<creator:panel id="yjqs" tbarId="op" title="常控预警签收">
		<%@include file="/jsp/zdrygl/pages/ckyj/ckyjInfo.jsp"%>
		<div id="yjqs_div">
			<form id="yjqsForm">
				<input type="hidden" name="ckxx.yjqs.id" value="${ckxx.yjqs.id}" />
				<input type="hidden" name="ckxx.yjqs.ldxxbh" value="${ckxx.yjqs.ldxxbh}" />
				<input type="hidden" name="ckxx.yjqs.yjxxbh" value="${ckxx.ckyj.yjxxbh}" />
				<input type="hidden" name="operType" value="${operType}" id="operType"/>
				<input type="hidden" name="modename" value="常控预警签收"/>
				<fieldset>
					<legend>签收信息</legend>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="13%">签收人姓名：</cps:tdLabel>
							<cps:tdContent width="16%">
								<cps:textfield name="ckxx.yjqs.qsrxm" value="${ckxx.yjqs.qsrxm}" readonly="true"/>
							</cps:tdContent>
							
							<cps:tdLabel width="13%">身份证号码：</cps:tdLabel>
							<cps:tdContent width="16%">
								<cps:textfield name="ckxx.yjqs.qsrsfzh" value="${ckxx.yjqs.qsrsfzh}" readonly="true"/>
							</cps:tdContent>
							
							<cps:tdLabel width="13%">签收时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="ckxx.yjqs.qssj" value="${ckxx.yjqs.qssj}" readonly="true"/>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel>签收单位：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield name="ckxx.yjqs.qsdw" value="${ckxx.yjqs.qsdw}" readonly="true" cssStyle="width:92.5%" />
								<input type="hidden" name="ckxx.yjqs.qsdwjgdm" value="${ckxx.yjqs.qsdwjgdm}" />
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</fieldset>
			</form>
		</div>
	</creator:panel>
</creator:view>