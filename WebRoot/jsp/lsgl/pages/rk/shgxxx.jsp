<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="gxrxxsavetbar">
	<cps:button value="保存" onclick="submitFormRkInfo(saveAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<c:if test="${operType!='rydaxx'}">
	<creator:panel id="rkshxxpanel" title="社会关系人信息" tbarId="gxrxxsavetbar">
		<input type="hidden" id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh}"/>
		<cps:table id="shgxxxtable">
			<input type="hidden" id="id" name="rkBean.gxrBean.id" value="${rkBean.gxrBean.id}"/>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>证件类型：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="zjlx" zdlb="GB_ZJZL" name="rkBean.gxrBean.zjlx" onchange="zjlxChange(this)" value="111" required="true" headerKey="" headerValue="  "></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel width="12%"><font color="red">*</font>证件号码：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="gxrsfzh" name="rkBean.gxrBean.gxrsfzh" isSfzh="true" required="true" onblur="loadShgxrkxx(this.value)"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">中文姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="gxrxm" name="rkBean.gxrBean.gxrxm" maxlength="15"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="12%">外文姓：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="wwx" name="rkBean.gxrBean.wwx" maxlength="15"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel width="12%">外文名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="wwm" name="rkBean.gxrBean.wwm" maxlength="15"></cps:textfield>
				</cps:tdContent>
			
				<cps:tdLabel width="12%"><font color="red">*</font>性别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="GB_XB" id="gxrxb" name="rkBean.gxrBean.gxrxb" required="true" cssStyle="width:95%" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>出生日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="gxrcsrq" name="rkBean.gxrBean.gxrcsrq" maxDate="sysdate" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>关系人联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="gxrlxdh" name="rkBean.gxrBean.gxrlxdh" isPhone="true" maxlength="20" minlength="7"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>社会关系：</cps:tdLabel>
				<cps:tdContent>
					 <cps:select zdlb="SHGX" id="ydsrgx" name="rkBean.gxrBean.ydsrgx" required="true" headerKey="" headerValue=" " cssStyle="width:95%"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>是否有固定职业：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="isgdzy" list="#{'1':'是','0' :'否'}" name="rkBean.gxrBean.isgdzy" cssClass="cps-select" headerKey="" headerValue=" "/>
				</cps:tdContent>
				<cps:tdLabel>现住地详址：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="gxrxzdxz" name="rkBean.gxrBean.gxrxzdxz" cssStyle="width:97%"  maxlength="60" ></cps:textfield>
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
							<cps:date id="czsj" name="rkBean.gxrBean.czsj" readOnly="true" defaultSystemDate="true" maxDate="sysdate" cssStyle="width:95%"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="czsj" name="rkBean.gxrBean.czsj" defaultSystemDate="true" maxDate="sysdate" cssStyle="width:95%"></cps:date>
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
						<cps:date id="djsj" name="rkBean.gxrBean.djsj"  defaultSystemDate="true" cssStyle="width:95%"></cps:date>
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
						<cps:date id="djsj" name="rkBean.gxrBean.djsj"  value="${rkBean.gxrBean.djsj}" maxDate="sysdate" cssStyle="width:95%"></cps:date>
					</cps:tdContent>
				</c:if>
			</cps:row>
		</cps:table>
		
		<cps:tableGrid id="gxrxxtablegrid" 
						list="${rkBean.gxrBeans}"
						width="99.6%"
						autoload="true"
						isAsynch="false"
						height="200"
						title="关系人列表"
						click="shgxxRowClick"
						usepager="false" >
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
	</creator:panel>
