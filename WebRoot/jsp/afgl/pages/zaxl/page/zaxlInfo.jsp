<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 治安巡逻详细信息 --%>
<creator:view>
	<creator:Script src="/jsp/afgl/pages/zaxl/js/zaxl.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${!(operType eq 'detail')}">
				<cps:button value="保存" onclick="saveZaxlInfo()" display="${displayAddBtn}"></cps:button>
			</c:if>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</cps:tbar>
		<cps:panel title="治安巡逻信息">
			<form id="zaxlForm">
				<input type="hidden" name="zaxl.id" value="${zaxl.id}" id="id" />
				<input type="hidden" name="operType" id="operType" value="${operType}" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><span style="color:red">*</span>巡逻日期：</cps:tdLabel>
						<cps:tdContent width="38%">
							<cps:date name="zaxl.xlsj" value="${zaxl.xlsj}" id="xlsj" required="true" dateFmt="yyyy-MM-dd" maxDate="sysdate" />
						</cps:tdContent>
						<cps:tdLabel width="12%"><span style="color:red">*</span>巡逻社区：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="zaxl.xlsqmc" value="${zaxl.xlsqmc}" id="xlsqmc" required="true" readonly="true" onclick="openSqxxSelectWin()" appendPopuBtn="true"></cps:textfield>
							<input type="hidden" name="zaxl.xlsqdm" value="${zaxl.xlsqdm}" id="xlsqdm" />						
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><span style="color:red">*</span>巡逻路线：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="zaxl.xllx" value="${zaxl.xllx}" id="xlqk" required="true" maxlength="500" cssStyle="width:93%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><span style="color:red">*</span>巡逻情况：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield  name="zaxl.xlqk" value="${zaxl.xlqk}" id="xlqk" required="true" maxlength="500" cssStyle="width:93%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield  name="zaxl.bz" value="${zaxl.bz}" id="bz" maxlength="500" cssStyle="width:93%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<creator:tbar id="xlrytbar">
		<c:if test="${!(operType eq 'detail')}">
			<cps:button value="选择民警" onclick="addZaxlryMjInfo('${loginInfo.orgcode}')" display="${displayAddBtn}"></cps:button>
			<cps:button value="选择巡逻民警" onclick="addZaxlryXlMjInfo()" display="${displayAddBtn}"></cps:button>
			<cps:button value="选择社区干部" onclick="addZaxlrySqgbInfo()" display="${displayAddBtn}"></cps:button>
			<cps:button value="新增" onclick="addZaxlryInfo()" display="${displayAddBtn}"></cps:button>
		</c:if>
	</creator:tbar>		
	<cps:tableGrid url="/afgl/zaxl/queryZaxlryList.action" 
		title="治安巡逻人员列表"
		id="zaxlryList" 
		autoload="true" 
		pageSize="5" 
		width="99.8%" 
		usepager="true" 
		searchform="zaxlForm" 
		autothead="false" 
		mutilSelect="true" 
		tbarId="xlrytbar">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="姓名" field="xldyxm" align="left" width="15%" maxlength="100"></cps:column>
		<cps:column title="身份证号" field="xldysfzh" align="center" width="12%" maxlength="18"></cps:column>
		<cps:column title="联系电话" field="xldylxdh" align="center" width="15%"></cps:column>
		<cps:column title="职务" field="zwms" align="center" maxlength="25"></cps:column>
		<cps:column title="操作" field="cz" align="center" maxlength="25" rowcallback="callBackXldyCz"></cps:column>
	</cps:tableGrid>
	<creator:tbar id="xlpcrytbar">
		<c:if test="${!(operType eq 'detail')}">
			<cps:button value="添加" onclick="addZaxlpcryInfo()" display="${displayAddBtn}"></cps:button>
		</c:if>
	</creator:tbar>		
	<cps:tableGrid url="/afgl/zaxl/queryZaxlpcryList.action" 
		title="治安巡逻盘查人员列表"
		id="zaxlpcryList" 
		autoload="true" 
		pageSize="5" 
		width="99.8%" 
		usepager="true" 
		searchform="zaxlForm" 
		autothead="false" 
		mutilSelect="true" 
		tbarId="xlpcrytbar">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="姓名" field="pcryxm" align="left" width="15%" maxlength="100"></cps:column>
		<cps:column title="身份证号" field="pcrysfzh" align="center" width="12%" maxlength="18"></cps:column>
		<cps:column title="联系电话" field="pcrylxdh" align="center" width="15%"></cps:column>
		<cps:column title="操作" field="cz" align="center" maxlength="25" rowcallback="callBackXldypcryCz"></cps:column>
	</cps:tableGrid>
</creator:view>