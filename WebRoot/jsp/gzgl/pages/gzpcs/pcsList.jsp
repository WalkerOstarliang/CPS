<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/jws.js"></script>
	<creator:tbar id="jwsbar">
		<cps:button value="查&nbsp;询" onclick="queryList();"></cps:button>&nbsp;
	</creator:tbar>
	<creator:box>
		<creator:panel id="aaa" title="派出所警务室管理" tbarId="jwsbar">
			<input type="hidden" id="logincode" value="${loginInfo.orgcode }"/>
			<form method="post" id="searchform">
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="jwsQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="jwsQuery.citygajgjgdm" value="${jwsQuery.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="jwsQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="jwsQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="jwsQuery.countrygajgjgdm" value="${jwsQuery.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="jwsQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="jwsQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="jwsQuery.pcsdm" value="${jwsQuery.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="jwsQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
						<cps:row>
						<cps:tdLabel width="10%">办公地点类型：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:select id="bgddlx" name="jwsQuery.bgddlx" zdlb="ZDY_BGDDLX" headerKey="" headerValue="--请选择--" onchange="queryList();"></cps:select>
						</cps:tdContent>
						<cps:tdLabel>机构名称：</cps:tdLabel>	
						<cps:tdContent> 
							<input type="hidden" name="jwsQuery.orgcode" value="${jwsQuery.orgcode }" id="orgcode"/>
							<cps:textfield id="orgname" name="jwsQuery.orgname" value="${jwsQuery.orgname}" ondblclick="selectOrg('${loginInfo.rootOrgCode}')"></cps:textfield>
							<cps:button value="选择" onclick="selectOrg('${loginInfo.rootOrgCode}')"></cps:button>
						</cps:tdContent>
						<%--<cps:tdLabel width="10%">是否派出所：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:select id="ispcs" name="jwsQuery.ispcs" zdlb="GB_ZT" headerKey="" headerValue="--请选择--" onchange="queryList();"></cps:select>
						</cps:tdContent>--%>
						<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="25%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
			
		</creator:panel>
	<cps:tableGrid url="${contextPath}/gzgl/gzjwsgl/queryJwsList.action" 
				id="datagridList"
				searchform="searchform" 
				width="99.8%"
				autoload="true">
		<cps:column isNumber="true" title="序号" ></cps:column>
		<cps:column field="cz" title="操作" rowcallback="jwsCallback"></cps:column>
		<cps:column field="orgname" title="机构名称" align="left"></cps:column>
		<cps:column field="bgddlxmc" title="办公地点类型" ></cps:column>
		<cps:column field="wljrfsmc" title="网络接入方式" ></cps:column>
		<cps:column field="pcsszxm" title="派出所所长姓名" ></cps:column>
		<cps:column field="pcsfszxm" title="派出所副所长姓名" ></cps:column>
		<cps:column field="ispcsmc" title="是否派出所"></cps:column>
		
	</cps:tableGrid>
	</creator:box>
</creator:view>