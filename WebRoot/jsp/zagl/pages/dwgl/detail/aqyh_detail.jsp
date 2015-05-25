<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/aqyh_detail.js"></creator:Script>
	<cps:tableGrid list="${dw.aqyhList}" height="150" id="aqyhList"
		autoload="true" searchform="" pageSize="5" width="99.5%"  click="loadAqyh"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="隐患类型" field="yhlxmc"></cps:column>
		<cps:column title="隐患名称" field="yhmc"></cps:column>
		<cps:column title="隐患登记" field="yhdjmc"></cps:column>
		<cps:column title="发现时间" field="fxsj"></cps:column>
		<cps:column title="发现人员" field="fxry"></cps:column>
	</cps:tableGrid>
	
	<cps:table>
		<cps:row>
			<cps:tdLabel width="15%"><font color="red">*</font>隐患名称：</cps:tdLabel>
			<cps:tdContent width="18%" id="yhmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="15%"><font color="red">*</font>隐患类型：</cps:tdLabel>
			<cps:tdContent width="18%" id="yhlxmc">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel width="15%"><font color="red">*</font>隐患等级：</cps:tdLabel>
			<cps:tdContent id="yhdjmc">
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>发现人：</cps:tdLabel>
			<cps:tdContent id="fxry">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>发现时间：</cps:tdLabel>
			<cps:tdContent id="fxsj">
				&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>具体位置：</cps:tdLabel>
			<cps:tdContent colspan="5" id="jtwz">
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