<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="dwjc_op">
	<cps:button value="保存" type="button" onclick="saveDwJcxxBean()" />
	<cps:button value="关闭" type="button" onclick="window.close();" />
</creator:tbar>
<creator:panel id="dwjc_panel" title="单位奖罚信息" tbarId="dwjc_op">
	<div id="dwjc_div">
		<input type="hidden" name="dw.dwjc.bh" id="bh" value="${dw.dwjc.bh}" />
		<input type="hidden" name="dw.dwjc.jgbh" id="jgbh" value="${dw.dwjc.jgbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>奖惩类别：</cps:tdLabel>
				<cps:tdContent width="23%">
					<s:select list="#{'0':'奖励','1':'处罚'}" name="dw.dwjc.jclb" value="dw.dwjc.jclb" id="jclb" cssClass="cps-select" headerKey="" headerValue="--请选择--" />
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>奖惩时间：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" name="dw.dwjc.cfrq" value="${dw.dwjc.cfrq}" id="cfrq" required="true"></cps:date>
				</cps:tdContent>

				<cps:tdLabel width="10%">奖惩实施单位：</cps:tdLabel>
				<cps:tdContent width="24%">
					<cps:textfield name="dw.dwjc.jcssdw" value="${dw.dwjc.jcssdw}" maxlength="60" id="jcssdw" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"> 奖惩原因：</cps:tdLabel>
				<cps:tdContent colspan="6">
					<cps:textfield name="dw.dwjc.cfyy" id="cfyy" value="${dw.dwjc.cfyy}" maxlength="500" cssStyle="width:93%;"></cps:textfield>
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel> 奖惩内容：</cps:tdLabel>
				<cps:tdContent colspan="6">
					<cps:textfield type="textarea" name="dw.dwjc.cfnr" id="cfnr" maxlength="1500" value="${dw.dwjc.cfnr}" cssStyle="width:93%;height:60px;"></cps:textfield>
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>登记人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.dwjc.djrxm" value="${loginInfo.realname}" id="djrxm" readonly="true"></cps:textfield>
				</cps:tdContent>

				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date name="dw.dwjc.djsj"  id="djsj" defaultSystemDate="true" readOnly="true"></cps:date>
				</cps:tdContent>

				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" name="dw.dwjc.djdwdm" value="${loginInfo.orgcode}" />
					<cps:textfield name="dw.dwjc.djdwmc" value="${loginInfo.orgname}" id="djdwmc" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
</creator:panel>
<form id="dwjcqueryform">
	<input type="hidden" id="jgbhhidden" name="dwcx.jgbh" value="${jgbh}"/>
</form>
<creator:panel id="dwjclist" title="历史奖惩情况">
	<cps:tableGrid url="/zagl/dw/queryDwjcBeans.action" 
					id="dwjcList" 
					width="99.5%"
					autoload="true" 
					click="dwjcClickRowcallback"
					searchform="dwjcqueryform" 
					usepager="true" 
					mutilSelect="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="奖惩类别" field="jclbmc"></cps:column>
			<cps:column title="奖惩日期" field="cfrq"></cps:column>
			<cps:column title="奖惩内容" field="cfnr" maxlength="20"></cps:column>
			<cps:column title="登记时间" field="djsj"></cps:column>
	</cps:tableGrid>
</creator:panel>