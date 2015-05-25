<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view title="采集量统计表">
	<creator:box>
		<creator:Script src="/jsp/xtgl/js/sjcjsl.js"></creator:Script>
		<creator:tbar id="op">
			<cps:button value="查询" type="button" onclick="query()"></cps:button>
			<cps:button value="导出Excel" type="button" onclick="downLoadSjcssl()"></cps:button>
		</creator:tbar>
		<creator:panel id="cxtj" title="查询条件" tbarId="op">
			<form id="cjsjcx" method="post" target="hiddenframe">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%"><font color='red'>*</font>统计月份：</cps:tdLabel>
						<cps:tdContent width="15%">
							<cps:date name="query.tjsj" id="tjsj" dateFmt="yyyy-MM"  defaultSystemDate="true" required="true"/>
						</cps:tdContent>
						
						<cps:tdLabel width="15%"><font color='red'>*</font>统计时间：</cps:tdLabel>
						<cps:tdContent width="15%">
							<s:select list="#{'1':'1号-10号','2':'1号-20号','3':'1号-月底'}" cssClass="cps-select validate[required]" name="query.tjsjfw" id="tjsjfw"></s:select>
						</cps:tdContent>
						
						<cps:tdLabel width="15%">统计单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="query.khdwdm" id="khdwdm" value="430100000000"  />
							<cps:textfield id="khdwmc" value="长沙市公安局"  onclick="selectOrg('${loginInfo.rootOrgCode}', 'khdwdm', 'khdwmc','orgLeve')" appendPopuBtn="true"/>
						</cps:tdContent>
					</cps:row>
					<cps:row>
							<cps:tdLabel>统计级别：</cps:tdLabel>
							<cps:tdContent>
									<s:select list="#{'2':'市局','3':'分县局','4':'派出所','5':'警务区'}" cssClass="cps-select" name="query.tjjb" value="5" onchange="tjjbChange(this.value)"></s:select>
							</cps:tdContent>
							
							<cps:tdLabel id="text">警务区分类：</cps:tdLabel>
							<cps:tdContent>
									<cps:select name="query.jwqfl" zdlb="KHKP_JWQFL" id="jwqfl" headerKey="" headerValue=" "></cps:select>
									<cps:select name="query.pcsdj" zdlb="KHKP_PCSDJ" id="pcsdj" cssStyle="display:none;" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdContent colspan="6">
							<b><font color="red">说明：</font></b><br/>
							<font color='red'>* 10条流动人口延期等于1条采集量</font><br/>
							<font color='red'>* 数据采集量不计算出租房屋巡查登记数</font><br/>
							<font color="red">
								* 数据按统计阶段固化，其中1-10号为一阶段，1-20号为二阶段，1-月底为三阶段。数据每天统计，跨阶段、月份查看的是固化的数据，本阶段内查看的是当月一日至当前日期前一天的结果。
							</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>

		<cps:tableGrid url="/xtgl/khkp/querySjcjList.action" title="采集量统计表"
			id="sjcjslList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" searchform="cjsjcx" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="单位名称" field="orgname" align="left"></cps:column>
			<cps:column title="总数" field="jcsjzs" maxlength="10"></cps:column>
			<cps:column title="常住人口" field="czrkzs"></cps:column>
			<cps:column title="寄住人口" field="jzrkzs" ></cps:column>
			<cps:column title="流动人口" field="ldrkzs"></cps:column>
			<cps:column title="流动人口延期" field="ldrkyqs" ></cps:column>
			<cps:column title="未落户人口" field="wlhrks"  ></cps:column>
			<cps:column title="地址" field="fwxxs"></cps:column>
			<cps:column title="实体" field="stxxs" ></cps:column>
			<cps:column title="单位" field="dwxxs" ></cps:column>
			<cps:column title="从业人员" field="cyrys" ></cps:column>
			<cps:column title="出租屋" field="czfws"></cps:column>
			<cps:column title="出租屋巡查登记" field="czfwxcs"></cps:column>
		</cps:tableGrid>
		
		<iframe src="" width="0" height="0" name="hiddenframe" style="display: none;"></iframe>
	</creator:box>
</creator:view>

