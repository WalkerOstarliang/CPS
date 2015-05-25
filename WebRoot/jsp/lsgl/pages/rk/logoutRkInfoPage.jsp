<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
<creator:tbar id="tbarLogout">
	<cps:button value="保存" onclick="logoutRkInfo();"></cps:button>
	<cps:button value="关闭" onclick="window.close();"></cps:button>
</creator:tbar>
	<creator:panel id="logoutpanel" title="${modename}注销信息填写" tbarId="tbarLogout">
		<form id="logoutform">
			<input id = "rylb" name="rylb" value="${rylb}" type="hidden" />
			<c:if test="${rylb =='2'}">
				<cps:table>
					<input id ="zzbh" name = "rkBean.ldrkBean.zzbh" value="${bhs}" type="hidden" />
					<cps:row>
						<cps:tdLabel width="15%"><font color="red">*</font>注销原因：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:select zdlb="ZDY_ZXYY" id="zxyy" name="rkBean.ldrkBean.zxyy" headerKey="" headerValue=" " required="true"></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel width="15%"><font color="red">*</font>注销时间</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:date id="zxsj"  name="rkBean.ldrkBean.zxsj" value="${rkBean.ldrkBean.zxsj}" maxDate="${currentSystemDate}" required="true"></cps:date>
						</cps:tdContent>
						
						<cps:tdLabel width="15%"><font color="red">*</font>去向：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="qx"  name="rkBean.ldrkBean.qx" value="${rkBean.ldrkBean.qx}" maxlength="100"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</c:if>
			<c:if test="${rylb =='1'}">
				<cps:table>
					<input id ="zzbh" name = "rkBean.czrkBean.czrkbh" value="${bhs}" type="hidden" />
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>注销原因：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="zxyy" name="rkBean.czrkBean.zxyy"  required="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>注销时间</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="zxsj"  name="rkBean.czrkBean.zxsj" value="${rkBean.czrkBean.zxsj}" maxDate="${currentSystemDate}" required="true"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</c:if>
			
			<c:if test="${rylb =='4'}">
				<cps:table>
					<input id ="zzbh" name = "rkBean.jwrkBean.jwbh" value="${bhs}" type="hidden" />
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>注销原因：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="zxyy" name="rkBean.jwrkBean.zxyy" required="true" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>注销时间</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="zxsj"  name="rkBean.jwrkBean.zxsj" value="${rkBean.jwrkBean.zxsj}" maxDate="${currentSystemDate}" required="true"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</c:if>
			<c:if test="${rylb =='5'}">
				<cps:table>
					<input id ="zzbh" name = "rkBean.jzrkBean.jzbh" value="${bhs}" type="hidden" />
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>注销原因：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="zxyy" name="rkBean.jzrkBean.zxyy" required="true" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>注销时间</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="zxsj"  name="rkBean.jzrkBean.zxsj" value="${rkBean.jzrkBean.zxsj}" maxDate="${currentSystemDate}" required="true"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</c:if>
			<c:if test="${rylb =='3'}">
				<cps:table>
					<input id ="zzbh" name = "rkBean.wlhrkBean.wlhrkbh" value="${bhs}" type="hidden" />
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>注销原因：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="zxyy" name="rkBean.wlhrkBean.zxyy" required="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>注销时间</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="zxsj"  name="rkBean.wlhrkBean.zxsj" value="${rkBean.wlhrkBean.zxsj}" maxDate="${currentSystemDate}" required="true"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</c:if>
			
		</form>
		<c:if test="${rylb != 4}">
			<div>
				<fieldset>
					<legend>人员基本信息</legend>
					 <%@include file="/jsp/lsgl/pages/rk/detailrkjbxx.jsp" %>
				</fieldset>
			</div>
		</c:if>
		<c:if test="${rylb == 4}">
			<div>
				<fieldset>
					<legend>人员基本信息</legend>
					<%@include file="/jsp/lsgl/pages/rk/jwrk/rydajwrkjbxx.jsp"%>
				</fieldset>
			</div>
		</c:if>
	</creator:panel>
</creator:view>