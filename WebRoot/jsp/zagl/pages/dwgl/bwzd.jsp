<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="保卫制度">
<creator:Script src="/jsp/zagl/js/bwzd.js"></creator:Script>
	<creator:tbar id="op">
		<cps:button value="保存" onclick="saveBwzd()"></cps:button>
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<div id="bwzd_div">
		<creator:panel id="bwzd" title="保卫制度" tbarId="op">
			<form id="bwzd_from">
				<input type="hidden" name="dw.bwzd.zdbh" value="${dw.bwzd.zdbh}" id="zdbh" />
				<input type="hidden" name="dw.bwzd.jgbh" value="${jgbh}" />
				<input type="hidden" value="${operType}" id="opertype" />
			
				<cps:table>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>保卫制度名称：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="dw.bwzd.bwzdmc" value="${dw.bwzd.bwzdmc}" id="bwzdmc" maxlength="100" required="true" cssStyle="width:89%" />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="20%">修订时间：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:date name="dw.bwzd.xdsj" value="${dw.bwzd.xdsj}" id="xdsj" defaultSystemDate="true" dateFmt="yyyy-MM-dd"/>
						</cps:tdContent>
						
						<cps:tdLabel width="20%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="30%">&nbsp;</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color="red">*</font>内容：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="dw.bwzd.nr" value="${dw.bwzd.nr}" id="nr" type="textarea" cssStyle="height:100px; width:89%" required="true"/>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>登记人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dw.bwzd.djrxm" value="${dw.bwzd.djrxm}" id="djr" readonly="true"/>
						</cps:tdContent>
						
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dw.bwzd.djsj" value="${dw.bwzd.djsj}" id="djsj" readonly="true"/>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<input type="hidden" name="dw.bwzd.djdwdm" value="${dw.bwzd.djdwdm}" />
							<cps:textfield name="dw.bwzd.djdwmc" value="${dw.bwzd.djdwmc}" id="djdwmc" cssStyle="width:89%" readonly="true"/>
						</cps:tdContent>
					</cps:row>
					
				</cps:table>
			</form>
		</creator:panel>
	</div>
</creator:view>