<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="dqjzxx">
	<input type="hidden" id="jzbh" name="rkBean.jzrkBean.jzbh" value="${rkBean.jzrkBean.jzbh}">
	<fieldset>
		<legend>寄住信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel>寄住地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<input type="hidden" id="fwid"  name="rkBean.fwxxBean.fwid" value="${rkBean.fwxxBean.fwid}"/>
					<input type="hidden" id="dzid"  name="rkBean.fwxxBean.dzid" value="${rkBean.fwxxBean.dzid}"/>
					<input type="hidden" id="sssq"  name="rkBean.fwxxBean.sssq" value="${rkBean.fwxxBean.sssq}"/>
					<input type="hidden" id="ssxzqh" name="rkBean.fwxxBean.ssxzqh" value="${rkBean.fwxxBean.ssxzqh}"/>
					<input type="hidden" id="sszrdwdm" name="rkBean.fwxxBean.sszrdwdm" value="${rkBean.fwxxBean.sszrdwdm}"/>
					<input type="hidden" id="rkfwglid" name="rkBean.jzrkBean.rkfwglid" value="${rkBean.jzrkBean.rkfwglid}"/>
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" cssStyle="width:97%" readonly="true"></cps:textfield>
					<%-- 
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" cssStyle="width:97%" appendPopuBtn="true" readonly="true" onclick="openSelectFwWin(updateSelectFwCallback,'select','5')"></cps:textfield>
					--%>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">房主身份证号：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="hzsfzh" name="rkBean.jzrkBean.hzsfzh" value="${rkBean.fwxxBean.hzsfzh}" isSfzh="true" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">房主姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="hzxm" name="rkBean.jzrkBean.hzxm" value="${rkBean.fwxxBean.hzxm}" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>与房主关系：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="YHZGL" id="yhzgy" name="rkBean.jzrkBean.yhzgy" value="${rkBean.jzrkBean.yhzgy}" headerKey="" headerValue="--请选择--" required="true"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>寄住时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="jzsj" name="rkBean.jzrkBean.jzsj" value="${rkBean.jzrkBean.jzsj}" dateFmt="yyyy-MM-dd"  required="true" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>寄住原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_JZYY" id="jzyy" name="rkBean.jzrkBean.jzyy" value="${rkBean.jzrkBean.jzyy}" headerKey="" headerValue="--请选择--" required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" id="bz" name="rkBean.jzrkBean.bz" value="${rkBean.jzrkBean.bz}" cssStyle="width:97%;height:50px"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>责任民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.czrkBean.zrmjjh}">
							<input type="hidden" id="zrmjjh" name="rkBean.jzrkBean.zrmjjh" value="${loginInfo.username }">
							<cps:textfield id="zrmjxm" name="rkBean.jzrkBean.zrmjxm" value="${loginInfo.realname}" readonly="true" required="true" onclick="selectZrmjWin()" appendPopuBtn="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrmjjh" name="rkBean.jzrkBean.zrmjjh" value="${rkBean.jzrkBean.zrmjjh }">
							<cps:textfield id="zrmjxm" name="rkBean.jzrkBean.zrmjxm" value="${rkBean.jzrkBean.zrmjxm}" appendPopuBtn="true" onclick="selectZrmjWin()" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">责任单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.jzrkBean.zrdwdm}">
							<input type="hidden" id="zrdwdm" name="rkBean.jzrkBean.zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.jzrkBean.zrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.jzrkBean.zrdwdm" value="${rkBean.jzrkBean.zrdwdm }">
							<cps:textfield id="zrdwmc" name="rkBean.jzrkBean.zrdwmc" value="${rkBean.jzrkBean.zrdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkBean.zrmjlxdh}">
							<cps:textfield id="zrmjlxdh" name="rkBean.jzrkBean.zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="zrmjlxdh" name="rkBean.jzrkBean.zrmjlxdh" value="${rkBean.jzrkBean.zrmjlxdh}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			
			<%--
			
			<cps:row>
				<cps:tdLabel >操作民警：</cps:tdLabel>
				<cps:tdContent >
					<s:hidden id="czbs" name="rkBean.jzrkBean.czbs"></s:hidden>
					<c:choose>
						<c:when test="${empty rkBean.jzrkBean.czrxm}">
							<cps:textfield id="czrxm" name="rkBean.jzrkBean.czrxm" value="${loginInfo.realname}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:when>
						<c:otherwise>
							<cps:textfield id="czrxm" name="rkBean.jzrkBean.czrxm" value="${rkBean.jzrkBean.czrxm}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>操作单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkBean.czdwdm}">
							<input type="hidden" name="rkBean.jzrkBean.czdwdm" value="${loginInfo.orgcode}"/>
							<cps:textfield id="czdwmc" name="rkBean.jzrkBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.jzrkBean.czdwdm" value="${rkBean.jzrkBean.czdwdm}"/>
							<cps:textfield id="czdwmc" name="rkBean.jzrkBean.czdwmc" readonly="true" value="${rkBean.jzrkBean.czdwmc}"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>操作时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType=='add'}">
							<cps:date id="czsj" name="rkBean.jzrkBean.czsj" readOnly="true" defaultSystemDate="true"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="czsj" name="rkBean.jzrkBean.czsj" readOnly="true" value="${rkBean.jzrkBean.czsj}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			--%>
			
			 
			<cps:row>
				<cps:tdLabel>寄住状态：</cps:tdLabel>
				<cps:tdContent >
					<cps:select id="zxbs" zdlb="ZDY_ZXBS"  name="rkBean.jzrkBean.zxbs" value="${rkBean.jzrkBean.zxbs}" onchange="changeZxbs(this.value)" disabled="true" enableEdit="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>注销时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zxsj" disabled="true" name="rkBean.jzrkBean.zxsj" value="${rkBean.jzrkBean.zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield disabled="true" id="zxyy" name="rkBean.jzrkBean.zxyy" value="${rkBean.jzrkBean.zxyy}"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel >登记民警：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkBean.djrxm}">
							<cps:textfield id="djrxm" name="rkBean.jzrkBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="djrxm" name="rkBean.jzrkBean.djrxm" value="${rkBean.jzrkBean.djrxm}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkBean.djdwdm}">
							<input id="djdwdm" type="hidden" name="rkBean.jzrkBean.djdwdm" value="${loginInfo.orgcode}">
							<cps:textfield id="djdwmc" name="rkBean.jzrkBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.jzrkBean.djdwdm" value="${rkBean.jzrkBean.djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.jzrkBean.djdwmc" value="${rkBean.jzrkBean.djdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkBean.djsj}">
							<cps:date id="djsj" name="rkBean.jzrkBean.djsj"  defaultSystemDate="true" maxDate="${currentSystemDate}"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="rkBean.jzrkBean.djsj" value="${rkBean.jzrkBean.djsj}" maxDate="${currentSystemDate}" ></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
</div>