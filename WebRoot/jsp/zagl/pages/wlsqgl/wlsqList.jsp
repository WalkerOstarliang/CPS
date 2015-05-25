<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:tbar id="op">
		<cps:button value="查询" onclick="wlsqcx()"></cps:button>
		<cps:button value="新增" onclick="openWlsqView('add')"></cps:button>
		<cps:button value="批量删除" onclick="delWlsq()"></cps:button>
	</creator:tbar>

	<creator:panel id="wlsqgl" title="网络社区管理" tbarId="op" width="99.8%">
		<form id="searchform">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">市局：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"
									name="query.citygajgjgdm" listKey="dm" listValue="jc"
									headerKey="" headerValue="--请选择--" cssClass="cps-select"
									onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="query.citygajgjgdm" value="${query.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"
									disabled="true" name="query.citygajgjgdm" listKey="dm"
									listValue="jc" headerKey="" headerValue="--请选择--"
									cssClass="cps-select"
									onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>

					<cps:tdLabel width="12%">县区局：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"
									name="query.countrygajgjgdm" listKey="dm" listValue="jc"
									headerKey="" headerValue="--请选择--" cssClass="cps-select"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="query.countrygajgjgdm" value="${query.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"
									name="query.countrygajgjgdm" listKey="dm" listValue="jc"
									disabled="true" headerKey="" headerValue="--请选择--"
									cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="12%">派出所：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"
									name="query.pcsdm" listKey="dm" listValue="jc"
									headerKey="" headerValue="--请选择--" cssClass="cps-select"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="query.pcsdm" value="${query.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"
									name="query.pcsdm" listKey="dm" listValue="jc"
									disabled="true" headerKey="" headerValue="--请选择--"
									cssClass="cps-select" ></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">社区名称：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="sssqbh" name="query.sssqbh">
						<cps:textfield id="sssqmc" name="query.sssqmc"
							cssStyle="width:50%" readonly="true"
							ondblclick="openSqxxSelectWin('0')">
						</cps:textfield>
						<cps:button value="选择" onclick="openSqxxSelectWin('0')"></cps:button>
					</cps:tdContent>
					
					<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
					
					<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>

	<cps:tableGrid id="wlsqList" pageSize="10" usepager="true"
		searchform="searchform" autothead="false"
		url="/zagl/wlsq/queryWlsqByPageResultInfo.action" mutilSelect="true"
		autoload="false" width="99.8%">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column title="操作" field="cz" align="left"></cps:column>
		<cps:column title="社区名称" field="sssqmc"></cps:column>
		<cps:column title="所属行政区划" field="ssxzqhmc"></cps:column>
		<cps:column title="所属街道" field="ssjdxzmc"></cps:column>
		<cps:column title="社区网站总数" field="wzs"></cps:column>
		<cps:column title="社区论坛总数" field="lts"></cps:column>
		<cps:column title="社区QQ群总数" field="qqqs"></cps:column>
		
	</cps:tableGrid>
	<script type="text/javascript" src="${contextPath}/jsp/zagl/js/wlsq.js">
</script>
</creator:view>