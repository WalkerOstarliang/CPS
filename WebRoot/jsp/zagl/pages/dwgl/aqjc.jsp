<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<!-- 单位安全检查信息 -->
<creator:tbar id="aqjc_op">
	<cps:button value="保存" type="button" onclick="saveDwAqjcBean()" />
	<!--<cps:button value="打印预览" type="button" onclick="alert('功能正在开发')" />-->
	<cps:button value="关闭" type="button" onclick="window.close();" />
</creator:tbar>

<form id="aqjcqueryform">
	<input type="hidden" id="jgbhhidden" name="dwcx.jgbh" value="${jgbh}"/>
</form>
<creator:panel id="aqjc_panel" title="安全检查" tbarId="aqjc_op">
	<div id="aqjc_div">
		<input type="hidden" id="aqjc_jlbh" name="dw.aqjc.jlbh" value="${dw.aqjc.jlbh}"/>
		<input type="hidden" id="jgbh" name="dw.aqjc.jgbh" value="${jgbh}"  />
		<fieldset>
			<legend>
				检查信息
			</legend>
				<cps:table>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>检查人员：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqjc.jcryxm" onclick="openDwjcrySelect('${loginInfo.orgcode}','jcryxm')" id="jcryxm" maxlength="50" value="${loginInfo.realname}" ondblclick="orgUserSelect('${loginInfo.orgcode}',null,'jcryxm',setJcdwxx)" required="true" appendPopuBtn="true"/>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>检查单位：</cps:tdLabel>
					<cps:tdContent width="22%">
						<input type="hidden" id="jcdwdm" name="dw.aqjc.jcdwdm" value="${loginInfo.orgcode}" id="jcdwdm" />
						<cps:textfield  id="jcdwmc" name="dw.aqjc.jcdwmc" value="${loginInfo.orgname}" ondblclick="selectOrg('${loginInfo.rootOrgCode}','jcdwdm','jcdwmc')" required="true" readonly="true" onclick="selectOrg('${loginInfo.rootOrgCode}','jcdwdm','jcdwmc')" appendPopuBtn="true"/>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>检查日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="dw.aqjc.jcsj" dateFmt="yyyy-MM-dd" maxDate="sysdate" value="${dw.aqjc.jcsj}" id="jcsj" required="true"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					
					<cps:tdLabel width="13%">被检查单位负责人：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield name="dw.aqjc.bjcdwfzr" id="bjcdwfzr" maxlength="15" value="${dw.aqjc.bjcdwfzr}" />
					</cps:tdContent>
					
					<cps:tdLabel>见证人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqjc.jcjzr" id="jcjzr" maxlength="15"
							value="${dw.aqjc.jcjzr}" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>

					<cps:tdLabel>记录人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dw.aqjc.jcjlr" id="jcjlr" maxlength="15"
							value="${dw.aqjc.jcjlr}" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>检查内容：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jcnr" value="${dw.aqjc.jcnr}" maxlength="100" id="jcnr" required="true" cssStyle="width:92.9%;height:30px"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>检查部位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jcbw" value="${dw.aqjc.jcbw}" maxlength="50" id="jcbw" cssStyle="width:93%;height:30px" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>检查情况：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.jcqk" id="jcqk" maxlength="200" value="${dw.aqjc.jcqk}" cssStyle="width:92.9%;height:30px" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">发现问题：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="dw.aqjc.fxwt" id="fxwt" maxlength="200" value="${dw.aqjc.fxwt}" cssStyle="width:92.9%;height:30px" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
			</fieldset>
			
			<fieldset>
				<legend>处理情况</legend>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%">检查处理情况：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select headerKey="" headerValue="--请选择--" name="dw.aqjc.jcclqk" value="${dw.aqjc.jcclqk}" id="jcclqk" zdlb="ZAGL_CLQK" />
						</cps:tdContent>
						<cps:tdLabel width="13%">限期整改日期：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:date name="dw.aqjc.jcxqzgrq" value="${dw.aqjc.jcxqzgrq}" dateFmt="yyyy-MM-dd" id="jcxqzgrq" />
						</cps:tdContent>
						<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
						<cps:tdContent>
							&nbsp;
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel>处理意见：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" name="dw.aqjc.jcclyj" id="jcclyj" maxlength="200" value="${dw.aqjc.jcclyj}" cssStyle="width:92.9%;height:30px" />
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel>被检查单位意见：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" name="dw.aqjc.bjcdwyj" value="${dw.aqjc.bjcdwyj}" id="bjcdwyj" cssStyle="width:92.9%;height:30px" maxlength="200"></cps:textfield>
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel>整改结果：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" name="dw.aqjc.jczgjg" id="jczgjg" maxlength="200" value="${dw.aqjc.jczgjg}" cssStyle="width:92.9%;height:30px" />
						</cps:tdContent>
					</cps:row>

					<cps:row>
						<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" name="dw.aqjc.bz" id="bz" value="${dw.aqjc.bz}" maxlength="50" cssStyle="width:92.9%;height:30px" />
						</cps:tdContent>
					</cps:row>
			</cps:table>
		</fieldset>
		
		<fieldset>
			<legend>登记信息</legend>
			<cps:table>
			<cps:row>
				<cps:tdLabel width="12%">录入人：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield name="dw.aqjc.djrxm" value="${loginInfo.realname}" readonly="true" id="djrxm"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="13%">录入单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" name="dw.aqjc.djdwdm" value="${loginInfo.orgcode}" />
					<cps:textfield name="dw.aqjc.djdwmc" value="${loginInfo.orgname}" readonly="true" id="djdwmc"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel width="10%">录入时间：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:date name="dw.aqjc.djsj" value="${dw.aqjc.djsj}" defaultSystemDate="true" readOnly="true" id="djsj"></cps:date>
				</cps:tdContent>
			</cps:row>
		</cps:table>
		</fieldset>
	</div>
</creator:panel>
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
			<cps:column title="登记时间" field="djsj"></cps:column>
	</cps:tableGrid>
</creator:panel>
