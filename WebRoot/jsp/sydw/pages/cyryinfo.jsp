<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="公共场所信息">
<creator:Script src="/jsp/sydw/js/cyryinfo.js"></creator:Script>
<creator:tbar id="cyry_op">
	<cps:button value="查询" onclick="queryCyry()" />
	<cps:button value="境内从业人员登记" type="button" onclick="addCyry('0')" display="${operType!='detail'}"/>
	<cps:button value="境外从业人员登记" type="button" onclick="addCyry('1')" display="${operType!='detail'}"/>
	<cps:button value="关闭" type="button" onclick="window.close();" />
</creator:tbar>
<creator:panel id="crry_panel" title="从业人员" tbarId="cyry_op">
	<form id="queryCyryForm">
		<input type="hidden" id="jgbh" name="cyrycx.jgbh" value="${dwBean.dwjbxx.jgbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">身份证号码：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:textfield name="cyrycx.sfzh" id="querySfz"/>
				</cps:tdContent>
				<cps:tdLabel width="10%">姓名：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:textfield name="cyrycx.xm" />
				</cps:tdContent>
				
				<cps:tdLabel width="12%">注销标示：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="zxbz" list="#{'0':'正常','1','已注销'}" name="cyrycx.zxbs" onclick="queryCyry()" cssClass="cps-select"></s:select>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
	<cps:tableGrid url="/zagl/dw/queryCyryPageResultInfo.action" title="从业人员列表"
			id="cyryList" autoload="true" searchform="queryCyryForm" width="99.5%"
			pageSize="15" usepager="true" mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="cyryCallback"></cps:column>
		<cps:column title="证件类型" field="zjzlmc"></cps:column>
		<cps:column title="证件号码" field="zjhm"></cps:column>
		<cps:column title="姓名" field="xm"></cps:column>
		<cps:column title="性别" field="xbmc"></cps:column>
		<cps:column title="所在部门" field="bmmc"></cps:column>
		<cps:column title="职务" field="zwmc"></cps:column>
		<cps:column title="聘用期限" field="pynx"></cps:column>
		<cps:column title="入职时间" field="rzsj"></cps:column>
	</cps:tableGrid>
</creator:panel>
</creator:view>