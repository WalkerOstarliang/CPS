<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/whsrk/js/whsrk.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryRkList()"></cps:button>
			<cps:button value="重置" onclick="clearSearchForm()"></cps:button>
			<cps:button value="导出" onclick="expWhsRk()"></cps:button>
			<c:if test="${loginInfo.leve == 4}">
				<cps:button value="派发" onclick="openRypfWin()"></cps:button>
			</c:if>
			<c:if test="${loginInfo.leve == 5}">
				<cps:button value="退回" display="${displayAddBtn}" onclick="openRythWin()"></cps:button>
				<cps:button value="反馈" display="${displayAddBtn}" onclick="openRyfkWin()"></cps:button>
				<cps:button value="登记实有人口" display="${displayAddBtn}" onclick="syrkdj()"></cps:button>
			</c:if>
		</cps:tbar>
		<cps:panel title="查询条件">
			<form id="searchForm" >
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="query.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.citygajgjgdm" value="${query.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="query.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">县区局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										name="query.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.countrygajgjgdm" value="${query.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="query.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.pcsdm" value="${query.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm"
										disabled="true" listKey="dm" listValue="jc" headerKey=""
										headerValue=" " cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="query.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="query.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.xm" id="xm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
			
					<cps:row>
						<cps:tdLabel>身份证号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.sfzh" id="sfzh"></cps:textfield>
						</cps:tdContent>
						<c:if test="${loginInfo.leve != 5}">
							<cps:tdLabel>派发状态：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'0':'未派发','1':'已派发','2':'已退回'}" name="czzt" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
							</cps:tdContent>
							
							<cps:tdLabel>派发时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date name="query.pfsj_s" dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>&nbsp;至
								<cps:date name="query.pfsj_e" dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>
							</cps:tdContent>
						</c:if>
						<c:if test="${loginInfo.leve == 5}">
							<cps:tdLabel>户籍地详址：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield name="query.hjdxz" id="hjdxz"></cps:textfield>
								<input type="hidden" name="czzt" value="1" /> 
							</cps:tdContent>
						</c:if>
					</cps:row>
					<c:if test="${loginInfo.leve != 5}">
						<cps:row>
							<cps:tdLabel>户籍地详址：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield name="query.hjdxz" id="hjdxz"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					</c:if>
				</cps:table>
			</form>	
		</cps:panel>
	</cps:PanelView>
	<cps:tableGrid url="/whsrk/queryWhsRkList.action" 
						title="人员列表"
						id="rylist" 
						autoload="false" 
						pageSize="10" 
						width="99.8%" 
						usepager="true" 
						searchform="searchForm" 
						autothead="false" 
						mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column title="姓名" field="xm" align="left"></cps:column>
			<cps:column title="身份证号" field="sfhm"></cps:column>
			<cps:column title="联系电话" field="lxfs"></cps:column>
			<cps:column title="户籍地详址" field="hjdxz" align="left" maxlength="20"></cps:column>
			<cps:column title="现住址详址" field="zzxz" align="left" maxlength="20"></cps:column>
			<c:if test="${loginInfo.leve != 5}">
				<cps:column title="派发状态" field="czztms" align="left" width="8%"></cps:column>
			</c:if>
			<%-- 
			<cps:column title="反馈状态" field="fkztms" width="8%"></cps:column>
			--%>
	</cps:tableGrid>
	
	<c:if test="${loginInfo.leve == 4}">
		<div id="rypf" style="display: none;width: 500px">
			<cps:panel title="人员派发">
				<form id="rypfform">
					<input type="hidden" name="whsrkpf.rkid" id="pf_rkid" />
					<input type="hidden" name="whsrkpf.jwqdm" id="jwqdm" />
					<input type="hidden" name="whsrkpf.jwqmc" id="jwqmc" />
					<input type="hidden" name="whsrkpf.mbdwdm" id="mbdwdm" />
					<cps:table>
						<cps:row>
							<cps:tdLabel width="20%"><span style="color:red">*</span>单位：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield name="whsrkpf.mbdwmc" id="mbdwmc" onclick="openSqxxSelectWin()" appendPopuBtn="true" readonly="true" required="true"></cps:textfield>
								<cps:button value="清除" onclick="clearSqSelect()"></cps:button>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent cssStyle="text-align:center;" colspan="2">
								<cps:button value="派发" onclick="saveRyPfxx()"></cps:button>&nbsp;&nbsp;
								<cps:button value="关闭" onclick="closeLayer()"></cps:button>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</div>
	</c:if>
		
	<c:if test="${loginInfo.leve == 5}">
		<div id="ryth" style="display: none;width: 500px">
			<cps:panel title="人员退回">
				<form id="ryform">
					<input type="hidden" name="whsrkth.rkid" id="th_rkid" />
					<cps:table>
						<cps:row>
							<cps:tdLabel width="30%"><span style="color:red">*</span>退回原因：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield type="textarea" id="thyy" name="whsrkth.thyy" cssStyle="height:80px;width:95%" required="true"
									cssClass="validate[maxSize[200]]"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent cssStyle="text-align:center;" colspan="2">
								<cps:button value="退回" onclick="saveRyThxx()"></cps:button>&nbsp;&nbsp;
								<cps:button value="关闭" onclick="closeLayer()"></cps:button>
							</cps:tdContent>
					</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</div>
		
		<div id="ryfk" style="display: none;width: 500px">
			<cps:panel title="人员反馈">
				<form id="ryfkform">
					<input type="hidden" name="whsrkfk.rkid" id="fk_rkid" />
					<cps:table>
						<cps:row>
							<cps:tdLabel><span style="color:red">*</span>反馈类型：</cps:tdLabel>
							<cps:tdContent>
								<cps:select zdlb="ZDY_RY_FKLX" name="whsrkfk.fklx" cssStyle="200px" id="fklx" required="true"></cps:select>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="30%">反馈内容：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield type="textarea" id="fknr" name="whsrkfk.fknr" cssStyle="height:80px;width:95%" 
									cssClass="validate[maxSize[200]]"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent cssStyle="text-align:center;" colspan="2">
								<cps:button value="反馈" onclick="saveRyFkxx()"></cps:button>&nbsp;&nbsp;
								<cps:button value="关闭" onclick="closeLayer()"></cps:button>
							</cps:tdContent>
					</cps:row>
					</cps:table>
				</form>
			</cps:panel>
		</div>
	</c:if>	
	
	<div style="display: none;">
		<iframe name="expWhsrk" id="expWhsrk" src="" />
	</div>
</creator:view>