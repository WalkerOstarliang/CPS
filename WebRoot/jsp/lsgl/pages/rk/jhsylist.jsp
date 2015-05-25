<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:box>
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<form id="queryForm">
		<creator:tbar id="jhsytooltbar">
			<cps:button value="查询" onclick="queryjhsyList();"></cps:button>
			<cps:button value="重置" onclick="reset()"></cps:button>
		</creator:tbar>
		<creator:panel id="jhsyxxquerypanel" title="计划生育信息查询" tbarId="jhsytooltbar">
			<cps:table>
				<input type="hidden" name="queryBean.leve" value="${loginInfo.leve}">
				<input type="hidden" name="queryBean.orgcode" value="${loginInfo.orgcode}">
				<cps:row>
					<cps:tdLabel  width="9%">市局：</cps:tdLabel>
					<cps:tdContent  width="25%">
							<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
					<cps:tdContent  width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
							</c:when>
							<c:otherwise>
									<s:hidden name="queryBean.pcsdm"></s:hidden>
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >身份证号码：</cps:tdLabel>
					<cps:tdContent >
						 <cps:textfield id="sfzh" name="queryBean.sfzh"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >计生证号码：</cps:tdLabel>
					<cps:tdContent >
						 <cps:textfield id="jszhm" name="queryBean.jszhm"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >登记时间：</cps:tdLabel>
					<cps:tdContent >
						<cps:date id="djsj_start" cssStyle="width:40%" name="queryBean.djsj_start" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>-
						<cps:date id="djsj_end"   cssStyle="width:40%" name="queryBean.djsj_end" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}" minDateDepend="djsj_start"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>性别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_XB" id="xb" name="queryBean.xb" value="${queryBean.xb}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel >出生日期：
					</cps:tdLabel>
					<cps:tdContent id="birthContent">
						<cps:date id="csrq_start" cssStyle="width:40%" name="queryBean.csrq_start" dateFmt="yyyy-MM-dd"  maxDate="${currentSystemDate}"></cps:date>-
						<cps:date id="csrq_end"   cssStyle="width:40%" name="queryBean.csrq_end" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"  minDateDepend="csrq_start"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>发证日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="fzrq_start" cssStyle="width:40%" name="queryBean.fzrq_start" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>-
						<cps:date id="fzrq_end"   cssStyle="width:40%" name="queryBean.fzrq_end" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"  minDateDepend="fzrq_start"></cps:date>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
		</form>
				<cps:tableGrid id="jhsytablegrid"  
					title="计划生育信息列表"
					url="/lsgl/rk/queryJhsyListInfoPage.action" 
					searchform="queryForm"
					mutilSelect="true"
					autoload="true"
					width="99.8%">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="cz" title="操作"></cps:column>
				<cps:column field="xm" title="姓名"></cps:column>
				<cps:column field="sfzh" title="身份证号码"></cps:column>
				<cps:column field="xbms" title="性别"></cps:column>
				<cps:column field="xzzxz" title="人员现住地详址" maxlength="10"></cps:column>
				<cps:column field="jszhm" title="计生证号码" ></cps:column>
				<cps:column field="fzrq" title="发证日期"></cps:column>
				<cps:column field="djsj" title="登记时间"></cps:column>
			</cps:tableGrid>
		
		
	</creator:box>
</creator:view>