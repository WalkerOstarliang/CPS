<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/xtgl/js/khkp.js"></creator:Script>
	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="khkpcx()"></cps:button>
			<cps:button value="重置" onclick="resetForm()"></cps:button>
			<cps:button value="导出" onclick="downloadKhtjpmExcel()"></cps:button>
		</creator:tbar>
		
		<creator:panel id="khkp_panel" title="考核排名查询条件" tbarId="op">
			<form id="khcx_form" method="post" target="hiddeniframe">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">统计时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date name="query.tjsj" id="tjsj" dateFmt="yyyy-MM"  defaultSystemDate="true"/>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">时间段：</cps:tdLabel>
						<cps:tdContent width="20%">
							<s:select list="#{'1':'1号-10号','2':'1号-20号','3':'1号-月底'}" cssClass="cps-select" name="query.tjsjfw" value="1" id="jsjd"></s:select>
							<%-- 
							<input type="hidden" name="query.tjsjfw" value="1" id="tjsjfw_hidden" />
							<input type="radio" name="tjsjfw" value="1" id="sx" onclick="changeTjsjfw(this.value)" checked="checked"/>
							<label for="sx" id="sx_label">1号-10号</label>
							<input type="radio" name="tjsjfw" value="2" id="zx" onclick="changeTjsjfw(this.value)" />
							<label for="zx" id="zx_label">1号-20号</label>
							<input type="radio" name="tjsjfw" value="3" id="xx" onclick="changeTjsjfw(this.value)" />
							<label for="xx" id="xx_label">1号-月底</label>
							--%>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">考核单位:</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="query.khdwdm" id="khdwdm" value="${loginInfo.orgcode}" />
							<cps:textfield id="khdwmc" onclick="selectOrg('${loginInfo.rootOrgCode}', 'khdwdm', 'khdwmc')" value="${loginInfo.orgname}"  appendPopuBtn="true"/>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>统计类别：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'01':'大类','02':'细类'}" id="tjlb" cssClass="cps-select" name="query.tjlb" value="01"></s:select>
							<%-- 
							<input type="hidden" id="tjlb_hidden" name="query.tjlb" value="01" />
							<input type="radio" name="tjlb" value="01" id="dl" checked="checked" onclick="changeTjlb(this.value)" />
							<label for="dl">大类</label>
							<input type="radio" name="tjlb" value="02" id="xl" onclick="changeTjlb(this.value)"/>
							<label for="xl">细类</label>
							--%>
						</cps:tdContent>
					
						<cps:tdLabel>统计级别：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'2':'市局','3':'分县局','4':'派出所','5':'警务区'}" cssClass="cps-select" name="query.tjjb" value="5" onchange="tjjbChange(this.value)"></s:select>
							<%-- 
							<input type="radio" name="query.tjjb" value="2" id="sj"/>
							<label for="sj">市局</label>
							<input type="radio" name="query.tjjb" value="3" id="fxj"/>
							<label for="fxj">分县局</label>
							<input type="radio" name="query.tjjb" value="4" id="pcs"/>
							<label for="pcs">派出所</label>
							<input type="radio" name="query.tjjb" value="5" id="jwq" checked="checked"/>
							<label for="jwq">警务区</label>
							--%>	
						</cps:tdContent>
						
						<cps:tdLabel id="text">警务区分类：</cps:tdLabel>
						<cps:tdContent>
							<cps:select name="query.jwqfl" zdlb="KHKP_JWQFL" id="jwqfl" headerKey="" headerValue=" "></cps:select>
							<cps:select name="query.pcsdj" zdlb="KHKP_PCSDJ" id="pcsdj" cssStyle="display:none;" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdContent colspan="6">
							<span style="color:red">注意：由于新版考核升级，4月份考核取消。</span>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<div id="dataArea_div" style="overflow:auto;"></div>
		<iframe name="hiddeniframe" src="" height="0" width="0"></iframe>
	</creator:box>
</creator:view>	