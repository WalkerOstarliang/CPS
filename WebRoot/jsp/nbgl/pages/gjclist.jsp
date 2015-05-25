<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 内保管理关键词 --%>
<creator:view>
	<creator:Script src="/jsp/nbgl/js/gjc.js"></creator:Script>	
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="新增 " onclick="addGjc()"></cps:button>
			<cps:button value="查询 " onclick="queryGjc()"></cps:button>
			<cps:button value="重置" onclick="resetForm()"></cps:button>
		</cps:tbar>
		<cps:panel title="查询条件">
			<form id="searchForm">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="30%">关键词：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.gjc" value="${query.gjc}" id="query_gjc" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<cps:tableGrid url="/nbgl/gjc/queryGjcList.action" 
						title="关键词列表"
						id="gjclist" 
						autoload="true" 
						pageSize="10" 
						width="99.8%" 
						usepager="true" 
						searchform="searchForm" 
						autothead="false" 
						mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" align="left" rowcallback="showOp" width="10%"></cps:column>
		<cps:column title="关键词" field="gjc" align="left" width="30%"></cps:column>
		<cps:column title="创建人" field="cjr" align="left"></cps:column>
		<cps:column title="创建时间" field="cjsj" align="center"></cps:column>
	</cps:tableGrid>
	
	<div id="gjcEdit" style="display:none;width:400px;">
		<form id="editForm">
			<s:hidden name="gjc.id" id="gjcid"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="30%"><font color="red">*</font>关键词：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="gjc.gjc" id="gjc" maxlength="100" required="true"></cps:textfield>
						<s:hidden name="gjc.gjc_old" id="gjc_old"></s:hidden>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="2" cssStyle="text-align:center">
						<cps:button value="保存" onclick="saveGjc()"></cps:button>
						<cps:button value="取消" onclick="closeGjcEdit()"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</div>
</creator:view>