</c:if>
<c:if test="${operType=='rydaxx'}">
<div>
	<fieldset>
		<legend>社会关系信息</legend>
		<input type="hidden" id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh}"/>
		<cps:table id="shgxxxtable">
			<input type="hidden" id="id" name="rkBean.gxrBean.id" value="${rkBean.gxrBean.id}"/>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>证件类型：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="zjlx" zdlb="GB_ZJZL" name="rkBean.gxrBean.zjlx" onchange="zjlxChange(this)" value="111" required="true" headerKey="" headerValue="  "></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel width="12%"><font color="red">*</font>证件号码：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="gxrsfzh" name="rkBean.gxrBean.gxrsfzh" isSfzh="true" required="true" onblur="loadShgxrkxx(this.value)"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">中文姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="gxrxm" name="rkBean.gxrBean.gxrxm" maxlength="15"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="12%">外文姓：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="wwx" name="rkBean.gxrBean.wwx" maxlength="15"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel width="12%">外文名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="wwm" name="rkBean.gxrBean.wwm" maxlength="15"></cps:textfield>
				</cps:tdContent>
			
				<cps:tdLabel width="12%"><font color="red">*</font>性别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="GB_XB" id="gxrxb" name="rkBean.gxrBean.gxrxb" required="true" cssStyle="width:95%" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>出生日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="gxrcsrq" name="rkBean.gxrBean.gxrcsrq" maxDate="sysdate" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>关系人联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="gxrlxdh" name="rkBean.gxrBean.gxrlxdh" isPhone="true" maxlength="20" minlength="7"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>社会关系：</cps:tdLabel>
				<cps:tdContent>
					 <cps:select zdlb="SHGX" id="ydsrgx" name="rkBean.gxrBean.ydsrgx" required="true" headerKey="" headerValue=" " cssStyle="width:95%"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>是否有固定职业：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="isgdzy" list="#{'1':'是','0' :'否'}" name="rkBean.gxrBean.isgdzy" cssClass="cps-select" headerKey="" headerValue=" "/>
				</cps:tdContent>
				<cps:tdLabel>现住地详址：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<cps:textfield id="gxrxzdxz" name="rkBean.gxrBean.gxrxzdxz" cssStyle="width:97%"  maxlength="60" ></cps:textfield>
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
							<cps:date id="czsj" name="rkBean.gxrBean.czsj" readOnly="true" defaultSystemDate="true" maxDate="sysdate" cssStyle="width:95%"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="czsj" name="rkBean.gxrBean.czsj" defaultSystemDate="true" maxDate="sysdate" cssStyle="width:95%"></cps:date>
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
						<cps:date id="djsj" name="rkBean.gxrBean.djsj"  defaultSystemDate="true" cssStyle="width:95%"></cps:date>
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
						<cps:date id="djsj" name="rkBean.gxrBean.djsj"  value="${rkBean.gxrBean.djsj}" maxDate="sysdate" cssStyle="width:95%"></cps:date>
					</cps:tdContent>
				</c:if>
			</cps:row>
		</cps:table>
		
		<cps:tableGrid id="gxrxxtablegrid" 
						list="${rkBean.gxrBeans}"
						width="99.6%"
						autoload="true"
						isAsynch="false"
						title="关系人列表"
						click="shgxxRowClick"
						usepager="false" >
			<cps:column title="序号" isNumber="true"></cps:column>
			<cps:column field="zjlxmc" title="证件类型"></cps:column>
			<cps:column field="gxrsfzh" title="证件号码"></cps:column>
			<cps:column field="gxrxm" title="中文姓名"></cps:column>
			<cps:column field="ydsrgxms" title="关系"></cps:column>
			<cps:column field="gxrlxdh" title="联系电话"></cps:column>
			<cps:column field="isgdzyms" title="是否有固定职业"></cps:column>
			<cps:column field="gxrxzdxz" title="现住地详址" align="left"  maxlength="15"></cps:column>
		</cps:tableGrid>
		
		<cps:tableGrid id="glgxrtablegrid" 
					url="/lsgl/rk/queryGlgxrPageResult.action?sfzh=${rkBean.jbxxBean.sfzh}"
					width="99.6%"
					title="关联关系人列表"
					searchform="rkxxform"
					usepager="true">
		<cps:column title="序号" isNumber="true"></cps:column>
		<cps:column field="sfzh" title="身份证号码"></cps:column>
		<cps:column field="gxrxm" title="中文姓名"></cps:column>
		<cps:column field="ydsrgxms" title="与其关系"></cps:column>
		<cps:column field="gxrlxdh" title="联系电话"></cps:column>
		<cps:column field="gxrxzdxz" title="现住地详址" align="left"  maxlength="15"></cps:column>
	</cps:tableGrid>
	</fieldset>
</div>
</c:if>