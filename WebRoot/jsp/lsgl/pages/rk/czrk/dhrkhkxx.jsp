<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<input type="hidden" id="czrkbh" name="rkBean.czrkBean.czrkbh" value="${rkBean.czrkBean.czrkbh}"/>
<div id="hkxx">
	<cps:table>
		<cps:row>
			<cps:tdLabel width="12%">户号：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:textfield id="hh" name="rkBean.czrkBean.hh" value="${rkBean.czrkBean.hh}" maxlength="20"  readonly="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="10%">户口类型：</cps:tdLabel>
			<cps:tdContent width="25%">
				<input type="hidden" name="rkBean.czrkBean.hklb" value="${rkBean.czrkBean.hklb}" />
				<cps:select id="hklb" zdlb="HKLB" value="${rkBean.czrkBean.hklb}" headerKey="" headerValue=" " disabled="true"></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="10%">与房主关系：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="YHZGL" id="yhzgx" name="rkBean.czrkBean.yhzgx" value="${rkBean.czrkBean.yhzgx}"  headerKey="" headerValue=" "></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>变动原因：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" name="rkBean.czrkBean.bdyy" value="${rkBean.czrkBean.qryy}" />
				<cps:select zdlb="ZDY_BDYY" id="bdyy" value="${rkBean.czrkBean.qryy}" disabled="true"></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="12%">何地迁入：</cps:tdLabel>
			<cps:tdContent width="25%">
				<input type="hidden" id="hdqr" name="rkBean.czrkBean.hdqr" value="${rkBean.czrkBean.hdqr}"/>
				 <cps:textfield id="hdqrmc" name="rkBean.czrkBean.hdqrmc" readonly="true" ></cps:textfield>
			</cps:tdContent >
			<cps:tdLabel width="10%">迁入时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="qrsj" name="rkBean.czrkBean.qrsj" value="${rkBean.czrkBean.qrsj}" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</div>
 
<div id="dzxx">
	<fieldset>
		<legend>居住地址</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>现居房屋：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<input type="hidden" id="rkfwglid"  name="rkBean.czrkBean.rkfwglid" value="${rkBean.czrkBean.rkfwglid}"/>
					<input type="hidden" id="fwid"  name="rkBean.fwxxBean.fwid" value="${rkBean.fwxxBean.fwid}"/>
					<input type="hidden" id="dzid"  name="rkBean.fwxxBean.dzid" value="${rkBean.fwxxBean.dzid}"/>
					<input type="hidden" id="sssq"  name="rkBean.fwxxBean.sssq" value="${rkBean.fwxxBean.sssq}"/>
					<input type="hidden" id="ssxzqh" name="rkBean.fwxxBean.ssxzqh" value="${rkBean.fwxxBean.ssxzqh}"/>
					<input type="hidden" id="sszrdwdm" name="rkBean.fwxxBean.sszrdwdm" value="${rkBean.fwxxBean.sszrdwdm}"/>
					<%-- 
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}" appendPopuBtn="true" required="true" cssStyle="width:97%" readonly="true" onclick="openSelectFwWin(updateSelectFwCallback,'select','1')"></cps:textfield>
					--%>
					<cps:textfield id="dzmc" name="rkBean.fwxxBean.dzmc" value="${rkBean.fwxxBean.dzmc}"  required="true" cssStyle="width:97%" readonly="true" ></cps:textfield>
					
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">住址县区：</cps:tdLabel>
				<cps:tdContent width="38%">
					<input type="hidden" id="zzssxq" name="rkBean.czrkBean.zzssxq" value="${rkBean.czrkBean.zzssxq}"/>
					<cps:textfield id="zzssxqmc" name="rkBean.czrkBean.zzssxqmc" appendPopuBtn="true" value="${rkBean.czrkBean.zzssxqmc}" readonly="true" onclick="openSelectXzqh('0',callbackZzxq)"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">住址详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zzxz" name="rkBean.czrkBean.zzxz" value="${rkBean.czrkBean.zzxz}" cssStyle="width:88%" maxlength="60"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="10%">其他住址县区：</cps:tdLabel>
				<cps:tdContent >
					<input type="hidden" id="qtzzssxq" name="rkBean.czrkBean.qtzzssxq" value="${rkBean.czrkBean.qtzzssxq}"/>
					<cps:textfield id="qtzzssxqmc" name="rkBean.czrkBean.qtzzssxqmc" value="${rkBean.czrkBean.qtzzssxqmc}" appendPopuBtn="true" onclick="openSelectXzqh('0', callbackQtzzxq)" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">住址详址：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="qtzzxz" name="rkBean.czrkBean.qtzzxz" value="${rkBean.czrkBean.qtzzxz}" cssStyle="width:88%"  maxlength="60"></cps:textfield>
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
						<c:when test="${empty rkBean.czrkBean.zrmjjh}">
							<input type="hidden" id="zrmjjh" name="rkBean.czrkBean.zrmjjh" value="${loginInfo.username }">
							<cps:textfield id="zrmjxm" name="rkBean.czrkBean.zrmjxm" value="${loginInfo.realname}" appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrmjjh" name="rkBean.czrkBean.zrmjjh" value="${rkBean.czrkBean.zrmjjh }">
							<cps:textfield id="zrmjxm" name="rkBean.czrkBean.zrmjxm" value="${rkBean.czrkBean.zrmjxm}" appendPopuBtn="true" onclick="selectZrmjWin('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">责任单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty rkBean.czrkBean.zrdwdm}">
							<input type="hidden" id="zrdwdm" name="rkBean.czrkBean.zrdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="zrdwmc" name="rkBean.czrkBean.zrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="zrdwdm" name="rkBean.czrkBean.zrdwdm" value="${rkBean.czrkBean.zrdwdm }">
							<cps:textfield id="zrdwmc" name="rkBean.czrkBean.zrdwmc" value="${rkBean.czrkBean.zrdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty rkBean.czrkBean.zrmjlxdh}">
							<cps:textfield id="zrmjlxdh" name="rkBean.czrkBean.zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="zrmjlxdh" name="rkBean.czrkBean.zrmjlxdh" value="${rkBean.czrkBean.zrmjlxdh}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>注销标识：</cps:tdLabel>
				<cps:tdContent >
					<cps:select disabled="true" id="zxbs" zdlb="ZDY_ZXBS"  name="rkBean.czrkBean.zxbs" value="${rkBean.czrkBean.zxbs}" onchange="changeZxbs(this.value)"  enableEdit="true" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel>注销时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="zxsj" disabled="true" name="rkBean.czrkBean.zxsj" value="${rkBean.czrkBean.zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zxyy" disabled="true" name="rkBean.czrkBean.zxyy" value="${rkBean.czrkBean.zxyy}"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		
		</cps:table>
	</fieldset>
</div>
