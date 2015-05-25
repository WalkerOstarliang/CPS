<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/userlxfs.js"></script>
	<creator:tbar id="lxfsbar">
		<cps:button value="查&nbsp;询" onclick="queryList();"></cps:button>&nbsp;
	</creator:tbar>
	<creator:box>
		<creator:panel id="userlxfs" title="警员信息管理" tbarId="lxfsbar">
			<form method="post" id="searchform">
			<input value="${loginInfo.username }" type="hidden" id="userjh"/>
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm}"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm}"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.pcsdm" value="${queryBean.pcsdm}"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="jxQuery()" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">用户姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="xm" name="queryBean.xm" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">警号：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="username" name="queryBean.username" ></cps:textfield>
						</cps:tdContent>
				</cps:row>
						<cps:row>
						
						<cps:tdLabel width="10%">身份证号：</cps:tdLabel>	
						<cps:tdContent width="25%"> 
							<cps:textfield id="sfzh" name="queryBean.sfzh"></cps:textfield>
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
	<cps:tableGrid url="${contextPath}/gzgl/userlxsfgl/queryLxfsList.action" 
				id="datagridList"
				searchform="searchform" 
				autothead="true" 
				width="99.8%"
				autoload="true">  
		<cps:column isNumber="true" title="序号" ></cps:column>
		<cps:column title="操作" field="cz"></cps:column>
		<cps:column field="username" title="警号" ></cps:column>
		<cps:column field="xm" title="用户姓名" ></cps:column>
		<cps:column field="sfzh" title="身份证"></cps:column>
		<cps:column field="mobile" title="手机号码" ></cps:column>
		<cps:column field="telephone" title="电话号码"></cps:column>
		<cps:column field="orgdwmc" title="所属单位" align="left" width="30%"></cps:column>
		
	</cps:tableGrid>
	</creator:box>
</creator:view>