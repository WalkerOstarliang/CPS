<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/xunldJL.js"></script>
	<creator:tbar id="tbar">
			<cps:button type="button" onclick="searchInfo();" value="查询" ></cps:button>
			<cps:button value="新&nbsp;增" type="button" onclick="openView('add','${loginInfo.orgcode}');"></cps:button>
			<%--<cps:button value="批量删除" onclick="del()"></cps:button>--%>
		</creator:tbar>
	<creator:box>
		<creator:panel id="searchPanel" title="巡逻队奖励管理" tbarId="tbar">
			<form id="searchform" action="">
				<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="bean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',searchInfo)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="bean.citygajgjgdm" value="${bean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="bean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',searchInfo)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="bean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',searchInfo)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="bean.countrygajgjgdm" value="${bean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="bean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',searchInfo)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"  name="bean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="searchInfo()"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="bean.pcsdm" value="${bean.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="bean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="searchInfo()" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="bean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="bean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="bean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel >巡逻队:</cps:tdLabel>
							<cps:tdContent >
						<input type="hidden" name="bean.op" value="${bean.op}" />
						<s:hidden id="xldbh" name="bean.xldbh"></s:hidden>
						<c:choose>
							<c:when test="${bean.op == 'detail'}">
								${bean.xldmc}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldmc" name="bean.xldmc"  onclick="openXldSelectWin()" appendPopuBtn="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
						
						<cps:tdLabel >奖励时间:</cps:tdLabel>
						<cps:tdContent >
							<cps:date name="bean.jlsj" cssStyle="width:39%"></cps:date>&nbsp;至
							<cps:date name="bean.jlsj_end" cssStyle="width:39%"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="xldJLList" title="巡逻奖励情况列表"
					url="/gzgl/xldjl/queryXunldJL.action"  
					searchform="searchform" 
					width="98.8%"
					autothead="true" 
					autoload="false">
			<cps:column isNumber="true" title="序号" />
			<cps:column field="cz" title="操作" align="left"/>
			<cps:column field="xldmc" title="巡逻队名称" maxlength="15"/>
			<cps:column field="ry" title="荣誉" maxlength="15"/>
			<cps:column field="jlsj" title="奖励时间" />
			<cps:column field="djrxm" title="登记人" />
			<cps:column field="djsj" title="登记时间" />
		</cps:tableGrid>
	</creator:box>
</creator:view>