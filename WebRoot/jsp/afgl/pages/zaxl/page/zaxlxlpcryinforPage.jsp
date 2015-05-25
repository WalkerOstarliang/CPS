<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="治安巡逻盘查人员信息登记">
	<creator:Script src="/jsp/afgl/pages/zaxl/js/zaxl.js"></creator:Script>
	<creator:tbar  id="xlpcrylinfotab">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSavexlpcryinfo()"  display="${displayAddBtn}"></cps:button>
				<cps:button id="submitbtn" value="取&nbsp;消" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xlpcrypanel" title="治安巡逻盘查人员基本信息" tbarId="xlpcrylinfotab">
		<form id="infoform" name="infoform" action="<c:url value='/afgl/zaxl/saveXlpcryxxInfoBean.action'/>" method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="id" name="zaxlpcdx.id"></s:hidden>
		<s:hidden id="zaxlid" name="zaxlpcdx.zaxlid"></s:hidden>
		<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="90%">
					<cps:table>
						<cps:row id="clear_row2">
							<cps:tdLabel width="12%"><font color="red">*</font>身份证号：</cps:tdLabel>
							<cps:tdContent width="25%">
								<cps:textfield id="pcrysfzh" name="zaxlpcdx.pcrysfzh" onblur="loadypccyRkxxBean(this.value)" maxlength="18" required="true" isSfzh="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%"><font color="red">*</font>姓名：</cps:tdLabel>
							<cps:tdContent width="22%">
								<cps:textfield id="pcryxm" name="zaxlpcdx.pcryxm" required="true" maxlength="15" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>联系电话：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="pcrylxdh" name="zaxlpcdx.pcrylxdh" maxlength="20" minlength="7" isPhone="true" value="${zaxlpcdx.pcrylxdh}"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>登记人姓名：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djrjh" name="zaxlpcdx.djrjh" value="${zaxlpcdx.djrjh}"/>
									<input type="hidden" id="djrsfzh" name="zaxlpcdx.djrsfzh" value="${zaxlpcdx.djrsfzh}"/>
									<cps:textfield id="djrxm" name="zaxlpcdx.djrxm" readonly="true" value="${zaxlpcdx.djrxm}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djrjh" name="zaxlpcdx.djrjh" value="${zaxlpcdx.djrjh}"/>
									<input type="hidden" id="djrsfzh" name="zaxlpcdx.djrsfzh" value="${zaxlpcdx.djrsfzh}"/>
									<cps:textfield id="djrxm" name="zaxlpcdx.djrxm" readonly="true" value="${zaxlpcdx.djrxm}"></cps:textfield>
								</c:when>
							</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djdwdm" name="zaxlpcdx.djdwdm" value="${zaxlpcdx.djdwdm}"/>
									<cps:textfield id="djdwmc" name="zaxlpcdx.djdwmc"  readonly="true" value="${zaxlpcdx.djdwmc}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djdwdm" name="zaxlpcdx.djdwdm" value="${zaxlpcdx.djdwdm}"/>
									<cps:textfield id="djdwmc" name="zaxlpcdx.djdwmc"  readonly="true" value="${zaxlpcdx.djdwmc}"></cps:textfield>
								</c:when>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="djsj" name="zaxlpcdx.djsj"  readonly="true" value="${zaxlpcdx.djsj}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</creator:view>