<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="xcdjtbar">
	<cps:button value="保存" onclick="saveFwBean(saveAfterCallback,'czfxcdj')"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="xcdjpanel" tbarId="xcdjtbar" title="巡查情况登记信息" height="window">

<div id="xcdjxx">
	<input type="hidden" id="xcdjbh" name="fwBean.xcdjBean.xcdjbh" value="${fwBean.xcdjBean.xcdjbh}">
	<cps:table>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>巡查民警：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty fwBean.xcdjBean.xcmjxm}">
						<cps:textfield id="xcmjxm" name="fwBean.xcdjBean.xcmjxm" value="${loginInfo.realname}" readonly="true" required="true" appendPopuBtn="true" onclick="openXcmjSelect('${loginInfo.rootOrgCode}')"></cps:textfield>
					</c:when>
					<c:otherwise>
						<cps:textfield id="xcmjxm" name="fwBean.xcdjBean.xcmjxm" value="${fwBean.xcdjBean.xcmjxm}" readonly="true" required="true" appendPopuBtn="true" onclick="openXcmjSelect('${loginInfo.rootOrgCode}')"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>巡查单位：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty fwBean.xcdjBean.xcmjdwdm}">
						<input type="hidden" id="xcmjdwdm" name="fwBean.xcdjBean.xcmjdwdm" value="${loginInfo.orgcode }">
						<cps:textfield id="xcmjdwmc" name="fwBean.xcdjBean.xcmjdwmc" value="${loginInfo.orgname}" readonly="true" required="true"></cps:textfield>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="xcmjdwdm" name="fwBean.xcdjBean.xcmjdwdm" value="${fwBean.xcdjBean.xcmjdwdm }">
						<cps:textfield id="xcmjdwmc" name="fwBean.xcdjBean.xcmjdwmc" value="${fwBean.xcdjBean.xcmjdwmc}" readonly="true" required="true"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>巡查时间：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty fwBean.xcdjBean.xcsj}">
						<cps:date id="xcsj" name="fwBean.xcdjBean.xcsj" dateFmt="yyyy-MM-dd" required="true" defaultSystemDate="true" maxDate="${currentSystemDate}"></cps:date>
					</c:when>
					<c:otherwise>
						<cps:date id="xcsj" name="fwBean.xcdjBean.xcsj" dateFmt="yyyy-MM-dd" required="true" value="${fwBean.xcdjBean.xcsj}"></cps:date>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>巡查情况：</cps:tdLabel>
			<cps:tdContent colspan="5">
				<s:textarea id="xcqknr" name="fwBean.xcdjBean.xcqknr" rows="6" cols="10" cssStyle="width:93%" cssClass="validate[required,maxSize[500]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>处理结果：</cps:tdLabel>
			<cps:tdContent colspan="5">
				<s:textarea id="xccljg" name="fwBean.xcdjBean.xccljg" rows="6" cssStyle="width:93%" cssClass="validate[maxSize[500]]"></s:textarea>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel width="10%">登记民警：</cps:tdLabel>
			<cps:tdContent width="25%">
				<c:choose>
					<c:when test="${empty fwBean.xcdjBean.djrxm}">
						<cps:textfield id="djrxm" name="fwBean.xcdjBean.djrxm" value="${loginInfo.realname}"></cps:textfield>
					</c:when>
					<c:otherwise>
						<cps:textfield id="djrxm" name="fwBean.xcdjBean.djrxm" value="${fwBean.xcdjBean.djrxm}"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
			<cps:tdContent width="25%">
				<c:choose>
					<c:when test="${empty fwBean.xcdjBean.djdwdm}">
						<input type="hidden" id="djdwdm" name="fwBean.xcdjBean.djdwdm" value="${loginInfo.orgcode}"/>
						<cps:textfield id="djdwmc" name="fwBean.xcdjBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="djdwdm" name="fwBean.xcdjBean.djdwdm" value="${fwBean.djdwdm}"/>
						<cps:textfield id="djdwmc" name="fwBean.xcdjBean.djdwmc" value="${fwBean.xcdjBean.djdwmc}"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty fwBean.xcdjBean.djsj}">
						<cps:date id="djsj" name="fwBean.xcdjBean.djsj" defaultSystemDate="true" maxDate="${currentSystemDate}"></cps:date>
					</c:when>
					<c:otherwise>
						<cps:date id="djsj" name="fwBean.xcdjBean.djsj" value="${fwBean.xcdjBean.djsj}" maxDate="${currentSystemDate}"></cps:date>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</div>
<cps:tableGrid id="xcdjtablgrid"
				list="${fwBean.czwxcdjxxBeans}"
				click="rowcallbackCzfxcdj"
				width="99.6%"
				isAsynch="false">
	<cps:column isNumber="true" title="序号"></cps:column>
	<cps:column field="xcmjxm" title="巡查民警姓名"></cps:column>
	<cps:column field="xcmjdwmc" title="巡查单位"></cps:column>
	<cps:column field="xcsj" title="巡查时间"></cps:column>
	<cps:column field="xcqknr" title="巡查内容" maxlength="20"></cps:column>
</cps:tableGrid>
</creator:panel>