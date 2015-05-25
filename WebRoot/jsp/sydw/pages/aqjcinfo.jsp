<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="安全检查信息">
<creator:Script src="/jsp/sydw/js/aqjcinfo.js"></creator:Script>
 <!-- 单位安全检查信息 -->
<creator:tbar id="aqjc_op">
	<cps:button value="保存" type="button" onclick="saveDwAqjcBean()" />
	<cps:button value="关闭" type="button" onclick="window.close();" />
</creator:tbar>

<creator:panel id="aqjc_panel" title="安全检查信息" tbarId="aqjc_op">
	<form id="dw_form">
	<div id="aqjc_div">
		<input type="hidden" id="aqjc_jlbh" name="dw.aqjc.jlbh" value="${dw.aqjc.jlbh}"/>
		<input type="hidden" id="jgbh" name="dw.aqjc.jgbh" value="${jgbh}"  />
		<input type="hidden" id="jgbh" name="dw.dwjbxx.jgbh" value="${jgbh}"  />
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>检查人员：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield name="dw.aqjc.jcryxm" onclick="openDwjcrySelect('${loginInfo.orgcode}','jcryxm')" id="jcryxm" maxlength="50" value="${loginInfo.realname}"  required="true" appendPopuBtn="true"/>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>检查单位：</cps:tdLabel>
					<cps:tdContent width="22%">
						<input type="hidden" id="jcdwdm" name="dw.aqjc.jcdwdm" value="${loginInfo.orgcode}" id="jcdwdm" />
						<cps:textfield  id="jcdwmc" name="dw.aqjc.jcdwmc" value="${loginInfo.orgname}" ondblclick="selectOrg('${loginInfo.rootOrgCode}','jcdwdm','jcdwmc')" required="true" readonly="true" onclick="selectOrg('${loginInfo.rootOrgCode}','jcdwdm','jcdwmc')" appendPopuBtn="true"/>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>检查日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="dw.aqjc.jcsj" dateFmt="yyyy-MM-dd" maxDate="sysdate" value="${dw.aqjc.jcsj}" id="jcsj" required="true"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>单位负责人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqjc.bjcdwfzr" id="bjcdwfzr" maxlength="15" value="${dw.aqjc.bjcdwfzr}" />
					</cps:tdContent>
					<cps:tdLabel>见证人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqjc.jcjzr" id="jcjzr" maxlength="15"
							value="${dw.aqjc.jcjzr}" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
					<cps:tdLabel>记录人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqjc.jcjlr" id="jcjlr" maxlength="15" value="${dw.aqjc.jcjlr}" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>检查类别：</cps:tdLabel>
					<cps:tdContent>
						<cps:checkBoxList id="aqjclb" name="dw.aqjc.jclb" value="${dw.aqjc.jclb}" zdlb="ZDY_DWJCLB"></cps:checkBoxList>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>是否发现问题：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'1':'发现','2':'未发现'}" id="sffxwt" name="dw.aqjc.sffxwt" cssClass="validate[required] cps-select" headerKey="" headerValue=" " onchange="changeAqjcSffxwt(this.value)"></s:select>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>检查内容：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jcnr" value="${dw.aqjc.jcnr}" maxlength="100" id="jcnr" required="true" cssStyle="width:96.5%;height:30px"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>检查部位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jcbw" value="${dw.aqjc.jcbw}" maxlength="50" id="jcbw" cssStyle="width:96.5%;height:30px" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>检查情况：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jcqk" id="jcqk" maxlength="200" value="${dw.aqjc.jcqk}" cssStyle="width:96.5%;height:30px" />
					</cps:tdContent>
				</cps:row>
				<cps:row id="fxwtrow">
					<cps:tdLabel>发现问题：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.fxwt" id="fxwt" maxlength="200" value="${dw.aqjc.fxwt}" cssStyle="width:96.5%;height:30px" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqjc.djrxm" value="${loginInfo.realname}" readonly="true" id="djrxm"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="dw.aqjc.djdwdm" value="${loginInfo.orgcode}" />
						<cps:textfield name="dw.aqjc.djdwmc" value="${loginInfo.orgname}" readonly="true" id="djdwmc"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="dw.aqjc.djsj" value="${dw.aqjc.djsj}" defaultSystemDate="true" readOnly="true" id="djsj"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row id="jcclqkrow_1">
					<cps:tdLabel>检查处理情况：</cps:tdLabel>
					<cps:tdContent>
						<cps:select headerKey="" headerValue=" " name="dw.aqjc.jcclqk" value="${dw.aqjc.jcclqk}" id="jcclqk" zdlb="ZAGL_CLQK" />
					</cps:tdContent>
					<cps:tdLabel>限期整改日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="jcxqzgrq" name="dw.aqjc.jcxqzgrq" value="${dw.aqjc.jcxqzgrq}" dateFmt="yyyy-MM-dd" />
					</cps:tdContent>
					<cps:tdLabel>整改情况：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="zgqk" list="#{'1':'未整改','2':'已整改'}" name="dw.aqjc.zgqk" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row  id="jcclqkrow_2">
					<cps:tdLabel>处理意见：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jcclyj" id="jcclyj" maxlength="200" value="${dw.aqjc.jcclyj}" cssStyle="width:96.5%;height:30px" />
					</cps:tdContent>
				</cps:row>
				<cps:row  id="jcclqkrow_3">
					<cps:tdLabel>被检查单位意见：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.bjcdwyj" value="${dw.aqjc.bjcdwyj}" id="bjcdwyj" cssStyle="width:96.5%;height:30px" maxlength="200"></cps:textfield>
					</cps:tdContent>
				</cps:row>

				<cps:row  id="jcclqkrow_4">
					<cps:tdLabel>整改结果：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jczgjg" id="jczgjg" maxlength="200" value="${dw.aqjc.jczgjg}" cssStyle="width:96.5%;height:30px" />
					</cps:tdContent>
				</cps:row>
				<cps:row  id="jcclqkrow_5">
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.bz" id="bz" value="${dw.aqjc.bz}" maxlength="50" cssStyle="width:96.5%;height:30px" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</div>
	</form>
</creator:panel>
<form id="aqjcqueryform">
	<input type="hidden" id="jgbhhidden" name="dwcx.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
</form>
<creator:panel id="list" title="历史安全检查">
	<cps:tableGrid url="/zagl/dw/queryDwaqjcBeans.action" 
				searchform="aqjcqueryform" 
				id="aqjcList"
				autoload="true" 
				usepager="true"
				click="aqjcRowClickCallback"
				width="99.5%"
				mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="检查内容" field="jcnr" maxlength="10"></cps:column>
			<cps:column title="检查人员" field="jcryxm"></cps:column>
			<cps:column title="检查单位" field="jcdwmc"></cps:column>
			<cps:column title="处理情况" field="jcclqkmc"></cps:column>
			<cps:column title="检查时间" field="jcsj"></cps:column>
			<cps:column title="是否发现问题" field="sffxwtms"></cps:column>
			<cps:column title="登记时间" field="djsj"></cps:column>
	</cps:tableGrid>
</creator:panel>

</creator:view>