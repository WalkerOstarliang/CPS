<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/rypf.js"></creator:Script>
<creator:tbar id="op">
	<c:if test="${operType != 'detail'}">
		<cps:button value="重点人员派发" onclick="rypf('${loginInfo.orgcode}')"></cps:button>
	</c:if>
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>
<creator:panel id="ryjbxx" title="重点人员信息" tbarId="op">
	<%@include file="/jsp/lsgl/pages/zdry/rkjbxx.jsp"%>
</creator:panel>
<creator:panel id="zdry" title="重点人员信息">
	<%@include file="/jsp/lsgl/pages/zdry/zdryDetail.jsp"%>
</creator:panel>
<creator:panel id="pfxx" title="派发信息">
	<form id="pfxx_form">
		<input type="hidden" name="operType" value="${operType}" />
		<input type="hidden" name="modename" value="重点人员派发" />
		<cps:table>
			<cps:row>
				<cps:tdLabel width="20%"><font color="red">*</font>目标单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" name="zdryBean.zdrybh" value="${zdryBean.zdrybh}"/>
					<input type="hidden" name="zdryBean.sfzh" value="${rkBean.jbxxBean.sfzh}"/>
					<c:choose>
						<c:when test="${loginInfo.leve < 4}">
							<input type="hidden" name="zdryBean.ssxzsqmc" id="ssxzsqmc" value="${zdryBean.ssxzsqmc}" />
							<input type="hidden" name="zdryBean.ssxzsq" id="xzsqdm" value="${zdryBean.ssxzsq}" />
							
							<input type="hidden" name="zdryBean.sszrdwdm" id="sszrdwdm" value="${zdryBean.sszrdwdm}" />
							<cps:textfield name="zdryBean.sszrdwmc" value="${zdryBean.sszrdwmc}" id="sszrdwmc" 
								onclick="selectOrg('${loginInfo.orgcode}',${loginInfo.leve},'sszrdwdm','sszrdwmc')" appendPopuBtn="true" required="true"/>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="zdryBean.sszrdwdm" id="sszrdwdm" value="${zdryBean.sszrdwdm}" />
							<input type="hidden" name="zdryBean.sszrdwmc" id="sszrdwmc" value="${zdryBean.sszrdwmc}" />
							
							<input type="hidden" name="zdryBean.ssxzsq" id="xzsqdm" value="${zdryBean.ssxzsq}">
							<cps:textfield name="zdryBean.ssxzsqmc" value="${zdryBean.ssxzsqmc}" id="ssxzsqmc" 
								onclick="openSqxxSelectWin('xzsqdm','sszrdwdm','sszrdwmc','ssxzsqmc')" appendPopuBtn="true" required="true"/>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</creator:view>
