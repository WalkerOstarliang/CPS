<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
	<creator:Script src="/jsp/lsgl/js/lsglcollect.js"></creator:Script>
	<script type="text/javascript">
		MapServicesUrl = "${mapServicesUrl}";
	</script>
	<form id="queryForm">
		<creator:tbar id="topTbar" >
			<cps:button value="实有人口登记" onclick="openSyrkRkInfo('add','')"></cps:button>
			<cps:button value="境外人口登记" onclick="openSyrkRkInfo('add','4')"></cps:button>
			<cps:button value="实有单位登记" onclick="openSydw()"></cps:button>
			<cps:button value="实体新增" onclick="openStxxDetailInfoPage('add')"></cps:button>
		</creator:tbar>
		<creator:panel id="topPanel" tbarId="topTbar"></creator:panel>
		<creator:tbar id="fwtooltbar">
			<cps:button value="查询" onclick="queryList();"></cps:button>
			<cps:button value="重置" type="reset"></cps:button>
			
		</creator:tbar>
		<creator:panel id="fwquerypanel" title="房屋查询条件" tbarId="fwtooltbar">
				<input type="hidden" name="operType" value="select">
				<input type="hidden" name="modename" value="实有房屋">
				<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="citydm" 
									list="${cityXzqhList}" 
									name="queryBean.citydm" 
									value="${queryBean.citydm}" 
									listKey="dm" 
									disabled="${queryBean.citydisabled}" 
									listValue="mc" 
									hideValue="true"
									headerKey="" headerValue=" " 
									onchange="doubleSelectCountry(this.value,'countrydm',queryTableGrid);return false;">
						</cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">县/区：</cps:tdLabel>
					<cps:tdContent width="22%">
						 <cps:select id="countrydm" 
						 			list="${countryXzqhList}" 
						 			name="queryBean.countrydm" 
						 			value="${queryBean.countrydm}" 
						 			hideValue="true" 
						 			disabled="${queryBean.countrydisabled}" 
						 			listKey="dm" 
						 			listValue="mc" 
						 			headerKey="" 
						 			headerValue=" " 
						 			onchange="doubleSelectJdxz(this.value,'jdxzdm',queryTableGrid)">
						 </cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">街道/乡镇：</cps:tdLabel>
					<cps:tdContent>
						 <cps:select id="jdxzdm" 
						 			list="${xzjdqhList}"  
						 			name="queryBean.jdxzdm" 
						 			value="${queryBean.jdxzdm}" 
						 			listKey="dm" 
						 			listValue="jc" 
						 			headerKey="" 
						 			headerValue=" " 
						 			onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',queryTableGrid)" >
						 </cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">社区/村：</cps:tdLabel>
					<cps:tdContent width="22%">
						 <cps:select id="sqdm" 
						 			list="${sqJbxxList}"  
						 			name="queryBean.sqdm" 
						 			value="${queryBean.sqdm}" 
						 			listKey="sqbh" 
						 			listValue="jc" 
						 			headerKey="" 
						 			headerValue=" " 
						 			onchange="queryTableGrid()" >
						 </cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">街路巷：</cps:tdLabel>
					<cps:tdContent width="22%">
						 <input type="hidden" id="jlxdm" name="queryBean.jlxdm"/>
						 <cps:textfield id="jlxmc" readonly="true" onclick="openJlxSelect(setSelectJlxValue)" appendPopuBtn="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">实体名称：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="stmc" name="queryBean.stmc" onblur="queryList()"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				 
				<cps:row>
					<cps:tdLabel>门牌号：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="mph" name="queryBean.mph"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>小区(组)：</cps:tdLabel>
					<cps:tdContent>
						  <cps:textfield id="xqz" name="queryBean.xqz"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>楼栋详址：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="ldxz" name="queryBean.ldxz"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				 <cps:row>
					<cps:tdLabel>单元号：</cps:tdLabel>
					<cps:tdContent>
						 <cps:select id="dyh" zdlb="ZDY_DYH" name="queryBean.dyh" headerKey="" headerValue=" " onchange="queryTableGrid()"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>楼层号：</cps:tdLabel>
					<cps:tdContent>
						  <cps:textfield id="lch" name="queryBean.lch"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>房间号：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="fjh" name="queryBean.fjh"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
		</form>
		<cps:tableGrid id="fwtablegrid"  title="房屋列表"
				url="/lsgl/fw/queryFwPageResult.action" 
				searchform="queryForm"	
				width="100%"
				mutilSelect="false"
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="stglcz" title="操作" align="left"></cps:column>
			<cps:column field="dzmc" title="地址" align="left"></cps:column>
			<cps:column field="hzxm" title="房主姓名"></cps:column>
			<cps:column field="hzsfzh" title="房主身份证号"></cps:column>
			<cps:column field="sfczwms" title="是否出租房屋"></cps:column>
		</cps:tableGrid>
</creator:view>