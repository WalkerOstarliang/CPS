<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/sydw/js/sydwdjlist.js"></creator:Script>
<creator:box>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="clickQueryBtn()"></cps:button>
			<cps:button value="下一步" onclick="clickNextBtn()" display="${displayAddBtn}"></cps:button>
		</cps:tbar>
		<cps:panel id="cxtj" title="单位登记之查询页面" >
			<form id="dwcxform">
				<input type="hidden" id="executequerydwmc" value=""/>
				<cps:table>
					 <cps:row>
					 	<cps:tdLabel width="15%">请输入单位名称：</cps:tdLabel>
					 	<cps:tdContent width="40%">
					 		<cps:textfield id="dwmc" name="queryBean.dwmc"></cps:textfield>
					 	</cps:tdContent>
					 	<cps:tdContent width="45%">
					 		&nbsp;
					 	</cps:tdContent>
					 </cps:row>
					 <cps:row>
					 	<cps:tdContent colspan="3">
					 		<font color="red">
					 			&nbsp;说明：在登记单位之前请先查询要登记的单位是否已经被登记，以防止单位重复登记。点击“下一步”进入房屋选择页面。<br/>
					 			&nbsp;单位采集流程：（查询单位是否存在）-->（房屋选择）-->（单位登记）
					 			&nbsp;单位采集对象：只能社区民警采集
					 		</font>
					 	</cps:tdContent>
					 </cps:row>
				</cps:table>
			</form>
			<cps:tableGrid url="/sydw/dwgl/queryDwdjCheckList.action" title="单位列表"
				id="cxjgList" autoload="false" pageSize="10" width="99.5%"
				usepager="true" searchform="dwcxform" mutilSelect="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="操作" field="dwdjcz" rowcallback="dwdjczRowCallBack"></cps:column>
				<cps:column title="单位名称" field="dwmc" align="left"></cps:column>
				<cps:column title="单位地址" field="dwdz" align="left"></cps:column>
				<cps:column title="联系电话" field="dwdh" ></cps:column>
				<cps:column title="登记时间" field="djsj"></cps:column>
			</cps:tableGrid>
		</cps:panel>
	</cps:PanelView>
</creator:box>
</creator:view>

