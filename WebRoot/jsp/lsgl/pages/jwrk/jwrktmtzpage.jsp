<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/jwrkinfo.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${operType != 'detail'}">
				<cps:button value="保存" onclick="saveTmtzxxBean()"></cps:button>
				<cps:button value="关闭" onclick="parent.close();"></cps:button>
			</c:if>
		</cps:tbar>
		<cps:panel id="ryjbxxpanel" title="境外人员基本信息">
			<cps:table>
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
							<cps:textfield id="ywm" name="jwrkBean.ywx" value="${jwrkBean.ywx}" required="true" maxlength="50" inputType="onlychar" readonly="true"></cps:textfield>
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
							<cps:textfield id="xm" name="jwrkBean.zwm" value="${jwrkBean.zwm}" maxlength="15" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>出生日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="csrq" name="jwrkBean.csrq" value="${jwrkBean.csrq}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="lxdh" name="jwrkBean.lxdh" isPhone="true" value="${jwrkBean.lxdh}" readonly="true" maxlength="20" required="true" minlength="7"></cps:textfield>
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
				</cps:table>
		</cps:panel>
	</cps:PanelView>
	<form id="rkxxform" method="post">
		<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${jwrkBean.rybh}">
		<input type="hidden" id="tmtzid" name="rkBean.tmtzBean.id" value="${tmtzBean.id}"/>
		<cps:panel id="tmtzxxpanel" title="体貌特征信息">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>脸型：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select zdlb="GA_LX" id="lx" name="rkBean.tmtzBean.lx" value="${tmtzBean.lx}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>体型：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select zdlb="GB_TX" id="tx" name="rkBean.tmtzBean.tx" value="${tmtzBean.tx}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>口音：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_KY" id="ky" name="rkBean.tmtzBean.ky" value="${tmtzBean.ky}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>有无伤疤：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="ywsb" zdlb="ZDY_YW" name="rkBean.tmtzBean.ywsb"  value="${tmtzBean.ywsb}" headerKey="" headerValue=" " onchange="changeYwsb(this.value)"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>伤疤位置：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sbwz" name="rkBean.tmtzBean.sbwz" value="${tmtzBean.sbwz}" maxlength="100"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>有无特殊标记：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="ywmxbs" zdlb="ZDY_YW"  name="rkBean.tmtzBean.ywmxbs" value="${tmtzBean.ywmxbs}" onchange="changeTstzbj(this.value)"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row cssClass="tstzrow">
					<cps:tdLabel>特殊特征：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZ" id="tstz" name="rkBean.tmtzBean.tstz" value="${tmtzBean.tstz}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊标记：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTBJZ" id="tstzbj" name="rkBean.tmtzBean.tstzbj" value="${tmtzBean.tstzbj}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊标记部位：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZBW" id="tstzbw" name="rkBean.tmtzBean.tstzbw" value="${tmtzBean.tstzbw}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row cssClass="tstzrow">
					<cps:tdLabel>特殊标记大小：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZDX" id="tstzdx" name="rkBean.tmtzBean.tstzdx" value="${tmtzBean.tstzdx}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊标记方位：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZFW" id="tstzfw" name="rkBean.tmtzBean.tstzfw" value="${tmtzBean.tstzfw}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>特殊特征数量：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_TSTZSL" id="tstzsl" name="rkBean.tmtzBean.tstzsl" value="${tmtzBean.tstzsl}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>足长：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zc" name="rkBean.tmtzBean.zc" value="${tmtzBean.zc}" inputType="number" maxlength="3"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>鞋号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xh" name="rkBean.tmtzBean.xh" value="${tmtzBean.xh}" inputType="number" maxlength="2"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="bz" name="rkBean.tmtzBean.bz" value="${tmtzBean.bz}"  maxlength="150"></cps:textfield>
					</cps:tdContent>
				</cps:row>	
				<cps:row>
					<cps:tdLabel>操作民警：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty tmtzBean.czrxm }">
								<s:hidden id="czbs" name="rkBean.tmtzBean.czbs"></s:hidden>
								<cps:textfield id="czrxm" name="rkBean.tmtzBean.czrxm" value="${loginInfo.realname}" appendPopuBtn="true" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<s:hidden id="czbs" name="rkBean.tmtzBean.czbs"></s:hidden>
								<cps:textfield id="czrxm" name="rkBean.tmtzBean.czrxm" value="${tmtzBean.czrxm}" appendPopuBtn="true" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
			
					<cps:tdLabel>操作单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty tmtzBean.czdwdm }">
								<input type="hidden" name="rkBean.tmtzBean.czdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="czdwmc" name="rkBean.tmtzBean.czdwmc" readonly="true" value="${loginInfo.orgname}" ></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="rkBean.tmtzBean.czdwdm" value="${tmtzBean.czdwdm}"/>
								<cps:textfield id="czdwmc" name="rkBean.tmtzBean.czdwmc" readonly="true" value="${tmtzBean.czdwmc}" ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>操作时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty tmtzBean.djsj }">
								<cps:date id="czsj" name="rkBean.tmtzBean.czsj" readOnly="true" defaultSystemDate="true"></cps:date>
							</c:when>
							<c:otherwise>
								<cps:date id="czsj" name="rkBean.tmtzBean.czsj"  value="${tmtzBean.czsj}"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<c:if test="${empty tmtzBean.djrxm }">
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
					<c:if test="${!empty tmtzBean.djrxm }">
						<cps:tdLabel >登记民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="rkBean.tmtzBean.djrxm" value="${tmtzBean.djrxm}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent>
							<input id="djdwdm" type="hidden" name="rkBean.tmtzBean.djdwdm" value="${tmtzBean.djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.tmtzBean.djdwmc" value="${tmtzBean.djdwmc}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj" name="rkBean.tmtzBean.djsj"  value="${tmtzBean.djsj}"></cps:date>
						</cps:tdContent>
					</c:if>
				</cps:row>
			</cps:table> 
		</cps:panel>
</form>
</creator:view>