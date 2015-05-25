<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<creator:box>
		<creator:panel id="lgsq" title="采集列管 >>> 列管（撤管）申请">
			<form id="searchform" method="POST">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市/州：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" name="lcsqxx.citydm"
										listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
										cssClass="cps-input"
										onchange="querytable('zdryInfo','searchform');"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="lcsqxx.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="lcsqxx.citydm" listKey="dm" listValue="mc" headerKey=""
										headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">县/区：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect"
										name="lcsqxx.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="querytable('zdryInfo','searchform');"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="lcsqxx.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="lcsqxx.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="lcsqxx.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="querytable('zdryInfo','searchform');"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="lcsqxx.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="lcsqxx.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect"
										name="lcsqxx.jwsqdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--选择--" cssStyle="width:70%"
										cssClass="cps-input"
										onchange="querytable('zdryInfo','searchform');"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="lcsqxx.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect"
										name="lcsqxx.jwsqdm" listKey="orgcode" listValue="orgjc"
										disabled="true" cssStyle="width:70%" cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xm" name="lcsqxx.xm" value="${lcsqxx.xm}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">身份证号码：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="sfzh" name="lcsqxx.sfzh"
								value="${lcsqxx.sfzh}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">人员类别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="zdrklx" name="lcsqxx.zdrklx" zdlb="ZDRY_RYLX"
								cssClass="cps-input" value="${lcsqxx.zdrklx}" headerKey=""
								headerValue="--请选择--"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="startDjsj" name="lcsqxx.startDjsj"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:96px;"></cps:date> -- 
						<cps:date id="endDjsj" name="lcsqxx.endDjsj" dateFmt="yyyy-MM-dd"
								cssClass="cps-input" cssStyle="width:97px;"></cps:date>
						</cps:tdContent>

						<cps:tdLabel width="10%">列管状态：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="lgczt" name="lcsqxx.lgczt" zdlb="ZDRY_LGZT"
								cssClass="cps-input" value="${lcsqxx.lgsqlx}" headerKey=""
								headerValue="--请选择--"></cps:select>
						</cps:tdContent>

						<cps:tdLabel width="10%">性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="xb" name="lcsqxx.xb" zdlb="GB_XB"
								cssClass="cps-input" value="${lcsqxx.xb}" headerKey=""
								headerValue="--请选择--"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="查&nbsp;询"
								onclick="querytable('zdryInfo','searchform');"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>

			</form>

		</creator:panel>
		<creator:tbar>
			<cps:button value="申请列控" onclick="openApplication()"></cps:button>
		</creator:tbar>
		<cps:tableGrid id="zdryInfo" pageSize="15" usepager="true"
			searchform="searchform" autothead="true"
			url="/zdry/collect_queryLcsqxx.action" mutilSelect="false"
			autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="姓名" field="xm"></cps:column>
			<cps:column title="性别" field="xbmc"></cps:column>
			<cps:column title="身份证号" field="sfzh"></cps:column>
			<cps:column title="人员类型" field="zdrklxmc"></cps:column>
			<cps:column title="列(撤)管日期" field="toChar_lcgrq"></cps:column>
			<cps:column title="家庭住址" field="jtzz"></cps:column>
			<cps:column title="列管状态" field="lgcztmc"></cps:column>
			<cps:column title="操作" field="cz"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
