<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
		<creator:panel id="afglkkxlxxdj" title="安防管理>卡口巡逻管理">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="kkxlxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryKkxlxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="kkxlxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="kkxlxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县/区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkxlxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKkxlxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxlxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkxlxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkxlxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryKkxlxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxlxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkxlxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>卡口名称：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="kkbh" name="kkxlxxQuery.kkbh"/>
							<cps:textfield id="kkmc" name="kkxlxxQuery.kkmc"
								cssStyle="width:40%" ondblclick="selectKkxx()"></cps:textfield>
							<cps:button value="选择" onclick="selectKkxx()"></cps:button>
						</cps:tdContent>
						<cps:tdLabel>巡逻时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="xlkssj" name="kkxlxxQuery.xlkssj"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%"></cps:date>
					至
					<cps:date id="xljssj" name="kkxlxxQuery.xljssj"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>巡逻民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="xlmj" name="kkxlxxQuery.xlmj"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="查&nbsp;询" onclick="queryKkxlxx()"></cps:button>
							<cps:button value="清&nbsp;空" type="reset"></cps:button>
							<cps:button value="高级查询" onclick="toGjQueryKkxlxx()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel> 
		<creator:tbar id="op">
			<cps:button value="新&nbsp;增" onclick="openAddKkxlxx()"></cps:button>
			<!--<cps:button value="批量删除"></cps:button>-->
		</creator:tbar>
		
		<cps:tableGrid id="kkxlxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="false" tbarId="op"
			url="/kkxlxx/kkxlxxList.action" mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="卡口名称" field="kkmc"></cps:column>
			<cps:column title="卡口位置" field="kkwz"></cps:column>
			<cps:column title="警务责任区" field="sszrqmc"></cps:column>
			<cps:column title="巡逻开始日期" field="xlkssj"></cps:column>
			<cps:column title="巡逻结束日期" field="xljssj"></cps:column>
			<cps:column title="巡逻民警" field="xlmj"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="kkxlxxlistCzRowCallback"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkxlxx.js"></script>
	</creator:box>
</creator:view>