<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/xtgl/js/dwjcMain.js"></creator:Script>
	<creator:tbar id="dwjcpz_op">
		<c:if test="${!(dwjcpz.opertype eq 'detail')}">
			<cps:button value="保存" type="button" onclick="saveInfo()"></cps:button>
		</c:if>
		<cps:button value="关闭" type="button"  onclick="window.close()"></cps:button>
	</creator:tbar>
	
	<creator:panel id="dwjcpc_panel" title="单位检查周期配置" tbarId="dwjcpz_op"></creator:panel>
	<div id="dwjcpz_div">
		<form id="dwjcpzpz_form"
			action="${contextPath}/xtgl/dwjcpz/saveDwjcpz.action" method="post">
			<input type="hidden" name="modename" value="单位检查周期配置" />
			<input type="hidden" name="opertype" value="${dwjcpz.opertype}" id="opertype" />

			<cps:table>
				<cps:row>
					<input type="hidden" name="dwjcpz.id" value="${dwjcpz.id}" />

					<cps:tdLabel>行业类别<font color="red">*</font>：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="dwjcpz.opertype == 'add'">
							<cps:select name="dwjcpz.hylb" value="${dwjcpz.hylb}" headerKey=""
								headerValue="--请选择--" zdlb="ZDY_HYLB"
								id="hylb" required="true" onchange="hylbChange()" />
						</s:if>
						<s:else >
							<input type="hidden" name="dwjcpz.hylb" value="${dwjcpz.hylb}" />
							<cps:select name="dwjcpz.hylb" value="${dwjcpz.hylb}" headerKey=""
								headerValue="--请选择--" zdlb="ZDY_HYLB" 
								id="hylb" required="true" onchange="hylbChange()" disabled="true"/>
						</s:else>
					</cps:tdContent>
					
					<s:if test="dwjcpz.hylb == 'add'">
						<cps:tdLabel id="tdLabel" width="10%">单位分类：</cps:tdLabel>
						<cps:tdContent id="tdContent" width="25%">
							<cps:select name="dwjcpz.hylb" value="${dwjcpz.hylb}" headerKey=""
							headerValue="--请选择--" zdlb="ZDY_HYLB"
							id="hylb" required="true" onchange="hylbChange()" />
							<cps:doubleSelect zdlb="" id="dwdl" name="dwjcpz.dwdl"
								parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%"
								headerKey="" headerValue="--请选择--"></cps:doubleSelect>
							<cps:doubleSelect zdlb="" id="dwxl" name="dwjcpz.dwxl"
								dependSelectId="dwdl" cssStyle="width:47%" headerKey=""
								headerValue="--请选择--"></cps:doubleSelect>
						</cps:tdContent>
					</s:if>
					
					<s:else>
						<s:if test="dwjcpz.opertype == 'add'">
							<s:if test="dwjcpz.hylb == '01'">
							<cps:tdLabel id="tdLabel">特行类别：</cps:tdLabel>
							<cps:tdContent id="tdContent">
								<cps:doubleSelect zdlb="ZAGL_THLB" id="dwdl" name="dwjcpz.dwdl" value="${dwjcpz.dwdl}"
									parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%" 
									headerKey="" headerValue="--请选择--"></cps:doubleSelect>
								<cps:doubleSelect zdlb="ZAGL_THLB" id="dwxl" name="dwjcpz.dwxl" value="${dwjcpz.dwxl}"
									dependSelectId="dwdl" cssStyle="width:47%" headerKey="" 
									headerValue="--请选择--"></cps:doubleSelect>
							</cps:tdContent>
							</s:if>
							<s:elseif test="dwjcpz.hylb == '02'">
								<cps:tdLabel id="tdLabel">场所类别：</cps:tdLabel>
								<cps:tdContent id="tdContent">
									<cps:doubleSelect zdlb="GGCSLB" id="dwdl" name="dwjcpz.dwdl" value="${dwjcpz.dwdl}"
										parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%"
										headerKey="" headerValue="--请选择--"></cps:doubleSelect>
									<cps:doubleSelect zdlb="GGCSLB" id="dwxl" name="dwjcpz.dwxl" value="${dwjcpz.dwxl}"
										dependSelectId="dwdl" cssStyle="width:47%" headerKey=""
										headerValue="--请选择--"></cps:doubleSelect>
								</cps:tdContent>
							</s:elseif>
							<s:elseif test="dwjcpz.hylb == '03'">
								<cps:tdLabel id="tdLabel">单位分类：</cps:tdLabel>
								<cps:tdContent id="tdContent">
									<cps:doubleSelect zdlb="ZDY_DWFL" id="dwdl" name="dwjcpz.dwdl" value="${dwjcpz.dwdl}"
										parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%"
										headerKey="" headerValue="--请选择--"></cps:doubleSelect>
									<cps:doubleSelect zdlb="ZDY_DWFL" id="dwxl" name="dwjcpz.dwxl" value="${dwjcpz.dwxl}"
										dependSelectId="dwdl" cssStyle="width:47%" headerKey=""
										headerValue="--请选择--"></cps:doubleSelect>
								</cps:tdContent>
							</s:elseif>
							<s:else>
								<cps:tdLabel id="tdLabel">单位分类：</cps:tdLabel>
								<cps:tdContent id="tdContent">
									<cps:doubleSelect zdlb="" id="dwdl" name="dwjcpz.dwdl"
										parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%"
										headerKey="" headerValue="--请选择--"></cps:doubleSelect>
									<cps:doubleSelect zdlb="" id="dwxl" name="dwjcpz.dwxl"
										dependSelectId="dwdl" cssStyle="width:47%" headerKey=""
										headerValue="--请选择--"></cps:doubleSelect>
								</cps:tdContent>
							</s:else>
						</s:if>
						<s:else>
							<input type="hidden" name="dwjcpz.dwdl" value="${dwjcpz.dwdl}" />
							<input type="hidden" name="dwjcpz.dwxl" value="${dwjcpz.dwxl}" />
							
							<s:if test="dwjcpz.hylb == '01'">
							<cps:tdLabel id="tdLabel">特行类别：</cps:tdLabel>
							<cps:tdContent id="tdContent">
								<cps:doubleSelect zdlb="ZAGL_THLB" id="dwdl" name="dwjcpz.dwdl" value="${dwjcpz.dwdl}"
									parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%" disabled="true"
									headerKey="" headerValue="--请选择--"></cps:doubleSelect>
									
								<cps:doubleSelect zdlb="ZAGL_THLB" id="dwxl" name="dwjcpz.dwxl" value="${dwjcpz.dwxl}"
									dependSelectId="dwdl" cssStyle="width:47%" 
									headerKey="" disabled="true" headerValue="--请选择--"></cps:doubleSelect>
							</cps:tdContent>
							</s:if>
							<s:elseif test="dwjcpz.hylb == '02'">
								<cps:tdLabel id="tdLabel">场所类别：</cps:tdLabel>
								<cps:tdContent id="tdContent">
									<cps:doubleSelect zdlb="GGCSLB" id="dwdl" name="dwjcpz.dwdl" value="${dwjcpz.dwdl}"
										parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%" disabled="true"
										headerKey="" headerValue="--请选择--"></cps:doubleSelect>
									<cps:doubleSelect zdlb="GGCSLB" id="dwxl" name="dwjcpz.dwxl" value="${dwjcpz.dwxl}"
										dependSelectId="dwdl" cssStyle="width:47%" headerKey="" disabled="true"
										headerValue="--请选择--"></cps:doubleSelect>
								</cps:tdContent>
							</s:elseif>
							<s:elseif test="dwjcpz.hylb == '03'">
								<cps:tdLabel id="tdLabel">单位分类：</cps:tdLabel>
								<cps:tdContent id="tdContent">
									<cps:doubleSelect zdlb="ZDY_DWFL" id="dwdl" name="dwjcpz.dwdl" value="${dwjcpz.dwdl}"
										parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%" disabled="true"
										headerKey="" headerValue="--请选择--"></cps:doubleSelect>
									<cps:doubleSelect zdlb="ZDY_DWFL" id="dwxl" name="dwjcpz.dwxl" value="${dwjcpz.dwxl}"
										dependSelectId="dwdl" cssStyle="width:47%" headerKey="" disabled="true"
										headerValue="--请选择--"></cps:doubleSelect>
								</cps:tdContent>
							</s:elseif>
							<s:else>
								<cps:tdLabel id="tdLabel">单位分类：</cps:tdLabel>
								<cps:tdContent id="tdContent">
									<cps:doubleSelect zdlb="" id="dwdl" name="dwjcpz.dwdl" disabled="true"
										parentdm="0" doubleSelectId="dwxl" cssStyle="width:47%"
										headerKey="" headerValue="--请选择--"></cps:doubleSelect>
									<cps:doubleSelect zdlb="" id="dwxl" name="dwjcpz.dwxl" disabled="true"
										dependSelectId="dwdl" cssStyle="width:47%" headerKey=""
										headerValue="--请选择--"></cps:doubleSelect>
								</cps:tdContent>
							</s:else>
						</s:else>
					</s:else>
				</cps:row>
