<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!-- 从业人员信息 -->
<creator:tbar id="cyry_op">
	<cps:button value="查询从业人人员" onclick="queryCyry()" />
	<c:if test="${!(operType eq 'detail')}">
		<cps:button value="登记从业人员(境内)" type="button" onclick="addCyry('0','09')" />
		<cps:button value="登记从业人员(境外)" type="button" onclick="addCyry('1','09')" />
	</c:if>
</creator:tbar>
<creator:panel id="crry_panel" title="从业人员" tbarId="cyry_op">
	<form id="queryCyryForm">
		<input type="hidden" name="cyrycx.jgbh" value="${jgbh}" />
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
				
				<cps:tdLabel width="12%">是否注销：</cps:tdLabel>
				<cps:tdContent>
				&nbsp;
					<input type="radio" name="cyrycx.zxbs" id="zxbz_y" value="1" onclick="queryCyry()"/>
					<label for="zxbz_y">是</label>
					<input type="radio" name="cyrycx.zxbs" id="zxbz_n" value="0" checked="checked" onclick="queryCyry()"/>
					<label for="zxbz_n">否</label>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
	
	<cps:tableGrid url="${contextPath}/zagl/dw/queryCyryPageResultInfo.action" title="从业人员列表"
			id="cyryList" autoload="true" searchform="queryCyryForm" width="99.5%"
			pageSize="5" usepager="true" mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="cyryCallback"></cps:column>
		<cps:column title="身份证号码" field="sfzh"></cps:column>
		<cps:column title="姓名" field="xm"></cps:column>
		<cps:column title="性别" field="xbmc"></cps:column>
		<cps:column title="所在部门" field="bmmc"></cps:column>
		<cps:column title="职务" field="zwmc"></cps:column>
		<cps:column title="聘用期限" field="pynx"></cps:column>
		<cps:column title="入职时间" field="rzsj"></cps:column>
	</cps:tableGrid>
</creator:panel>
