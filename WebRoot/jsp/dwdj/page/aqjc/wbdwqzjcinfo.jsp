<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>


<creator:view title="安全检查信息">
	<creator:Script src="/jsp/dwdj/js/wbdwaqjc.js"></creator:Script>
	<div id="_div">
		<creator:tbar id="wbdw_op">
			<cps:button value="清空" type="button" onclick="resetForm()"></cps:button>
			<cps:button value="保存" type="button" onclick="submitWbdwForm()"></cps:button>
			<cps:button value="关闭" type="button" onclick="window.close()"></cps:button>
		</creator:tbar>

		<creator:panel id="wbdw_panel" title="单位检查" tbarId="wbdw_op">
			<form id="wbdwform"
				action="<c:url value='/sydw/wbdwgl/submitWbdwQzjc.action'/>"
				method="post">
				<input type="hidden" id="opertype" value="${operType}" />
				<input type="hidden" id="id" name="qzjcBean.id"
					value="${qzjcBean.id}" />
				<input type="hidden" id="jgbh" name="qzjcBean.jgbh"
					value="${qzjcBean.jgbh}" />
				<cps:table>
					<cps:row>
						<cps:tdLabel>枪支管理部门<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield required="true" maxlength="50"
								cssStyle="width:96%" id="qzglbm" name="qzjcBean.qzglbm"
								value="${qzjcBean.qzglbm}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>主管领导姓名<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield required="true" maxlength="15"
								cssStyle="width:96%" id="zgldxm" name="qzjcBean.zgldxm"
								value="${qzjcBean.zgldxm}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>移动电话<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield required="true" isPhone="true"
								cssStyle="width:96%" id="yddh" name="qzjcBean.yddh"
								value="${qzjcBean.yddh}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="2">持枪证办理情况</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">现有总计（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">原老持枪证（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">新办持枪证（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">正在办理（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">尚需申办持枪证（人）<font
								color='red'>*</font>
						</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="cqzxyzj" name="qzjcBean.cqzxyzj"
								value="${qzjcBean.cqzxyzj}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="ylcqz" name="qzjcBean.ylcqz"
								value="${qzjcBean.ylcqz}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="xbcqz" name="qzjcBean.xbcqz"
								value="${qzjcBean.xbcqz}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="zzblcqz" name="qzjcBean.zzblcqz"
								value="${qzjcBean.zzblcqz}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="sxsbcqz" name="qzjcBean.sxsbcqz"
								value="${qzjcBean.sxsbcqz}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="2">枪证办理情况</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">现有总计（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">原老枪证（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">新办枪证（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">正在办理（本）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">尚需申办枪证（本）<font
								color='red'>*</font>
						</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="qzxyzj" name="qzjcBean.qzxyzj"
								value="${qzjcBean.qzxyzj}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="ylqz" name="qzjcBean.ylqz"
								value="${qzjcBean.ylqz}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="xbqz" name="qzjcBean.xbqz"
								value="${qzjcBean.xbqz}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="zzblqz" name="qzjcBean.zzblqz"
								value="${qzjcBean.zzblqz}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="sxsbqz" name="qzjcBean.sxsbqz"
								value="${qzjcBean.sxsbqz}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="2">枪支情况</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">总计（支）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel rowspan="2">详细情况<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent rowspan="2" colspan="3">
							<cps:textfield required="true" maxlength="200" type="textarea"
								cssStyle="width:100%;height:40px" id="qzxxqk"
								name="qzjcBean.qzxxqk" value="${qzjcBean.qzxxqk}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="qzzj" name="qzjcBean.qzzj"
								value="${qzjcBean.qzzj}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="2">子弹情况</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">总计（发）<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel rowspan="2">详细情况<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent rowspan="2" colspan="3">
							<cps:textfield required="true" maxlength="200" type="textarea"
								cssStyle="width:100%;height:40px" id="zdxxqk"
								name="qzjcBean.zdxxqk" value="${qzjcBean.zdxxqk}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent>
							<cps:textfield required="true" inputType="integer" maxlength="7"
								cssStyle="width:96%" id="zdzj" name="qzjcBean.zdzj"
								value="${qzjcBean.zdzj}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="2">枪弹库情况</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">枪弹分库情况<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel colspan="2" cssStyle="text-align:center">值班情况<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel colspan="2" cssStyle="text-align:center">三铁两器情况<font
								color='red'>*</font>
						</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdContent>
							<cps:textfield required="true" maxlength="200" type="textarea"
								cssStyle="width:100%;height:40px" id="qdfkqk"
								name="qzjcBean.qdfkqk" value="${qzjcBean.qdfkqk}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent colspan="2">
							<cps:textfield required="true" maxlength="200" type="textarea"
								cssStyle="width:100%;height:40px" id="qdkzbqk"
								name="qzjcBean.qdkzbqk" value="${qzjcBean.qdkzbqk}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent colspan="2">
							<cps:textfield required="true" maxlength="200" type="textarea"
								cssStyle="width:100%;height:40px" id="stlqqk"
								name="qzjcBean.stlqqk" value="${qzjcBean.stlqqk}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>枪弹库存在的问题<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield required="true" maxlength="200" type="textarea"
								cssStyle="width:100%;height:40px" id="qdkczdwt"
								name="qzjcBean.qdkczdwt" value="${qzjcBean.qdkczdwt}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="2">枪支单位管理情况</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">是否成立领导小组<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">是否对枪支全面进行了清查<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">管理部门分工是否明确<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">培训工作落实情况<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">配备枪械员情况<font
								color='red'>*</font>
						</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已成立','0':'未成立'}"
								cssClass="validate[required]" id="ldxz" name="qzjcBean.ldxz"></s:radio>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已清查','0':'未清查'}"
								cssClass="validate[required]" id="qmqc" name="qzjcBean.qmqc"></s:radio>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已明确','0':'未明确'}"
								cssClass="validate[required]" id="glbm" name="qzjcBean.glbm"></s:radio>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="pxgzls" name="qzjcBean.pxgzls"></s:radio>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已配备','0':'未配备'}"
								cssClass="validate[required]" id="pbqxy" name="qzjcBean.pbqxy"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>枪支单位管理存在的问题<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield required="true" type="textarea"
								cssStyle="width:100%;height:40px" id="qzdwgl"
								name="qzjcBean.qzdwgl" value="${qzjcBean.qzdwgl}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>安全责任书签订情况<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield required="true" type="textarea"
								cssStyle="width:100%;height:40px" id="aqzrs"
								name="qzjcBean.aqzrs" value="${qzjcBean.aqzrs}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>上级枪支管理部门检查情况<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield required="true" type="textarea"
								cssStyle="width:100%;height:40px" id="sjqzjc"
								name="qzjcBean.sjqzjc" value="${qzjcBean.sjqzjc}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>落实隐患整治情况<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield required="true" type="textarea"
								cssStyle="width:100%;height:40px" id="lsyhzz"
								name="qzjcBean.lsyhzz" value="${qzjcBean.lsyhzz}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>台帐登记情况<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield required="true" type="textarea"
								cssStyle="width:100%;height:40px" id="tzdjqk"
								name="qzjcBean.tzdjqk" value="${qzjcBean.tzdjqk}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>检查人签名<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="2">
							<cps:textfield required="true" cssStyle="width:98%" id="jcrxm"
								name="qzjcBean.jcrxm" value="${qzjcBean.jcrxm}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel colspan="2">时间<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent>
							<cps:date required="true" maxDate="sysdate" cssStyle="width:98%"
								dateFmt="yyyy-MM-dd" id="jcrq" name="qzjcBean.jcrq"
								value="${qzjcBean.jcrq}" defaultSystemDate="true" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>被检查人签名<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent colspan="2">
							<cps:textfield required="true" cssStyle="width:98%" id="bjcrxm"
								name="qzjcBean.bjcrxm" value="${qzjcBean.bjcrxm}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel colspan="2">时间<font color='red'>*</font>
						</cps:tdLabel>
						<cps:tdContent>
							<cps:date required="true" maxDate="sysdate" cssStyle="width:98%"
								dateFmt="yyyy-MM-dd" id="qmsj" name="qzjcBean.qmsj"
								value="${qzjcBean.qmsj}" defaultSystemDate="true" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<creator:panel id="list" title="历史安全检查">
			<cps:tableGrid url="/sydw/wbdwgl/queryWbdwQzjc.action"
				searchform="wbdwform" id="queryWbdw" autoload="true" usepager="true"
				click="wbdwRowClickCallback" width="99.5%" mutilSelect="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="检查人员" field="jcrxm"></cps:column>
				<cps:column title="检查单位" field="jcdwmc"></cps:column>
				<cps:column title="检查时间" field="czsj"></cps:column>
				<cps:column title="登记时间" field="djsj"></cps:column>
			</cps:tableGrid>
		</creator:panel>
	</div>
</creator:view>