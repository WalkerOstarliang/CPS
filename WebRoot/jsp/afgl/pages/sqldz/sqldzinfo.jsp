<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="楼栋长管理">
	<creator:Script src="/jsp/afgl/js/sqldzinfo.js"></creator:Script>
	<creator:tbar  id="sqglinfotab">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSave()"  display="${displayAddBtn}"></cps:button>
				<cps:button id="submitbtn" value="取&nbsp;消" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldglpanel" title="楼栋长基本信息" tbarId="sqglinfotab">
		<form id="infoform" name="infoform" action="<c:url value='/afgl/sqldzgl/saveSqLdzxxBean.action'/>" method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="id" name="ldzbean.id"></s:hidden>
		<input type="hidden" id="sqdm" name="ldzbean.sqdm" value="${ldzbean.sqdm}">
		<input type="hidden" id="sqmc" name="ldzbean.sqmc" value="${ldzbean.sqmc}">
		<input type="hidden" id="ip" name="ldzbean.ip" value="${ldzbean.ip}">
		<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="90%">
					<cps:table>
						<cps:row id="sq_row">
							<cps:tdLabel><font color="red">*</font>楼栋地址：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<c:choose>
									<c:when test="${operType=='detail'}">
										<cps:dicText value="${ldzbean.stdz}"></cps:dicText>
									</c:when>
									<c:otherwise>
										<input type="hidden" id="stid" name="ldzbean.stid" value="${ldzbean.stid}">
										<cps:textfield id="stdz"  name="ldzbean.stdz" value="${ldzbean.stdz}" cssClass="validate[required] cps-input" appendPopuBtn="true" cssStyle="width:100%" readonly="true" onclick="openStxxSelectWin('stid','stdz')"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						
						<cps:row id="clear_row2">
							<cps:tdLabel width="12%"><font color="red">*</font>身份证号：</cps:tdLabel>
							<cps:tdContent width="25%">
								<cps:textfield id="sfzh" name="ldzbean.sfzh" onblur="loadRkxxBean(this.value)" maxlength="18" required="true" isSfzh="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%"><font color="red">*</font>姓名：</cps:tdLabel>
							<cps:tdContent width="22%">
								<cps:textfield id="xm" name="ldzbean.xm" required="true" maxlength="15" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%">性别：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="xbs" name="ldzbean.xb" value="${ldzbean.xb}"/>
								<cps:select id="xb" zdlb="GB_XB" name="ldzbean.xb" value="${ldzbean.xb}" headerKey="" headerValue=" "  disabled="true"></cps:select>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row3">
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="csrq" name="ldzbean.csrq" value="${ldzbean.csrq}" cssClass="cps-input" readonly="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>政治面貌：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="zzmm" zdlb="GB_ZZMM" name="ldzbean.zzmm" value="${ldzbean.zzmm}" cssClass="cps-input" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							<cps:tdLabel>联系电话：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="lxdh" name="ldzbean.lxdh" maxlength="20" minlength="7" isPhone="true" value="${ldzbean.lxdh}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row5">
							<cps:tdLabel>户籍地区划：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="hjdqh" name="ldzbean.hjdqh" value="${ldzbean.hjdqh}">
								<cps:textfield id="hjdqhmc" name="hjdqhmc" ondblclick="openHjdxzqh()" appendPopuBtn="true" value="${ldzbean.hjdqhmc}" onclick="openHjdxzqh()"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>现住地详址：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield id="xzzxz" name="ldzbean.xzzxz" maxlength="150" value="${ldzbean.xzzxz}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记人姓名：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djrjh" name="ldzbean.djrjh" value="${ldzbean.djrjh}"/>
									<input type="hidden" id="djrsfzh" name="ldzbean.djrsfzh" value="${ldzbean.djrsfzh}"/>
									<cps:textfield id="djrxm" name="ldzbean.djrxm" readonly="true" value="${ldzbean.djrxm}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djrjh" name="ldzbean.djrjh" value="${ldzbean.djrjh}"/>
									<cps:textfield id="djrxm" name="ldzbean.djrxm" readonly="true" value="${ldzbean.djrxm}"></cps:textfield>
								</c:when>
							</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djdwdm" name="ldzbean.djdwdm" value="${ldzbean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="ldzbean.ssjwqdm" value="${ldzbean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="ldzbean.ssjwqmc" value="${ldzbean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="ldzbean.djdwmc"  readonly="true" value="${ldzbean.djdwmc}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djdwdm" name="ldzbean.djdwdm" value="${ldzbean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="ldzbean.ssjwqdm" value="${ldzbean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="ldzbean.ssjwqmc" value="${ldzbean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="ldzbean.djdwmc"  readonly="true" value="${ldzbean.djdwmc}"></cps:textfield>
								</c:when>
							</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="djsj" name="ldzbean.djsj" defaultSystemDate="true" readOnly="true"></cps:date>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:tdContent>
				<cps:tdContent valign="top">
					<img id="zpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${ldzbean.sfzh}" height="140" width="130"/>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</creator:view>