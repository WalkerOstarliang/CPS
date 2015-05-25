<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="保存" onclick="saveTmtzxxBean()"></cps:button>
			<cps:button value="关闭" onclick="closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel id="ryjbxxpanel" title="人员基本信息">
			<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
		</cps:panel>
	</cps:PanelView>
	<form id="rkxxform" method="post">
		<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${rkBean.jbxxBean.rybh}">
		<input type="hidden" id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh }"/>
		<input type="hidden" id="tmtzid" name="rkBean.tmtzBean.id" value="${rkBean.tmtzBean.id}"/>
		<cps:panel id="tmtzxxpanel" title="体貌特征信息">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>脸型：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select zdlb="GA_LX" id="lx" name="rkBean.tmtzBean.lx" value="${rkBean.tmtzBean.lx}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>体型：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select zdlb="GB_TX" id="tx" name="rkBean.tmtzBean.tx" value="${rkBean.tmtzBean.tx}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>口音：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_KY" id="ky" name="rkBean.tmtzBean.ky" value="${rkBean.tmtzBean.ky}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>有无伤疤：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="ywsb" list="#{'1' : '有','0':'无'}" name="rkBean.tmtzBean.ywsb" cssClass="cps-select" onchange="changeYwsb(this.value)"/>
					</cps:tdContent>
					<cps:tdLabel>伤疤位置：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sbwz" name="rkBean.tmtzBean.sbwz" value="${rkBean.tmtzBean.sbwz}" maxlength="100"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>有无特殊标记：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="ywmxbs" list="#{'1' : '有','0':'无'}" name="rkBean.tmtzBean.ywmxbs" cssClass="cps-select" onchange="changeTstzbj(this.value)"/>
					</cps:tdContent>
				</cps:row>
				<cps:row cssClass="tstzrow">
					<cps:tdLabel>特殊特征：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZ" id="tstz" name="rkBean.tmtzBean.tstz" value="${rkBean.tmtzBean.tstz}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊标记：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTBJZ" id="tstzbj" name="rkBean.tmtzBean.tstzbj" value="${rkBean.tmtzBean.tstzbj}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊标记部位：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZBW" id="tstzbw" name="rkBean.tmtzBean.tstzbw" value="${rkBean.tmtzBean.tstzbw}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row cssClass="tstzrow">
					<cps:tdLabel>特殊标记大小：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZDX" id="tstzdx" name="rkBean.tmtzBean.tstzdx" value="${rkBean.tmtzBean.tstzdx}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊标记方位：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZFW" id="tstzfw" name="rkBean.tmtzBean.tstzfw" value="${rkBean.tmtzBean.tstzfw}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊特征数量：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZSL" id="tstzsl" name="rkBean.tmtzBean.tstzsl" value="${rkBean.tmtzBean.tstzsl}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>足长：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zc" name="rkBean.tmtzBean.zc" value="${rkBean.tmtzBean.zc}" inputType="number" maxlength="3"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>鞋号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xh" name="rkBean.tmtzBean.xh" value="${rkBean.tmtzBean.xh}" inputType="number" maxlength="2"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="bz" name="rkBean.tmtzBean.bz" value="${rkBean.tmtzBean.bz}"  maxlength="150"></cps:textfield>
					</cps:tdContent>
				</cps:row>	
				<cps:row>
					<cps:tdLabel>操作民警：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty rkBean.tmtzBean.czrxm }">
								<s:hidden id="czbs" name="rkBean.tmtzBean.czbs"></s:hidden>
								<cps:textfield id="czrxm" name="rkBean.tmtzBean.czrxm" value="${loginInfo.realname}" appendPopuBtn="true" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<s:hidden id="czbs" name="rkBean.tmtzBean.czbs"></s:hidden>
								<cps:textfield id="czrxm" name="rkBean.tmtzBean.czrxm" value="${rkBean.tmtzBean.czrxm}" appendPopuBtn="true" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
			
					<cps:tdLabel>操作单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty rkBean.tmtzBean.czdwdm }">
								<input type="hidden" name="rkBean.tmtzBean.czdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="czdwmc" name="rkBean.tmtzBean.czdwmc" readonly="true" value="${loginInfo.orgname}" ></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="rkBean.tmtzBean.czdwdm" value="${rkBean.tmtzBean.czdwdm}"/>
								<cps:textfield id="czdwmc" name="rkBean.tmtzBean.czdwmc" readonly="true" value="${rkBean.tmtzBean.czdwmc}" ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>操作时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty rkBean.tmtzBean.djsj }">
								<cps:date id="czsj" name="rkBean.tmtzBean.czsj" readOnly="true" defaultSystemDate="true"></cps:date>
							</c:when>
							<c:otherwise>
								<cps:date id="czsj" name="rkBean.tmtzBean.czsj"  value="${rkBean.tmtzBean.czsj}"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<c:if test="${empty rkBean.tmtzBean.djrxm }">
						<cps:tdLabel >登记民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="rkBean.tmtzBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent>
							<input id="djdwdm" type="hidden" name="rkBean.tmtzBean.djdwdm" value="${loginInfo.orgcode}">
							<cps:textfield id="djdwmc" name="rkBean.tmtzBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj" name="rkBean.tmtzBean.djsj"  defaultSystemDate="true"></cps:date>
						</cps:tdContent>
					</c:if>
					<c:if test="${!empty rkBean.tmtzBean.djrxm }">
						<cps:tdLabel >登记民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="rkBean.tmtzBean.djrxm" value="${rkBean.tmtzBean.djrxm}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent>
							<input id="djdwdm" type="hidden" name="rkBean.tmtzBean.djdwdm" value="${rkBean.tmtzBean.djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.tmtzBean.djdwmc" value="${rkBean.tmtzBean.djdwmc}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj" name="rkBean.tmtzBean.djsj"  value="${rkBean.tmtzBean.djsj}"></cps:date>
						</cps:tdContent>
					</c:if>
				</cps:row>
			</cps:table> 
		</cps:panel>
</form>
</creator:view>