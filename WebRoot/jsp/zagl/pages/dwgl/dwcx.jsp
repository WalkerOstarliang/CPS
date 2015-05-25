<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view title="${dwcx.hylbmc}单位查询">
	<!-- 单位通用查询页面 -->
	<creator:box>
		<creator:Script src="/jsp/zagl/js/dwcx.js"></creator:Script>
		<creator:Script src="/jsp/sydw/js/sydwinfo.js"></creator:Script>
		<input type="hidden" id="loginUser" value="${loginInfo.realname}" />
		<s:if test="dwcx.hylbmc != ''">
			<c:set var="title" value="${dwcx.hylbmc}" scope="page" />
		</s:if>
		<s:else>
			<c:set var="title" value="单位" scope="page" />
		</s:else>
		<creator:tbar id="dwlisttbar">
			<cps:button value="查询" type="button" onclick="dwcx()"></cps:button>
			<cps:button value="导出" onclick="toExportExcelDwxx()"></cps:button>
			<cps:button value="新增单位" onclick="openFwWin('${dwcx.hylb}')" display="${displayAddBtn}"></cps:button>
			<cps:button id="cyrybtn" value="从业人员登记" onclick="clickCyryBtn()" display="${displayAddBtn}"></cps:button>
			<cps:button id="aqjcbtn" value="安全检查" onclick="clickAqjcBtnEvent()"></cps:button>
			<cps:button id="dwzpbtn" value="单位照片" onclick="clickGgBtnEvent('dwzpinfo')"></cps:button>
			<cps:button id="dwjfbtn" value="单位奖罚" onclick="clickGgBtnEvent('dwjcinfo')"></cps:button>
			<cps:button id="zdyhbwtn" value="重点要害部位" onclick="clickGgBtnEvent('zdyhbwinfo')"></cps:button>
			<cps:button id="aqsbbtn" value="安全设备" onclick="clickGgBtnEvent('aqsbinfo')"></cps:button>
		</creator:tbar>
		<creator:panel id="cxtj" title="${title}查询" tbarId="dwlisttbar">
			<form id="dwcx" method="post">
				<input type="hidden" name="dwcx.opertype" value="${dwcx.opertype}" id="opertype" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="dwcx.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.citygajgjgdm" value="${dwcx.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="dwcx.citygajgjgdm" listKey="dm"
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
										name="dwcx.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.countrygajgjgdm" value="${dwcx.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="dwcx.countrygajgjgdm" listKey="dm"
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
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.pcsdm" value="${dwcx.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm"
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
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="dwcx.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="dwcx.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>实体名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.stmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">单位属性：</cps:tdLabel>
						<cps:tdContent width="21%">
							<s:if test="dwcx.hylb != null">
								<cps:select headerValue=" " headerKey="" zdlb="ZDY_HYLB"
									disabled="true" value="${dwcx.hylb}" />
								<input type="hidden" name="dwcx.hylb" value="${dwcx.hylb}" />
							</s:if>
							<s:else>
								<cps:select headerValue=" " headerKey="" zdlb="ZDY_HYLB" name="dwcx.hylb" />
							</s:else>
						</cps:tdContent>
						<cps:tdLabel width="12%">组织机构代码：</cps:tdLabel>
						<cps:tdContent width="21%">
							<cps:textfield name="dwcx.dwdm"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>营业执照号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.yyzzh"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.dwmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>法人代表：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frdb"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>法人身份证：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frsfzhm" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="djsjstart" dateFmt="yyyy-MM-dd" name="dwcx.djsjstart" cssStyle="width:39%"  value="${dwcx.djsjstart}"/> -
								<cps:date id="djsjend" dateFmt="yyyy-MM-dd" defaultSystemDate="true" name="dwcx.djsjend" minDateDepend="djsjstart" cssStyle="width:39%"  maxDate="${dwcx.djsjend}"/>
							</cps:tdContent>
							<cps:tdLabel>单位类别：</cps:tdLabel>
							<cps:tdContent>
								<cps:select zdlb="JG_DWLB" name="dwcx.dwlb" optgroup="true" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							<cps:tdLabel>是否注销：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zxbs" name="dwcx.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" " value="0" ></cps:select>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</form>
		</creator:panel>
	   	<creator:tbar id="nbafxxtbar">
	   		<cps:button value="从业人员导入" onclick="toImportCyryExcel()" display="${displayAddBtn}"></cps:button>
	   		<cps:button id="afxtbtn" value="安防系统信息" onclick="clickNbdwGnanBtnEvent('afxtinfo')"></cps:button>
	   		<%-- 
	   		<cps:button id="abrybtn" value="安保人员信息" onclick="clickNbdwGnanBtnEvent('abryinfo')"></cps:button>
	   		--%>
	   		<cps:button id="znsgbtn" value="灾难事故信息" onclick="clickNbdwGnanBtnEvent('znsginfo')"></cps:button>
	   		<cps:button id="bwjgbtn" value="保卫机构信息" onclick="clickNbdwGnanBtnEvent('bwjginfo')"></cps:button>
	   		<cps:button id="tfsjyabtn" value="突发事件预案" onclick="clickNbdwGnanBtnEvent('tfsjyainfo')"></cps:button>
	   		<cps:button id="badysbtn" value="不安定因素" onclick="clickNbdwGnanBtnEvent('badysinfo')"></cps:button>
	   	</creator:tbar>
		<cps:tableGrid url="/zagl/dw/queryDwjbxxPageResultInfoByJgbh.action" 
						title="单位列表"
						id="cxjgList" 
						autoload="false" 
						pageSize="10" 
						width="99.8%" 
						tbarId="nbafxxtbar"
						usepager="true" 
						searchform="dwcx" 
						autothead="false" 
						mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column title="操作" field="dwcxcz" align="center"></cps:column>
			<cps:column title="机构编号" field="jgbh" align="left"></cps:column>
			<cps:column title="单位名称" field="dwmc" align="left" maxlength="5"></cps:column>
			<cps:column title="单位属性" field="hylbmc" align="left" maxlength="5"></cps:column>
			<cps:column title="法人代表" field="frdb" align="left"></cps:column>
			<cps:column title="法人身份证" field="frsfzhm" ></cps:column>
			<cps:column title="单位地址" field="dwdz" align="left" maxlength="4"></cps:column>
			<cps:column title="是否内保管理" field="sfnbglms" align="left"></cps:column>
			<cps:column title="注销标识" field="zxbsmc" align="left" ></cps:column>
		</cps:tableGrid>
	</creator:box>
	<div style="display:none">
		<form id="exportform" target="exportiframe" method="post">
			<input type="hidden" id="jgbhs" name="jgbhs"/>
		</form>
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>

