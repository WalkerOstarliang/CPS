<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 单位签收/派发列表 --%>
<creator:view>
	<creator:Script src="/jsp/dwdj/js/dwoplist.js"></creator:Script>
	
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryDwOpList()"></cps:button>
			<cps:button value="重置" onclick="resetQueryForm()"></cps:button>
			<c:if test="${loginInfo.leve < 4}">
				<cps:button value="新增危爆单位" onclick="addDwOpPage()"></cps:button>
			</c:if>
		</cps:tbar>
		<cps:panel title="查询条件">
			<form id="queryForm">
				<input type="hidden" name="query.glbm" value="${query.glbm}" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%">单位名称：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="query.dwmc" id="dwmc" cssStyle="width:94%" />
						</cps:tdContent>
						
						<cps:tdLabel width="15%">单位类别：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:select name="query.hylb" headerKey="" headerValue=" " zdlb="ZDY_HYLB" parentDm="${query.glbm}"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">锁定状态：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'0':'正常','1':'已锁定'}" name="query.sdzt" headerKey="" headerValue=" " cssClass="cps-select" />
						</cps:tdContent>
						
						<cps:tdLabel width="15%">签收状态：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'0':'未签收','1':'已签收'}" name="query.qszt" headerKey="" headerValue=" " cssClass="cps-select" />
						</cps:tdContent>
						<c:choose>
							<c:when test="${loginInfo.leve < 5}">
								<cps:tdLabel width="15%">派发状态：</cps:tdLabel>
								<cps:tdContent>
									<s:select list="#{'0':'未派发','1':'已派发','3':'已退回'}" name="query.pfzt" headerKey="" headerValue=" " cssClass="cps-select" />
								</cps:tdContent>
							</c:when>
							<c:otherwise>
								<cps:tdLabel width="15%">&nbsp;</cps:tdLabel>
								<cps:tdContent>&nbsp;</cps:tdContent>
							</c:otherwise>
						</c:choose>
					</cps:row>
					<c:if test="${loginInfo.leve < 4}">
						<cps:row>
							<cps:tdContent colspan="6">
								<span style="color:red;">
									对于已退回的单位请核准信息后去业务系统进行修改。
								</span>
							</cps:tdContent>
						</cps:row>	
					</c:if>
				</cps:table>
			</form>
		</cps:panel>
		<cps:tableGrid  url="/sydw/dwop/queryDwOpList.action" 
			id="dwoplist" 
			title="单位列表"
			pageSize="10" 
			searchform="queryForm"
			mutilSelect="false"
			width="99.8%" 
			autothead="false"
			usepager="true"
			autoload="false" >
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作" align="left" width="15%"></cps:column>
			<cps:column field="dwmc" title="单位名称" align="left" width="20%" maxlength="12"></cps:column>
			<cps:column field="hylbmc" title="单位类别" align="left" width="10%"></cps:column>
			<cps:column field="dwdz" title="单位地址" maxlength="20" align="left"></cps:column>
			<c:if test="${loginInfo.leve != 5}">
				<cps:column field="pfzt" title="派发状态" width="80"></cps:column>
			</c:if>
			<cps:column field="qszt" title="签收状态" width="80"></cps:column>
		</cps:tableGrid>
	</cps:PanelView>
</creator:view>