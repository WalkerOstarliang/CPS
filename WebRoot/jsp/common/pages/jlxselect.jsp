<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script  src="/jsp/common/js/jlxselect.js"></creator:Script>
<form id="jlxSelectForm" method="post" >
	<creator:tbar id="condition">
		<cps:button value="查询" onclick="queryList();"></cps:button>	
		<cps:button value="重置" onclick="jlxSelectForm.reset();"></cps:button>	
		<cps:button value="新增" onclick="openJlxWin('add','');"></cps:button>
	</creator:tbar>
	<creator:panel id="panel" tbarId="condition" title="街路巷查询条件">
		<cps:table>
			<cps:row id="clear_row">
				<cps:tdLabel width="13%">名称：</cps:tdLabel>
				<cps:tdContent width="30%" >
					<cps:textfield id="mc" name="jlxBean.mc"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel width="13%" >所属行政区划：</cps:tdLabel>
				<cps:tdContent>
					<s:hidden id="ssxzqh" name="jlxBean.ssxzqh" ></s:hidden>
					<cps:textfield id="ssxzqhmc" name="jlxBean.ssxzqhmc" appendPopuBtn="true" onclick="selectXzqh('ssxzqh','ssxzqhmc','${currentXzqh}00');" cssStyle="width:95%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</form>	
<cps:tableGrid id="commonDzjlxList"  
			   url="/cps/dzjlx/queryCommonDzJlx.action"
			   autoload="true"
			   width="99.6%"
			   dblclick="rowdblClickReturn"
			   searchform="jlxSelectForm"
			   mutilSelect="false"
			   title="街路巷选择列表">
	<cps:column isNumber="true" title="序号" ></cps:column>	
	<cps:column field="cz" title="操作" ></cps:column>
	<cps:column field="dm" title="代码" ></cps:column>
	<cps:column field="mc" title="全称" align="left" maxlength="15"></cps:column>
	<cps:column field="jc" title="简称" align="left" maxlength="15"></cps:column>
	<cps:column field="ssxzqhmc" title="行政区划" ></cps:column>
	<cps:column field="sfmzmmms" title="是否民政命名" ></cps:column>		
	<cps:column field="djsj" title="登记时间" ></cps:column>	
</cps:tableGrid>
</creator:view>

