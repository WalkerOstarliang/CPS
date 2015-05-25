<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
	<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
	<creator:Script src="/jsp/lsgl/js/dzfwqy.js"></creator:Script>
	<creator:box>
		<form id="queryForm">
		<creator:tbar id="fwtooltbar">
			<cps:button value="查询" id="querybtn" onclick="queryList();"></cps:button>
			<cps:button value="重置" type="reset"></cps:button>
			<input type="hidden" id="oldfwid" value="${queryBean.oldfwid}"/>
		</creator:tbar>
		<creator:panel id="fwquerypanel" title="目标房屋查询条件" tbarId="fwtooltbar">
				<input type="hidden" name="operType" value="select">
				<input type="hidden" name="modename" value="实有房屋">
				<cps:table>
				<cps:row>
					<cps:tdLabel  width="12%">市局：</cps:tdLabel>
						<cps:tdContent  width="25%">
								<c:choose>
									<c:when test="${empty loginInfo.citygajgdm}">
										<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
										<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
								</c:when>
								<c:otherwise>
										<s:hidden name="queryBean.pcsdm"></s:hidden>
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
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
					<cps:tdLabel>出租房屋：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="sfczw" name="queryBean.sfczw" zdlb="ZDY_ZDSF" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj_start" cssStyle="width:37%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
						至
						<cps:date id="djsj_end"   cssStyle="width:37%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>注销状态：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="zxbs" name="queryBean.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" " value="0" ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
		</form>
		<cps:tableGrid id="fwtablegrid"  title="目标房屋列表"
				url="/lsgl/fw/queryFwPageResult.action" 
				searchform="queryForm"	
				width="99.6%"
				mutilSelect="true"
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="fwdzhbqycz" title="合并迁移" align="left"></cps:column>
			<cps:column field="dzmc" title="地址" align="left"></cps:column>
			<cps:column field="dyhmc" title="单元号"></cps:column>
			<cps:column field="lchmc" title="楼层号"></cps:column>
			<cps:column field="fjhmc" title="房间号"></cps:column>
			<cps:column field="fsdz" title="附属地址"></cps:column>
			<cps:column field="sfczwms" title="是否出租屋"></cps:column>
			<cps:column field="zxbsms" title="注销状态"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
		</cps:tableGrid>
		<div style="display:none">
		<form id="exportform" target="exportiframe" method="post">
			<input type="hidden" id="fwids" name="fwids"/>
		</form>
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
	</creator:box>
