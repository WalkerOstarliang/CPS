<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/jwrklist.js"></creator:Script>
	<creator:box>
		<form id="queryForm">
		 	<input type="hidden" name="queryBean.rybh" value="${queryBean.rybh}">
		</form>
		<cps:tableGrid id="rktablegrid"  
				title="境外人员列表"
				url="/lsgl/jwrk/queryJwrkLsjzPageResultInfo.action" 
				searchform="queryForm"
				click="clickRowSetValue"
				mutilSelect="true"
				autoload="true"
				width="99.8%">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="gjms" title="国籍" ></cps:column>
				<cps:column field="ywx" title="英文姓" maxlength="5"></cps:column>
				<cps:column field="ywm" title="英文名" maxlength="5"></cps:column>
				<cps:column field="zjzlms" title="证件种类" ></cps:column>
				<cps:column field="zjhm" title="证件号码" maxlength="7"></cps:column>
				<cps:column field="xbms" title="性别"></cps:column>
				<cps:column field="csrq" title="出生日期"></cps:column>
				<cps:column field="xzzxz" title="居住地址" align="left" maxlength="8"></cps:column>
				<cps:column field="lxdh" title="联系电话" maxlength="7"></cps:column>
				<cps:column field="zxbsms" title="注销状态"></cps:column>	
		</cps:tableGrid>
		<div>
			<cps:table>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>居住地址：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="xzzxz" name="jwrkBean.dzmc" value="${jwrkBean.dzmc}" required="true" cssStyle="width:97%" readonly="true" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" name="jwrkBean.gj" value="${jwrkBean.gj }">
						<cps:select zdlb="GB_GJ" id="gj"  value="${jwrkBean.gj}" required="true" headerKey="" headerValue=" " disabled="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" name="jwrkBean.zjzl" value="${jwrkBean.zjzl}">
						<cps:select zdlb="GB_ZJZL" id="zjzl" value="${jwrkBean.zjzl}" required="true" headerKey="" headerValue=" " disabled="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zjhm" name="jwrkBean.zjhm" value="${jwrkBean.zjhm}" required="true" maxlength="30" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>英文姓：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="ywx" name="jwrkBean.ywx" value="${jwrkBean.ywx}" required="true" maxlength="50" inputType="onlychar" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>英文名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="ywm" name="jwrkBean.ywm" value="${jwrkBean.ywm}" required="true" maxlength="50" inputType="onlychar" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="jwrkBean.xb" value="${jwrkBean.xb}">
						<cps:select zdlb="GB_XB" id="xb" value="${jwrkBean.xb}" required="true" headerKey="" headerValue=" " disabled="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>中文姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zwm" name="jwrkBean.zwm" value="${jwrkBean.zwm}" maxlength="15" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>出生日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="csrq" name="jwrkBean.csrq" value="${jwrkBean.csrq}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdh" name="jwrkBean.lxdh" isPhone="true" value="${jwrkBean.lxdh}" maxlength="20" required="true" minlength="7" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>服务处所：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fwcs" name="jwrkBean.fwcs" value="${jwrkBean.fwcs}" maxlength="60" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>职务：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zw" name="jwrkBean.zw" value="${jwrkBean.zw}" maxlength="35" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>电话备注：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdhbz" name="jwrkBean.lxdhbz" value="${jwrkBean.lxdhbz}" maxlength="10" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>签证类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GA_QZZZL" id="qzzl" name="jwrkBean.qzzl" headerKey="" headerValue=" " value="${jwrkBean.qzzl}" disabled="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>签证机关：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="qzjg" name="jwrkBean.qzjg" value="${jwrkBean.qzjg}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>签发日期：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="qfrq" name="jwrkBean.qfrq" value="${jwrkBean.qfrq}" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				 <cps:row>
					<cps:tdLabel>停留有效期：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="tlyxq" name="jwrkBean.tlyxq" value="${jwrkBean.tlyxq}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>停留事由：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TLSY" id="tlsy" name="jwrkBean.tlsy" value="${jwrkBean.tlsy}" headerKey="" headerValue=" " disabled="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>居住类型：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="jwrylx" list="#{'0':'常住','1' : '临住'}" name="jwrkBean.jwrylx" cssClass="cps-select" disabled="true"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="bz" name="jwrkBean.bz" value="${jwrkBean.bz}" cssStyle="width:94%" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>警务通登记：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="sfjwtdjms" name="jwrkBean.sfjwtdjms" value="${jwrkBean.sfjwtdjms}"  readonly="true"></cps:textfield>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">登记民警：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${not empty jwrkBean.djrxm}">
								<cps:textfield id="djrxm" name="jwrkBean.djrxm" value="${jwrkBean.djrxm}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="djrxm" name="jwrkBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${not empty jwrkBean.djdwdm}">
								<input id="djdwdm" type="hidden" name="jwrkBean.djdwdm" value="${jwrkBean.djdwdm}">
								<cps:textfield id="djdwmc" name="jwrkBean.djdwmc" value="${jwrkBean.djdwmc}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input id="djdwdm" type="hidden" name="jwrkBean.djdwdm" value="${loginInfo.orgcode}">
								<cps:textfield id="djdwmc" name="jwrkBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${not empty jwrkBean.djsj}">
								<cps:textfield id="djsj" name="jwrkBean.djsj" value="${jwrkBean.djsj}"  readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="djsj" name="jwrkBean.djsj" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</div>
	</creator:box>
</creator:view>