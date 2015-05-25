<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:tbar id="rwtbar">
		<cps:button value="查&nbsp;询" onclick="queryData();"></cps:button>&nbsp;
		<c:if test="${renwuQuery.rwlx == '0'}">
			<cps:button value="新&nbsp;增" onclick="toNewRw();"></cps:button>
		</c:if>
	</creator:tbar>
	<creator:box>
		<creator:panel id="aaa" title="${renwuQuery.rwlx == '0'?'任务派发':'任务处理'}" tbarId="rwtbar">
			<form method="post" id="searchform">
				<input type="hidden" name="renwuQuery.clmjjh" value="${loginInfo.username }"/> 
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="renwuQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="renwuQuery.citygajgjgdm" value="${renwuQuery.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="renwuQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryData)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="renwuQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="renwuQuery.countrygajgjgdm" value="${renwuQuery.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="renwuQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryData)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="renwuQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="renwuQuery.pcsdm" value="${renwuQuery.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="renwuQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
						<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="renwuQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="renwuQuery.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="renwuQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<input type="hidden" name="renwuQuery.rwlx" value="${renwuQuery.rwlx}" />
						<cps:tdLabel width="10%">任务标题：</cps:tdLabel>	
						<cps:tdContent width="25%">
							<cps:textfield id="rwbt" name="renwuQuery.rwbt" value="${renwuQuery.rwbt}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">要求完成日期：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date  name="renwuQuery.jcsj_start" cssStyle="width:40%" dateFmt="yyyy-MM-dd"/> -
							<cps:date  name="renwuQuery.jcsj_end" cssStyle="width:40%" dateFmt="yyyy-MM-dd"/>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
			
		</creator:panel>
	<c:if test="${renwuQuery.rwlx == '0'}">
	<cps:tableGrid url="${contextPath}/gzgl/rwgl/queryRenwuList.action" title="任务派发列表"
				id="datagridList"
				searchform="searchform" 
				autothead="true" 
				width="99.8%"
				autoload="true">
		<cps:column isNumber="true" title="序号" ></cps:column>
		<cps:column field="cz" title="操作" ></cps:column>
		<cps:column field="rwbt" title="任务标题"  maxlength="20"></cps:column>
		<cps:column field="clmjxm" title="执行民警" ></cps:column>
		<cps:column field="yqclwcrq" title="要求完成时间" ></cps:column>
		<cps:column field="qsrxm" title="签收人" ></cps:column>
		<cps:column field="qsdwmc" title="签收单位" maxlength="15"></cps:column>
		<cps:column field="sfqsmc" title="签收情况" ></cps:column>
		<cps:column field="rwwcqkmc" title="完成情况"></cps:column>
		
	</cps:tableGrid>
	</c:if>
	<c:if test="${renwuQuery.rwlx == '1'}">
		<div style="height:5px;"></div>
		<cps:tableGrid url="${contextPath}/gzgl/rwgl/queryRenwuclList.action" title="任务处理列表"
						id="datagridList" 
						width="99.8%"
						searchform="searchform" 
						autothead="true" 
						autoload="true" >
			<cps:column isNumber="true" title="序号" ></cps:column>
			<cps:column field="rwclcz" title="操作"></cps:column>
			<cps:column field="rwbt" title="任务标题" maxlength="20"></cps:column>
			<cps:column field="clmjxm" title="执行民警" ></cps:column>
			<cps:column field="yqclwcrq" title="要求完成时间" ></cps:column>
			<cps:column field="sfqsmc" title="签收情况" ></cps:column>
			<cps:column field="rwwcqkmc" title="任务完成情况" ></cps:column>
		</cps:tableGrid>
	</c:if>
	
	</creator:box>
</creator:view>