<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="保卫建议书">
<creator:Script src="/jsp/zagl/js/bwjys.js"></creator:Script>
	<creator:tbar id="op">
		<cps:button value="保存" onclick="saveBwjys()"></cps:button>
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<div id="bwjys_div">
		<creator:panel id="bwjys" title="保卫制度" tbarId="op">
			<form id="bwjys_from">
				<input type="hidden" name="dw.bwjys.jysbh" value="${dw.bwjys.jysbh}" id="jysbh" />
				<input type="hidden" name="dw.bwjys.jgbh" value="${jgbh}" />
				<input type="hidden" value="${operType}" id="opertype" />
			
				<cps:table>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>建议书名称：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="dw.bwjys.jysmc" value="${dw.bwjys.jysmc}" id="jysmc" maxlength="100" required="true" cssStyle="width:89%" />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>下达单位：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<input type="hidden" name="dw.bwjys.xddwdm" value="${dw.bwjys.xddwdm}" id="xddwdm" />
							<cps:textfield name="dw.bwjys.xddwmc" value="${dw.bwjys.xddwmc}" id="xddwmc" readonly="true" cssStyle="width:78%"/>
							<cps:button value="选择" onclick="selectOrg('${loginInfo.rootOrgCode}','xddwdm','xddwmc')"></cps:button>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="20%">下达时间：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:date name="dw.bwjys.xdsj" value="${dw.bwjys.xdsj}" id="xdsj" dateFmt="yyyy-MM-dd" defaultSystemDate="true"/>
						</cps:tdContent>
						
						<cps:tdLabel width="20%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="30%">&nbsp;</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color="red">*</font>内容：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield name="dw.bwjys.nr" value="${dw.bwjys.nr}" id="nr" type="textarea" cssStyle="height:100px;width:89%" required="true"/>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>登记人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dw.bwjys.djrxm" value="${dw.bwjys.djrxm}" id="djr" readonly="true"/>
						</cps:tdContent>
						
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dw.bwjys.djsj" value="${dw.bwjys.djsj}" id="djsj" readonly="true"/>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<input type="hidden" name="dw.bwjys.djdwdm" value="${dw.bwjys.djdwdm}" />
							<cps:textfield name="dw.bwjys.djdwmc" value="${dw.bwjys.djdwmc}" id="djdwmc" readonly="true" cssStyle="width:89%" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
	</div>
</creator:view>