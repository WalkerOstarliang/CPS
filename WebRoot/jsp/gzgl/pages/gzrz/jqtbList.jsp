<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/gzgl/js/jqtb.js"></creator:Script>
	<creator:box>
		<creator:tbar id="rztbar">
			<cps:button value="查&nbsp;询" onclick="queryData();"></cps:button>&nbsp;
			<cps:button value="导出打印" onclick="exportJqtbWord()"></cps:button>
		</creator:tbar>
		<creator:panel id="rizhiPanel" title="警情通报" tbarId="rztbar">
			<form id="searchform">
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="20%">
							<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
						<cps:row>
						
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%;">月份</cps:tdLabel>
						<cps:tdContent width="25%;">
							<cps:date id="month" name="queryBean.month" dateFmt="yyyyMM" maxDate="$"></cps:date>
						</cps:tdContent>
						<cps:tdLabel width="10%;">&nbsp;</cps:tdLabel>
						<cps:tdContent width="25%;">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent width="10%;" colspan="6">
							 <font color="red">
							 	注意：警情通报不能新增，系统每个月会根据执法办案系统的发案情况进行统计每个月每个单位会自动生成一条警情，民警可能找到自己的单位进行修改，填写典型案例以及防范提示。
							 	<br/>
							 	完善警情同步信息请点击修改操作，然后填写完善信息后点击保存按钮后，关闭窗口后重新查询列表，既可以导出打印。
							 </font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid url="/gzgl/rzgl/queryJqtbBeanPageInfo.action" title="警情通报登记列表"
					   id="datagridList"
					   width="99.8%"
					   searchform="searchform"
					   autoload="false" 
					   mutilSelect="false" >
			<cps:column isNumber="true" title="序号" ></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="cz" title="操作" align="left" ></cps:column>
			<cps:column field="zrdwmc" title="所属单位" align="left" maxlength="15"></cps:column>
			<cps:column field="ny" title="年月"></cps:column>
			<cps:column field="xsaj" title="刑事案件" ></cps:column>
			<cps:column field="zaaj" title="治安案件" ></cps:column>
			<cps:column field="tcjf" title="调处纠纷"></cps:column>
			<cps:column field="zhsg" title="灾害事故" ></cps:column>
			<cps:column field="qjqdaj" title="抢劫、抢夺案件"></cps:column>
			<cps:column field="rsdqaj" title="入室盗窃案件"></cps:column>
			<cps:column field="dqjdclaj" title="盗窃机动车辆案件"></cps:column>
			<cps:column field="qtaj" title="其他案件"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
