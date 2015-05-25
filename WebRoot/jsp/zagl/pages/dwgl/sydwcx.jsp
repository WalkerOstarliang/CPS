<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<!-- 实有单位查询页面 -->
	<creator:Script src="/jsp/zagl/js/dwcx.js"></creator:Script>
	<creator:Script src="/jsp/zagl/js/sydwcx.js"></creator:Script>
	<creator:tbar id="tbar">
		<cps:button value="查询" type="button" onclick="sydwcx()"></cps:button>
		<cps:button value="新增" id="addButton" onclick="addSydw('${dw.dwjbxx.dzid}')"></cps:button>
	</creator:tbar>
	<creator:panel id="cxtj" title="单位查询" tbarId="tbar">
		<form id="dwcx">
			<input type="hidden" id="fwid" value="${dw.fwBean.fwid}"/>
			<input type="hidden" id="dzid" value="${dw.fwBean.dzid}"/>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">单位名称：</cps:tdLabel>
					<cps:tdContent width="35%">
						<cps:textfield id="dwmc" name="dwcx.dwmc"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="15%">组织机构代码：</cps:tdLabel>
					<cps:tdContent width="35%">
						<cps:textfield id="dwdm" name="dwcx.dwdm" inputType="onlychar"></cps:textfield>
					</cps:tdContent>
				</cps:row>

				<cps:row>
					<cps:tdLabel>法人姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="frdb" name="dwcx.frdb"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>法人身份证：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="frsfzhm" name="dwcx.frsfzhm" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<cps:tableGrid
			url="${contextPath}/zagl/dw/queryDwjbxxPageResultInfoByJgbh.action"
			id="cxjgList" autoload="false"  pageSize="10"
			dblclick="dblclickRowCallback" width="99.8%"
			usepager="true" searchform="dwcx" autothead="true"
			mutilSelect="false">
		<cps:column isCheckbox="true"></cps:column>
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="单位名称" field="dwmc"></cps:column>
		<cps:column title="行业类别" field="hylbmc"></cps:column>
		<cps:column title="营业执照" field="yyzzbh"></cps:column>
		<cps:column title="法人代表" field="frdb"></cps:column>
		<cps:column title="法人身份证" field="frsfzhm"></cps:column>
		<cps:column title="登记人" field="djrxm"></cps:column>
		<cps:column title="登记时间" field="djsj"></cps:column>
		<cps:column title="注销状态" field="zxbsmc"></cps:column>
		<cps:column title="操作" field="cz" rowcallback="sydwRowCallback"></cps:column>
	</cps:tableGrid>

	
</creator:view>

