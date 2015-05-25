<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="服务群众登记表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/bmfw.js"></script>
	<creator:tbar id="addbmfwInfotbar">
			<c:choose>
				<c:when test="${operType != 'detail'}">
					<cps:button value="保&nbsp;存" onclick="save()"></cps:button>
				</c:when>
			</c:choose>
			<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<form id="bmfwInfoform"
			action="<c:url value='/qzgl/bmfwgl/updateBmfw.action'/>"
			method="post" enctype="application/x-www-form-urlencoded">
	<creator:panel id="fwqzxx" title="服务群众登记表" tbarId="addbmfwInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="bh" name="bmfwxxBean.bh" ></s:hidden>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">服务项目：</cps:tdLabel>
				<cps:tdContent width="25%">
				<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.fwxmlb}"></cps:dicText>
				</c:when>
				<c:otherwise>
				<cps:textfield id="fwxmlb" name="bmfwxxBean.fwxmlb" value="${bmfwxxBean.fwxmlb}" maxlength="25"></cps:textfield>
				
				<%--<s:select list="xbList" id="zc" cssStyle="width:70%"
									listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
									cssClass="cps-input" name="zyzdjxxBean.xb"></s:select>--%>
				</c:otherwise>
				</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">服务群体：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.bfwqtmc}"></cps:dicText>
				</c:when>
				<c:otherwise>
				<cps:textfield id="jtzz" name="bmfwxxBean.bfwqtmc"
						value="${bmfwxxBean.bfwqtmc}" cssClass="cps-input" maxlength="100"></cps:textfield>
				</c:otherwise>
				</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>服务时间：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.fwsj}" ></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:date id="csrq" name="bmfwxxBean.fwsj"
						value="${bmfwxxBean.fwsj}" cssClass="cps-input" dateFmt="yyyy-MM-dd" defaultSystemDate="true" required="true"></cps:date>
				</c:otherwise>
				</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>服务对象身份证：</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.bfwdxsfzh}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="email" name="bmfwxxBean.bfwdxsfzh"
						value="${bmfwxxBean.bfwdxsfzh}"   maxlength="18" isSfzh="true" onblur="queryRkBean(this.value,setFwdxxx)"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>服务对象姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.bfwdxxm}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="fwdxxm" name="bmfwxxBean.bfwdxxm"
						value="${bmfwxxBean.bfwdxxm}" cssClass="cps-input" maxlength="15" required="true"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
				
				<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.bfwdxlxfs}" ></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="bfwdxlxfs" name="bmfwxxBean.bfwdxlxfs"
						value="${bmfwxxBean.bfwdxlxfs}" isPhone="true" minlength="7" maxlength="11"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">现住地址：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="5">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.bfwdxjtzz}" ></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="xm" name="bmfwxxBean.bfwdxjtzz" value="${bmfwxxBean.bfwdxjtzz}" cssStyle="width:93%" maxlength="60"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%"><font color="red">*</font>服务民警姓名:</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.fwdxxm}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="zrmjxm" name="bmfwxxBean.fwdxxm"
						value="${bmfwxxBean.fwdxxm}" required="true"  readonly="true" appendPopuBtn="true" onclick="openSelectzrmjxx('${loginInfo.rootOrgCode}')"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>民警身份证号:</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.fwdxsfzh}" ></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="zrmjsfzh" name="bmfwxxBean.fwdxsfzh"
						value="${bmfwxxBean.fwdxsfzh}"   maxlength="18" readonly="true" required="true" isSfzh="true"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">民警联系方式:</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.fwdxlxfs}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="zrmjdh" name="bmfwxxBean.fwdxlxfs"
						value="${bmfwxxBean.fwdxlxfs}"  cssClass="validate[custom[phone]] cps-input" maxlength="11"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">服务内容：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="5">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.fwnrms}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<s:textarea id="fwnrms" name="bmfwxxBean.fwnrms" cssStyle="width:93%" rows="5" cssClass="validate[maxSize[250]]"></s:textarea>
					</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">备注：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="5">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.bz}"></cps:dicText>
				</c:when>
				<c:otherwise>
				<s:textarea id="bz" name="bmfwxxBean.bz" cssStyle="width:93%" rows="5" cssClass="validate[maxSize[500]]"></s:textarea>
				</c:otherwise>
				</c:choose>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="10%">登记人：</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.djrxm}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:textfield id="djr" name="bmfwxxBean.djrxm"
						value="${bmfwxxBean.djrxm}"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.djdwmc}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<input name="bmfwxxBean.djdwdm" type="hidden" value="${bmfwxxBean.djdwdm }"/>
					<cps:textfield id="bmfwxxBean.djdwmc" name="bmfwxxBean.djdwmc"
						value="${bmfwxxBean.djdwmc}"></cps:textfield>
						</c:otherwise>
						</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记日期：</cps:tdLabel>
				<cps:tdContent width="25%">
						<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:dicText value="${bmfwxxBean.djsj}"></cps:dicText>
				</c:when>
				<c:otherwise>
					<cps:date id="djdwmc" name="bmfwxxBean.djsj"
						value="${bmfwxxBean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
						</c:otherwise>
						</c:choose>
						
				</cps:tdContent>
				
			</cps:row>
		
	</cps:table>
	</creator:panel>
</form>
	
</creator:view>