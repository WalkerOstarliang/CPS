<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/zhsg_detail.js"></creator:Script>
	<cps:tableGrid list="${dw.zhsgList}" height="150" id="zhsgList"
		autoload="true" searchform="" pageSize="5" width="99.5%"  click="loadZhsg"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="事故类型" field="sglxmc"></cps:column>
		<cps:column title="发生时间" field="fssj"></cps:column>
		<cps:column title="发生地点" field="fsdd"></cps:column>
		<cps:column title="损失财产(万元)" field="sscc"></cps:column>
		<cps:column title="承办人" field="cbr"></cps:column>
	</cps:tableGrid>
	
	<cps:table>
		<cps:row>
			<cps:tdLabel width="15%"><font color="red">*</font>事故类型：</cps:tdLabel>
			<cps:tdContent width="18%" id="sglxmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="15%">发生时间：</cps:tdLabel>
			<cps:tdContent width="18%" id="fssj">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="15%"><font color="red">*</font>损失财产：</cps:tdLabel>
			<cps:tdContent id="sscc">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>发生地点：</cps:tdLabel>
			<cps:tdContent colspan="3" id="fsdd">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>事故责任人：</cps:tdLabel>
			<cps:tdContent id="sgzrr">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>承办人：</cps:tdLabel>
			<cps:tdContent id="cbr">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>事故原因：</cps:tdLabel>
			<cps:tdContent id="sgyymc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>事故案件状态：</cps:tdLabel>
			<cps:tdContent id="sgajzt">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>发生经过：</cps:tdLabel>
			<cps:tdContent colspan="5" id="fsjg">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>处置措施：</cps:tdLabel>
			<cps:tdContent colspan="5" id="czcs">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>登记人：</cps:tdLabel>
			<cps:tdContent id="djrxm">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>登记时间：</cps:tdLabel>
			<cps:tdContent id="djsj">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>登记单位：</cps:tdLabel>
			<cps:tdContent id="djdwmc">
				&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>