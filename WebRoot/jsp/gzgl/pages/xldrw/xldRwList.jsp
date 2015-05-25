<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/xunldRw.js"></script>
	<creator:box>
		<creator:tbar id="tbar">
			<cps:button type="button" onclick="searchInfo();" value="查询" ></cps:button>	
			<cps:button value="新&nbsp;增" type="button" onclick="openView('add','${loginInfo.orgcode}');"></cps:button>
			<%--<cps:button value="批量删除" onclick="del()"></cps:button>--%>
		</creator:tbar>
		<creator:panel id="searchPanel" title="巡逻情况查询" tbarId="tbar">
			<form id="searchform" action="">
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',searchInfo)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',searchInfo)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',searchInfo)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',searchInfo)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="searchInfo()"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="searchInfo()" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">巡逻地点：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield name="queryBean.zxdyfw" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">巡逻时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date name="queryBean.gzqsrq_start" cssStyle="width:38%" dateFmt="yyyy-mm-dd"></cps:date>&nbsp;至
							<cps:date name="queryBean.gzqsrq_end" cssStyle="width:38%"  dateFmt="yyyy-mm-dd"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
			<cps:tableGrid id="xldRwList" title="巡逻情况登记列表" 
					url="/gzgl/xldrw/queryListXunldRW.action" 
					width="99.8%"
					autoload="false"
					searchform="searchform">
				<cps:column isCheckbox="true"></cps:column>
				<cps:column isNumber="true" title="序号" />
				<cps:column field="cz" title="操作" align="left"/>
				<cps:column field="xlsj" title="巡逻时间" />
				<cps:column field="xlfs" title="巡逻方式" />
				<cps:column field="ddmj" title="带队民警" />
				<cps:column field="zxryxm" title="巡逻队员" />
				<cps:column field="zxdyfw" title="巡逻地点" maxlength="20"/>
			</cps:tableGrid>
	</creator:box>
</creator:view>