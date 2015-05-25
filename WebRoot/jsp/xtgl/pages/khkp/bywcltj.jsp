<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%-- 
				本月未处理数据统计表
--%>
<creator:view>
	<creator:Script src="/jsp/xtgl/js/bywcl.js"></creator:Script>
	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="query()"></cps:button>
			<cps:button value="重置" onclick="resetForm()"></cps:button>
			<cps:button value="导出" onclick="downloadExcel()"></cps:button>
		</creator:tbar>
		
		<creator:panel id="bywcl_panel" title="当前待处理查询" tbarId="op">
			<form id="bywcl_form" method="post" target="hiddeniframe">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">统计单位:</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="query.khdwdm" id="khdwdm" value="${loginInfo.orgcode}" />
							<cps:textfield id="khdwmc" onclick="selectOrg('${loginInfo.rootOrgCode}', 'khdwdm', 'khdwmc')" value="${loginInfo.orgname}" appendPopuBtn="true"/>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">统计级别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<s:select list="#{'2':'市局','3':'分县局','4':'派出所','5':'警务区'}" cssClass="cps-select" name="query.tjjb" value="5" onchange="tjjbChange(this.value)"></s:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="4">
							<b>
								<font color="red">说明：当前待处理统计数据是指当前需要及时处理的提醒任务.</font>
							</b>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid url="/xtgl/khkp/queryBywcltj.action" title="当前待处理统计表"
						id="bywclList" autoload="false" pageSize="10" width="99.8%"
						usepager="true" searchform="bywcl_form" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="单位名称" field="orgname" align="left"></cps:column>
			<cps:column title="流动人口延期" field="ldrkyq" maxlength="10"></cps:column>
			<cps:column title="从业人员反馈或登记" field="cyryhs"></cps:column>
			<cps:column title="从业人员派发" field="cyrypf" ></cps:column>
			<cps:column title="重点人员接管" field="zdrytg"></cps:column>
			<cps:column title="重点人员在控登记" field="zdryzkdj" ></cps:column>
			<cps:column title="出租屋巡查" field="czwxc"  ></cps:column>
			<cps:column title="出租房登记" field="czfdj"></cps:column>
			<cps:column title="实体未标注" field="stxxbz" ></cps:column>
		</cps:tableGrid>
		<iframe name="hiddeniframe" src="" height="0" width="0"></iframe>
	</creator:box>
</creator:view>	