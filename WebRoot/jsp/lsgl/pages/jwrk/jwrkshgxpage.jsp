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
					<cps:button value="保存" onclick="saveGxrShxx()"></cps:button>
					<cps:button value="关闭" onclick="parent.close()"></cps:button>
				</c:if>
			</cps:tbar>
			<cps:panel id="rkjbxx"  title="境外人员基本信息">
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
			<creator:panel id="rkshxxpanel" title="社会关系人信息">
				<cps:table id="shgxxxtable">
				<input type="hidden" id="id" name="rkBean.gxrBean.id" value="${rkBean.gxrBean.id}"/>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>证件类型：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select id="zjlx" zdlb="GB_ZJZL" name="rkBean.gxrBean.zjlx" onchange="zjlxChange(this)" value="111" required="true" headerKey="" headerValue="  "></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="gxrsfzh" name="rkBean.gxrBean.gxrsfzh" required="true" onblur="loadShgxrkxx(this.value)"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">中文姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="gxrxm" name="rkBean.gxrBean.gxrxm" maxlength="15"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>外文姓：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="wwx" name="rkBean.gxrBean.wwx" maxlength="15"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>外文名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="wwm" name="rkBean.gxrBean.wwm" maxlength="15"></cps:textfield>
					</cps:tdContent>
				
					<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="GB_XB" id="gxrxb" name="rkBean.gxrBean.gxrxb" required="true"  headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>出生日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="gxrcsrq" name="rkBean.gxrBean.gxrcsrq" maxDate="sysdate" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="gxrlxdh" name="rkBean.gxrBean.gxrlxdh" isPhone="true" maxlength="20" minlength="7"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>社会关系：</cps:tdLabel>
					<cps:tdContent>
						 <cps:select zdlb="SHGX" id="ydsrgx" name="rkBean.gxrBean.ydsrgx" required="true" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>有无固定职业：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="isgdzy" list="#{'1':'是','0' :'否'}" name="rkBean.gxrBean.isgdzy" cssClass="cps-select" headerKey="" headerValue=" "/>
					</cps:tdContent>
					<cps:tdLabel>现住地详址：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="gxrxzdxz" name="rkBean.gxrBean.gxrxzdxz" cssStyle="width:95%"  maxlength="60" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>操作民警：</cps:tdLabel>
					<cps:tdContent >
						<c:choose>
							<c:when test="${operType =='add'}">
								<s:hidden id="czbs" name="rkBean.gxrBean.czbs"></s:hidden>
								<cps:textfield id="czrxm" name="rkBean.gxrBean.czrxm" value="${loginInfo.realname}" appendPopuBtn="true" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<s:hidden id="czbs" name="rkBean.gxrBean.czbs"></s:hidden>
								<cps:textfield id="czrxm" name="rkBean.gxrBean.czrxm" value="${loginInfo.realname}" appendPopuBtn="true" onclick="openCzmjSelect('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>操作单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType =='add'}">
								<input type="hidden" name="rkBean.gxrBean.czdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="czdwmc" name="rkBean.gxrBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="rkBean.gxrBean.czdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="czdwmc" name="rkBean.gxrBean.czdwmc" readonly="true" value="${loginInfo.orgname}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>操作时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'add'}">
								<cps:date id="czsj" name="rkBean.gxrBean.czsj" readOnly="true" defaultSystemDate="true" maxDate="sysdate" ></cps:date>
							</c:when>
							<c:otherwise>
								<cps:date id="czsj" name="rkBean.gxrBean.czsj" defaultSystemDate="true" maxDate="sysdate"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<c:if test="${operType == 'add' or operType == 'update'}">
						<cps:tdLabel >登记民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="rkBean.gxrBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent>
							<input id="djdwdm" type="hidden" name="rkBean.gxrBean.djdwdm" value="${loginInfo.orgcode}">
							<cps:textfield id="djdwmc" name="rkBean.gxrBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj" name="rkBean.gxrBean.djsj"  defaultSystemDate="true"></cps:date>
						</cps:tdContent>
					</c:if>
					<c:if test="${operType == 'detail'}">
						<cps:tdLabel >登记民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="rkBean.gxrBean.djrxm" value="${rkBean.gxrBean.djrxm}" readonly="true" appendPopuBtn="true" onclick="openDjmjSelect('${loginInfo.rootOrgCode}')"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent>
							<input id="djdwdm" type="hidden" name="rkBean.gxrBean.djdwdm" value="${rkBean.gxrBean.djdwdm}">
							<cps:textfield id="djdwmc" name="rkBean.gxrBean.djdwmc" value="${rkBean.gxrBean.djdwmc}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj" name="rkBean.gxrBean.djsj"  value="${rkBean.gxrBean.djsj}" maxDate="sysdate" ></cps:date>
						</cps:tdContent>
					</c:if>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>
	<cps:tableGrid id="gxrxxtablegrid" 
					url="/lsgl/rk/queryShgxxxPageResult.action"
					width="99.6%"
					title="关系人列表"
					click="shgxxRowClick"
					searchform="rkxxform"
					usepager="false">
		<cps:column title="序号" isNumber="true"></cps:column>
		<cps:column field="cz" title="操作"></cps:column>
		<cps:column field="zjlxmc" title="证件类型"></cps:column>
		<cps:column field="gxrsfzh" title="证件号码"></cps:column>
		<cps:column field="gxrxm" title="中文姓名"></cps:column>
		<cps:column field="ydsrgxms" title="关系"></cps:column>
		<cps:column field="gxrlxdh" title="联系电话"></cps:column>
		<cps:column field="isgdzyms" title="是否有固定职业"></cps:column>
		<cps:column field="gxrxzdxz" title="现住地详址" align="left"  maxlength="15"></cps:column>
	</cps:tableGrid>
</creator:view>