<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:Script src="/jsp/lsgl/js/dz.js"></creator:Script>
	<creator:box>
		<creator:tbar id="rztbar">
			<cps:button value="查询" onclick="queryDate();"></cps:button>&nbsp;
		<cps:button value="新增" onclick="openDzInfoWin('add')"></cps:button>
		</creator:tbar>
		<creator:panel id="rizhiPanel" title="查询条件" tbarId="rztbar">
			<form id="dzQuery">
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="dzQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryDate)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="dzQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryDate)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="dzQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryDate)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="dzQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryDate)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="dzQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryDate()"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="dzQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryDate()" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
				</cps:row>
		     	<cps:row>		
					<cps:tdLabel width="10%">实体名称：</cps:tdLabel>
					<cps:tdContent width="25%;">
						<cps:textfield id="stmc" name="dzQuery.stmc"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%;">地址名称：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dzmc" name="dzQuery.dzmc"></cps:textfield>
					</cps:tdContent>	
					<cps:tdLabel width="10%;">登记时间：</cps:tdLabel>
					<cps:tdContent >
						<cps:date id="djsj_from" name="dzQuery.djsj_from" dateFmt="yyyy-MM-dd" cssStyle="width:32%" ></cps:date>
						-
						<cps:date id="djsj_to" name="dzQuery.djsj_to" dateFmt="yyyy-MM-dd" cssStyle="width:32%"></cps:date>
					</cps:tdContent>
				</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid  url="/lsgl/dz/queryDzWithPageInfoRseult.action"
					    id="dzList" title="地址信息类别"
						searchform="dzQuery" 
						autoload="true" 
						mutilSelect="false"
						width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz"  title="操作" align="left"></cps:column>
			<cps:column field="dzmc" title="地址"  align="left"></cps:column>
			<cps:column field="djrxm" title="登记人"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
