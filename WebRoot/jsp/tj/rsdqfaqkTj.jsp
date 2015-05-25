<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/tj/js/fatj.js"></creator:Script>
	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="tjcx()"></cps:button>
			<cps:button value="导出" onclick="expFatj()"></cps:button>
			<cps:button value="重置" onclick="resetForm()"></cps:button>
		</creator:tbar>
		
		<creator:panel id="fatj_panel" title="查询条件" tbarId="op">
			<form id="fatj_form">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="20%">统计时间：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:date name="tjqueryBean.tjkssj" id="tjkssj" value="${tjqueryBean.tjkssj}" dateFmt="yyyy-MM-dd"   maxDate="${currentSystemDate}" cssStyle="width:40%"/>
							-
							<cps:date name="tjqueryBean.tjjssj" id="tjjssj" dateFmt="yyyy-MM-dd"  defaultSystemDate="true" maxDate="${currentSystemDate}" minDateDepend="tjkssj" cssStyle="width:40%"/>
						</cps:tdContent>
						
						
						<cps:tdLabel width="20%">统计单位:</cps:tdLabel>
						<cps:tdContent width="30%">
							<input type="hidden" name="tjqueryBean.orgLeve" id="orgLeve" value="${loginInfo.leve }" }/>
							<input type="hidden" name="tjqueryBean.tjdwdm" id="tjdwdm" value="${loginInfo.orgcode}" />
							<cps:textfield id="tjdwmc" onclick="selectOrg('${loginInfo.rootOrgCode}', 'tjdwdm', 'tjdwmc','orgLeve')" value="${loginInfo.orgname}" appendPopuBtn="true"/>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					
						<cps:tdLabel>统计级别：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'2':'市局','3':'分县局','4':'派出所','5':'警务区','6':'社区'}" cssClass="cps-select" name="tjqueryBean.tjjb" value="5" onchange="tjjbChange(this.value)"></s:select>
						</cps:tdContent>
						
						<cps:tdLabel id="text">警务区分类：</cps:tdLabel>
						<cps:tdContent>
							<cps:select name="tjqueryBean.jwqfl" zdlb="KHKP_JWQFL" id="jwqfl" headerKey="" headerValue=" "></cps:select>
							<cps:select name="tjqueryBean.pcsdj" zdlb="KHKP_PCSDJ" id="pcsdj" cssStyle="display:none;" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6">
							<span style="color:red">
								说明：该统计报表统计结果按发案社区统计，并非办案单位。<br/>案件立案日期是上月，案件入卷宗时间是本月的案件属本月数据
							</span>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<creator:panel id="fatj_result" title="统计结果">
			<div id="dataArea_div" style="overflow:auto;"></div>
		</creator:panel>
		
	<div style="display:none">
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
	</creator:box>
</creator:view>	