<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script  src="/jsp/common/js/dictionaryselect.js"></creator:Script>
	<creator:tbar id="condition">
		<cps:button   value="查询" onclick="queryList();"></cps:button>	
		<cps:button   value="选择" onclick="dictionarycheck();"></cps:button>
		<c:if test="${bean.zdlb!='ZDY_AJLB'}">	
			<cps:button   value="添加" onclick="saveZdyDictionary();"></cps:button>
		</c:if>
	</creator:tbar>
	<creator:panel id="panel" tbarId="condition"  title="名称列表">
	<form id="dictionarySelectForm" method="post" >
		<cps:table>
			<cps:row id="clear_row">
				<cps:tdLabel width="12%">名称：</cps:tdLabel>
				<cps:tdContent  width="25%">
					<cps:textfield id="mc" name="bean.mc" ></cps:textfield>
				</cps:tdContent>
			
			<cps:tdLabel  width="12%" >选择类别：</cps:tdLabel>
			<cps:tdContent  width="25%">
			<select id="select"  name="bean.zdlb"  onchange="queryList()" style="width:70%;height:25px" >
					<c:if test="${bean.zdlb=='ZATZ_XZWP'}">
						<option  value="${bean.zdlb }">选择物品</option>
					</c:if>
					<c:if test="${bean.zdlb=='GA_ZASD'}">
						<option  value="${bean.zdlb }">作案手段</option>
					</c:if>
					<c:if test="${bean.zdlb=='ZDY_ZAGJ'}">
						<option  value="${bean.zdlb }">作案工具</option>
					</c:if>
					<c:if test="${bean.zdlb=='GA_XZDX'}">
						<option  value="${bean.zdlb }">选择对象</option>
					</c:if>
					<c:if test="${bean.zdlb=='GA_XZFS'}">
						<option  value="${bean.zdlb }">销赃方式</option>
					</c:if>
					<c:if test="${bean.zdlb=='GA_ZATD'}">
						<option  value="${bean.zdlb }">作案特点</option>
					</c:if>
					<c:if test="${bean.zdlb=='ZDY_XZSJ'}">
						<option  value="${bean.zdlb }">选择时机</option>
					</c:if>
					<c:if test="${bean.zdlb=='GA_XZCS'}">
						<option  value="${bean.zdlb }">选择处所</option>
					</c:if>
					<c:if test="${bean.zdlb=='ZDY_AJLB'}">
						<option  value="${bean.zdlb }">案件类别</option>
					</c:if>
					<c:if test="${bean.zdlb=='ZDY_WTXZ'}">
						<option  value="${bean.zdlb }">问题性质</option>
					</c:if>
				</select>
			</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>	
		<cps:tableGrid id="dictionarySelectList"  
					   url="/dic/selectdic/queryDictionaryBeanByZdlb.action"
					   autoload="true"
					   width="98%"
					   searchform="dictionarySelectForm"
						mutilSelect="${selectFlag}"		   
						>
			<cps:column isCheckbox="true" ></cps:column>
			<cps:column isNumber="true" title="序号" ></cps:column>	
			<cps:column field="mc" title="名称" align="left"></cps:column>
			
		</cps:tableGrid>
	</creator:panel>
</creator:view>

