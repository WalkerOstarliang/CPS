<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="小区技防物防设施高级查询">
		<creator:panel id="afglxqjfwfssdjgj" title="小区技防物防设施高级查询">
			<form id="gjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="xqjfwfssxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryXqjfwfssxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="xqjfwfssxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="xqjfwfssxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县/区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="xqjfwfssxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryXqjfwfssxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="xqjfwfssxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="xqjfwfssxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="xqjfwfssxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryXqjfwfssxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="xqjfwfssxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="xqjfwfssxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">设施名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="ssmc" name="xqjfwfssxxQuery.ssmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">安装日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="azsj_from" name="xqjfwfssxxQuery.azsj_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:35%;">
							</cps:date>
					至
					<cps:date id="azsj_to" name="xqjfwfssxxQuery.azsj_to"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:35%;">
							</cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%">设施类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="sslx" name="xqjfwfssxxQuery.sslx"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">所在社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" id="sqbh" name="xqjfwfssxxQuery.sqbh" >
							<cps:textfield id="sqmc"  name="xqjfwfssxxQuery.sqmc" 
										cssClass="validate[required] cps-input" 
										cssStyle="width:50%" readonly="true" ondblclick="openSqxxSelectWin('sqbh','sqmc')">
							</cps:textfield>
							<cps:button value="选择" onclick="openSqxxSelectWin('sqbh','sqmc')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在小区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" id="xqbh" name="xqjfwfssxxQuery.xqbh" />
							<cps:textfield id="xqmc" name="xqjfwfssxxQuery.xqmc"  cssStyle="width:50%"  
										ondblclick="selectXqxx('xqbh','xqmc')"></cps:textfield>
							<cps:button value="选择" onclick="selectXqxx('xqbh','xqmc')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="12%">报警设施连接：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="bjsslj" name="xqjfwfssxxQuery.bjsslj" zdlb="AF_BJSSLJ"
								cssStyle="width:80%" headerKey="" headerValue="--选择--"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="确定" onclick="gjQueryXqjfwfssxx()"></cps:button>
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="关闭" type="window.close()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/xqjfwfssxx.js"></script>
</creator:view>