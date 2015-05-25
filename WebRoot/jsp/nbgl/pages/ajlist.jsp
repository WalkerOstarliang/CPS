<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 案件列表 --%>
<creator:view>
	<creator:Script src="/jsp/nbgl/js/ajlist.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryAjlist()"></cps:button>
			<cps:button value="重置" onclick=""></cps:button>
			<cps:button value="导出" onclick="expAjlist()"></cps:button>
		</cps:tbar>
		<cps:panel title="查询条件">
			<form id='searchForm' target="expIframe">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="11%">案件编号：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield name="query.ajbh"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="14%">匹配关键词：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield name="query.gjc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="11%">立案日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="query.larq_s" dateFmt="yyyyMMdd" cssStyle="width:40%"></cps:date>&nbsp;至
							<cps:date name="query.larq_e" dateFmt="yyyyMMdd" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>案件类别：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="ajlb" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" name="query.ajlx" cssClass="cps-select" ></s:select>
						</cps:tdContent>
						
						<cps:tdLabel>是否重点单位发案：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'1':'是','0':'否'}" headerKey="" headerValue="--请选择--" name="query.sfzddwfa" cssClass="cps-select"></s:select>
						</cps:tdContent>
						
						<cps:tdLabel>是否核实：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'0':'否','1':'是'}"  headerKey="" headerValue="--请选择--" name="query.sfhs" cssClass="cps-select"></s:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>立案单位：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<input type="hidden" id="ladwdm" name="query.ladw" />
							<cps:textfield id="ladwmc" onclick="orgSelect('${loginInfo.rootOrgCode}')" appendPopuBtn="true" ></cps:textfield>
							<cps:button value="清除" onclick="clearLadw()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<cps:tableGrid url="/nbgl/ajhs/queryAjList.action" 
				title="案件列表"
				id="gjclist" 
				autoload="false" 
				pageSize="10" 
				width="99.8%" 
				usepager="true" 
				searchform="searchForm" 
				autothead="false" 
				mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz" align="left"></cps:column>
		<cps:column title="案件编号" field="ajbh" align="left"></cps:column>
		<cps:column title="案件名称" field="ajmc" align="left"></cps:column>
		<cps:column title="案件类型" field="ajlx" align="left"></cps:column>
		<cps:column title="立案日期" field="larq" align="center"></cps:column>
		<cps:column title="关键词" field="gjc" align="left"></cps:column>
		<cps:column title="是否核实" field="sfhs_ms" align="left"></cps:column>
		<cps:column title="是否重点单位发案" field="sfzddwfams" align="left"></cps:column>
	</cps:tableGrid>
	
	<iframe style="display: none;" name="expIframe" id="expIframe" src="" />
</creator:view>