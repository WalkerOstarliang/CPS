<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<creator:box>
	<form id="queryForm">
	<cps:PanelView>
	<cps:tbar>
		<cps:button value="查询" onclick="queryList()"></cps:button>
		<cps:button value="重置" onclick="reset()"></cps:button>
		<cps:button value="批量打印人口信息" onclick="toPrintRkxxInfoPage('rktablegrid')"></cps:button>
		<c:if test="${queryBean.rylb == 'select'}">
			<cps:button value="导出实有人口信息" onclick="toExportExcelSyrkInfo('select')"></cps:button>
		</c:if>
		<c:if test="${queryBean.rylb == null}">
			<cps:button value="实有人口登记" onclick="openSelectFwWin(true,'','')" display="${displayAddBtn}"></cps:button>
		</c:if>
		<c:if test="${queryBean.rylb=='1'}">
			<%-- 
			<cps:button value="打印常口信息" onclick="toExportPrintSyrkInfoPage('1')"></cps:button>
			--%>
			<cps:button value="导出常口信息" onclick="toExportExcelSyrkInfo('1')"></cps:button>
		</c:if>
		<c:if test="${queryBean.rylb=='5'}">
			<cps:button value="导出寄口信息" onclick="toExportExcelSyrkInfo('5')"></cps:button>
		</c:if>
		<c:if test="${queryBean.rylb == '4'}">
			<cps:button value="境外人口登记" onclick="toJwrkSelectFwWin(true,'4')" display="${displayAddBtn}"></cps:button>
			<cps:button value="打印境外人口信息" onclick="ldrkExportWord()"></cps:button>
		</c:if>
		<c:if test="${queryBean.rylb=='2'}">
			<cps:button value="居住证管理" onclick="openLdrkJzzxxWin()"></cps:button>
			<cps:button value="流动人口延期" onclick="openLdrkYQWin()" display="${displayAddBtn}"></cps:button>
			<cps:button value="打印流口信息" onclick="ldrkExportWord()"></cps:button>
			<cps:button value="导出流口信息" onclick="ldrkExportExcel()"></cps:button>
			<cps:button value="批量注销" onclick="openBathchlogoutRkInfoPage()"></cps:button>
		</c:if>
	</cps:tbar>
	<cps:panel id="fwquerypanel" title="${modename}查询" >
			<input type="hidden" name="operType" value="select">
			<input type="hidden" name="modename" value="${modename}">
			<input type="hidden" name="queryBean.rylb" value="${queryBean.rylb}">
			<cps:table>
				<c:if test="${queryBean.rylb != '' and queryBean.rylb !=null}">
					<input type="hidden" name="queryBean.leve" value="${loginInfo.leve}">
					<input type="hidden" name="queryBean.orgcode" value="${loginInfo.orgcode}">
					<cps:row>
						<cps:tdLabel  width="9%">市局：</cps:tdLabel>
						<cps:tdContent  width="25%">
								<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
								</c:when>
								<c:otherwise>
										<s:hidden name="queryBean.pcsdm"></s:hidden>
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
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
						<c:if test="${queryBean.rylb != '4'}">
							<cps:tdLabel width="10%">姓名：</cps:tdLabel>
							<cps:tdContent >
								<cps:textfield id="xm" name="queryBean.xm" cssStyle="width:50%"></cps:textfield>
								<input type="checkbox" id="xmty"  name="queryBean.xmty" value="1" onclick="setXmtyInfo(this)" />
								<label for="xmty" >同音</label>
							</cps:tdContent>
						</c:if>
						<c:if test="${queryBean.rylb == '4'}">
							<cps:tdLabel width="10%">英文姓名：</cps:tdLabel>
							<cps:tdContent >
								<cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
							</cps:tdContent>
						</c:if>
					</cps:row>
				 </c:if>
				 <c:if test="${queryBean.rylb == '' or queryBean.rylb == null}">
				 	<cps:row>
						<cps:tdLabel  width="9%">市局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>	
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="25%">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent >
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="dm" listValue="jc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqbhselect')" ></s:select>
						</cps:tdContent>
						<c:if test="${queryBean.rylb != '4'}">
							<cps:tdLabel width="10%">姓名：</cps:tdLabel>
							<cps:tdContent >
								<cps:textfield id="xm" name="queryBean.xm" cssStyle="width:50%"></cps:textfield>
								<input type="checkbox" id="xmty"  name="queryBean.xmty" onclick="setXmtyInfo(this)" />
								<label for="xmty" >同音</label>
							</cps:tdContent>
						</c:if>
						<c:if test="${queryBean.rylb == '4'}">
							<cps:tdLabel width="10%">英文姓名：</cps:tdLabel>
							<cps:tdContent >
								<cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
							</cps:tdContent>
						</c:if>
						<cps:tdLabel>操作时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="czsj_start" cssStyle="width:40%" name="queryBean.czsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>-
							<cps:date id="czsj_end"   cssStyle="width:40%" minDateDepend="czsj_start" name="queryBean.czsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
					</cps:row>
				 </c:if>
				<cps:row>
					<cps:tdLabel width="9%">证件种类：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:select zdlb="GB_ZJZL"  id="zjzl" name="queryBean.zjzl" value="${queryBean.zjzl}" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="zjhm" name="queryBean.zjhm" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >性别：</cps:tdLabel>
					<cps:tdContent >
						 <cps:select zdlb="GB_XB" id="xb" name="queryBean.xb" value="${queryBean.xb}"  headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				
				<c:if test="${queryBean.rylb !='4'}">
					<cps:row>
						<cps:tdLabel >出生日期：</cps:tdLabel>
						<cps:tdContent id="birthContent">
							<cps:date id="csrq_start" cssStyle="width:37%" name="queryBean.csrq_start" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
							至
							<cps:date id="csrq_end"   cssStyle="width:37%" name="queryBean.csrq_end" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}" minDateDepend="csrq_start"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >年龄段：</cps:tdLabel>
						<cps:tdContent id="ageContent"  >
							<cps:textfield id="age_start" cssStyle="width:37%" name="queryBean.age_start"  inputType="integer" onblur="minAge(this.value)" maxlength="2"></cps:textfield>
							至
							<cps:textfield id="age_end"   cssStyle="width:37%" name="queryBean.age_end" inputType="integer" onblur="maxAge(this.value)" maxlength="3"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>户籍地区划：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="hjdqh" name="queryBean.hjdqh">
								<cps:textfield id="hjdqhmc" appendPopuBtn="true" onclick="openSelectXzqh('0',callbackHjdqh)"></cps:textfield>
							</cps:tdContent>
					</cps:row>
				</c:if>
				
				<%-- 实有人口查询--%>
				<c:if test="${queryBean.rylb=='select'}">
					<cps:row>
						<cps:tdLabel>民族：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="GB_MZ" id="mz" name="queryBean.mz" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel >登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:40%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}"></cps:date>
							至
							<cps:date id="djsj_end"   cssStyle="width:40%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
					</cps:row>
				</c:if>
				
				<%--常住人口查询 --%>
				<c:if test="${queryBean.rylb=='1'}">
					<cps:row>
						<cps:tdLabel>民族：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="GB_MZ" id="mz" name="queryBean.mz" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel >登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:40%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}"></cps:date>
							至
							<cps:date id="djsj_end"   cssStyle="width:40%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
					</cps:row>
				</c:if>
				<%--流动人口查询 --%>
				<c:if test="${queryBean.rylb=='2'}">
					<cps:row>
						<cps:tdLabel>民族：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="GB_MZ" id="mz" name="queryBean.mz" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel >登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:37%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}"></cps:date>
							至
							<cps:date id="djsj_end"   cssStyle="width:37%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>居住地址：</cps:tdLabel>
						<cps:tdContent>
						 	<input type ="hidden" id="fwid"  name= "queryBean.fwid" >
						 	<cps:textfield id="dzmc" name="queryBean.dzmc" appendPopuBtn="true" onclick="openSelectFwWin(true,'','selectQuery')"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>居住证办理：</cps:tdLabel>
					    <cps:tdContent>
					 		<s:select list="#{'0':'否','1':'是'}" id="sfbljzz" name="queryBean.sfbljzz" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
					    </cps:tdContent>
					    <cps:tdContent colspan="2">
							<input  type="checkbox" id="xj" name="queryBean.xj" value="xj" >
							<label for="xj" >新疆籍维吾尔族人员</label>
							<input  type="checkbox" id="xz" name="queryBean.xz" value="xz" >
							<label for="xz" >西藏籍藏族人员</label>
					 	</cps:tdContent>
					</cps:row>
				</c:if>
				
				<%-- 寄住人口--%>
				<c:if test="${queryBean.rylb=='5'}">
					<cps:row>
						<cps:tdLabel>民族：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="GB_MZ" id="mz" name="queryBean.mz" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel >登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:37%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}"></cps:date>
							至
							<cps:date id="djsj_end"   cssStyle="width:37%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
					</cps:row>
				</c:if>
				<%-- 未落户人口--%>
				<c:if test="${queryBean.rylb=='3'}">
					<cps:row>
						<cps:tdLabel>民族：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="GB_MZ" id="mz" name="queryBean.mz" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel >登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:37%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}"></cps:date>-
							<cps:date id="djsj_end"   cssStyle="width:37%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
					</cps:row>
				</c:if>
				<%-- 境外人口--%>
				<c:if test="${queryBean.rylb=='4'}">
					<cps:row>
						<cps:tdLabel>国籍</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="GB_GJ" id="gj" name="rkBean.jbxxBean.gj" value="${rkBean.jbxxBean.gj}" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:37%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}"></cps:date>
							-
							<cps:date id="djsj_end"   cssStyle="width:37%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
						
					</cps:row>
				</c:if>
				<cps:row>
					<cps:tdLabel>实体：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<input type="hidden" name="queryBean.stid" id="stid" />
						<cps:textfield id="stmc" appendPopuBtn="true" onclick="openSelectStxxBean()" cssStyle="width:90%"></cps:textfield>
						<cps:button value="清空" onclick="clearSt()"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
		</cps:PanelView>
	</form>
	
	<c:choose>
		<c:when test="${queryBean.rylb != '4'}">
			<cps:tableGrid id="rktablegrid"  
				title="${modename}列表"
				url="/lsgl/rk/queryRkPageResultInfo.action" 
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
				<cps:column field="xzzxz" title="住址详址" align="left" maxlength="8"></cps:column>
				<cps:column field="lxdh" title="联系电话"></cps:column>
				<c:if test="${queryBean.rylb != '2'}">
					<cps:column field="zxbsms" title="注销状态"></cps:column>	
				</c:if>
				<c:if test="${queryBean.rylb =='2'}">
					<cps:column field="jzzdyztms" title="居住证办理"></cps:column>
				</c:if>
			</cps:tableGrid>
		</c:when>

		<c:when test="${queryBean.rylb == '4'}">
			<cps:tableGrid id="rktablegrid"  
				title="${modename}列表"
				url="/lsgl/rk/queryRkPageResultInfo.action" 
				searchform="queryForm"
				mutilSelect="true"
				autoload="false"
				width="99.8%">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="cz" title="操作" align="center"></cps:column>
				<cps:column field="gjms" title="国籍" ></cps:column>
				<cps:column field="ywx" title="英文姓" maxlength="5"></cps:column>
				<cps:column field="ywm" title="英文名" maxlength="5"></cps:column>
				<cps:column field="zjzlms" title="证件种类" ></cps:column>
				<cps:column field="zjhm" title="证件号码" maxlength="7"></cps:column>
				<cps:column field="xbms" title="性别"></cps:column>
				<cps:column field="csrq" title="出生日期"></cps:column>
				<cps:column field="xzzxz" title="住址祥址" align="left" maxlength="8"></cps:column>
				<cps:column field="lxdh" title="联系电话" maxlength="7"></cps:column>
				<cps:column field="zxbsms" title="注销状态"></cps:column>	
			</cps:tableGrid>
		</c:when>
	</c:choose>
	</creator:box>
	<div style="display:none">
		<form id="exportform" target="exportform" method="post">
			<input type="hidden" id="ldrkids" name="ldrkids"/>
			<input type="hidden" id="rkids" name="rkids"/>
			<input type="hidden" id="selectedrybhs" name="selectedrybhs"/>
			<input type="hidden" id="rylb" name="queryBean.rylb" value="${queryBean.rylb }"/>
		</form>
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
	<div style="display:none">
		<form id="wordform" target="_blank" method="post">
			<input type="hidden" id="rybhs" name="rybhs"/>
		</form>
	</div>
</creator:view>