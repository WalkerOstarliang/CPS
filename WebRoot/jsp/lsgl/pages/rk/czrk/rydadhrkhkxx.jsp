<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div id="hkxx" style="float: left;width: 100%;display:none">
	<fieldset>
		<legend>户口信息</legend>
		<input type="hidden" id="czrkbh" name="rkBean.czrkBeans[0].czrkbh" value="${rkBean.czrkBeans[0].czrkbh}"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>户号：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="hh" name="rkBean.czrkBeans[0].hh" value="${rkBean.czrkBeans[0].hh}" maxlength="20"  ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>户口类型：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="hklb" zdlb="HKLB" name="rkBean.czrkBeans[0].hklb" value="${rkBean.czrkBeans[0].hklb}" headerKey="" headerValue="--请选择--" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>与房主关系：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="YHZGL" id="yhzgx" name="rkBean.czrkBeans[0].yhzgx" value="${rkBean.czrkBeans[0].yhzgx}"  headerKey="" headerValue="--请选择--"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">何地迁入：</cps:tdLabel>
				<cps:tdContent width="25%">
					<input type="hidden" id="hdqr" name="rkBean.czrkBeans[0].hdqr" value="${rkBean.czrkBeans[0].hdqr}"/>
					 <cps:textfield id="hdqrmc" name="rkBean.czrkBeans[0].hdqrmc" readonly="true"  onclick="openSelectXzqh('0',callbackHdqr)" appendPopuBtn="true"></cps:textfield>
				</cps:tdContent >
				<cps:tdLabel width="10%">迁入详址：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="hdqrxz" name="rkBean.czrkBeans[0].hdqrxz" value="${rkBean.czrkBeans[0].hdqrxz}" maxlength="75"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">迁入时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="qrsj" name="rkBean.czrkBeans[0].qrsj" value="${rkBean.czrkBeans[0].qrsj}" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>迁入原因：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:select zdlb="ZDY_BDYY" id="qryy" name="rkBean.czrkBeans[0].qryy" value="${rkBean.czrkBeans[0].qryy}" cssStyle="width:93%"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>变动区划：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="bdqh" name="rkBean.czrkBeans[0].bdqh" value="${rkBean.czrkBeans[0].bdqh}"/>
					<cps:textfield id="bdqhmc" name="rkBean.czrkBeans[0].bdqhmc" readonly="true" appendPopuBtn="true" onclick="openSelectXzqh('0', callbackBdqh)"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>变动详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="bdxz" name="rkBean.czrkBeans[0].bdxz" value="${rkBean.czrkBeans[0].bdxz}" maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>流出日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="bdsj" name="rkBean.czrkBeans[0].bdsj" value="${rkBean.czrkBeans[0].bdsj}" dateFmt="yyyy-MM-dd" readOnly="true"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>变动原因：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:select zdlb="ZDY_BDYY" id="bdyy" name="rkBean.czrkBeans[0].bdyy" value="${rkBean.czrkBeans[0].bdyy}" cssStyle="width:93%"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>监护人一姓名：</cps:tdLabel>
				<cps:tdContent colspan="2">
					<cps:textfield id="jhryxm" name="rkBean.czrkBeans[0].jhryxm" value="${rkBean.czrkBeans[0].jhryxm}" cssStyle="width:89%"></cps:textfield>
				</cps:tdContent >
				<cps:tdLabel>与监护人一关系：</cps:tdLabel>
				<cps:tdContent colspan="2">
					<cps:select id="yjhrygx" zdlb="YJHRGX" name="rkBean.czrkBeans[0].yjhrygx" value="${rkBean.czrkBeans[0].yjhrygx}" headerKey="" headerValue="--请选择--"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>监护人二姓名：</cps:tdLabel>
				<cps:tdContent colspan="2">
					<cps:textfield id="jhrexm" name="rkBean.czrkBeans[0].jhrexm" value="${rkBean.czrkBeans[0].jhrexm}" cssStyle="width:89%"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>与监护人二关系：</cps:tdLabel>
				<cps:tdContent colspan="2">
					<cps:select id="yjhregx" zdlb="YJHRGX" name="rkBean.czrkBeans[0].yjhregx" value="${rkBean.czrkBeans[0].yjhregx}" headerKey="" headerValue="--请选择--"></cps:select>
				</cps:tdContent>
			</cps:row>
			 <cps:row>
			 	<cps:tdLabel>备注：</cps:tdLabel>
			 	<cps:tdContent colspan="5">
			 		<cps:textfield id="bz" name="rkBean.czrkBeans[0].bz" value="${rkBean.czrkBeans[0].bz}" maxlength="150" cssStyle="width:93%"></cps:textfield>
			 	</cps:tdContent>
			 </cps:row>
		</cps:table>
	</fieldset>
</div>
 