<%-- 
				<cps:row>
					<cps:tdLabel width="10%">特殊日期：</cps:tdLabel>
					<cps:tdContent colspan="5" id="jjrZdContent">
						<s:checkboxlist list="jjrZd" name="dwjcpz.tsrq"
							value="dwjcpz.tsrq" listKey="dm" listValue="mc"></s:checkboxlist>
					</cps:tdContent>
				</cps:row>
--%>
				<cps:row>
					<cps:tdLabel width="20%">检查周期<font color="red">*</font>：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:textfield name="dwjcpz.sz" value="${dwjcpz.sz}" id="sz"
							required="true" inputType="integer" cssStyle="width:46%" />
						<cps:select name="dwjcpz.dw" value="${dwjcpz.dw}"
							zdlb="ZAGL_JCZQDW" cssStyle="width:50px" />
					</cps:tdContent>
					
					<cps:tdLabel width="20%">提醒提前天数：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:textfield name="dwjcpz.tqtxts" value="${dwjcpz.tqtxts}" id="tqtxts" inputType="integer" maxlength="2"></cps:textfield>(天)
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwjcpz.djrxm" value="${dwjcpz.djrxm}"
							readonly="true"></cps:textfield>
					</cps:tdContent>

					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwjcpz.djrq" value="${dwjcpz.djrq}"
							readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>	
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield name="dwjcpz.djdwmc" value="${dwjcpz.djdwmc}" cssStyle="width:89%"
							readonly="true"></cps:textfield>
						<input type="hidden" name="dwjcpz.djdwdm" value="${dwjcpz.djdwdm}" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</div>
</creator:view>