<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:panel id="czdjpanel" title="房屋出租登记信息">
	<cps:table>
		<cps:row>
			<cps:tdLabel width="11%">租住类型：</cps:tdLabel>
			<cps:tdContent width="22%">
				<cps:select zdlb="ZDY_ZZLX" id="zzlx"></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="11%">承租用途：</cps:tdLabel>
			<cps:tdContent width="22%">
				<cps:select zdlb="ZDY_CZYT" id="czyt"></cps:select>
			</cps:tdContent>
			<cps:tdLabel width="11%">管理类别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="ZDY_FWGLLB" id="gllb"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>租住人数：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zzrs" inputType="integer" maxlength="2"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>起租时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="qzrq" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>到期时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="dqrq" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>月租金：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="yzj" inputType="number" maxlength="9"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>出租间数：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="czjs" inputType="integer" maxlength="9"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>出租面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="czmj" inputType="number" maxlength="9"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>租凭备案证号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zpbazh" maxlength="9"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>受理时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="slrq" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>承租状态：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="czzt" zdlb="ZDY_CZZT"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>身份证号：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="rybh" />
				<cps:textfield id="sfzh" isSfzh="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>姓名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="xm" isSfzh="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>性别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="GB_XB" id="xb"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>身份证号：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="rybh" />
				<cps:textfield id="sfzh" isSfzh="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>姓名：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="xm" isSfzh="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>性别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="GB_XB" id="xb"></cps:select>
			</cps:tdContent>
		</cps:row>
	</cps:table>
	<fieldset>
		<legend>治安责任信息</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel>是否签订治安责任书：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="sfqdzazrs" zdlb="ZDY_ZDSF" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel>签订时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="qdsj" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>治安责任人身份证：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zazrrsfzh" maxlength="18"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>治安责任人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zazrr" maxlength="15"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zazrrlxdh" maxlength="15" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
	<fieldset>
		<legend>操作/登记信息</legend>
		<cps:table>
		<cps:row>
			<cps:tdLabel width="10%">操作民警：</cps:tdLabel>
			<cps:tdContent width="25%">
				<c:choose>
					<c:when test="${empty fwBean.czrxm}">
						<s:hidden id="czbs" name="fwBean.czbs"></s:hidden>
						<cps:textfield id="czrxm" name="fwBean.czrxm" appendPopuBtn="true" value="${loginInfo.realname}" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
					</c:when>
					<c:otherwise>
						<s:hidden id="czbs" name="fwBean.czbs"></s:hidden>
						<cps:textfield id="czrxm" name="fwBean.czrxm" appendPopuBtn="true" value="${fwBean.czrxm}" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel width="10%">操作单位：</cps:tdLabel>
			<cps:tdContent width="25%">
				<c:choose>
					<c:when test="${empty fwBean.czdwdm}">
						<s:hidden id="czdwdm" name="fwBean.czdwdm"></s:hidden>
						<input type="hidden" name="fwBean.czdwdm" value="${loginInfo.orgcode }">
						<cps:textfield id="czdwmc" name="fwBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
					</c:when>
					<c:otherwise>
						<s:hidden id="czdwdm" name="fwBean.czdwdm"></s:hidden>
						<cps:textfield id="czdwmc" name="fwBean.czdwmc" readonly="true" value="${fwBean.czdwmc}"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel width="10%">操作时间：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty fwBean.czsj}">
						<cps:date id="czsj" name="fwBean.czsj" readOnly="true" defaultSystemDate="true"></cps:date>
					</c:when>
					<c:otherwise>
						<cps:date id="czsj" name="fwBean.czsj" readOnly="true" value="${fwBean.czsj}"></cps:date>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="10%">登记民警：</cps:tdLabel>
			<cps:tdContent width="25%">
				<c:choose>
					<c:when test="${empty fwBean.djrxm}">
						<cps:textfield id="djrxm" name="fwBean.djrxm" value="${loginInfo.realname}"></cps:textfield>
					</c:when>
					<c:otherwise>
						<cps:textfield id="djrxm" name="fwBean.djrxm" value="${fwBean.djrxm}"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
			<cps:tdContent width="25%">
				<c:choose>
					<c:when test="${empty fwBean.djdwdm}">
						<input type="hidden" id="djdwdm" name="fwBean.djdwdm" value="${loginInfo.orgcode}"/>
						<cps:textfield id="djdwmc" name="fwBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="djdwdm" name="fwBean.djdwdm" value="${fwBean.djdwdm}"/>
						<cps:textfield id="djdwmc" name="fwBean.djdwmc" value="${fwBean.djdwmc}"></cps:textfield>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${empty fwBean.djsj}">
						<cps:date id="djsj" name="fwBean.djsj" defaultSystemDate="true"></cps:date>
					</c:when>
					<c:otherwise>
						<cps:date id="djsj" name="fwBean.djsj" value="${fwBean.djsj}"></cps:date>
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
	</cps:table>
	</fieldset>
</creator:panel>