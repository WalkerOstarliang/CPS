<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="dqjzxx">
	<input type="hidden" id="jzbh" name="rkBean.jzrkjzxxBeans[0].jzbh" value="${rkBean.jzrkjzxxBeans[0].jzbh}">
	<fieldset>
		<legend>寄住信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel>寄住地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="dzmc" name="rkBean.jzrkjzxxBeans[0].dzmc" value="${rkBean.jzrkjzxxBeans[0].dzmc}" required="true" cssStyle="width:88%" readonly="true" onclick="openSelectFwWin(updateSelectFwCallback,'select','5')"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">房主身份证号：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="hzsfzh" name="rkBean.jzrkjzxxBeans[0].hzsfzh" value="${rkBean.jzrkjzxxBeans[0].hzsfzh}" isSfzh="true" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">房主姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="hzxm" name="rkBean.jzrkjzxxBeans[0].hzxm" value="${rkBean.jzrkjzxxBeans[0].hzxm}" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>与房主关系：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_LDRK_YHZGX" id="yhzgy" name="rkBean.jzrkjzxxBeans[0].yhzgy" value="${rkBean.jzrkjzxxBeans[0].yhzgy}" headerKey="" headerValue="--请选择--" required="true"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>寄住时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="jzsj" name="rkBean.jzrkjzxxBeans[0].jzsj" value="${rkBean.jzrkjzxxBeans[0].jzsj}" dateFmt="yyyy-MM-dd"  required="true"></cps:date>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>寄住原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_JZYY" id="jzyy" name="rkBean.jzrkjzxxBeans[0].jzyy" value="${rkBean.jzrkjzxxBeans[0].jzyy}" headerKey="" headerValue="--请选择--" required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" id="bz" name="rkBean.jzrkjzxxBeans[0].bz" value="${rkBean.jzrkjzxxBeans[0].bz}" cssStyle="width:94%;height:50px"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>责任民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.czrkBean.zrmjjh}">
							<input type="hidden" id="zrmjjh" name="rkBean.jzrkjzxxBeans[0].zrmjjh" value="${loginInfo.username }">
							<cps:textfield id="zrmjxm" name="rkBean.jzrkjzxxBeans[0].zrmjxm" value="${loginInfo.realname}" readonly="true" required="true" onclick="selectZrmjWin()" appendPopuBtn="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrmjjh" name="rkBean.jzrkjzxxBeans[0].zrmjjh" value="${rkBean.jzrkjzxxBeans[0].zrmjjh }">
							<cps:textfield id="zrmjxm" name="rkBean.jzrkjzxxBeans[0].zrmjxm" value="${rkBean.jzrkjzxxBeans[0].zrmjxm}" appendPopuBtn="true" onclick="selectZrmjWin()" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">责任单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.jzrkjzxxBeans[0].zrdwdm}">
							<input type="hidden" id="zrdwdm" name="rkBean.jzrkjzxxBeans[0].zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.jzrkjzxxBeans[0].zrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.jzrkjzxxBeans[0].zrdwdm" value="${rkBean.jzrkjzxxBeans[0].zrdwdm }">
							<cps:textfield id="zrdwmc" name="rkBean.jzrkjzxxBeans[0].zrdwmc" value="${rkBean.jzrkjzxxBeans[0].zrdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkjzxxBeans[0].zrmjlxdh}">
							<cps:textfield id="zrmjlxdh" name="rkBean.jzrkjzxxBeans[0].zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="zrmjlxdh" name="rkBean.jzrkjzxxBeans[0].zrmjlxdh" value="${rkBean.jzrkjzxxBeans[0].zrmjlxdh}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			
			<%--
			
			<cps:row>
				<cps:tdLabel >操作民警：</cps:tdLabel>
				<cps:tdContent >
					<s:hidden id="czbs" name="rkBean.jzrkjzxxBeans[0].czbs"></s:hidden>
					<c:choose>
						<c:when test="${empty rkBean.jzrkjzxxBeans[0].czrxm}">
							<cps:textfield id="czrxm" name="rkBean.jzrkjzxxBeans[0].czrxm" value="${loginInfo.realname}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:when>
						<c:otherwise>
							<cps:textfield id="czrxm" name="rkBean.jzrkjzxxBeans[0].czrxm" value="${rkBean.jzrkjzxxBeans[0].czrxm}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>操作单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkjzxxBeans[0].czdwdm}">
							<input type="hidden" name="rkBean.jzrkjzxxBeans[0].czdwdm" value="${loginInfo.orgcode}"/>
							<cps:textfield id="czdwmc" name="rkBean.jzrkjzxxBeans[0].czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.jzrkjzxxBeans[0].czdwdm" value="${rkBean.jzrkjzxxBeans[0].czdwdm}"/>
							<cps:textfield id="czdwmc" name="rkBean.jzrkjzxxBeans[0].czdwmc" readonly="true" value="${rkBean.jzrkjzxxBeans[0].czdwmc}"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>操作时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType=='add'}">
							<cps:date id="czsj" name="rkBean.jzrkjzxxBeans[0].czsj" readOnly="true" defaultSystemDate="true"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="czsj" name="rkBean.jzrkjzxxBeans[0].czsj" readOnly="true" value="${rkBean.jzrkjzxxBeans[0].czsj}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel >登记民警：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkjzxxBeans[0].djrxm}">
							<cps:textfield id="djrxm" name="rkBean.jzrkjzxxBeans[0].djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="djrxm" name="rkBean.jzrkjzxxBeans[0].djrxm" value="${rkBean.jzrkjzxxBeans[0].djrxm}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkjzxxBeans[0].djdwdm}">
							<input id="djdwdm" type="hidden" name="rkBean.jzrkjzxxBeans[0].djdwdm" value="${loginInfo.orgcode}">
							<cps:textfield id="djdwmc" name="rkBean.jzrkjzxxBeans[0].djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.jzrkjzxxBeans[0].djdwdm" value="${rkBean.jzrkjzxxBeans[0].djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.jzrkjzxxBeans[0].djdwmc" value="${rkBean.jzrkjzxxBeans[0].djdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.jzrkjzxxBeans[0].djsj}">
							<cps:date id="djsj" name="rkBean.jzrkjzxxBeans[0].djsj"  defaultSystemDate="true"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="rkBean.jzrkjzxxBeans[0].djsj" value="${rkBean.jzrkjzxxBeans[0].djsj}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			 --%>
			<cps:row>
				<cps:tdLabel>寄住状态：</cps:tdLabel>
				<cps:tdContent >
					<s:select id="zxbs" list="#{'0':'正常','1' : '注销'}" name="rkBean.jzrkjzxxBeans[0].zxbs" cssClass="cps-select" onchange="changeZxbs(this.value)"/>
				</cps:tdContent>
				<cps:tdLabel>注销时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zxsj" name="rkBean.jzrkjzxxBeans[0].zxsj" value="${rkBean.jzrkjzxxBeans[0].zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zxyy" name="rkBean.jzrkjzxxBeans[0].zxyy" value="${rkBean.jzrkjzxxBeans[0].zxyy}"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
</div>