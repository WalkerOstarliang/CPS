<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>


<creator:view title="安全检查信息">
	<creator:Script src="/jsp/dwdj/js/wbdwaqjc.js"></creator:Script>
	<div id="_div">
		<cps:PanelView>
			<cps:tbar id="wbdw_op">
				<cps:button value="清空" type="button" onclick="resetForm()"></cps:button>
				<cps:button value="保存" type="button" onclick="submitWbdwForm()"></cps:button>
				<cps:button value="关闭" type="button" onclick="window.close()"></cps:button>
			</cps:tbar>

			<cps:panel id="wbdw_panel" title="单位检查">
				<form id="wbdwform"
					action="<c:url value='/sydw/wbdwgl/submitWbdwWxhx.action'/>"
					method="post">
					<input type="hidden" id="opertype" value="${operType}" />
					<input type="hidden" id="id" name="wxhxBean.id"
						value="${wxhxBean.id}" />
					<input type="hidden" id="jgbh" name="wxhxBean.jgbh"
						value="${wxhxBean.jgbh}" />
					<cps:table>
						<cps:row>
							<cps:tdLabel rowspan="2" cssStyle="text-align:center">检查场所</cps:tdLabel>
							<cps:tdLabel rowspan="2" cssStyle="text-align:center">检查方法</cps:tdLabel>
							<cps:tdLabel colspan="2" cssStyle="text-align:center">检查重点</cps:tdLabel>
							<cps:tdLabel colspan="2" cssStyle="text-align:center">整改意见</cps:tdLabel>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:center">主要问题</cps:tdLabel>
							<cps:tdLabel cssStyle="text-align:center">是否存在<font
									color='red'>*</font>
							</cps:tdLabel>
							<cps:tdLabel cssStyle="text-align:center">整改措施<font
									color='red'>*</font>
							</cps:tdLabel>
							<cps:tdLabel cssStyle="text-align:center">是否存在<font
									color='red'>*</font>
							</cps:tdLabel>
						</cps:row>
						<cps:row>
							<cps:tdLabel rowspan="15" cssStyle="text-align:center">民爆销售单位及仓库</cps:tdLabel>
							<cps:tdLabel rowspan="10" cssStyle="text-align:center">入库清查民爆物品</cps:tdLabel>
							<cps:tdLabel cssStyle="text-align:left">看护力量不到位</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx01"
									name="wxhxBean.wxhx01"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx02"
									name="wxhxBean.wxhx02" value="${wxhxBean.wxhx02}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx03"
									name="wxhxBean.wxhx03"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">物防设施</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx04"
									name="wxhxBean.wxhx04"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx05"
									name="wxhxBean.wxhx05" value="${wxhxBean.wxhx05}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx06"
									name="wxhxBean.wxhx06"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">技防设施</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx07"
									name="wxhxBean.wxhx07"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx08"
									name="wxhxBean.wxhx08" value="${wxhxBean.wxhx08}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx09"
									name="wxhxBean.wxhx09"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">犬防设施</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx10"
									name="wxhxBean.wxhx10"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx11"
									name="wxhxBean.wxhx11" value="${wxhxBean.wxhx11}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx12"
									name="wxhxBean.wxhx12"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">仓库与周边安全距离</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx13"
									name="wxhxBean.wxhx13"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx14"
									name="wxhxBean.wxhx14" value="${wxhxBean.wxhx14}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx15"
									name="wxhxBean.wxhx15"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">生活区和库区未分离</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx16"
									name="wxhxBean.wxhx16"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx17"
									name="wxhxBean.wxhx17" value="${wxhxBean.wxhx17}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx18"
									name="wxhxBean.wxhx18"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">“双人双锁”制度不落实</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx19"
									name="wxhxBean.wxhx19"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx20"
									name="wxhxBean.wxhx20" value="${wxhxBean.wxhx20}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx21"
									name="wxhxBean.wxhx21"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">雷管和炸药未分库存放</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx22"
									name="wxhxBean.wxhx22"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx23"
									name="wxhxBean.wxhx23" value="${wxhxBean.wxhx23}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx24"
									name="wxhxBean.wxhx24"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">库类无清退回收的民爆物品</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx25"
									name="wxhxBean.wxhx25"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx26"
									name="wxhxBean.wxhx26" value="${wxhxBean.wxhx26}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx27"
									name="wxhxBean.wxhx27"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">雷管和炸药无编码</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx28"
									name="wxhxBean.wxhx28"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx29"
									name="wxhxBean.wxhx29" value="${wxhxBean.wxhx29}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx30"
									name="wxhxBean.wxhx30"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel rowspan="5" cssStyle="text-align:center">查看民爆物品出入库台帐</cps:tdLabel>
							<cps:tdLabel cssStyle="text-align:left">民爆物品台帐与清点实物不相符</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx31"
									name="wxhxBean.wxhx31"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx32"
									name="wxhxBean.wxhx32" value="${wxhxBean.wxhx32}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx33"
									name="wxhxBean.wxhx33"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">清退回库的民爆物品未登记</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx34"
									name="wxhxBean.wxhx34"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx35"
									name="wxhxBean.wxhx35" value="${wxhxBean.wxhx35}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx36"
									name="wxhxBean.wxhx36"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">民爆物品出入口未登记编码</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx37"
									name="wxhxBean.wxhx37"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx38"
									name="wxhxBean.wxhx38" value="${wxhxBean.wxhx38}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx39"
									name="wxhxBean.wxhx39"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">民爆物品出入库时发放人和领用人为签字</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx40"
									name="wxhxBean.wxhx40"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx41"
									name="wxhxBean.wxhx41" value="${wxhxBean.wxhx41}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx42"
									name="wxhxBean.wxhx42"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">无手续领取雷管或炸药</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx43"
									name="wxhxBean.wxhx43"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx44"
									name="wxhxBean.wxhx44" value="${wxhxBean.wxhx44}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx45"
									name="wxhxBean.wxhx45"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel rowspan="12" cssStyle="text-align:center">民爆物品使用单位</cps:tdLabel>
							<cps:tdLabel rowspan="8" cssStyle="text-align:center">深入爆破现场和施工人员宿舍实地检查</cps:tdLabel>
							<cps:tdLabel cssStyle="text-align:left">爆破现场未设临时储存点</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx46"
									name="wxhxBean.wxhx46"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx47"
									name="wxhxBean.wxhx47" value="${wxhxBean.wxhx47}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx48"
									name="wxhxBean.wxhx48"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">临时存储点未实行“双人双锁”管理制度</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx49"
									name="wxhxBean.wxhx49"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx50"
									name="wxhxBean.wxhx50" value="${wxhxBean.wxhx50}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx51"
									name="wxhxBean.wxhx51"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">当天剩余民爆物品隔夜储存在临时库</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx52"
									name="wxhxBean.wxhx52"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx53"
									name="wxhxBean.wxhx53" value="${wxhxBean.wxhx53}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx54"
									name="wxhxBean.wxhx54"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">民爆物品乱存乱放</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx55"
									name="wxhxBean.wxhx55"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx56"
									name="wxhxBean.wxhx56" value="${wxhxBean.wxhx56}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx57"
									name="wxhxBean.wxhx57"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">民爆物品无编码</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx58"
									name="wxhxBean.wxhx58"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx59"
									name="wxhxBean.wxhx59" value="${wxhxBean.wxhx59}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx60"
									name="wxhxBean.wxhx60"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">从业人员无《爆破员证》</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx61"
									name="wxhxBean.wxhx61"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx62"
									name="wxhxBean.wxhx62" value="${wxhxBean.wxhx62}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx63"
									name="wxhxBean.wxhx63"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">从业人员宿舍私藏民爆物品</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx64"
									name="wxhxBean.wxhx64"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx65"
									name="wxhxBean.wxhx65" value="${wxhxBean.wxhx65}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx66"
									name="wxhxBean.wxhx66"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">关闭矿点和非法矿点仍在非法购买、使用民爆物品</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx67"
									name="wxhxBean.wxhx67"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx68"
									name="wxhxBean.wxhx68" value="${wxhxBean.wxhx68}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx69"
									name="wxhxBean.wxhx69"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel rowspan="4" cssStyle="text-align:center">查看有关台帐和资质证件</cps:tdLabel>
							<cps:tdLabel cssStyle="text-align:left">矿山或采石场无省国土资源厅和省安监局分别核发的《采矿许可证》和《安全生产许可证》</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx70"
									name="wxhxBean.wxhx70"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx71"
									name="wxhxBean.wxhx71" value="${wxhxBean.wxhx71}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx72"
									name="wxhxBean.wxhx72"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">民爆物品购买未经过当地派出所和治安大队（科）审批</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx73"
									name="wxhxBean.wxhx73"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx74"
									name="wxhxBean.wxhx74" value="${wxhxBean.wxhx74}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx75"
									name="wxhxBean.wxhx75"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">民爆物品的品种、数量及编号未登记到爆破员头上</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx76"
									name="wxhxBean.wxhx76"></s:radio>
							</cps:tdContent>
							<cps:tdContent>
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx77"
									name="wxhxBean.wxhx77" value="${wxhxBean.wxhx77}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx78"
									name="wxhxBean.wxhx78"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:left">剩余民爆物品当天未及时清退回库</cps:tdLabel>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'存在','0':'不存在'}"
									cssClass="validate[required]" id="wxhx79"
									name="wxhxBean.wxhx79"></s:radio>
							</cps:tdContent>
							<cps:tdContent cssStyle="width:200px;height:45px">
								<cps:textfield required="true" type="textarea" maxlength="200"
									cssStyle="width:98%;height:45px" id="wxhx80"
									name="wxhxBean.wxhx80" value="${wxhxBean.wxhx80}"></cps:textfield>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center;width:120px">
								<s:radio list="#{'1':'已落实','0':'未落实'}"
									cssClass="validate[required]" id="wxhx81"
									name="wxhxBean.wxhx81"></s:radio>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel cssStyle="text-align:center" rowspan="2">备注</cps:tdLabel>
							<cps:tdContent colspan="5" cssStyle="text-align:left;">
							民爆销售单位及仓库：对发现的无编码民爆物品，要彻查生产和销售厂家；
											对库房无清退回收民爆物品的，要彻查每天剩余民爆物品流向及储存情况；
											对存在仅领取炸药（或雷管）问题的，要彻查所用雷管（或炸药）来源及日常民爆物品清退回库情况。
						</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent colspan="5" cssStyle="text-align:left;">
							民爆物品使用单位：对无《采矿许可证》和《安全生产许可证》的关闭矿点和非法矿山仍在非法使用爆炸物品开采的，要彻查民爆物品来源、流向，依法严肃查处非法买卖民爆物品所有涉案人员，依法追究有关单位和人员的监管责任；
										   对剩余民爆物品当天不清退回库的，一律停业整顿，对单位负责人和从业人员一律行政拘留，并处单位5-20万元罚款；
										   对无编码的民爆物品要追查生产和销售厂家；
										   对临时库隔夜储存民爆物品或宿舍存有民爆无凭的，一律停业整顿。
						</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</cps:PanelView>
		<cps:tableGrid url="/sydw/wbdwgl/queryWbdwWxhx.action" title="历史安全检查"
			searchform="wbdwform" id="queryWbdw" autoload="true" usepager="true"
			click="wbdwRowClickCallback" width="99.5%" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作人员" field="czrxm"></cps:column>
			<cps:column title="操作时间" field="czsj"></cps:column>
			<cps:column title="登记时间" field="djsj"></cps:column>
		</cps:tableGrid>
	</div>
</creator:view>