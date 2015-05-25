<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zdrygl/js/ckyj.js"></creator:Script>
	<creator:tbar id="op">
		<cps:button value="查询" onclick="queryYjxx()"></cps:button>
		<cps:button value="重置" onclick="resetForm('ckyjQueryForm')"></cps:button>
	</creator:tbar>
	<creator:panel id="cxtj" tbarId="op" title="查询条件">
		<form id="ckyjQueryForm">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">预警发布时间：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:date name="query.fbsj"  dateFmt="yyyy-MM-dd"/>
					</cps:tdContent>
					
					<cps:tdLabel width="15%">重点人员姓名：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:textfield name="query.zdryxm"  />
					</cps:tdContent>
					
					<cps:tdLabel width="15%">公民身份证号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="query.sfzh"  />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>重点人员细类：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="query.zdryxl" id="zdryxl" zdlb='GA_ZDRYLBDM' headerValue=" " headerKey="" />
					</cps:tdContent>
					
					<cps:tdLabel>预警级别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="query.yjjb" zdlb = 'ZDRY_YJJB' headerValue=" " headerKey="" />
					</cps:tdContent>
					
					<cps:tdLabel>预警接收单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="query.yjjsdw" id="yjjsdwdm" value="${userOrgCode}" />
						<cps:textfield id="yjjsdwmc" appendPopuBtn="true" value="${userOrgName}" onclick="selectOrg('${userOrgCode}','yjjsdwdm','yjjsdwmc')" readonly="true"/>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<cps:tableGrid url="/zdry/ckyj/queryCkyjxxPageResultInfo.action" title="常控预警信息"
			id="ckyjxxList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" searchform="ckyjQueryForm" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" field="cz" align="left" />
			<cps:column title="重点人员姓名" field="zdryxm" align="left" maxlength="10"></cps:column>
			<cps:column title="公民身份证号码" field="sfzh"></cps:column>
			<cps:column title="重点人员细类" field="zdryxlmc" align="left" maxlength="15"></cps:column>
			<cps:column title="预警级别" field="yjjbmc" expand="false" align="left" ></cps:column>
			<cps:column title="签收时限" field="qssx"></cps:column>
			<cps:column title="活动发生时间" field="hdfssj"></cps:column>
			<cps:column title="详址" field="hdfsddxz" align="left"></cps:column>
		</cps:tableGrid>
</creator:view>