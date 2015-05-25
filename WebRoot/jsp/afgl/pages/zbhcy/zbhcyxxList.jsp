<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
		<creator:tbar id="tbar">
			<cps:button value="查&nbsp;询" onclick="queryZbhcyxx()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="openAddZbhcyxx()"></cps:button>
			<%--<cps:button value="批量撤销" onclick="toBatchDeleteZbhcyxx()"></cps:button>--%>
		</creator:tbar>
		<creator:panel id="afglzbhcyxxdj" title="治保会成员管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select id="citygajgjgdm" list="cityGajgjgList"  name="zbhcyxxQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryZbhcyxx)"></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="zbhcyxxQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryZbhcyxx)"></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select id="pcsdm" list="pcsGajgjgList"  name="zbhcyxxQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryZbhcyxx()"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
						<cps:tdLabel width="13%">治保会名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="zbhbh" name="zbhcyxxQuery.zbhbh" />
							<cps:textfield id="zbhmc" name="zbhcyxxQuery.zbhmc" 
								 ondblclick="selectZbhxx()"></cps:textfield>
							<cps:button value="选择" onclick="selectZbhxx()"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="12%">姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xm" name="zbhcyxxQuery.xm"
								></cps:textfield>
						</cps:tdContent>
							<cps:tdLabel width="12%">身份证号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="sfzh" name="zbhcyxxQuery.sfzh" >
							</cps:textfield>
						</cps:tdContent>
						</cps:row>
					
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="zbhcyxxList" pageSize="20" usepager="true" 
			searchform="searchform" autothead="false" url="/zbhcyxx/zbhcyxxList.action"
			mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="姓名" field="xm"></cps:column>
			<cps:column title="性别" field="xbmc"></cps:column>
			<cps:column title="身份证号" field="sfzh"></cps:column>
			<cps:column title="治保会" field="zbhmc"></cps:column>
			<cps:column title="参加日期" field="cjrq"></cps:column>
			<cps:column title="退出标识" field="tcbsmc"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="zbhcyxxlistCzRowCallback"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/zbhcyxx.js"></script>
	</creator:box>
</creator:view>