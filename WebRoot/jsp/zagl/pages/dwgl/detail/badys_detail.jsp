<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/badys_detal.js"></creator:Script>
	<cps:tableGrid list="${dw.badysList}" height="150" id="badysList"
		autoload="true" searchform="" pageSize="5" width="99.5%"  click="onloadBadxx"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="不安定因素类型" field="lxmc"></cps:column>
		<cps:column title="引发原因" field="yfyymc"></cps:column>
		<cps:column title="表现形式" field="bxxsmc"></cps:column>
		<cps:column title="发生时间" field="fssj"></cps:column>
		<cps:column title="发生地点" field="fsdd"></cps:column>
		<cps:column title="承办人" field="cbr"></cps:column>
	</cps:tableGrid>
	
		
	<cps:table>
		<cps:row>
			<cps:tdLabel width="15%"><font color="red">*</font>不安定因素类型：</cps:tdLabel>
			<cps:tdContent width="18%" id="lxmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="15%"><font color="red">*</font>引发原因：</cps:tdLabel>
			<cps:tdContent width="18%" id="yfyymc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="15%">发生时间：</cps:tdLabel>
			<cps:tdContent id="fssj">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>承办人：</cps:tdLabel>
			<cps:tdContent id="cbr">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>发生地点：</cps:tdLabel>
			<cps:tdContent colspan="3" id="fsdd">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>表现形式：</cps:tdLabel>
			<cps:tdContent colspan="3" id="bxxsmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>事端规模：</cps:tdLabel>
			<cps:tdContent id="sdgm">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>情况描述：</cps:tdLabel>
			<cps:tdContent colspan="5" id="qkms">
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