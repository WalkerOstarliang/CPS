<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="志愿者登记表">
	<script type="text/javascript"
		src="${contextPath}/jsp/qzgl/js/zyzgl.js"></script>
		
	<creator:tbar id="addzyzInfotbar">
				<c:if test="${operType!='detail'}">
					<cps:button value="保&nbsp;存" onclick="save();"></cps:button>
				</c:if>
				<cps:button value="关&nbsp;闭" onclick="cl();"></cps:button>
	</creator:tbar>
	<creator:panel id="zyzjbxx" title="志愿者基本信息" tbarId="addzyzInfotbar">
		<form id="Zyzform"
			action="<c:url value='/qzgl/zyzgl/saveZyz.action'/>" method="post">
			<input type="hidden" id="bh" name="zyzdjxxBean.bh" value="${zyzdjxxBean.bh }" />
			<input type="hidden" name="operType" value="${operType }"
				id="operType" />

			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">
						<c:if test="${operType!='detail'}">
							<font color="red">*</font>
						</c:if>身份证号：</cps:tdLabel>
					<cps:tdContent width="23%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.sfzh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="sfzh" name="zyzdjxxBean.sfzh"
									value="${zyzdjxxBean.sfzh}"
									cssClass="validate[required,funcCall[checkIDC]] cps-input"
									onblur="isExistSfzhInOrg(this.value)"  maxlength="18"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>姓名：</cps:tdLabel>
					<cps:tdContent width="23%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.xm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="xm" name="zyzdjxxBean.xm"
									value="${zyzdjxxBean.xm}" cssClass="validate[required]  cps-input" maxlength="15"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>

					<cps:tdLabel width="10%">性别：</cps:tdLabel>
					<cps:tdContent width="23%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.xbmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="xb" zdlb="GB_XB" name="zyzdjxxBean.xb"
									headerKey=" " headerValue=" " value="${zyzdjxxBean.xb}" disabled="true" enableEdit="true"></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">出生日期：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.csrq}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="csrq" name="zyzdjxxBean.csrq"
									value="${zyzdjxxBean.csrq}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">家庭住址：</cps:tdLabel>
					<cps:tdContent width="25%" colspan="3">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.jtzz}" ></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jtzz" name="zyzdjxxBean.jtzz"
									value="${zyzdjxxBean.jtzz}" maxlength="100" cssClass="cps-input" cssStyle="width:88%"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				
				</cps:row>
				<cps:row>
						<cps:tdLabel width="10%">文化程度：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.whcdmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<s:select list="whcdList" id="whcd" listKey="dm" listValue="mc"
									headerKey="" headerValue=" " cssClass="cps-select"
									name="zyzdjxxBean.whcd"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>手机号码：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.lxdh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="lxdh" name="zyzdjxxBean.lxdh"
									value="${zyzdjxxBean.lxdh}"
									cssClass="validate[custom[mobile],maxSize[11]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>邮箱：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.email}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="email" name="zyzdjxxBean.email"
									value="${zyzdjxxBean.email}" cssClass="validate[custom[email],maxSize[50]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel>QQ号码：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.qqhm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="qqhm" name="zyzdjxxBean.qqhm"
									value="${zyzdjxxBean.qqhm}" cssClass="cps-input validate[maxSize[10]]" inputType="integer"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>所属派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.sspcsmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zyzdjxxBean.sspcsdm"
									value="${zyzdjxxBean.sspcsdm}" id="sspcsdm" />
								<cps:textfield name="zyzdjxxBean.sspcsmc" id="sspcsmc"
									value="${zyzdjxxBean.sspcsmc}"
									cssClass="validate[required] cps-input"
									onclick="selectOrg('${loginInfo.orgcode}','sspcsdm','sspcsmc')" readonly="true" appendPopuBtn="true">
								</cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>所属警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.ssjwqsmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="zyzdjxxBean.ssjwqsdm"
									value="${zyzdjxxBean.ssjwqsdm}" id="ssjwsdm" />
								<cps:textfield name="zyzdjxxBean.ssjwqsmc"
									value="${zyzdjxxBean.ssjwqsmc}"
									onclick="openSelectSqjwsWin()" id="ssjwsmc"
									cssClass="cps-input" readonly="true" appendPopuBtn="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${loginInfo.realname}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<input type="hidden"  id="djrjh" name="zyzdjxxBean.djrjh" value="${loginInfo.username}">
								<cps:textfield value="${loginInfo.realname}" id="djrxm"
									name="zyzdjxxBean.djrxm" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${zyzdjxxBean.djsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date value="${zyzdjxxBean.djsj}" id="djsj"
									name="zyzdjxxBean.djsj"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记单位名称：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${loginInfo.orgname}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<input  type="hidden" id="djdwdm" name="zyzdjxxBean.djdwdm" value="${loginInfo.orgcode }">
								<cps:textfield value="${loginInfo.orgname}" id="djdwdm"
									name="zyzdjxxBean.djdwmc" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>


	<creator:tbar id="zyzinfotbar">
		<cps:button value="新增" onclick="addzc('add','','')"></cps:button>
	</creator:tbar>
	<%--
		<cps:table id="zcTable">
			<tr id="zcListTh">
				<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
					专长
				</td>
				<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
					专长说明
				</td>
				<td style="background-image: url('${contextPath}/template/default/images/table_head_bg.jpg');background-position: center bottom;background-repeat: repeat-x; border-bottom: 1px solid #A5D4EE; border-right: 1px solid #A5D4EE;color: #003F87;cursor: pointer;font-size: 12px; font-weight: bold;height: 22px; text-align: center;">
					操作
				</td>
			</tr>
		</cps:table>
		--%>
	<c:choose>
		<c:when test="${operType!='detail'}">
			<cps:tableGrid
				url="/qzgl/zyzgl/queryzcList.action"
				id="queryzcxxlist" pageSize="5" title="志愿者专长信息" tbarId="zyzinfotbar"
				width="99.8%"
				searchform="Zyzform">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="zcmc" title="专长名称"></cps:column>
				<cps:column field="jysm" title="专长说明"></cps:column>
				<cps:column field="cz" title="操作"
					rowcallback="updatezcxxRowCallback"></cps:column>

			</cps:tableGrid>
		</c:when>
		<c:otherwise>
			<cps:tableGrid
				url="/qzgl/zyzgl/queryzcList.action"
				id="queryzcxxlist" pageSize="5" title="志愿者专长信息" width="99.8%"
				searchform="Zyzform">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="zcmc" title="专长名称"></cps:column>
				<cps:column field="jysm" title="专长说明"></cps:column>
			</cps:tableGrid>
		</c:otherwise>
	</c:choose>
</creator:view>