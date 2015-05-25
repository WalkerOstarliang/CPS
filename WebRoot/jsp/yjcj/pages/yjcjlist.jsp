<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/yjcj/js/yjcj.js"></creator:Script>
	
	<form id="queryForm">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="queryList();"></cps:button>
				<cps:button value="新增" onclick="toAddWtxxPage()"></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="问题查询">
				<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">问题标题：</cps:tdLabel>
					<cps:tdContent width="15%">
						<cps:textfield  name="queryBean.title" value="${queryBean.title}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记起始时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						 <cps:date id="djsjstart" name="queryBean.djsjstart" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记结束时间：</cps:tdLabel>
					<cps:tdContent width="15%">
						 <cps:date id="djsjend" name="queryBean.djsjend" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="10%">是否反馈：</cps:tdLabel>
					<cps:tdContent width="15%">
						<s:select list="#{'1':'是','0':'否'}" id="sffk" name="queryBean.sffk" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
					</cps:tdContent>
				</cps:row>
			</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
	
	<cps:tableGrid id="yjcjtablegrid"
			url="/yjcj/queryYjcjPageResult.action" 
			searchform="queryForm"
			mutilSelect="false"
			pageSize="20"
			autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="title" title="标题" maxlength="20"></cps:column>
		<cps:column field="djrxm" title="登记人"></cps:column>
		<cps:column field="djdwmc" title="登记单位" maxlength="15"></cps:column>
		<cps:column field="djsj" title="登记时间" ></cps:column>
		<cps:column field="sffk" title="是否反馈" rowcallback="sffkrowcallback"></cps:column>
		<cps:column title="操作"  rowcallback="czrowcallback" align="left"></cps:column>
	</cps:tableGrid>
</creator:view>