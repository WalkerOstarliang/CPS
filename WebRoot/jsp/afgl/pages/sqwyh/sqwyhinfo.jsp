<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="业主委员会管理">
	<creator:Script src="/jsp/afgl/js/sqywhinfo.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/sqywhcyinfo.js"></creator:Script>
	<creator:tbar  id="sqglinfotab">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSave()"  display="${displayAddBtn}"></cps:button>
				<cps:button id="addbtn" value="增加成员" onclick="addyzwyhcy()"  display="${displayAddBtn}"></cps:button>
				<cps:button id="submitbtn" value="取&nbsp;消" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldglpanel" title="业主委员会基本信息" tbarId="sqglinfotab">
		<s:hidden id="ywhssss" value="ywhssss"></s:hidden>
		<form id="infoform" name="infoform" action="<c:url value='/afgl/sqldzgl/saveSqYwhxxBean.action'/>" method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="id" name="ywhxxbean.id"></s:hidden>
		<input type="hidden" id="sqdm" name="ywhxxbean.sqdm" value="${ywhxxbean.sqdm}">
		<input type="hidden" id="sqmc" name="ywhxxbean.sqmc" value="${ywhxxbean.sqmc}">
		<input type="hidden" id="ip" name="ywhxxbean.ip" value="${ywhxxbean.ip}">
		<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="90%">
					<cps:table>
						<cps:row id="sq_row">
							<cps:tdLabel><font color="red">*</font>小区/组：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<c:choose>
									<c:when test="${operType=='detail'}">
										<cps:dicText value="${ywhxxbean.stmc}"></cps:dicText>
									</c:when>
									<c:otherwise>
										<input type="hidden" id="stid" name="ywhxxbean.stid" value="${ywhxxbean.stid}">
										<cps:textfield id="stmc"  name="ywhxxbean.stmc" value="${ywhxxbean.stmc}" cssClass="validate[required] cps-input" appendPopuBtn="true" cssStyle="width:100%" readonly="true" onclick="openWyxqxxSelectWin('stid','stmc')"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row1">
							<cps:tdLabel width="12%"><font color="red">*</font>业主委员会名称：</cps:tdLabel>
							<cps:tdContent width="25%" colspan="3">
								<cps:textfield id="wyxqmc" name="ywhxxbean.wyxqmc" maxlength="100" required="true" cssStyle="width:95%"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%"><font color="red">*</font>成立日期：</cps:tdLabel>
							<cps:tdContent width="22%">
								<cps:date id="clrq" name="ywhxxbean.clrq" value="${ywhxxbean.clrq}" dateFmt="yyyy-MM-dd"></cps:date>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记人姓名：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djrjh" name="ywhxxbean.djrjh" value="${ywhxxbean.djrjh}"/>
									<input type="hidden" id="djrsfzh" name="ywhxxbean.djrsfzh" value="${ywhxxbean.djrsfzh}"/>
									<cps:textfield id="djrxm" name="ywhxxbean.djrxm" readonly="true" value="${ywhxxbean.djrxm}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djrjh" name="ywhxxbean.djrjh" value="${ywhxxbean.djrjh}"/>
									<cps:textfield id="djrxm" name="ywhxxbean.djrxm" readonly="true" value="${ywhxxbean.djrxm}"></cps:textfield>
								</c:when>	
							</c:choose>	
							</cps:tdContent>
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djdwdm" name="ywhxxbean.djdwdm" value="${ywhxxbean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="ywhxxbean.ssjwqdm" value="${ywhxxbean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="ywhxxbean.ssjwqmc" value="${ywhxxbean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="ywhxxbean.djdwmc"  readonly="true" value="${ywhxxbean.djdwmc}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djdwdm" name="ywhxxbean.djdwdm" value="${ywhxxbean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="ywhxxbean.ssjwqdm" value="${ywhxxbean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="ywhxxbean.ssjwqmc" value="${ywhxxbean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="ywhxxbean.djdwmc"  readonly="true" value="${ywhxxbean.djdwmc}"></cps:textfield>
								</c:when>	
							</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="djdwmc" name="ywhxxbean.djsj"  readonly="true" value="${ywhxxbean.djsj}"></cps:textfield>
							</cps:tdContent>
							
						</cps:row>
					</cps:table>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
<cps:tableGrid id="yzwyhcyquerylist" title="业主委会成员列表"
				mutilSelect="false"
				url="/afgl/sqldzgl/querySqYwhcyPageResult.action" 
				autoload="true"
				searchform="infoform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czywhcyRowCallback"></cps:column>
		<cps:column field="wyxqmc" title="业主委员会名称"></cps:column>
		<cps:column field="xm" title="业主姓名"></cps:column>
		<cps:column field="sfzh" title="业主身份证号"></cps:column>
		<cps:column field="lxdh" title="业主联系电话"></cps:column>
		<cps:column field="zxbsms" title="有效标识"></cps:column>
	</cps:tableGrid>
</creator:view>