<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="dqwlhxx">
	<input type="hidden" id="wlhrkbh" name="rkBean.wlhrkBean.wlhrkbh" value="${rkBean.wlhrkBean.wlhrkbh}"/>
	<fieldset>
		<legend>未落户信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>现居地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<input type="hidden" id="rkfwglid" name="rkBean.wlhrkBean.rkfwglid" value="${rkBean.wlhrkBean.rkfwglid}"/>
					<input type="hidden" id="fwid"  name="rkBean.fwxxBean.fwid" value="${rkBean.fwxxBean.fwid}"/>
					<input type="hidden" id="dzid"  name="rkBean.fwxxBean.dzid" value="${rkBean.fwxxBean.dzid}"/>
					<input type="hidden" id="sssq"  name="rkBean.fwxxBean.sssq" value="${rkBean.fwxxBean.sssq}"/>
					<input type="hidden" id="sszrdwdm" name="rkBean.fwxxBean.sszrdwdm" value="${rkBean.fwxxBean.sszrdwdm}"/>
					<input type="hidden" id="ssxzqh" name="rkBean.fwxxBean.ssxzqh" value="${rkBean.fwxxBean.ssxzqh}"/>
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" cssStyle="width:98%" readonly="true"></cps:textfield>
					
					<%-- 
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" required="true" cssStyle="width:98%" readonly="true" onclick="openSelectFwWin(updateSelectFwCallback,'select','3')" appendPopuBtn="true"></cps:textfield>
					--%>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>持证件种类：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select zdlb="ZDY_WLHCZJZL" id="czjzl" name="rkBean.wlhrkBean.czjzl" value="${rkBean.wlhrkBean.czjzl}" required="true" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>持证件号码：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="czjhm" name="rkBean.wlhrkBean.czjhm" value="${rkBean.wlhrkBean.czjhm}" required="true" maxlength="15"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">未落户时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="wlhqssj" name="rkBean.wlhrkBean.wlhqssj" value="${rkBean.wlhrkBean.wlhqssj}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>原户籍地区划：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="yhjdqh" name="rkBean.wlhrkBean.yhjdqh" value="${rkBean.wlhrkBean.yhjdqh}"/>
					<cps:textfield id="yhjdqhms" name="rkBean.wlhrkBean.yhjdqhms" value="${rkBean.wlhrkBean.yhjdqhms}" readonly="true" onclick="openSelectQgXzqh('0','yhjdqh','yhjdqhms')" appendPopuBtn="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>原户籍地详址：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="yhjdxz" name="rkBean.wlhrkBean.yhjdxz" value="${rkBean.wlhrkBean.yhjdxz}" maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>出生地：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="csdxz" name="rkBean.wlhrkBean.csdxz" value="${rkBean.wlhrkBean.csdxz}" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>未落户原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_WLHYY" id="wlhyy" name="rkBean.wlhrkBean.wlhyy" value="${rkBean.wlhrkBean.wlhyy}"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="bz" name="rkBean.wlhrkBean.bz" value="${rkBean.wlhrkBean.bz}" cssStyle="width:96%;" maxlength="100"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel ><font color="red">*</font>责任民警：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.wlhrkBean.zrmjjh}">
							<input type="hidden" id="zrmjjh" name="rkBean.wlhrkBean.zrmjjh" value="${loginInfo.username }">
							<cps:textfield id="zrmjxm" name="rkBean.wlhrkBean.zrmjxm" value="${loginInfo.realname}" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true" required="true" appendPopuBtn="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrmjjh" name="rkBean.wlhrkBean.zrmjjh" value="${rkBean.wlhrkBean.zrmjjh }">
							<cps:textfield id="zrmjxm" name="rkBean.wlhrkBean.zrmjxm" value="${rkBean.wlhrkBean.zrmjxm}" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true" required="true" appendPopuBtn="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel ><font color="red">*</font>责任单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.wlhrkBean.zrdwdm}">
							<input type="hidden" id="zrdwdm" name="rkBean.wlhrkBean.zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.wlhrkBean.zrdwmc" value="${loginInfo.orgname}" readonly="true" required="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.wlhrkBean.zrdwdm" value="${rkBean.wlhrkBean.zrdwdm}"/>
							<cps:textfield id="zrdwmc" name="rkBean.wlhrkBean.zrdwmc" value="${rkBean.wlhrkBean.zrdwmc}" readonly="true" required="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				
				</cps:tdContent>
				<cps:tdLabel>联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zrmjlxdh" name="rkBean.wlhrkBean.zrmjlxdh" value="${rkBean.wlhrkBean.zrmjlxdh}" minlength="7" maxlength="20" isPhone="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<%--
			<cps:row>
				<cps:tdLabel width="10%">操作民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<s:hidden id="czbs" name="rkBean.wlhrkBean.czbs"></s:hidden>
					<c:choose>
						<c:when test="${not empty rkBean.wlhrkBean.czrxm}">
							<cps:textfield id="czrxm" name="rkBean.wlhrkBean.czrxm" value="${rkBean.wlhrkBean.czrxm}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:when>
						<c:otherwise>
							<cps:textfield id="czrxm" name="rkBean.wlhrkBean.czrxm" value="${loginInfo.realname}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">操作单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.wlhrkBean.czdwdm}">
							<input type="hidden" name="rkBean.wlhrkBean.czdwdm" value="${rkBean.wlhrkBean.czdwdm}"/>
							<cps:textfield id="czdwmc" name="rkBean.wlhrkBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>						
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.wlhrkBean.czdwdm" value="${loginInfo.orgcode}"/>
							<cps:textfield id="czdwmc" name="rkBean.wlhrkBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">操作时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${not empty rkBean.wlhrkBean.czsj}">
							<cps:date id="czsj" name="rkBean.wlhrkBean.czsj" value="${rkBean.wlhrkBean.czsj}" readOnly="true" cssStyle="width:93%"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="czsj" name="rkBean.wlhrkBean.czsj" defaultSystemDate="true"  readOnly="true" cssStyle="width:93%"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			--%>
			
			 
			<cps:row>
				<cps:tdLabel>注销标识：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="zxbs" zdlb="ZDY_ZXBS"  name="rkBean.wlhrkBean.zxbs" value="${rkBean.wlhrkBean.zxbs}" onchange="changeZxbs(this.value)" disabled="true" enableEdit="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>注销时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zxsj" name="rkBean.wlhrkBean.zxsj" value="${rkBean.wlhrkBean.zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}" disabled="true"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield disabled="true" id="zxyy" name="rkBean.wlhrkBean.zxyy" value="${rkBean.wlhrkBean.zxyy}" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">登记民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.wlhrkBean.djrxm}">
							<cps:textfield id="djrxm" name="rkBean.wlhrkBean.djrxm" value="${rkBean.wlhrkBean.djrxm}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="djrxm" name="rkBean.wlhrkBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${not empty rkBean.wlhrkBean.djdwdm}">
							<input id="djdwdm" type="hidden" name="rkBean.wlhrkBean.djdwdm" value="${rkBean.wlhrkBean.djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.wlhrkBean.djdwmc" value="${rkBean.wlhrkBean.djdwmc}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input id="djdwdm" type="hidden" name="rkBean.wlhrkBean.djdwdm" value="${loginInfo.orgcode}">
							<cps:textfield id="djdwmc" name="rkBean.wlhrkBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${not empty rkBean.wlhrkBean.djsj}">
							<cps:date id="djsj" name="rkBean.wlhrkBean.djsj" value="${rkBean.wlhrkBean.djsj}" cssStyle="width:90%"  maxDate="${currentSystemDate}"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="rkBean.wlhrkBean.djsj"  defaultSystemDate="true" cssStyle="width:90%" maxDate="${currentSystemDate}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
</div>