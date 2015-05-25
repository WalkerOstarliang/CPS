<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="tbar">
	<cps:button value="保存" onclick="submitFormZdryGzdxDetailInfo();"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow();"></cps:button>
</creator:tbar>
<creator:panel id="xsbxPanel" tbarId="tbar" title="吸毒人员尿检信息">

	<cps:tableGrid id="zdrygzdxActivityList"
		click="rowcallbackCzZdryGzdxActivity"
		url="/lsgl/zdry/queryZdryXdryhdListPage.action" autoload="true"
		width="98%" searchform="zdrygzdxActivityForm">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="chrq" title="查获日期"></cps:column>
		<cps:column field="chdqmc" title="查获地区"></cps:column>
		<cps:column field="xdcs" title="吸毒场所"></cps:column>
		<cps:column field="njrq" title="尿检日期"></cps:column>
		<cps:column field="njjg" title="尿检地区"></cps:column>
		<cps:column field="djrxm" title="登记人姓名"></cps:column>
	</cps:tableGrid>
	<div id="zdrygzdxActivityDiv">
		<form id="zdrygzdxActivityForm" method="post">
		<input type="hidden" id="xdrybh" name="zdryBean.xdchNjxxBean.xdrybh " value="${zdryBean.xdryBean.xdrybh }" />
			<cps:table>
				<cps:row id="clear_row1">
				<input type="hidden" id="id" name="zdryBean.xdchNjxxBean.id" value="${zdryBean.xdchNjxxBean.id }" />

					<cps:tdLabel width="10%"><font color="red">*</font>查获日期：</cps:tdLabel>
					<cps:tdContent width="24%">
						<cps:date id="chrq" name="zdryBean.xdchNjxxBean.chrq"
							value="${zdryBean.xdchNjxxBean.chrq}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>查获地区：</cps:tdLabel>
					<cps:tdContent width="24%">
						<input type="hidden" id="chdq" name="zdryBean.xdchNjxxBean.chdq" value="${zdryBean.xdchNjxxBean.chdq }"/>
						<cps:textfield id="chdqmc" name="zdryBean.xdchNjxxBean.chdqmc"
							value="${zdryBean.xdchNjxxBean.chdq}" ondblclick="openSelectXzqh('0',callbackChdq)" required="true" readonly="true"></cps:textfield>
						<cps:button value="选择" onclick="openSelectXzqh('0',callbackChdq)"></cps:button>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>查获地点：</cps:tdLabel>
					<cps:tdContent width="24%">
						<cps:textfield id="chdd" name="zdryBean.xdchNjxxBean.chdd"
							value="${zdryBean.xdchNjxxBean.chdd}" maxlength="60" required="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>

				<cps:row id="clear_row2">

					<cps:tdLabel><font color="red">*</font>吸毒场所：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xdcs" name="zdryBean.xdchNjxxBean.xdcs"
							value="${zdryBean.xdchNjxxBean.xdcs}" maxlength="60" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>毒品来源：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="dply" name="zdryBean.xdchNjxxBean.dply"
							value="${zdryBean.xdchNjxxBean.dply}" headerValue="--请选择--"
							zdlb="GA_DPLY"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>毒品种类：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="dpzl" name="zdryBean.xdchNjxxBean.dpzl"
							value="${zdryBean.xdchNjxxBean.dpzl}" headerValue="--请选择--"
							zdlb="GA_DPZL"></cps:select>
					</cps:tdContent>

				</cps:row>

				<cps:row id="clear_row3">
					<cps:tdLabel><font color="red">*</font>查获单位名称：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="chdwdm"
							name="zdryBean.xdchNjxxBean.chdwdm"
							value="${zdryBean.xdchNjxxBean.chdwdm }" />
						<cps:textfield id="chdwmc" value="${zdryBean.xdchNjxxBean.chdwmc}"
							name="zdryBean.xdchNjxxBean.chdwmc" readonly="true" ondblclick="openFwDwSelect('430000000000',callbackChdwdm)" required="true"></cps:textfield>
						<cps:button value="选择" onclick="openFwDwSelect('430000000000',callbackChdwdm)"></cps:button>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>复吸次数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fxcs" value="${zdryBean.xdchNjxxBean.fxcs}"
							name="zdryBean.xdchNjxxBean.fxcs" inputType="number" required="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>尿检日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="njrq" name="zdryBean.xdchNjxxBean.njrq"
							value="${zdryBean.xdchNjxxBean.njrq}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>

				</cps:row>
				<cps:row id="clear_row4">
					<cps:tdLabel>尿检地区：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="njdq" name="zdryBean.xdchNjxxBean.njdq" value="${zdryBean.xdchNjxxBean.njdq }"/>
						<cps:textfield id="njdqmc" value="${zdryBean.xdchNjxxBean.njdqmc}"
							name="zdryBean.xdchNjxxBean.njdqmc" ondblclick="openSelectXzqh('0',callbackNjdq)" readonly="true"></cps:textfield>
						<cps:button value="选择" onclick="openSelectXzqh('0',callbackNjdq)"></cps:button>
					</cps:tdContent>
					<cps:tdLabel>尿检结果：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="njjg" name="zdryBean.xdchNjxxBean.njjg"
							value="${zdryBean.xdchNjxxBean.njjg}" headerValue="--请选择--"
							zdlb="ZDRY_XDRY_NJJG"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>尿检地点：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="njdd" name="zdryBean.xdchNjxxBean.njdd"
							value="${zdryBean.xdchNjxxBean.njdd}" maxlength="60"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row7">
					<cps:tdLabel>违法事实：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<s:textarea id="wfss" name="zdryBean.xdchNjxxBean.wfss" rows="3"
							cssStyle="width:93%" cssClass="validate[maxSize[250]]"></s:textarea>
					</cps:tdContent>
				</cps:row>
				<cps:row >
					<cps:tdLabel>操作人姓名:</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czrxm" name="zdryBean.xdchNjxxBean.czrxm"
							value="${loginInfo.realname}"
							ondblclick="openCzmjSelect('${loginInfo.rootOrgCode}')"
							readonly="true"></cps:textfield>
						<cps:button value="选择"
							onclick="openCzmjSelect('${loginInfo.rootOrgCode}')"></cps:button>
					</cps:tdContent>
					<cps:tdLabel>操作单位名称:</cps:tdLabel>
					<cps:tdContent>
						<input id="czdwdm" name="zdryBean.xdchNjxxBean.czdwdm"
							value="${loginInfo.orgcode}" type="hidden" />
						<cps:textfield id="czdwmc" name="zdryBean.xdchNjxxBean.czdwmc"
							readonly="true" value="${loginInfo.orgname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>操作时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="czsj" name="zdryBean.xdchNjxxBean.czsj"
							readOnly="true" defaultSystemDate="true"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row >
					<cps:tdLabel>登记人姓名:</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" name="zdryBean.xdchNjxxBean.djrxm"
							value="${loginInfo.realname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位名称:</cps:tdLabel>
					<cps:tdContent>
						<input id="djdwdm" name="zdryBean.xdchNjxxBean.djdwdm"
							value="${loginInfo.orgcode}" type="hidden" />
						<cps:textfield id="djdwmc" name="zdryBean.xdchNjxxBean.djdwmc"
							value="${loginInfo.orgname}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj" name="zdryBean.xdchNjxxBean.djsj"
							defaultSystemDate="true"></cps:date>
					</cps:tdContent>
				</cps:row>


			</cps:table>
		</form>
	</div>
</creator:panel>