<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<script type="text/javascript">
	<!--
	function querytable() {
		$("#zdryInfo").query("F", "searchform");
	}
	//-->
	</script>
<creator:box>
	<creator:panel id="lgsq" title="采集列管 >>> 犯罪人员认领">
		<form id="searchform">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市/州：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select list="cityXzqhList" id="citydm" name="crime.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectCountry(this.value,'countrydmselect')"></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">县/区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select  list="countryXzqhList" id="countrydmselect" name="crime.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectPcs(this.value,'pcsdmselect')"></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="pcsOrgList" id="pcsdmselect"  name="crime.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="jxQueryXldxx()"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">姓名：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="xm" name="crime.xm" value="${crime.xm}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">身份证号码：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="sfzh" name="crime.sfzh" value="${crime.sfzh}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">案件名称：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="ajmc" name="crime.ajmc" value="${crime.ajmc}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">性别：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select id="xb" name="crime.xb" zdlb="GB_XB" cssClass="cps-input" value="${crime.xb}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">决定时间：</cps:tdLabel>
					<cps:tdContent width="20%" align="left">
						<cps:date id="startJdsj" name="crime.startJdsj" dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:96px;"></cps:date> --
						<cps:date id="endJdsj" name="crime.endJdsj" dateFmt="yyyy-MM-dd" cssClass="cps-input"  cssStyle="width:97px;"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="10%">决定结果：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select id="jdjg" name="crime.jdjgdm" zdlb="ZDRY_JDJG" cssClass="cps-input" value="${crime.jdjg}" headerKey="" headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6" align="center">
						 <cps:button value="查&nbsp;询" onclick="querytable();"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
			
		</form>
		
		</creator:panel>
		  <cps:tableGrid id="zdryInfo" 
					pageSize="15"
					usepager="true"
					searchform="searchform"
					autothead="true"
					url="/zdry/crime_queryCrimePersonnel.action" 
					mutilSelect="false"
					autoload="true"
					>
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="姓名" field="xm" ></cps:column>
			<cps:column title="性别" field="xb"></cps:column>
			<cps:column title="身份证号" field="sfzh" ></cps:column>
			<cps:column title="案件名称" field="ajmc"></cps:column>
			<cps:column title="所属派出所" field="sspcsmc"></cps:column>
			<cps:column title="决定时间" field="jdsj"></cps:column>
			<cps:column title="决定结果" field="jdjg"></cps:column>
			<cps:column title="是否提取" field="isrl" rowcallback="fzryIsrl"></cps:column>
			<cps:column title="操作" field="cz"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
