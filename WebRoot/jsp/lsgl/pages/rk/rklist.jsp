<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<creator:box>
		<form id="queryForm">
			<creator:tbar id="fwtooltbar">
				<cps:button value="查询" onclick="queryList();"></cps:button>
				<cps:button value="清空查询条件" onclick="clearQueryCondition()"></cps:button>
			</creator:tbar>
			<creator:panel id="fwquerypanel" title="实有人口查询" tbarId="fwtooltbar">
				<input type="hidden" name="operType" value="select">
				<input type="hidden" name="modename" value="实有人口">
				<c:if test="${queryBean.rylb != '4'}">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="10%">人员类别：</cps:tdLabel>
							<cps:tdContent width="25%">
								<s:hidden id="rylb" name="queryBean.rylb"></s:hidden>
								<cps:select zdlb="ZDY_RYLB" name="queryBean.rylb" value="${queryBean.rylb}" disabled="true"></cps:select>
							</cps:tdContent>
							<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
							<cps:tdContent width="25%">
								 <cps:textfield name="queryBean.sfzh"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="10%">姓名：</cps:tdLabel>
							<cps:tdContent width="25%">
								 <cps:textfield name="queryBean.xm"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>市局：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
							</cps:tdContent>
							<cps:tdLabel>县区局：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
							</cps:tdContent>
							<cps:tdLabel>派出所：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</c:if>
				<c:if test="${queryBean.rylb eq '4'}">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="10%">国籍：</cps:tdLabel>
							<cps:tdContent width="25%">
								 <cps:select zdlb="GB_GJ" id="gj" name="queryBean.gj" headerKey="" headerValue="--请选择--"></cps:select>
							</cps:tdContent>
							<cps:tdLabel width="10%">证件类型：</cps:tdLabel>
							<cps:tdContent width="25%">
								 <cps:select zdlb="GB_ZJZL" id="zjzl" name="queryBean.zjzl" headerKey="" headerValue="--请选择--"></cps:select>
							</cps:tdContent>
							<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
							<cps:tdContent >
								<cps:textfield id="zjhm" name="queryBean.zjhm"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="10%">英文名：</cps:tdLabel>
							<cps:tdContent width="25%">
								<cps:textfield id="ywm" name="queryBean.ywm"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="10%">中文名：</cps:tdLabel>
							<cps:tdContent width="25%">
								 <cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="10%">责任区：</cps:tdLabel>
							<cps:tdContent width="25%">
								<input type="hidden" id="zrdwdm" name="queryBean.zrdwdm" value="${loginInfo.jwsqdm }">
								<cps:textfield id="zrdwmc" readonly="true" value="${loginInfo.jwsqmc}" appendPopuBtn="true" onclick="openZrdw('${loginInfo.rootOrgCode}')"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent >&nbsp;</cps:tdContent>
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent >&nbsp;</cps:tdContent>
						</cps:row>
					</cps:table>
				</c:if>
			</creator:panel>
		</form>
		
		<%--常住 人口 --%>
		<c:if test="${queryBean.rylb == '1'}">
			<cps:tableGrid id="rktablegrid"  
					url="/lsgl/rk/queryRkPageResultInfo.action" 
					searchform="queryForm"
					mutilSelect="false"
					autoload="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
				<cps:column field="sfzh" title="身份证号"></cps:column>
				<cps:column field="xbms" title="性别"></cps:column>
				<cps:column field="csrq" title="出生日期"></cps:column>
				<cps:column field="hjdqhmc" title="户籍地区划"></cps:column>
				<cps:column field="hjdxz" title="户籍地详址" maxlength="8"></cps:column>
				<cps:column field="ssgajgjgmc" title="公安机构名称" maxlength="8"></cps:column>
				<cps:column field="sspcsmc" title="所属派出所" maxlength="8"></cps:column>
				<cps:column field="czrxm" title="核实人"></cps:column>
				<cps:column field="czdwmc" title="核实单位" maxlength="8"></cps:column>
				<cps:column field="czsj" title="核实时间"></cps:column>
				<cps:column field="cz" title="操作"></cps:column>
			</cps:tableGrid>
		</c:if>
		<%--流动人口--%>
		<c:if test="${queryBean.rylb == '2'}">
			<cps:tableGrid id="rktablegrid" 
					url="/lsgl/rk/queryRkPageResultInfo.action" 
					searchform="queryForm"
					mutilSelect="false"
					autoload="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
				<cps:column field="sfzh" title="身份证号"></cps:column>
				<cps:column field="lbdrq" title="来本地时间"></cps:column>
				<cps:column field="zzcsms" title="暂住处所"></cps:column>
				<cps:column field="zzdqhms" title="暂住地区划"></cps:column>
				<cps:column field="zzdxz" title="暂住地详址" maxlength="8"></cps:column>
				<cps:column field="djrxm" title="登记人"></cps:column>
				<cps:column field="djdwmc" title="登记单位" maxlength="8"></cps:column>
				<cps:column field="djsj" title="登记时间"></cps:column>
				<cps:column field="cz" title="操作"></cps:column>
			</cps:tableGrid>
		</c:if>
		
		<%--未落户常住人员 --%>
		<c:if test="${queryBean.rylb == '3'}">
			 <cps:tableGrid id="rktablegrid"
					url="/lsgl/rk/queryRkPageResultInfo.action" 
					searchform="queryForm"
					mutilSelect="false"
					autoload="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
				<cps:column field="sfzh" title="身份证号"></cps:column>
				<cps:column field="czjzlms" title="持证件种类"></cps:column>
				<cps:column field="czjhm" title="持证件号码"></cps:column>
				<cps:column field="wlhqssj" title="未落户起始时间"></cps:column>
				<cps:column field="yhjdqhms" title="原户籍地区划"></cps:column>
				<cps:column field="yhjdxz" title="原户籍地详址"></cps:column>
				<cps:column field="djrxm" title="登记人姓名"></cps:column>
				<cps:column field="djdwmc" title="登记单位" maxlength="15"></cps:column>
				<cps:column field="djsj" title="登记时间"></cps:column>
				<cps:column field="cz" title="操作"></cps:column>
			</cps:tableGrid>
		</c:if>
		
		<%--境外人口 --%>
		<c:if test="${queryBean.rylb == '4'}">
			<cps:tableGrid id="rktablegrid"
					url="/lsgl/rk/queryRkPageResultInfo.action" 
					searchform="queryForm"
					mutilSelect="false"
					autoload="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="gjms" title="国籍"></cps:column>
				<cps:column field="xm" title="中文名"></cps:column>
				<cps:column field="ywm" title="英文名"></cps:column>
				<cps:column field="zjzlms" title="证件类型" ></cps:column>
				<cps:column field="zjhm" title="证件号码" ></cps:column>
				<cps:column field="xbms" title="性别" ></cps:column>
				<cps:column field="djrxm" title="登记人"></cps:column>
				<cps:column field="djdwmc" title="登记单位" maxlength="15"></cps:column>
				<cps:column field="djsj" title="登记时间"></cps:column>
				<cps:column field="cz" title="操作"></cps:column>
			</cps:tableGrid>
		</c:if>
		
		<%--寄住人口 --%>
		<c:if test="${queryBean.rylb == '5'}">
			<cps:tableGrid id="rktablegrid"
					url="/lsgl/rk/queryRkPageResultInfo.action" 
					searchform="queryForm"
					mutilSelect="false"
					autoload="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
				<cps:column field="sfzh" title="身份证号"></cps:column>
				<cps:column field="jzsj" title="寄住时间" ></cps:column>
				<cps:column field="hzsfzh" title="房主身份证号" ></cps:column>
				<cps:column field="hzxm" title="房主姓名" ></cps:column>
				<cps:column field="fwmc" title="寄住地址" maxlength="20"></cps:column>
				<cps:column field="djsj" title="登记时间"></cps:column>
				<cps:column field="djrxm" title="登记人姓名"></cps:column>
				<cps:column field="djdwmc" title="登记单位" maxlength="20"></cps:column>
				<cps:column field="cz" title="操作"></cps:column>
			</cps:tableGrid>
		</c:if>
	</creator:box>
</creator:view>