<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<script type="text/javascript">
		function queryList()
		{
			var havevalue = false;
			$("#querytable").find(":visible").each(function(){
				var value = $(this).val();
				if (value != null && value != "")
				{
					havevalue = true;
				}
			});
			if (havevalue)
			{
				$("#rktablegrid").query("F","queryForm");
				
			}
			else
			{
				alert("请输入查询条件");
			}
		}
		
		
		function openRkInfoDetail(operType,rkid,rybh,rylb)
		{
			var newrkid = (rkid == undefined || rkid == null) ? "" : rkid;
			var newrybh = (rybh == undefined || rybh == null) ? "" : rybh;
			$.openWindow({
				name : "rkwin",
				url : contextPath + "/lsgl/rk/toRkInfoPage.action",
				data : {
					"operType" : operType,
					"queryBean.rkid":newrkid,
					"queryBean.rybh" : newrybh,
					"queryBean.rylb" :rylb,
					t:new Date().getTime()
				},
				width : 1000,
				height : 760
			});
		}

		function exportRsdtjjb()
		{
			$.openWindow({
				name : "rsdwin",
				url : contextPath + "/lsgl/jzzxx/toExportLdrkRsqfx.action",
				width:850,
				height:500
			})
		}
		
		function exportLdrkzhxls()
		{
			$("#queryForm").attr("action", contextPath + "/lsgl/jzzxx/exportLdrkZhQueryPage.action");
			$("#queryForm").submit();
		}
		
	</script>
	<creator:box>
	<form id="queryForm" target="exportiframe" method="post">
		<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryList()"></cps:button>
			<cps:button value="重置" onclick="reset()"></cps:button>
			<cps:button value="导出" onclick="exportLdrkzhxls()"></cps:button>
			<cps:button value="入室盗窃统计结果" onclick="exportRsdtjjb()"></cps:button>
		</cps:tbar>
		<cps:panel id="fwquerypanel" title="流口入室盗查询" >
				<input type="hidden" name="operType" value="select">
				<input type="hidden" name="modename" value="流动人口综合查询">
				<cps:table id="querytable">
					<cps:row>
						<cps:tdLabel width="15%">市局：</cps:tdLabel>
						<cps:tdContent  width="20%">
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
						<cps:tdContent  width="20%">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent >
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
						</cps:tdContent>
						<cps:tdLabel>社区：</cps:tdLabel>
						<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" name="queryBean.djsj_start" dateFmt="yyyy-MM-dd" cssStyle="width:40%" maxDate="${currentSysdateDate}" maxDateDepend="djsj_end"></cps:date>
							至<cps:date id="djsj_end" name="queryBean.djsj_end" minDateDepend="djsj_start"  dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">是否从业人员：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="sfcyry" zdlb="GB_ZT" name="queryBean.sfcyry" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">高危地区：</cps:tdLabel>
						<cps:tdContent  width="20%">
							<cps:select id="gwdq" zdlb="ZDY_GWDQ" name="queryBean.gwdq" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel  width="10%">登记次数：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="djcs" zdlb="ZDY_DJCS" name="queryBean.djcs" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel>是否前科劣迹人员：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="sfqkljry" zdlb="GB_ZT" name="queryBean.sfqkljry" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel >性别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="xb" zdlb="GB_XB" name="queryBean.xb" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>年龄：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="agestart" name="queryBean.age_start" inputType="integer" maxlength="2" cssStyle="width:40%"/>
							至<cps:textfield id="ageend" name="queryBean.age_end" inputType="integer" cssStyle="width:40%" maxlength="2"/>
						</cps:tdContent>
								
					</cps:row>
				 	<cps:row>
				 		<cps:tdLabel>入室盗窃前科人员：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="sfrsdqqkry" zdlb="GB_ZT" name="queryBean.sfrsdqqkry" headerKey="" headerValue=" "></cps:select>	
						</cps:tdContent>
						<cps:tdLabel>来本地时长：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="lcsj" zdlb="ZDY_LBDSC" name="queryBean.lbdsc" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>
							&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
	<cps:tableGrid id="rktablegrid"  
			title="流口入室盗查询列表"
			url="/lsgl/jzzxx/queryLdrkZhQueryPageResult.action" 
			searchform="queryForm"
			mutilSelect="true"
			autoload="false"
			width="99.8%">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" align="center"></cps:column>
		<cps:column field="xm" title="姓名" ></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="hjdqhmc" title="户籍地区划"  align="left" maxlength="5"></cps:column>
		<cps:column field="hjdxz" title="户籍地详址" align="left" maxlength="8"></cps:column>
		<cps:column field="xzzxz" title="现住地" align="left" maxlength="8"></cps:column>
		<cps:column field="lxdh" title="联系电话"></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
	</cps:tableGrid>
	</creator:box>
	<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
</creator:view>