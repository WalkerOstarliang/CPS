<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/xqxx.js"></script>
	<creator:tbar id="tbar">
			<cps:button value="查&nbsp;询" onclick="queryXqxx()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="openAddXqxx()"></cps:button>
			<cps:button value="批量撤销" onclick="toBatchDeleteXqxx()"></cps:button>	 
		</creator:tbar>
		<creator:panel id="afglxqgldj" title="小区管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="xqxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXqxx)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="xqxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryXqxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="xqxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryXqxx)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="xqxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryXqxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="xqxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryXqxx()"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="xqxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryXqxx()" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
				</cps:row>
						<%--<cps:row>
						<cps:tdLabel>社区：</cps:tdLabel>
						<cps:tdContent>
						<input type="hidden" id="sqbh" name="xqxxQuery.sqbh" value="${xqxxQuery.sqbh}"/>
						<cps:textfield id="sqmc"  cssClass="validate[required] cps-input"  readonly="true" ondblclick="openSqxxSelectWin(setSqxxToPage)"></cps:textfield>
						<cps:button value="选择" onclick="openSqxxSelectWin(setSqxxToPage)"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="13%">小区名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xqmc" name="xqxxQuery.xqmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>--%>
					
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="xqxxList" 
				pageSize="20" 
				usepager="true"
				searchform="searchform" 
				autothead="false" 
				url="/xqxx/xqxxList.action"
				mutilSelect="false" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="xqxxlistCzRowCallback"></cps:column>
			<cps:column title="小区名称" field="xqmc" maxlength="20"></cps:column>
			<cps:column title="小区地址" field="xqdz" maxlength="20"></cps:column>
			<cps:column title="所在社区" field="sssqmc" maxlength="20"></cps:column>
			<cps:column title="管理模式" field="glmsmc"></cps:column>
			<cps:column title="管理类型" field="gllxmc"></cps:column>
			<cps:column title="有效性" field="cxbsmc"></cps:column>
			
		</cps:tableGrid>
	
	</creator:box>
</creator:view>