<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/nbgl/js/ajxxInfo.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${operType eq 'update'}">
				<cps:button value="核实" onclick="ajhs()"></cps:button>
			</c:if>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</cps:tbar>
		<cps:panel title="案件信息">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="13%">案件编号：</cps:tdLabel>
					<cps:tdContent width="20%">
						${ajxx.ajbh}&nbsp;
					</cps:tdContent>
				
					<cps:tdLabel width="13%">案件名称：</cps:tdLabel>
					<cps:tdContent width="20%">
						${ajxx.ajmc}&nbsp;
					</cps:tdContent>
					
					<cps:tdLabel width="13%">案件类型：</cps:tdLabel>
					<cps:tdContent>
						${ajxx.ajlx}&nbsp;
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>匹配关键词：</cps:tdLabel>
					<cps:tdContent>
						${ajxx.gjc}&nbsp;
					</cps:tdContent>
				
					<cps:tdLabel>立案日期：</cps:tdLabel>
					<cps:tdContent>
						${ajxx.larq}&nbsp;
					</cps:tdContent>
					
					<cps:tdLabel>是否核实：</cps:tdLabel>
					<cps:tdContent>
						${ajxx.sfhs_ms}&nbsp;
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>立案单位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						${ajxx.ladw}&nbsp;
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>简要案情：</cps:tdLabel>
					<cps:tdContent cssStyle="height:60px" colspan="5">
						${ajxx.jyaq}&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
	
	<c:if test="${(operType eq 'update') || (ajxx.sfhs eq '1')}">
		<cps:panel title="案件核实">
			<form id="ajhsForm">
				<input type="hidden" name="ajxx.ajbh" value="${ajxx.ajbh}" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%"><span style="color:red;">*</span>是否重点单位发案：</cps:tdLabel>
						<cps:tdContent width="18%">
							<s:if test="operType eq 'detail'">
								${ajxx.sfzddwfa eq '1'?'是':'否'}&nbsp;
							</s:if>
							<s:else>
								<s:select list="#{'1':'是','0':'否'}" headerKey="" headerValue="--请选择--" id="sfzddwfa" name="ajxx.sfzddwfa" value="ajxx.sfzddwfa" cssClass="cps-select,validate[required]" onchange="sfzddwfaChange(this.value)"></s:select>
							</s:else>
						</cps:tdContent>
						
						<cps:tdLabel width="15%">重点单位：</cps:tdLabel>
						<cps:tdContent>
							<s:if test="operType eq 'detail'">
								${ajxx.zddwmc}&nbsp;
							</s:if>
							<s:else>
								<c:if test="${ajxx.sfzddwfa eq '0'}" >
									<c:set var="isDisabled" value="true" />
								</c:if>
								<cps:textfield appendPopuBtn="true" id="zddwmc" name="zddwmc" value="${ajxx.zddwmc}" onclick="openNbdwSelectWin('${query.fasqdm}')" disabled="${isDisabled}"></cps:textfield>
								<input type="hidden" name="ajxx.zddwdm" id="zddwdm" value="${ajxx.zddwdm}" />
								<cps:button value="清除" onclick="clearNbdwSelect()"></cps:button>
							</s:else>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>		
		</cps:panel>
	</c:if>
</creator:view>