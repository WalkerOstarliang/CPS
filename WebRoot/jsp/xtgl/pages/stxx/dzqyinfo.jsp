<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<creator:box>
		<form id="queryForm">
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="执行迁移" id="qybtn" ></cps:button>
				</cps:tbar>
				<cps:panel id="fwquerypanel" title="房屋查询条件" >
					 <cps:table>
					 	<cps:row>
					 		<cps:tdLabel>迁移前地址：</cps:tdLabel>
					 		<cps:tdContent>
					 			
					 		</cps:tdContent>
					 	</cps:row>
					 	<cps:row>
					 		<cps:tdLabel>迁移后地址：</cps:tdLabel>
					 		<cps:tdContent>
					 			
					 		</cps:tdContent>
					 	</cps:row>
					 </cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
		<cps:tabPanel id="tabpanel">
			<cps:tabItem id="syrk" title="实有人口">
				asdfas
			</cps:tabItem>
			<cps:tabItem id="sydw" title="实有单位">
				撒旦法师
			</cps:tabItem>
		</cps:tabPanel>
	</creator:box>
</creator:view>