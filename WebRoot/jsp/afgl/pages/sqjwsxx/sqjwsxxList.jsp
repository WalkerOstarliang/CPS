<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
	<creator:tbar id="tbar">
			<cps:button value="查询" onclick="querySqjwsxx()"></cps:button>
			<cps:button value="高级查询" onclick="toGjQueryZbhxx()"></cps:button>
			<cps:button value="新增" onclick="openAddSqjwsxx('add', '')"></cps:button>
		</creator:tbar>
		<creator:panel id="afglsqjwsgldj" title="安防管理>社区警务室管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市局：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="sqjwsxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',querySqjwsxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="sqjwsxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县区局：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',querySqjwsxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="sqjwsxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="querySqjwsxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="sqjwsxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">警务室名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="orgname" name="sqjwsxxQuery.orgname"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">责任民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="zrmj" name="sqjwsxxQuery.zrmj"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="czsj_from" name="sqjwsxxQuery.czsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
							至
							<cps:date id="czsj_to" name="sqjwsxxQuery.czsj_to"
										dateFmt="yyyy-MM-dd HH:mm:ss " cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
		
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="sqjwsxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="false" url="/sqjwsxx/sqjwsxxList.action"
			 autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="orgid" title="警务室编号"></cps:column>
			<cps:column title="警务室名称" field="orgname"></cps:column>
			<cps:column title="所属行政区划" field="ssxzqhmc"></cps:column>
			<cps:column title="所属派出所" field="sspcsmc"></cps:column>
			<cps:column title="管辖社区" field="gxqy"></cps:column>
			<cps:column title="责任民警" field="zrmj"></cps:column>
			<cps:column title="登记时间" field="czsj"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="sqjwsxxlistCzRowCallback"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/sqjwsxx.js"></script>
	</creator:box>
</creator:view>