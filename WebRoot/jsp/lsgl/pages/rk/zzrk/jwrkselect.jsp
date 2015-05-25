<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="实有人口查询">
	<creator:Script src="/jsp/lsgl/js/syrkselect.js"></creator:Script>
	<form id="queryForm">
		<input type="hidden" id="czselect" value="false">
		<creator:tbar id="syrktbar">
			<cps:button value="查询" onclick="queryTableGrid()"></cps:button>
			<cps:button value="新增" onclick="openNewRkInfoPage()"></cps:button>
			<cps:button value="修改" onclick="openUpdateRkInfoPage()"></cps:button>
		</creator:tbar>
		 <creator:panel id="syrkselectpanel" title="境外人口查询" width="99.8%" tbarId="syrktbar">
		 	<cps:table>
		 		<cps:row id="rylb_jwrk" cssStyle="display:none">
		 			<cps:tdLabel width="10%">国籍：</cps:tdLabel>
		 			<cps:tdContent width="25%">
		 				<cps:select zdlb="GB_GJ" id="gj" name="queryBean.gj" headerKey="" headerValue="--请选择--" required="true"></cps:select>
		 			</cps:tdContent>
		 			<cps:tdLabel width="10%">证件类型：</cps:tdLabel>
		 			<cps:tdContent width="25%">
		 				<cps:select zdlb="GB_ZJZL" id="zjzl" name="queryBean.zjzl" headerKey="" headerValue="--请选择--" required="true"></cps:select>
		 			</cps:tdContent>
		 			<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
		 			<cps:tdContent>
		 				<cps:textfield id="zjhm" name="queryBean.zjhm" required="true"></cps:textfield>
		 			</cps:tdContent>
		 		</cps:row>
		 	</cps:table>
		 </creator:panel>
	 </form>
	<div id="jwrkdiv" style="display: none">
		<cps:tableGrid id="jwrktablegrid"
						url="/lsgl/rk/queryRkJbxxBySfzh.action"
						searchform="queryForm"
						mutilSelect="false"
						usepager="false"
						autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="xm" title="中文名"></cps:column>
			<cps:column field="ywm" title="英文名"></cps:column>
			<cps:column field="zjzlms" title="证件类型" ></cps:column>
			<cps:column field="zjhm" title="证件号码" ></cps:column>
			<cps:column field="xbms" title="性别" ></cps:column>
			<cps:column field="zjyxq" title="证件有效期" ></cps:column>
		</cps:tableGrid>
	</div>
	<div id="rkjbxxdiv" style="display: none;">
		<%@include file="/jsp/lsgl/pages/rk/rkjbxx.jsp" %>
	</div>
</creator:view>
