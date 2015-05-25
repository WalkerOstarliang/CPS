<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- 工作台 -->
<creator:view>
	
	<script src="${contextPath}/FusionCharts/JSClass/FusionCharts.js" type="text/javascript"></script>
	<script type="text/javascript" src="${contextPath}/jsp/zagl/js/home.js"></script>
	
	<div style="widows: 100%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td width="100%" valign="top" colspan="3">
					<creator:panel id="aqjc" width="100%" expand="true" title="单位安全检查到期提醒">
						<cps:tableGrid url="${contextPath}/zagl/orgmanage/queryOrg.action" 
			    					id="queryResultList" 
			    					autoload="true"
			    					title="" 
									pageSize="20"
									usepager="true"
									height="40%"
									searchform="orgbaseform"
									autothead="true"
									mutilSelect="true">
							<cps:column isNumber="true" title="序号"></cps:column>
							<cps:column isCheckbox="true"></cps:column>
							<cps:column title="单位名称" field="dwmc"></cps:column>
							<cps:column title="单位法人" field="frdb" ></cps:column>
							<cps:column title="单位属性" field="dwsxmc"></cps:column>
							<cps:column title="登记人" field="djrxm"></cps:column>
							<cps:column title="登记日期" field="djsj"></cps:column>
							<cps:column title="操作" field="cz" expand="false"></cps:column>
    					</cps:tableGrid>
					</creator:panel>
				</td>
			</tr>
			<tr style="height: 5px;">
				<td>&nbsp;</td>
				<td style="width: 5px;">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="50%" valign="top">
					<creator:panel id="dwfb" expand="true" width="100%" title="单位分布情况">
						<div style="width: 100%;height: 200px;" id="orgStatistics"></div>
					</creator:panel>
				</td>
				<td style="width: 5px;">&nbsp;</td>
				<td valign="top">
					<creator:panel id="dwlbfb" expand="true" width="100%" title="单位类别分布情况">
						<div style="width: 100%;height: 200px" id="orgTypeStatistics"></div>
		    		</creator:panel>
				</td>
			</tr>
		</table>
	</div>

    	
    	
</creator:view>

