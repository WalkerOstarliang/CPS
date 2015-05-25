<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员查询">
	<!-- 从业人员信息 -->
	<creator:box>
		<creator:Script src="/jsp/zagl/js/cyry.js"></creator:Script>
		<form id="queryCyryForm">
			<creator:tbar id="cyryquerytbar">
				<cps:button id="cyryQueryButton" value="查询" onclick="queryCyry()"/>
				<cps:button value="重置" type="reset"></cps:button>
			</creator:tbar>
			<creator:panel id="search" title="从业人员查询" tbarId="cyryquerytbar">
				<input type="hidden" name="cyrycx.pcsdm" value="${loginInfo.pcsdm}" /> 
				<cps:table>
					<cps:row>
						<cps:tdLabel>证件类型：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zjzl" name="cyrycx.zjzl" zdlb="GB_ZJZL" ></cps:select>
						</cps:tdContent>
						<cps:tdLabel>证件号码：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="cyrycx.zjhm"/>
						</cps:tdContent>
						<cps:tdLabel width="15%">单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="cyrycx.jgmc" />
						</cps:tdContent>
					</cps:row>					
					<cps:row>
						<cps:tdLabel width="10%">中文姓名：</cps:tdLabel>
						<cps:tdContent width="15%">
							<cps:textfield name="cyrycx.xm" />
						</cps:tdContent>
						<cps:tdLabel width="10%">英文姓：</cps:tdLabel>
						<cps:tdContent width="15%">
							<cps:textfield name="cyrycx.ywx" />
						</cps:tdContent>
						<cps:tdLabel width="10%">英文名：</cps:tdLabel>
						<cps:tdContent width="15%">
							<cps:textfield name="cyrycx.ywm" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>登记时间</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="cyrycx.djsj_start" dateFmt="yyyy-MM-dd" cssStyle="width:40%" value="${cyrycx.djsj_start}"/> 
							至 
							<cps:date name="cyrycx.djsj_end" dateFmt="yyyy-MM-dd" cssStyle="width:40%" value="${cyrycx.djsj_end}"/>
						</cps:tdContent>
						<cps:tdContent colspan="4">&nbsp;</cps:tdContent>
					</cps:row>
				</cps:table>
			</creator:panel>
		</form>
		<cps:tableGrid id="cyryList" title="从业人员列表"
				url="/zagl/dw/queryCyryPfList.action"
				autoload="false"
				isAsynch="true"
				width="99.8%"
				searchform="queryCyryForm"
				pageSize="10" 
				usepager="true" mutilSelect="false"
				autothead="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column title="操作" field="cz" align="left"></cps:column>
			<cps:column title="国籍" field="gjms"></cps:column>
			<cps:column title="证件类型" field="zjzlms"></cps:column>
			<cps:column title="证件号码" field="zjhm"></cps:column>
			<cps:column title="姓名" field="xmms" align="left"></cps:column>
			<cps:column title="性别" field="xbmc" align="left"></cps:column>
			<cps:column title="工作单位" field="dwmc" align="left" maxlength="10"></cps:column>
			<cps:column title="登记时间" field="djsj" maxlength="8"></cps:column>
			<cps:column title="登记单位" field="djdwmc" maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>