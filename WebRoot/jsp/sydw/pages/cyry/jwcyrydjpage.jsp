<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/sydw/js/cyrydjpage.js"></creator:Script>
	<form id="cyrydjform">
		<input id="rybh" type="hidden" name="jwrkBean.rybh" value="${jwrkBean.rybh}">
		<input id="jwbh" type="hidden" name="jwrkBean.jwbh" value="${jwrkBean.jwbh}">
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="savebtn" value="保存" onclick="saveJwrkCyryInfo()"></cps:button>
				<cps:button value="关闭" onclick="parent.close()"></cps:button>
			</cps:tbar>
		 	<cps:panel id="jwrkjbxx" title="境外人口基本信息" scroll="false">
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
							<cps:select zdlb="GB_XB" id="xb" name="jwrkBean.xb" value="${jwrkBean.xb}" required="true" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>中文姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="xm" name="jwrkBean.zwm" value="${jwrkBean.zwm}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>出生日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="csrq" name="jwrkBean.csrq" value="${jwrkBean.csrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="lxdh" name="jwrkBean.lxdh" isPhone="true" value="${jwrkBean.lxdh}" maxlength="20" required="true" minlength="7"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<%--
					<cps:row>
						<cps:tdLabel>服务处所：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="fwcs" name="jwrkBean.fwcs" value="${jwrkBean.fwcs}" maxlength="60" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>职务：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="zw" name="jwrkBean.zw" value="${jwrkBean.zw}" maxlength="35"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>电话备注：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="lxdhbz" name="jwrkBean.lxdhbz" value="${jwrkBean.lxdhbz}" maxlength="10"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					 --%>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		<creator:panel id="cyryinfopanel" title="从业人员信息">
			<input type="hidden" name="cyryBean.cyrybh" id="cyrybh" value="${ cyryBean.cyrybh}" />
			<input type="hidden" name="cyryBean.rybh" value="${jwrkBean.rybh}" id="cyry_rybh" />
			<input type="hidden" name="cyryBean.jgbh" value="${cyryBean.jgbh}" id="cyry_jgbh" />
			<input type="hidden" name="cyryBean.sfjwry" value="0" id="sfcyry" />
			<input type="hidden" id="xzdjwq" name="cyryBean.xzdjwq" value="${cyryBean.xzdjwq}">
			<input type="hidden" id="xzdjwqmc" name="cyryBean.xzdjwqmc" value="${cyryBean.xzdjwqmc}" />
			<input type="hidden" id="jzdsqdm" name="cyryBean.jzdsqdm" value="${cyryBean.jzdsqdm}">
			<cps:table>
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>居住地派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty cyryBean.pfsj}">
								<input type="hidden" id="jzdpcsdm" name="cyryBean.jzdpcsdm" value="${cyryBean.jzdpcsdm}" />
								<cps:textfield id="jzdpcsmc" name="cyryBean.jzdpcsmc" value="${cyryBean.jzdpcsmc}" readonly="true" appendPopuBtn="true" onclick="orgSelect('${loginInfo.orgcode}','jzdpcsdm','jzdpcsmc')" required="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" id="jzdpcsdm" name="cyryBean.jzdpcsdm" value="${cyryBean.jzdpcsdm}" />
								<cps:textfield id="jzdpcsmc" name="cyryBean.jzdpcsmc" value="${cyryBean.jzdpcsmc}" readonly="true" required="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>居住地社区：</cps:tdLabel>
					<cps:tdContent>
						 <c:choose>
							<c:when test="${empty cyryBean.pfsj}">
								<cps:textfield id="jzdsqmc" name="cyryBean.jzdsqmc" value="${cyryBean.jzdsqmc}" readonly="true"  appendPopuBtn="true" onclick="openSqxxSelectWin('xzdjwq','jzdsqdm','jzdsqmc','xzdjwqmc')"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jzdsqmc" name="cyryBean.jzdsqmc" value="${cyryBean.jzdsqmc}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel><font color='red'>*</font>居住地址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xzdz" name="cyryBean.xzdz"  value="${cyryBean.xzdz}" required="true"  maxlength="100"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="11%"><font color="red">*</font>职务：</cps:tdLabel>
					<cps:tdContent width="23%">
						<cps:select zdlb="ZAGL_RY_ZW" headerKey="" headerValue=" " name="cyryBean.zw" id="zw" value="${cyryBean.zw}" required="true" />
					</cps:tdContent>
					<cps:tdLabel><font color="red" id="sjhm_tag">*</font>手机号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.sjhm" id="sjhm" required="true" isPhone="true" minlength="7" value="${cyryBean.sjhm}" maxlength="15" />
					</cps:tdContent>
					<cps:tdLabel width="11%"> 所在部门： </cps:tdLabel>
					 <cps:tdContent width="22%">
						<cps:textfield name="cyryBean.bmmc" id="bmmc" maxlength="30" value="${cyryBean.bmmc}"  />
					 </cps:tdContent>
				</cps:row>
			
				<cps:row>
					<cps:tdLabel>聘用期限(年)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.pynx" id="pynx" value="${cyryBean.pynx}" maxlength="2" inputType="integer" />
					</cps:tdContent>
					<cps:tdLabel>其他联系方式：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.qtlxdh" id="qtlxdh" value="${cyryBean.qtlxdh}" maxlength="20" />
					</cps:tdContent>
					<cps:tdLabel>奖惩情况：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="cyryBean.jcqk" id="jcqk" value="${cyryBean.jcqk}" maxlength="150"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>政审情况：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.zsqk" id="zsqk" value="${cyryBean.zsqk}" maxlength="25" />
					</cps:tdContent>
					<cps:tdLabel>员工号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.cyryygh" id="cyryygh" value="${cyryBean.cyryygh}" inputType="onlychar" maxlength="20" />
					</cps:tdContent>
					<cps:tdLabel>入职时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="rzsj" name="cyryBean.rzsj" value="${cyryBean.rzsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					 <cps:tdLabel>离职时间：</cps:tdLabel>
					 <cps:tdContent>
					 	<cps:date id="lzsj" name="cyryBean.lzsj" value="${cyryBean.lzsj}" dateFmt="yyyy-MM-dd"></cps:date>
					 </cps:tdContent>
					<cps:tdLabel>工资来源：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.gzly" id="gzly" value="${cyryBean.gzly}" cssClass="validate[maxSize[25]]" />
					</cps:tdContent>
					<cps:tdLabel>保卫措施：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.bwcs" value="${cyryBean.bwcs}" id="bwcs" maxlength="15"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>培训证书：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.pxzs" id="pxzs" inputType="onlychar" value="${cyryBean.pxzs}" maxlength="25" />
					</cps:tdContent>
					<cps:tdLabel>培训证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.pxzh" id="pxzh" value="${cyryBean.pxzh}" inputType="onlychar" maxlength="20" />
					</cps:tdContent>
					<cps:tdLabel>服务对象：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.zdfwdxlb" value="${cyryBean.pxzh}" id="fwdx" maxlength="25"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>控制措施：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.kzcs" value="${cyryBean.kzcs}" id="kzcs" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>主要贡献：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.zygx" value="${cyryBean.zygx}" id="zygx" maxlength="15"></cps:textfield>
					</cps:tdContent>
			
					<cps:tdLabel>主要问题：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="cyryBean.zywt" value="${cyryBean.zywt}" id="zywt" maxlength="15"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5" width="15%">
						<cps:textfield name="cyryBean.bz" id="bz" maxlength="250" cssStyle="width:96%;" value="${cyryBean.bz}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="11%">注销标识：</cps:tdLabel>
					<cps:tdContent width="22%">
						<s:select list="#{'0':'正常','1':'注销'}" name="cyryBean.zxbs" id="zxbs" value="cyryBean.zxbs" cssClass="cps-select" onchange="zxChange(this.value)"/>
					</cps:tdContent>
			
					<cps:tdLabel width="11%">注销日期：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:date dateFmt="yyyy-MM-dd" name="cyryBean.zxrq" id="zxrq" value="${cyryBean.zxrq}"  disabled="true"/>
					</cps:tdContent>
			
					<cps:tdLabel>注销原因</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'离职':'离职','解雇':'解雇','请辞':'请辞'}" disabled="true" id="zxyy" name="cyryBean.zxyy" headerKey="" headerValue="--请选择--" cssClass="cps-select"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>登记人姓名：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="cyryBean.djrxm" value="${cyryBean.djrxm!=null?cyryBean.djrxm : loginInfo.realname}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.djsj" value="${cyryBean.djsj!=null ? cyryBean.djsj : currentSystemDate}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="cyryBean.djdwmc" value="${cyryBean.djdwmc ? cyryBean.djdwmc : loginInfo.orgname}"></cps:textfield>
						<input type="hidden" name="cyryBean.djdwdm" value="${cyryBean.djdwdm ? cyryBean.djdwdm : loginInfo.orgcode}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<font color="red">
							注意：请认真填写居住地派出所、居住地社区、居住地详址，居住地派出所与居住地社区保存完成后，将不能再进行修改。
						</font>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>
</creator:view>