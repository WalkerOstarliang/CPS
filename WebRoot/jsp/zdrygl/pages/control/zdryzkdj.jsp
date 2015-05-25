<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="<c:url value='/jsp/zdrygl/js/zdry_comm.js'/>"></script>

<creator:view>
	<%@include file="/jsp/common/mysebar.jsp" %>
<creator:box>
	<creator:panel id="lgsq" title="在控管理 >>>重点人员在控登记">
		<form id="searchform" method="POST">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市/州：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citydm}">
								<s:select list="cityXzqhList" id="citydm" name="key.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectCountry(this.value,'countrydmselect')"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="citydm" name="key.citydm"></s:hidden>
								<s:select list="cityXzqhList" id="citydmselect" name="key.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县/区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrydm}">
								<s:select  list="countryXzqhList" id="countrydmselect" name="key.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectPcs(this.value,'pcsdmselect')"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="key.countrydm"></s:hidden>
								<s:select list="countryXzqhList" id="countrydmselect" name="key.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select list="pcsOrgList" id="pcsdmselect"  name="key.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="jxQueryXldxx()"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="key.pcsdm"></s:hidden>
								<s:select list="pcsOrgList" id="pcsdmselect" name="key.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">姓名：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="xm" name="key.xm" value="${key.xm}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">身份证号码：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="sfzh" name="key.sfzh" value="${key.sfzh}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">人员类别：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select id="rylx" name="key.rylx" zdlb="ZDRY_RYLX" cssClass="cps-input" value="${key.rylx}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">性别：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select id="xb" name="key.xb" zdlb="GB_XB" cssClass="cps-input" value="${key.xb}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel width="10%">考察时间：</cps:tdLabel>
					<cps:tdContent width="20%" colspan="4">
						<cps:date id="startDjsj" name="key.startDjsj" dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:96px;"></cps:date> -- 
						<cps:date id="endDjsj" name="key.endDjsj" dateFmt="yyyy-MM-dd" cssClass="cps-input"  cssStyle="width:97px;"></cps:date>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6" align="center">
						 <cps:button value="查&nbsp;询" onclick="querytable('zdryInfo','searchform');"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
			
		</form>
		
		</creator:panel>
		  <creator:tbar>
		  		<cps:button value="人员考察" onclick="openStatistics();"></cps:button>
		  </creator:tbar>
		  <cps:tableGrid id="zdryInfo" 
					pageSize="15"
					usepager="true"
					searchform="searchform"
					autothead="true"
					url="/zdry/control_queryKeyPersonnel.action" 
					mutilSelect="false"
					autoload="true"
					>
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="姓名" field="xm" ></cps:column>
			<cps:column title="性别" field="xb"></cps:column>
			<cps:column title="身份证号" field="sfzh" ></cps:column>
			<cps:column title="现住地址" field="xzdxz"></cps:column>
			<cps:column title="所属派出所" field="sspcsmc"></cps:column>
			<cps:column title="最新更新时间" field="gxsj"></cps:column>
			<cps:column title="考察到期时间" field="kcdqsj"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
