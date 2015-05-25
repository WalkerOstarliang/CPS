<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<creator:view>
	<creator:Script src="/jsp/gzgl/js/jqtb.js"></creator:Script>
	<form id="jqtbform">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="保存" onclick="saveJqtb()" display="${operType != 'detail'}"></cps:button>
				<cps:button value="关闭" onclick="window.close()"></cps:button>
			</cps:tbar>
			<cps:panel id="jqtb" title="${jqtbBean.zrdwmc}-警情通报">
				<cps:table>
					<input id="operType" type="hidden" value="${operType}">
					<input id="id" type="hidden" name="jqtbBean.id" value="${jqtbBean.id }" />
					<input id="zrdwdm" type="hidden" name="jqtbBean.zrdwdm" value="${jqtbBean.zrdwdm}" />
					<input id="zrdwdm" type="hidden" name="jqtbBean.zrdwmc" value="${jqtbBean.zrdwmc}" />
					<cps:row>
							<cps:tdLabel width="12%"> <font color="red">*</font>年月</cps:tdLabel>
							<cps:tdContent width="20%">
								<cps:textfield id="ny" name="jqtbBean.ny" value="${jqtbBean.ny}" required="true" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="15%">刑事案件(起)：</cps:tdLabel>
							<cps:tdContent width="20%">
								<cps:textfield inputType="number" id="xsaj" name="jqtbBean.xsaj" value="${jqtbBean.xsaj}" maxlength="10" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="15%">治安案件(起)：</cps:tdLabel>
							<cps:tdContent width="20%">
								<cps:textfield inputType="number" id="zaaj" name="jqtbBean.zaaj" value="${jqtbBean.zaaj}" maxlength="10" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>调处纠纷(起)：</cps:tdLabel>
							<cps:tdContent >
								<cps:textfield inputType="number" id="tcjf" name="jqtbBean.tcjf" value="${jqtbBean.tcjf}" maxlength="10" readonly="true"></cps:textfield>
							</cps:tdContent>
								<cps:tdLabel>入室盗窃案件(起)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield inputType="number" id="rsdqaj" name="jqtbBean.rsdqaj" value="${jqtbBean.rsdqaj}" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>抢劫、抢夺案件(起)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield inputType="number" maxlength="10" id="qjqdaj" name="jqtbBean.qjqdaj" value="${jqtbBean.qjqdaj}" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>盗窃机动车辆案件(起)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield inputType="number" maxlength="10" id="dqjdclaj" name="jqtbBean.dqjdclaj" value="${jqtbBean.dqjdclaj}" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>灾害事故(起)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield inputType="number" id="zhsg" name="jqtbBean.zhsg" value="${jqtbBean.zhsg}" maxlength="10" ></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>其他案件(起)：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield inputType="number" maxlength="10" id="qtaj" name="jqtbBean.qtaj" value="${jqtbBean.qtaj}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel><font color="red">*</font>防范提示：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield type="textarea" id="dqffzd" name="jqtbBean.dqffzd" readonly="" required="true" maxlength="2000" cssStyle="width:97%;height:150px;" value="${jqtbBean.dqffzd}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>典型案例：</cps:tdLabel>
							<cps:tdContent colspan="5" >
								<cps:textfield type="textarea" id="dxaj" name="jqtbBean.dxaj" readonly="" required="true" maxlength="2000" cssStyle="width:97%;height:150px;" value="${jqtbBean.dxaj}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel >登记人：</cps:tdLabel>
							<cps:tdContent >
								<cps:textfield id="djrxm" value="${loginInfo.realname}" name="jqtbBean.djrxm" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel >登记单位：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" name="jqtbBean.djdwdm" value="${loginInfo.orgcode }">
								<cps:textfield id="djdwmc" name="jqtbBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
							<cps:tdContent width="15%">
								<cps:textfield id="djsj" name="jqtbBean.djsj" value="${jqtbBean.djsj}" readonly="true"></cps:textfield>
							</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>