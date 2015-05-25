<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="queryDxhd()"></cps:button>
			<cps:button value="重置" type="reset"></cps:button>
			
			<cps:button value="新增" onclick="openAddDxhd()" display="${displayAddBtn}"></cps:button>
			<cps:button value="批量删除" onclick="batchDeleteDxhdByHdbh()" display="${displayAddBtn}"></cps:button>
			<%--<cps:button value="关闭" onclick="window.close()"></cps:button>--%>
		</creator:tbar>

		<creator:panel id="zagldxhd" title="治安大型活动" tbarId="op">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel>市局：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="dxhdQuery.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dxhdQuery.citygajgjgdm" value="${dxhdQuery.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="dxhdQuery.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>县区局：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										name="dxhdQuery.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dxhdQuery.countrygajgjgdm" value="${dxhdQuery.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="dxhdQuery.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"
										name="dxhdQuery.pcsdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dxhdQuery.pcsdm" value="${dxhdQuery.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList"
										name="dxhdQuery.pcsdm" disabled="true" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>

						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">活动名称：</cps:tdLabel>
						<cps:tdContent width="23%">
							<cps:textfield id="hdmc" name="dxhdQuery.hdmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="8%">活动性质：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="hdxz" name="dxhdQuery.hdxz" zdlb="HD_HDXZ"
								headerKey="" headerValue="---选择--">
							</cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">主办单位：</cps:tdLabel>
						<cps:tdContent width="23%">
							<cps:textfield id="zbdw" name="dxhdQuery.zbdw"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">承办单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="cbdw" name="dxhdQuery.cbdw"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">举办时间：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:date id="jbqssj" name="dxhdQuery.jbqssj"
								cssStyle="width:30%;" dateFmt="yyyy-MM-dd HH:mm:ss" 
								maxDate="jbjzsj">
							</cps:date>
							至
							<cps:date id="jbjzsj" name="dxhdQuery.jbjzsj"
								cssStyle="width:30%;" dateFmt="yyyy-MM-dd HH:mm:ss"
								minDate="jbqssj">
							</cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="dxhdList" title="大型活动列表"
			pageSize="10" usepager="true"
			width="99.8%" searchform="searchform" autothead="false"
			url="/dxhd/dxhdList.action" mutilSelect="true" autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="操作" field="cz" align="left"></cps:column>
			<cps:column title="活动名称" field="hdmc" align="left"></cps:column>
			<cps:column title="活动性质" field="hdxzmc" align="left"></cps:column>
			<cps:column title="主办单位" field="zbdw" align="left"></cps:column>
			<cps:column title="承办单位" field="cbdw" align="left"></cps:column>
			<cps:column title="举办时间" field="jbqssj"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript"
			src="${contextPath}/jsp/zagl/js/dxhd.js">
</script>
	</creator:box>
</creator:view>