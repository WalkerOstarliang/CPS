<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="业委会成员管理">
	<creator:Script src="/jsp/afgl/js/sqywhcyinfo.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/sqywhinfo.js"></creator:Script>
	<creator:tbar  id="sqglinfotab">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSaveywhcy()"  display="${displayAddBtn}"></cps:button>
				<cps:button id="submitbtn" value="取&nbsp;消" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldglpanel" title="业委会成员基本信息" tbarId="sqglinfotab">
		<form id="infoform" name="infoform" action="<c:url value='/afgl/sqldzgl/saveSqYwhcyxxBean.action'/>" method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="id" name="yzwyhcybean.id"></s:hidden>
		<input type="hidden" id="ip" name="yzwyhcybean.ip" value="${yzwyhcybean.ip}">
		<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="90%">
					<cps:table>
						<cps:row id="sq_row">
							<cps:tdLabel><font color="red">*</font>物业小区名称：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<c:choose>
									<c:when test="${operType=='detail'}">
										<input type="hidden" id="yzwyhid" name="yzwyhcybean.yzwyhid" value="${yzwyhcybean.yzwyhid}">
										<cps:dicText value="${yzwyhcybean.wyxqmc}"></cps:dicText>
									</c:when>
									<c:otherwise>
										<input type="hidden" id="yzwyhid" name="yzwyhcybean.yzwyhid" value="${yzwyhcybean.yzwyhid}">
										<input type="hidden" id="wyhid" name="wyhid" value="${wyhid}">
										<cps:textfield id="wyxqmc" name="yzwyhcybean.wyxqmc" required="true" maxlength="15" readonly="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row2">
							<cps:tdLabel width="12%"><font color="red">*</font>身份证号：</cps:tdLabel>
							<cps:tdContent width="25%">
								<cps:textfield id="sfzh" name="yzwyhcybean.sfzh" onblur="loadywhcyRkxxBean(this.value)" maxlength="18" required="true" isSfzh="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%"><font color="red">*</font>姓名：</cps:tdLabel>
							<cps:tdContent width="22%">
								<cps:textfield id="xm" name="yzwyhcybean.xm" required="true" maxlength="15" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%">性别：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="xbs" name="yzwyhcybean.xb" value="${yzwyhcybean.xb}"/>
								<cps:select id="xb" zdlb="GB_XB" name="yzwyhcybean.xb" value="${yzwyhcybean.xb}" headerKey="" headerValue=" "  disabled="true"></cps:select>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row3">
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="csrq" name="yzwyhcybean.csrq" value="${yzwyhcybean.csrq}" cssClass="cps-input" readonly="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>政治面貌：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="zzmm" zdlb="GB_ZZMM" name="yzwyhcybean.zzmm" value="${yzwyhcybean.zzmm}" cssClass="cps-input" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							<cps:tdLabel>联系电话：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="lxdh" name="yzwyhcybean.lxdh" maxlength="20" minlength="7" isPhone="true" value="${yzwyhcybean.lxdh}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					 	<cps:row id="clear_row8">
							<cps:tdLabel width="10%"><font color="red">*</font>职务：</cps:tdLabel>
							<cps:tdContent colspan="5">
							
							<c:choose>
								<c:when test="${operType=='detail'}">
									<input type="hidden" id="zw" name="yzwyhcybean.zw" value="${yzwyhcybean.zw}"/>
									<cps:dicText value="${yzwyhcybean.zwms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<input type="hidden" id="zw" name="yzwyhcybean.zw" value="${yzwyhcybean.zw}">
									主席：<input type="radio" name="zws" value="1">&nbsp;&nbsp;
									副主席：<input type="radio"  name="zws"  value="2">&nbsp;&nbsp;
								    普通成员：<input type="radio"  name="zws"  value="3" checked="checked">
								</c:otherwise>
							</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记人姓名：</cps:tdLabel>
							<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'add'}">
								<input type="hidden" id="djrjh" name="yzwyhcybean.djrjh" value="${yzwyhcybean.djrjh}"/>
								<input type="hidden" id="djrsfzh" name="yzwyhcybean.djrsfzh" value="${yzwyhcybean.djrsfzh}"/>
								<cps:textfield id="djrxm" name="yzwyhcybean.djrxm" readonly="true" value="${yzwyhcybean.djrxm}"></cps:textfield>
							</c:when>
							<c:when test="${operType != 'add'}">
								<input type="hidden" id="djrjh" name="yzwyhcybean.djrjh" value="${yzwyhcybean.djrjh}"/>
								<input type="hidden" id="djrsfzh" name="yzwyhcybean.djrsfzh" value="${yzwyhcybean.djrsfzh}"/>
								<cps:textfield id="djrxm" name="yzwyhcybean.djrxm" readonly="true" value="${yzwyhcybean.djrxm}"></cps:textfield>
							</c:when>
						</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djdwdm" name="yzwyhcybean.djdwdm" value="${yzwyhcybean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="yzwyhcybean.ssjwqdm" value="${yzwyhcybean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="yzwyhcybean.ssjwqmc" value="${yzwyhcybean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="yzwyhcybean.djdwmc"  readonly="true" value="${yzwyhcybean.djdwmc}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djdwdm" name="yzwyhcybean.djdwdm" value="${yzwyhcybean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="yzwyhcybean.ssjwqdm" value="${yzwyhcybean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="yzwyhcybean.ssjwqmc" value="${yzwyhcybean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="yzwyhcybean.djdwmc"  readonly="true" value="${yzwyhcybean.djdwmc}"></cps:textfield>
								</c:when>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="djsj" name="yzwyhcybean.djsj"  readonly="true" value="${yzwyhcybean.djsj}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:tdContent>
				<cps:tdContent valign="top">
					<img id="zpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${yzwyhcybean.sfzh}" height="140" width="130"/>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</creator:view>