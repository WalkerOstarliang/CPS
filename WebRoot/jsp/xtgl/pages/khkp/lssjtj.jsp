<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/xtgl/js/lssjtj.js"></creator:Script>
	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="queryLssjtj()"></cps:button>
			<cps:button value="重置" onclick="resetForm()"></cps:button>
		</creator:tbar>

		<creator:panel id="khkp_panel" title="两实数据统计" tbarId="op">
			<form id="lssjtj_from" method="post" target="hiddeniframe">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">统计类型：</cps:tdLabel>
						<cps:tdContent width="40%">
							<cps:select name="query.tjlx" zdlb="ZDY_LSTJLB"></cps:select>
						</cps:tdContent>

						<cps:tdLabel width="13%">统计时间：</cps:tdLabel>
						<cps:tdContent width="40%">
							<cps:date name="query.tjsj_start" id="tjsj_start" dateFmt="yyyy-MM-dd" cssStyle="width:40%;" />
							&nbsp;至&nbsp;
							<cps:date name="query.tjsj_end" id="tjsj_end" dateFmt="yyyy-MM-dd" cssStyle="width:40%;" />
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel>统计级别：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'3':'分县局','4':'派出所','5':'警务区'}"
								cssClass="cps-select" name="query.tjjb" value="5"></s:select>
						</cps:tdContent>

						<cps:tdLabel>统计单位:</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="query.tjdwdm" id="tjdwdm" value="${loginInfo.orgcode}" />
							<input type="hidden" name="query.tjdwjb" id="tjdwjb" value="${loginInfo.leve}" />	
							<cps:textfield id="tjdwmc" cssStyle="width:87%" onclick="selectOrg('${loginInfo.rootOrgCode}', 'tjdwdm', 'tjdwmc','tjdwjb')" value="${loginInfo.orgname}" appendPopuBtn="true" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="lssjtjList" url="/khkp/lssjtj/queryResult.action"
			autoload="false" pageSize="15" width="99.8%" title="统计结果"
			usepager="true" searchform="lssjtj_from" autothead="false"
			mutilSelect="true">
			<cps:column title="单位" field="orgname" align="left" width="50%"></cps:column>
			<cps:column title="数量" field="sl"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
