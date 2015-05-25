<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/afgl/js/af.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/xqjfwfssxx.js"></creator:Script>
	<creator:box>
		<creator:tbar id="tbar">
			<cps:button value="查&nbsp;询" onclick="queryXqjfwfssxx()"></cps:button>
			<%--<cps:button value="清&nbsp;空" type="reset"></cps:button>
			<cps:button value="高级查询" onclick="toGjQueryXqjfwfssxx()"></cps:button>--%>
			<cps:button value="新&nbsp;增" onclick="openAddXqjfwfssxx('add')"></cps:button>
		</creator:tbar>
		<creator:panel id="afglxqjfwfssdj" title="小区技防物防设施管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="xqjfwfssxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXqjfwfssxx)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="xqjfwfssxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXqjfwfssxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="xqjfwfssxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryXqjfwfssxx)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="xqjfwfssxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryXqjfwfssxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
				        <c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="xqjfwfssxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryXqjfwfssxx()"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="xqjfwfssxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryXqjfwfssxx()" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
				</cps:row>
					<%--<cps:row>
						<cps:tdLabel width="13%">社区：</cps:tdLabel>
						<cps:tdContent width="20%">
						<cps:textfield  id="sqmc" name="xqjfwfssxxQuery.sqmc" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="13%">小区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xqmc" name="xqjfwfssxxQuery.xqmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">设施类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="sslx" name="xqjfwfssxxQuery.sslx" zdlb="AF_SSLX" headerKey="" headerValue="--请选择--"></cps:select>
						</cps:tdContent>
					</cps:row>--%>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="xqjfwfssxxList" pageSize="15" usepager="true" 
			width="99.8%"
			searchform="searchform" autothead="false" url="/xqjfwfssxx/xqjfwfssxxList.action"
			mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="设施名称" field="ssmc"></cps:column>
			<cps:column title="设施类型" field="sslxmc"></cps:column>
			<cps:column title="所在社区" field="sqmc"></cps:column>
			<cps:column title="所在小区" field="xqmc"></cps:column>
			<cps:column title="安装时间" field="azsj"></cps:column>
			<cps:column title="运行情况" field="sbyxqkmc"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="xqjfwfssxxlistCzRowCallback"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>