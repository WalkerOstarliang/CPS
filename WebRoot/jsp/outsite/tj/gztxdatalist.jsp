<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="工作提醒数据列表">
	<creator:Script src="/jsp/outsite/js/gztxlist.js"></creator:Script>
 	<cps:PanelView>
 		<form id="xttxpzform">
	 		<input type="hidden" id="xttxpzbeanid" name="xttxpzBean.id" value="${xttxpzBean.id}"/>
	 	</form>
 		<cps:tbar>
 			<cps:button value="导出Excel" onclick="download()"></cps:button>
			<cps:button value="刷新" onclick="refreshGrid()"></cps:button>
 		</cps:tbar>
 		<cps:panel title="工作提醒数据列表">
 			<cps:tableGrid id="mygztstablegrid" 
							pageSize="10"
							width="99.8%"
							autoload="true"
							searchform="xttxpzform"
							usepager="true"
							url="/schedule/queryXttxPageResultInfo.action">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="操作" field="czs" width="50px" rowcallback="callbackRowCsz"></cps:column>
				<cps:column title="任务类型" field="type" align="left"></cps:column>
				<cps:column title="描述" field="title" maxlength="50" align="left"></cps:column>
				<cps:column title="要求办理时间" field="blsj" width="90px"></cps:column>
			</cps:tableGrid>	
 		</cps:panel>
 	</cps:PanelView>
 	<div style="margin-left: 10px">
 		<font color="red">
 			<h3>注意：</h3>关于出现出租屋巡查办理时间小于当期系统时间的出租屋，社区民警只要当天内对出租屋巡查一次后，就不会再进行扣分。
 		</font>
 	</div>
	<form id="download" target="exportiframe"></form>
	<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
</creator:view>