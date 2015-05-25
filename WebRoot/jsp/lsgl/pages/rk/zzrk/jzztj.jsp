<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/jzztj.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="query()"></cps:button>
			<cps:button value="重置" onclick="resetForm()"></cps:button>
			<cps:button value="导出" onclick="downloadjzztj('dataArea')"></cps:button>
		</cps:tbar>
		<cps:panel title="查询条件" width="99.8%">
			<form id="jzztjQueryForm" >
				<input type="hidden" name="queryBean.tjjb" value="${queryBean.tjjb}" id="tjjb" />
				<input type="hidden" id="orgleve" name="queryBean.orgLeve" value="${queryBean.tjjb}" />
				<cps:table>
					<cps:row>
						<%--
						<cps:tdLabel width="15%">统计级别：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:select list="#{'2':'市局','3':'区县局','4':'派出所','5':'警务区'}" cssClass="cps-select" name="queryBean.tjjb" value="5"></s:select>
						</cps:tdContent>
						 --%>
						<cps:tdLabel width="15%">统计时间：</cps:tdLabel>
						<cps:tdContent width="35%">
							<cps:date name="queryBean.tjsj_start" id="tjsj_start" value="2014-08-01" maxDateDepend="tjsj_end" dateFmt="yyyy-MM-dd" cssStyle="width:45%" minDate="2014-08-01"></cps:date>&nbsp;至
							<cps:date name="queryBean.tjsj_end" id="tjsj_end" minDateDepend="tjsj_start" dateFmt="yyyy-MM-dd" cssStyle="width:45%" maxDate="sysdate"></cps:date>
						</cps:tdContent>
						
						<cps:tdLabel width="15%">统计单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="tjdwdm" name="queryBean.tjdwdm" value="${queryBean.tjdwdm}" />
							<cps:textfield id="tjdwmc"  value="${queryBean.tjdwmc}" appendPopuBtn="true" onclick="selectOrg('${loginInfo.orgcode}','tjdwdm','tjdwmc')" cssStyle="width:98%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdContent colspan="4">
							<p style="color:red;font-size:12px;">
								<strong>说明：</strong><br>
								1：居住证办证数(不包含废证) :是指统计时段内所登记的流动人口，在统计时段内办理了多少居住证（只要办理就算）。<br>
								2：废证率：指统计时段内 错证重打/所有打证数。<br>
								3：遗失补领率：统计时段内  遗失补证/所有打证数。<br>
								4、办证率：统计时候内 办证数（登记数）/ 流口数。<br>
								5、统计时间最早只能从2014-08-01开始
							</p>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
	<div id="dataArea"></div>
	
	<iframe id="iframeid" src="" style="dispaly:none;" height="0"></iframe>
</creator:view>