<div id="dzxx">
	<fieldset>
		<legend>居住地址</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>现居房屋：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="dzmc" name="rkBean.czrkBeans[0].dzmc" value="${rkBean.czrkBeans[0].dzmc}" appendPopuBtn="true" required="true" cssStyle="width:95%" readonly="true" ></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">住址县区：</cps:tdLabel>
				<cps:tdContent width="38%">
					<input type="hidden" id="zzssxq" name="rkBean.czrkBeans[0].zzssxq" value="${rkBean.czrkBeans[0].zzssxq}"/>
					<cps:textfield id="zzssxqmc" name="rkBean.czrkBeans[0].zzssxqmc" appendPopuBtn="true" value="${rkBean.czrkBeans[0].zzssxqmc}" readonly="true" onclick="openSelectXzqh('0',callbackZzxq)"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">住址详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zzxz" name="rkBean.czrkBeans[0].zzxz" value="${rkBean.czrkBeans[0].zzxz}" cssStyle="width:88%" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">其他住址县区：</cps:tdLabel>
				<cps:tdContent >
					<input type="hidden" id="qtzzssxq" name="rkBean.czrkBeans[0].qtzzssxq" value="${rkBean.czrkBeans[0].qtzzssxq}"/>
					<cps:textfield id="qtzzssxqmc" name="rkBean.czrkBeans[0].qtzzssxqmc" value="${rkBean.czrkBeans[0].qtzzssxqmc}" appendPopuBtn="true" onclick="openSelectXzqh('0', callbackQtzzxq)" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">住址详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="qtzzxz" name="rkBean.czrkBeans[0].qtzzxz" value="${rkBean.czrkBeans[0].qtzzxz}" cssStyle="width:88%"  maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
</div>

 
<div id="zrczdjdwxx">
	<fieldset>
		<legend>责任/操作/登记单位信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>责任民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].zrmjjh}">
							<input type="hidden" id="zrmjjh" name="rkBean.czrkBeans[0].zrmjjh" value="${loginInfo.username }">
							<cps:textfield id="zrmjxm" name="rkBean.czrkBeans[0].zrmjxm" value="${loginInfo.realname}" appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrmjjh" name="rkBean.czrkBeans[0].zrmjjh" value="${rkBean.czrkBeans[0].zrmjjh }">
							<cps:textfield id="zrmjxm" name="rkBean.czrkBeans[0].zrmjxm" value="${rkBean.czrkBeans[0].zrmjxm}" appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">责任单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].zrdwdm}">
							<input type="hidden" id="zrdwdm" name="rkBean.czrkBeans[0].zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.czrkBeans[0].zrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.czrkBeans[0].zrdwdm" value="${rkBean.czrkBeans[0].zrdwdm }">
							<cps:textfield id="zrdwmc" name="rkBean.czrkBeans[0].zrdwmc" value="${rkBean.czrkBeans[0].zrdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].zrmjlxdh}">
							<cps:textfield id="zrmjlxdh" name="rkBean.czrkBeans[0].zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="zrmjlxdh" name="rkBean.czrkBeans[0].zrmjlxdh" value="${rkBean.czrkBeans[0].zrmjlxdh}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<%--
			<cps:row>
				<cps:tdLabel >操作民警：</cps:tdLabel>
				<cps:tdContent >
					<s:hidden id="czbs" name="rkBean.czrkBeans[0].czbs"></s:hidden>
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].czrxm}">
							<cps:textfield id="czrxm" name="rkBean.czrkBeans[0].czrxm" value="${loginInfo.realname}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:when>
						<c:otherwise>
							<cps:textfield id="czrxm" name="rkBean.czrkBeans[0].czrxm" value="${rkBean.czrkBeans[0].czrxm}" ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							<cps:button value="选择" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>操作单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].czdwdm}">
							<input type="hidden" name="rkBean.czrkBeans[0].czdwdm" value="${loginInfo.orgcode}"/>
							<cps:textfield id="czdwmc" name="rkBean.czrkBeans[0].czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.czrkBeans[0].czdwdm" value="${rkBean.czrkBeans[0].czdwdm}"/>
							<cps:textfield id="czdwmc" name="rkBean.czrkBeans[0].czdwmc" readonly="true" value="${rkBean.czrkBeans[0].czdwmc}"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>操作时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType=='add'}">
							<cps:date id="czsj" name="rkBean.czrkBeans[0].czsj" readOnly="true" defaultSystemDate="true"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="czsj" name="rkBean.czrkBeans[0].czsj" readOnly="true" value="${rkBean.czrkBeans[0].czsj}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel >登记民警：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].djrxm}">
							<cps:textfield id="djrxm" name="rkBean.czrkBeans[0].djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="djrxm" name="rkBean.czrkBeans[0].djrxm" value="${rkBean.czrkBeans[0].djrxm}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].djdwdm}">
							<input id="djdwdm" type="hidden" name="rkBean.czrkBeans[0].djdwdm" value="${loginInfo.orgcode}">
							<cps:textfield id="djdwmc" name="rkBean.czrkBeans[0].djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="rkBean.czrkBeans[0].djdwdm" value="${rkBean.czrkBeans[0].djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.czrkBeans[0].djdwmc" value="${rkBean.czrkBeans[0].djdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.czrkBeans[0].djsj}">
							<cps:date id="djsj" name="rkBean.czrkBeans[0].djsj"  defaultSystemDate="true"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="rkBean.czrkBeans[0].djsj" value="${rkBean.czrkBeans[0].djsj}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			 --%>
			<cps:row>
				<cps:tdLabel>注销标识：</cps:tdLabel>
				<cps:tdContent >
					<cps:select id="zxbs" zdlb="ZDY_ZXBS"  name="rkBean.czrkBeans[0].zxbs" value="${rkBean.czrkBeans[0].zxbs}" onchange="changeZxbs(this.value)"></cps:select>
				</cps:tdContent>
				<cps:tdLabel>注销时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zxsj" name="rkBean.czrkBeans[0].zxsj" value="${rkBean.czrkBeans[0].zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zxyy" name="rkBean.czrkBeans[0].zxyy" value="${rkBean.czrkBeans[0].zxyy}"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		
		</cps:table>
	</fieldset>
</div>
