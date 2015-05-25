<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"prefix="fn" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="lxfsxxsavetbar">
	<cps:button value="添加联系方式" onclick="addLxfs()"></cps:button>
	<cps:button value="保存" onclick="submitFormRkInfo(saveLxfsAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<c:if test="${operType!='rydaxx'}">
	<creator:panel id="lxfsxxpanel" title="人员联系方式" tbarId="lxfsxxsavetbar">
		<%-- 
		<cps:table id="slxfsxxtable">
			<cps:row>
				<cps:tdLabel width="10%">家庭电话：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="jtdh" name="rkBean.lxfsBean.jtdh" maxlength="20" isPhone="true" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">公司电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="gsdh" name="rkBean.lxfsBean.gsdh" maxlength="20" isPhone="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>传真号码：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="czhm" name="rkBean.lxfsBean.czhm" maxlength="50"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>电子邮件：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="email" name="rkBean.lxfsBean.email" maxlength="100" isEmail="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>QQ号码：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="qqhm" name="rkBean.lxfsBean.qqhm" maxlength="12" inputType="number"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>MSN账号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="ydsrgx" name="rkBean.lxfsBean.msn" maxlength="50" inputType="number"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			--%>
		<cps:table id="lxfsTable">
			<c:if test="${fn:length(rkBean.lxfsBean) > 0}">
				<c:forEach items="${rkBean.lxfsBean}" var="lxfsInfo" varStatus="s" step="1">
					<cps:row id="row${s.index}">
						<cps:tdLabel width="12%"><font color="red">*</font>联系方式类型：</cps:tdLabel>
						<cps:tdContent width="14%">
							<cps:select id="lxfslx${s.index}" name="rkBean.lxfsBean[${s.index}].lxfslx" value="${lxfsInfo.lxfslx}" zdlb="ZDY_LXFSLX"  required="true" headerKey="" headerValue=" " onchange="chageStyle(this)"></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel width="12%"><font color="red">*</font>联系方式：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="lxfs${s.index}" name="rkBean.lxfsBean[${s.index}].lxfs" value="${lxfsInfo.lxfs}" required="true"></cps:textfield>
							<input type="hidden" id="lxfsid${s.index}" name="rkBean.lxfsBean[${s.index}].id" value="${lxfsInfo.id}"/>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">备注：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="lxfsbz${s.index}" name="rkBean.lxfsBean[${s.index}].lxfsbz"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">
							<cps:button value="删除" onclick="delLxfs(this)"></cps:button>
						</cps:tdLabel>
					</cps:row>
				</c:forEach>
			</c:if>
			<c:if test="${fn:length(rkBean.lxfsBean) == 0}">
				<cps:row id="row0">
					<cps:tdLabel width="12%"><font color="red">*</font>联系方式类型：</cps:tdLabel>
					<cps:tdContent width="14%">
						<cps:select id="lxfslx0" name="rkBean.lxfsBean[0].lxfslx" value="" zdlb="ZDY_LXFSLX" headerKey="" headerValue=" "  required="true" onchange="chageStyle(this)"></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel width="12%"><font color="red">*</font>联系方式：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="lxfs0" name="rkBean.lxfsBean[0].lxfs" value="" required="true"></cps:textfield>
						<input type="hidden"  id="lxfsid0" name="rkBean.lxfsBean[0].id" value="" />
					</cps:tdContent>
					
					<cps:tdLabel width="12%">备注：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="lxfsbz0" name="rkBean.lxfsBean[0].lxfsbz" value="" ></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>
						<cps:button value="删除" onclick="delLxfs(this)"></cps:button>
					</cps:tdLabel>
				</cps:row>
			</c:if>
		</cps:table>	
		
		<cps:table>	
			<cps:row>
				<cps:tdLabel>网络身份：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="wlsf" name="rkBean.lxfsBean[0].wlsf" value="" maxlength="100" cssStyle="width:93.5%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">操作民警：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield id="czrxm" name="rkBean.lxfsBean[0].czrxm" value="${loginInfo.realname}" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" appendPopuBtn="true" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">操作单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" name="rkBean.lxfsBean[0].czdwdm" value="${loginInfo.orgcode}"/>
					<cps:textfield id="czdwmc" name="rkBean.lxfsBean[0].czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">操作时间：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:date id="czsj" name="rkBean.lxfsBean[0].czsj" readOnly="true" defaultSystemDate="true"></cps:date>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</c:if>
<c:if test="${operType=='rydaxx'}">
<div>
	<fieldset>
		<legend>人员联系方式</legend>
		<cps:table>
			<c:if test="${fn:length(rkBean.lxfsBean) > 0}">
				<c:forEach items="${rkBean.lxfsBean}" var="lxfsInfo" varStatus="s" step="1">
					<cps:row id="row${s.index}">
						<cps:tdLabel width="12%"><font color="red">*</font>联系方式类型：</cps:tdLabel>
						<cps:tdContent width="14%">
							<cps:select id="lxfslx${s.index}" name="rkBean.lxfsBean[${s.index}].lxfslx" value="${lxfsInfo.lxfslx}" zdlb="ZDY_LXFSLX"  required="true" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel width="12%"><font color="red">*</font>联系方式：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="lxfs${s.index}" name="rkBean.lxfsBean[${s.index}].lxfs" value="${lxfsInfo.lxfs}" required="true"></cps:textfield>
							<input type="hidden" id="lxfsid${s.index}" name="rkBean.lxfsBean[${s.index}].id" value="${lxfsInfo.id}"/>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">备注：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="lxfsbz${s.index}" name="rkBean.lxfsBean[${s.index}].lxfsbz"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</c:forEach>
			</c:if>
			<c:if test="${fn:length(rkBean.lxfsBean) == 0}">
				<cps:row id="row0">
					<cps:tdLabel width="12%"><font color="red">*</font>联系方式类型：</cps:tdLabel>
					<cps:tdContent width="14%">
						<cps:select id="lxfslx0" name="rkBean.lxfsBean[0].lxfslx" value="" zdlb="ZDY_LXFSLX" headerKey="" headerValue=" "  required="true"></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel width="12%"><font color="red">*</font>联系方式：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="lxfs0" name="rkBean.lxfsBean[0].lxfs" value="" required="true"></cps:textfield>
						<input type="hidden"  id="lxfsid0" name="rkBean.lxfsBean[0].id" value="" />
					</cps:tdContent>
					
					<cps:tdLabel width="12%">备注：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="lxfsbz0" name="rkBean.lxfsBean[0].lxfsbz" value="" required="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</c:if>
		</cps:table>	
		
		<cps:table>	
			<cps:row>
				<cps:tdLabel>网络身份：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="wlsf" name="rkBean.lxfsBean[0].wlsf" value="" maxlength="100" cssStyle="width:93.5%"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel >操作民警：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="czrxm" name="rkBean.lxfsBean[0].czrxm" value="${loginInfo.realname}" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" appendPopuBtn="true" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>操作单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" name="rkBean.lxfsBean[0].czdwdm" value="${loginInfo.orgcode}"/>
					<cps:textfield id="czdwmc" name="rkBean.lxfsBean[0].czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>操作时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="czsj" name="rkBean.lxfsBean[0].czsj" readOnly="true" defaultSystemDate="true"></cps:date>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
</div>
</c:if>