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
				action="<c:url value='/sydw/wbdwgl/submitWbdwJdhx.action'/>"
				method="post">
				<input type="hidden" id="opertype" value="${operType}" />
				<input type="hidden" id="id" name="jdhxBean.id"
					value="${jdhxBean.id}" />
				<input type="hidden" id="jgbh" name="jdhxBean.jgbh"
					value="${jdhxBean.jgbh}" />
				<cps:table>
					<cps:row>
						<cps:tdLabel rowspan="2" colspan="2" cssStyle="text-align:center">检查项目</cps:tdLabel>
						<cps:tdLabel colspan="2" cssStyle="text-align:center">检查内容</cps:tdLabel>
						<cps:tdLabel colspan="2" cssStyle="text-align:center">整改情况</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:center">主要问题</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">是否达标<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">整改措施<font
								color='red'>*</font>
						</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">是否落实<font
								color='red'>*</font>
						</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="4" colspan="2" cssStyle="text-align:center">人力防范要求</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:left">值班人员条件：年满18周岁，不满60周岁；具有完全民事行为能力；品行良好，无不良记录；具有初中以上文化程度，经过培训考核</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="rlff11" name="jdhxBean.rlff11"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="rlff12"
								name="jdhxBean.rlff12" value="${jdhxBean.rlff12}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="rlff13" name="jdhxBean.rlff13"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">交接班制度健全；24小时人员职守；有日常检查记录</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="rlff21" name="jdhxBean.rlff21"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="rlff22"
								name="jdhxBean.rlff22" value="${jdhxBean.rlff22}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="rlff23" name="jdhxBean.rlff23"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">有应急处理预案，并每年进行应急演习</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="rlff31" name="jdhxBean.rlff31"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="rlff32"
								name="jdhxBean.rlff32" value="${jdhxBean.rlff32}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="rlff33" name="jdhxBean.rlff33"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">有专门仓库，领用发放记录保存一年以上，每天核对账务数目</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="rlff41" name="jdhxBean.rlff41"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="rlff42"
								name="jdhxBean.rlff42" value="${jdhxBean.rlff42}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="rlff43" name="jdhxBean.rlff43"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="5" colspan="2" cssStyle="text-align:center">实体防范要求</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:left">建筑结构、配电设施、通风设施、防盗门和防盗保险柜符合要求</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="stff11" name="jdhxBean.stff11"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="stff12"
								name="jdhxBean.stff12" value="${jdhxBean.stff12}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="stff13" name="jdhxBean.stff13"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">存放场所有明显警告标志</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="stff21" name="jdhxBean.stff21"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="stff22"
								name="jdhxBean.stff22" value="${jdhxBean.stff22}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="stff23" name="jdhxBean.stff23"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">一、二级库房墙壁、顶部符合材料和厚度要求</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="stff31" name="jdhxBean.stff31"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="stff32"
								name="jdhxBean.stff32" value="${jdhxBean.stff32}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="stff33" name="jdhxBean.stff33"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">库房出入口等位置应设置放到安全门</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="stff41" name="jdhxBean.stff41"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="stff42"
								name="jdhxBean.stff42" value="${jdhxBean.stff42}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="stff43" name="jdhxBean.stff43"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">库房等窗口、通风口应设置放到栅栏，并符合要求</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="stff51" name="jdhxBean.stff51"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="stff52"
								name="jdhxBean.stff52" value="${jdhxBean.stff52}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="stff53" name="jdhxBean.stff53"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="7" cssStyle="text-align:center">技术防范要求</cps:tdLabel>
						<cps:tdLabel rowspan="3" cssStyle="text-align:center">三级</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:left">库房出入口有入侵报警和视频监控</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="jsffsj11"
								name="jdhxBean.jsffsj11"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="jsffsj12"
								name="jdhxBean.jsffsj12" value="${jdhxBean.jsffsj12}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="jsffsj13"
								name="jdhxBean.jsffsj13"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">存放部位有入侵报警和视频监控</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="jsffsj21"
								name="jdhxBean.jsffsj21"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="jsffsj22"
								name="jdhxBean.jsffsj22" value="${jdhxBean.jsffsj22}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="jsffsj23"
								name="jdhxBean.jsffsj23"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">值班室或监控室有通讯工具</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="jsffsj31"
								name="jdhxBean.jsffsj31"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="jsffsj32"
								name="jdhxBean.jsffsj32" value="${jdhxBean.jsffsj32}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="jsffsj33"
								name="jdhxBean.jsffsj33"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:center">二级</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:left">通风口、窗口有入侵报警和视频监控</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="jsffej11"
								name="jdhxBean.jsffej11"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="jsffej12"
								name="jdhxBean.jsffej12" value="${jdhxBean.jsffej12}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="jsffej13"
								name="jdhxBean.jsffej13"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="3" cssStyle="text-align:center">一级</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:left">库区周界有入侵报警和视频监控</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="jsffyj11"
								name="jdhxBean.jsffyj11"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="jsffyj12"
								name="jdhxBean.jsffyj12" value="${jdhxBean.jsffyj12}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="jsffyj13"
								name="jdhxBean.jsffyj13"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">库区出入口、主要通道、装卸区域有视频监控</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center;width:120px">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="jsffyj21"
								name="jdhxBean.jsffyj21"></s:radio>
						</cps:tdContent>
						<cps:tdContent>
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="jsffyj22"
								name="jdhxBean.jsffyj22" value="${jdhxBean.jsffyj22}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center;width:120px">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="jsffyj23"
								name="jdhxBean.jsffyj23"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="text-align:left">巡查部位有电子巡查装置</cps:tdLabel>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已达标','0':'未达标'}"
								cssClass="validate[required]" id="jsffyj31"
								name="jdhxBean.jsffyj31"></s:radio>
						</cps:tdContent>
						<cps:tdContent cssStyle="width:200px;height:45px">
							<cps:textfield required="true" type="textarea" maxlength="200"
								cssStyle="width:98%;height:45px" id="jsffyj32"
								name="jdhxBean.jsffyj32" value="${jdhxBean.jsffyj32}"></cps:textfield>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<s:radio list="#{'1':'已落实','0':'未落实'}"
								cssClass="validate[required]" id="jsffyj33"
								name="jdhxBean.jsffyj33"></s:radio>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel colspan="2" cssStyle="text-align:center">备注</cps:tdLabel>
						<cps:tdLabel colspan="4" cssStyle="text-align:left">检查技术防范要求时，二级要包含三级检查内容，一级应包含二级检查内容</cps:tdLabel>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<creator:panel id="list" title="历史安全检查">
			<cps:tableGrid url="/sydw/wbdwgl/queryWbdwJdhx.action"
				searchform="wbdwform" id="queryWbdw" autoload="true" usepager="true"
				click="wbdwRowClickCallback" width="99.5%" mutilSelect="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="操作人员" field="czrxm"></cps:column>
				<cps:column title="操作时间" field="czsj"></cps:column>
				<cps:column title="登记时间" field="djsj"></cps:column>
			</cps:tableGrid>
		</creator:panel>
	</div>
</creator:view>