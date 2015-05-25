<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="dqjwrkjzxx">
	<input type="hidden" id="jwbh" name="rkBean.jwrkBean.jwbh" value="${rkBean.jwrkBean.jwbh}"/>
	<fieldset>
		<legend>居住信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>居住地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<input type="hidden" id="fwid"  name="rkBean.fwxxBean.fwid" value="${rkBean.fwxxBean.fwid}"/>
					<input type="hidden" id="dzid"  name="rkBean.fwxxBean.dzid" value="${rkBean.fwxxBean.dzid}"/>
					<input type="hidden" id="sssq"  name="rkBean.fwxxBean.sssq" value="${rkBean.fwxxBean.sssq}"/>
					<input type="hidden" id="ssxzqh" name="rkBean.fwxxBean.ssxzqh" value="${rkBean.fwxxBean.ssxzqh}"/>
					<input type="hidden" id="sszrdwdm" name="rkBean.fwxxBean.sszrdwdm" value="${rkBean.fwxxBean.sszrdwdm}"/>
					<input type="hidden" id="rkfwglid" name="rkBean.jwrkBean.rkfwglid" value="${rkBean.jwrkBean.rkfwglid}"/>
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" appendPopuBtn="true" cssStyle="width:97%" readonly="true" onclick="openSelectFwWin(updateSelectFwCallback,'select','4')"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>签证类型：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="GA_QZZZL" id="qzzl" name="rkBean.jwrkBean.qzzl" headerKey="" headerValue=" " value="${rkBean.jwrkBean.qzzl}"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>签证机关：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="qzjg" name="rkBean.jwrkBean.qzjg" value="${rkBean.jwrkBean.qzjg}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>签发日期：</cps:tdLabel>
				<cps:tdContent >
					<cps:date id="qfrq" name="rkBean.jwrkBean.qfrq" value="${rkBean.jwrkBean.qfrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}" ></cps:date>
				</cps:tdContent>
			</cps:row>
			 <cps:row>
				<cps:tdLabel>停留有效期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="tlyxq" name="rkBean.jwrkBean.tlyxq" value="${rkBean.jwrkBean.tlyxq}" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>停留事由：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_TLSY" id="tlsy" name="rkBean.jwrkBean.tlsy" value="${rkBean.jwrkBean.tlsy}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>居住类型：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="jwrylx" list="#{'0':'常住','1' : '临住'}" name="rkBean.jwrkBean.jwrylx" cssClass="cps-select" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="bz" name="rkBean.jwrkBean.bz" value="${rkBean.jwrkBean.bz}" cssStyle="width:97%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%"><font color="red">*</font>责任民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.wlhrkBean.zrmjjh}">
							<input type="hidden" id="zrmjjh" name="rkBean.jwrkBean.zrmjjh" value="${rkBean.jwrkBean.zrmjjh }">
							<cps:textfield id="zrmjxm" name="rkBean.jwrkBean.zrmjxm" value="${rkBean.jwrkBean.zrmjxm}" appendPopuBtn="true" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrmjjh" name="rkBean.jwrkBean.zrmjjh" value="${loginInfo.username }">
							<cps:textfield id="zrmjxm" name="rkBean.jwrkBean.zrmjxm" value="${loginInfo.realname}" appendPopuBtn="true" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>责任单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.zrdwdm}">
							<input type="hidden" id="zrdwdm" name="rkBean.jwrkBean.zrdwdm" value="${rkBean.jwrkBean.zrdwdm }"/>
							<cps:textfield id="zrdwmc" name="rkBean.jwrkBean.zrdwmc" value="${rkBean.jwrkBean.zrdwmc}" readonly="true" required="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.jwrkBean.zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.jwrkBean.zrdwmc" value="${loginInfo.orgname}" readonly="true" required="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.zrmjlxdh}">
							<cps:textfield id="zrmjlxdh" name="rkBean.jwrkBean.zrmjlxdh" value="${rkBean.jwrkBean.zrmjlxdh}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="zrmjlxdh" name="rkBean.jwrkBean.zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<%--
			<cps:row>
				<cps:tdLabel width="10%">操作民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<s:hidden id="czbs" name="rkBean.jwrkBean.czbs"></s:hidden>
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.czrxm}">
							<cps:textfield id="czrxm" name="rkBean.jwrkBean.czrxm" value="${rkBean.jwrkBean.czrxm}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:when>
						<c:otherwise>
							<cps:textfield id="czrxm" name="rkBean.jwrkBean.czrxm" value="${loginInfo.realname}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">操作单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.czdwdm}">
							<input type="hidden" name="rkBean.jwrkBean.czdwdm" value="${rkBean.jwrkBean.czdwdm}"/>
							<cps:textfield id="czdwmc" name="rkBean.jwrkBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>						
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.jwrkBean.czdwdm" value="${loginInfo.orgcode}"/>
							<cps:textfield id="czdwmc" name="rkBean.jwrkBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">操作时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.czsj}">
							<cps:date id="czsj" name="rkBean.jwrkBean.czsj" value="${rkBean.jwrkBean.czsj}" readOnly="true" cssStyle="width:93%"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="czsj" name="rkBean.jwrkBean.czsj" defaultSystemDate="true"  readOnly="true" cssStyle="width:93%"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			 --%>
			
			<cps:row>
				<cps:tdLabel width="10%">注销标识：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="zxbs" zdlb="ZDY_ZXBS"  name="rkBean.jwrkBean.zxbs" value="${rkBean.jwrkBean.zxbs}" onchange="changeZxbs(this.value)" disabled="true" enableEdit="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%">注销时间：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:date id="zxsj" disabled="true" name="rkBean.jwrkBean.zxsj" value="${rkBean.jwrkBean.zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield disabled="true" id="zxyy" name="rkBean.jwrkBean.zxyy" value="${rkBean.jwrkBean.zxyy}" ></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">登记民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.djrxm}">
							<cps:textfield id="djrxm" name="rkBean.jwrkBean.djrxm" value="${rkBean.jwrkBean.djrxm}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="djrxm" name="rkBean.jwrkBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.djdwdm}">
							<input id="djdwdm" type="hidden" name="rkBean.jwrkBean.djdwdm" value="${rkBean.jwrkBean.djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.jwrkBean.djdwmc" value="${rkBean.jwrkBean.djdwmc}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input id="djdwdm" type="hidden" name="rkBean.jwrkBean.djdwdm" value="${loginInfo.orgcode}">
							<cps:textfield id="djdwmc" name="rkBean.jwrkBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${not empty rkBean.jwrkBean.djsj}">
							<cps:date id="djsj" name="rkBean.jwrkBean.djsj" value="${rkBean.jwrkBean.djsj}"  maxDate="${currentSystemDate}" readOnly="true"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="rkBean.jwrkBean.djsj"  defaultSystemDate="true"  maxDate="${currentSystemDate}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
</div>