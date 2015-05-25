<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<creator:Script src="/jsp/khkp/js/wtsjtjlist.js"></creator:Script>
	<creator:box>
		<form id="queryForm" target="exportiframe">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" id="querybtn" onclick="queryList();"></cps:button>
				<cps:button value="导出结果" id="querybtn" onclick="exportWtsjXls()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="问题数据统计列表" >
				<cps:table>
					<cps:row>
						<cps:tdLabel  width="15%"><font color='red'>*</font>统计日期：</cps:tdLabel>
							<cps:tdContent width="35%">
								<input type="hidden" id="mindatedeppend" value="20140417"/>
								<cps:date id="tjrq" name="queryBean.tjrq" dateFmt="yyyyMMdd" defaultSystemDate="true" minDateDepend="mindatedeppend" required="true" minDate="20140417"></cps:date>
							</cps:tdContent>
							<cps:tdLabel width="15%"><font color='red'>*</font>统计单位：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" name="queryBean.wtdwdm" id="wtdwdm" value="430100000000" />
								<cps:textfield id="wtdwmc" value="长沙市公安局" onclick="selectOrg('${currentXzqh}00000000', 'wtdwdm', 'wtdwmc')" required="true" appendPopuBtn="true"/>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="15%">统计类型：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'1':'一个月内','2':'一个星期内'}" id="tjlx" name="queryBean.tjlx" cssClass="cps-select" onchange="changeTjlx(this.value)"></s:select>
							</cps:tdContent>
							
							<cps:tdLabel width="15%">统计级别：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'2':'市局','3':'分县局','4':'派出所','5':'警务区'}" cssClass="cps-select" name="queryBean.wtdwleve" value="5" ></s:select>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent colspan="4">
								<font color="red">
									<span id="wtsjsmms_1" style="display:inline">问题数据规则：在一个月内，相同的记录在本辖区内被重复登记两次或两次以上的数据被定为问题数据，该数据仅供参考不作标准。</span>
									<span id="wtsjsmms_2" style="display:none">问题数据规则：在一个月内，相同的记录在本辖区内被重复登记两次或两次以上并且在一周内登记的数据被定为问题数据，该数据仅供参考不作标准。</span>
								</font>
							</cps:tdContent>
						</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		<%-- 一个月内登记--%>
		<div id="wtsjgrid_1">
			<cps:tableGrid id="wtsjtablegrid1"  title="问题数据列表"
					url="/xtgl/khkp/queryWtsltjfxList.action" 
					searchform="queryForm"	
					width="99.6%"
					pageSize="15"
					mutilSelect="false"
					autoload="false">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="orgname" title="单位名称" align="left"></cps:column>
				<cps:column field="pm" title="排名"></cps:column>
				<cps:column field="zwts" title="总数"></cps:column>
				<cps:column field="czrks" title="常口" rowcallback="czrksCallback"></cps:column>
				<cps:column field="ldrks" title="流口" rowcallback="ldrkCallBack"></cps:column>
				<cps:column field="jzrks" title="寄口" rowcallback="jzrkCallBack"></cps:column>
				<cps:column field="wlhrks" title="未落户" rowcallback="wlhrkCallBack"></cps:column>
				<cps:column field="stxxs" title="实体" rowcallback="stxxCallBack"></cps:column>
				<cps:column field="fwxxs" title="房屋" rowcallback="fwxxCallBack"></cps:column>
				<cps:column field="czfwxxs" title="出租屋" rowcallback="czfwxxCallBack"></cps:column>
				<cps:column field="sydws" title="单位" rowcallback="sydwsCallBack"></cps:column>
				<cps:column field="cyrys" title="从业人员" rowcallback="cyrysCallBack"></cps:column>
				<cps:column field="xzmj" title="登记民警明细" rowcallback="djmjdetailCallBack"></cps:column>
			</cps:tableGrid>
		</div>
		
		<%-- 一周内登记--%>
		<div id="wtsjgrid_2" style="display: none;">
			<cps:tableGrid id="wtsjtablegrid2"  title="问题数据列表"
					url="/xtgl/khkp/queryWtsltjfxBakList.action" 
					searchform="queryForm"	
					width="99.6%"
					pageSize="15"
					mutilSelect="false"
					autoload="false">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="orgname" title="单位名称" align="left"></cps:column>
				<cps:column field="pm" title="排名"></cps:column>
				<cps:column field="zwts" title="总数"></cps:column>
				<cps:column field="czrks" title="常口" rowcallback="czrksCallback"></cps:column>
				<cps:column field="ldrks" title="流口" rowcallback="ldrkCallBack"></cps:column>
				<cps:column field="jzrks" title="寄口" rowcallback="jzrkCallBack"></cps:column>
				<cps:column field="wlhrks" title="未落户" rowcallback="wlhrkCallBack"></cps:column>
				<cps:column field="stxxs" title="实体" rowcallback="stxxCallBack"></cps:column>
				<cps:column field="fwxxs" title="房屋" rowcallback="fwxxCallBack"></cps:column>
				<cps:column field="czfwxxs" title="出租屋" rowcallback="czfwxxCallBack"></cps:column>
				<cps:column field="sydws" title="单位" rowcallback="sydwsCallBack"></cps:column>
				<cps:column field="cyrys" title="从业人员" rowcallback="cyrysCallBack"></cps:column>
			</cps:tableGrid>
		</div>
	</form>
	<form id="exporthiddenform" method="post" target="exportiframe">
		<input type="hidden" id="hiddenwtdwdm" name="queryBean.wtdwdm" value=""/>
		<input type="hidden" id="hiddenwtdwleve" name="queryBean.wtdwleve" value=""/>
		<input type="hidden" id="hiddentjrq" name="queryBean.tjrq" value=""/>
	</form>
	<iframe id="exportiframe" name="exportiframe" src="" height="0" width="0"/>
	</creator:box>
</creator:view>