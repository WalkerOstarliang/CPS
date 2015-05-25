<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
	<creator:Script src="/jsp/lsgl/js/lsglcollect.js"></creator:Script>
	<creator:box>
		<form id="queryForm">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" id="querybtn" onclick="queryList();"></cps:button>
				<cps:button value="迁移" id="fwqybtn" ></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="房屋查询条件" >
				<input type="hidden" name="operType" value="select">
				<input type="hidden" name="modename" value="实有房屋">
				<cps:table>
					<cps:row>
					<cps:tdLabel  width="12%">市局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
						</cps:tdContent>
						<cps:tdLabel>社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>实体名称：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="stmc" name="queryBean.stmc" onblur="queryTableGrid()"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >街路巷：</cps:tdLabel>
						<cps:tdContent>
							 <input type="hidden" id="jlxdm" name="queryBean.jlxdm"/>
							 <cps:textfield id="jlxmc" readonly="true" appendPopuBtn="true" onclick="openJlxSelect(setSelectJlxValue)"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>门牌号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="mph" name="queryBean.mph"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>小区(组)：</cps:tdLabel>
						<cps:tdContent>
							  <cps:textfield id="xqz" name="queryBean.xqz"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					 <cps:row>
					 	<cps:tdLabel>楼栋详址：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="ldxz" name="queryBean.ldxz"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>单元号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select id="dyh" zdlb="ZDY_DYH" name="queryBean.dyh" headerKey="" headerValue=" " onchange="queryTableGrid()"></cps:select>
						</cps:tdContent>
						<cps:tdLabel>楼层号：</cps:tdLabel>
						<cps:tdContent>
							  <span><cps:textfield id="lch" name="queryBean.lch" cssStyle="width:50%"></cps:textfield></span>
							  <span><cps:select zdlb="ZDY_LCHZ" id="lchz" name="queryBean.lchz"  cssStyle="width:40px;" headerKey="" headerValue=" "></cps:select></span>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>房间号：</cps:tdLabel>
						<cps:tdContent>
							 <span><cps:textfield id="fjh" name="queryBean.fjh" cssStyle="width:50%"></cps:textfield></span>
							 <span><cps:select zdlb="ZDY_SHHZ" id="shhz" name="queryBean.shhz"  cssStyle="width:40px;" headerKey="" headerValue=" "></cps:select></span>
						</cps:tdContent>
						<cps:tdLabel>附属地址：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="fsdz" name="queryBean.fsdz"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>产权类型：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select zdlb="ZDY_CQXZ" id="cqlx" name="queryBean.cqlx" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>房主身份证号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="hzsfzh" name="queryBean.hzsfzh" maxlength="18"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>房主姓名：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="hzxm" name="queryBean.hzxm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>是否出租屋：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="sfczw" name="queryBean.sfczw" zdlb="ZDY_ZDSF" headerKey="" headerValue=" " ></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
		</form>
		<cps:tableGrid id="fwtablegrid"  title="房屋列表"
				url="/lsgl/fw/queryFwPageResult.action" 
				searchform="queryForm"	
				width="99.6%"
				mutilSelect="false"
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
			<cps:column field="dzmc" title="地址" align="left"></cps:column>
			<cps:column field="dyhmc" title="单元号"></cps:column>
			<cps:column field="lchmc" title="楼层号"></cps:column>
			<cps:column field="fjhmc" title="房间号"></cps:column>
			<cps:column field="fsdz" title="附属地址"></cps:column>
			<cps:column field="zxbsms" title="注销状态"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>