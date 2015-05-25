<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:box>
	<creator:tbar id="zjtbar">
			<cps:button value="查&nbsp;询" onclick="queryData();"></cps:button>&nbsp;
			<cps:button value="新&nbsp;增" onclick="toNewZj();"></cps:button>	
	</creator:tbar>
		<creator:panel id="searchPanel" title="总结管理" tbarId="zjtbar">
			<form id="searchform">
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
					<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="zjieQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zjieQuery.citygajgjgdm" value="${zjieQuery.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="zjieQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryData)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
							<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="zjieQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zjieQuery.countrygajgjgdm" value="${zjieQuery.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="zjieQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryData)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="zjieQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zjieQuery.pcsdm" value="${zjieQuery.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="zjieQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
						<cps:row>
						 	<cps:tdLabel>警务区：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="zjieQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="zjieQuery.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="zjieQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						 
						 	<cps:tdLabel>总结类型：</cps:tdLabel>
						 	<cps:tdContent>
						 		<cps:select zdlb="GZGL_ZJLB" name="zjieQuery.zjlx" headerKey="" headerValue="--请选择--" onchange="queryData()"></cps:select>
						 	</cps:tdContent>
						 	
							<cps:tdLabel width="10%">标题：</cps:tdLabel>
							<cps:tdContent width="25%">
								<cps:textfield name="zjieQuery.zjbt" ></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
							<cps:tdContent width="25%">
								<cps:date cssStyle="width:40%" id="beginDate" name="zjieQuery.beginDate" dateFmt="yyyy-MM-dd" value="${zjieQuery.beginDate}"></cps:date>&nbsp;-
								<cps:date cssStyle="width:40%" name="zjieQuery.endDate" dateFmt="yyyy-MM-dd" startDate="beginDate" value="${zjieQuery.endDate}"></cps:date>
							</cps:tdContent>
							<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
							<cps:tdContent width="25%">
								&nbsp;
							</cps:tdContent>
							<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
							<cps:tdContent width="25%">
								&nbsp;
							</cps:tdContent>
						</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid url="${contextPath}/gzgl/zjgl/queryZongjieList.action" 
			id="datagridList" title="总结列表" width="99.8%"
			searchform="searchform" autoload="true" mutilSelect="false" >
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作"></cps:column>	
			<cps:column field="zjbt" title="标题"></cps:column>
			<cps:column field="zjlxms" title="总结类型"></cps:column>
			<cps:column field="zjmjxm" title="值班民警姓名"></cps:column>
			<cps:column field="zjmjdwmc" title="值班民警单位名称"></cps:column>
			<cps:column field="djsj" title="登记时间"  ></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
