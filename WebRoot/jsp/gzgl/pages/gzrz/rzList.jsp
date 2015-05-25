<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:Script src="/jsp/gzgl/js/mjrzList.js"></creator:Script>
	<creator:box>
	<creator:tbar id="rztbar">
		
		<cps:button value="查&nbsp;询" onclick="queryData();"></cps:button>
		<cps:button value="新&nbsp;增" onclick="toNewRz();"></cps:button>
		<cps:button value="导&nbsp;出" onclick="downLoadRz();"></cps:button>
		<cps:button value="日志汇总" onclick="openRzhzWin()"></cps:button>
		<!-- 
		<cps:button value="打&nbsp;印" onclick="exportRzWord();"></cps:button>
		 -->
	</creator:tbar>
		<creator:panel id="rizhiPanel" title="日志管理" tbarId="rztbar">
			<form id="searchform">
			<%-- 
			<input type="hidden" name="rizhiQuery.mjjh" value="${loginInfo.username}"/>
			--%>
				<cps:table>
					<cps:row>
					<cps:tdLabel  width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="20%">
							<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="rizhiQuery.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="rizhiQuery.citygajgjgdm" value="${rizhiQuery.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="rizhiQuery.citygajgjgdm" value="rizhiQuery.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="rizhiQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="rizhiQuery.countrygajgjgdm" value="${rizhiQuery.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="rizhiQuery.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel>派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="rizhiQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="rizhiQuery.pcsdm" value="${rizhiQuery.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="rizhiQuery.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="rizhiQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="rizhiQuery.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="rizhiQuery.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%;">值班民警：</cps:tdLabel>
						<cps:tdContent width="25%;">
							<cps:textfield id="title" name="rizhiQuery.title"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%;">工作时间：</cps:tdLabel>
						<cps:tdContent width="25%;">
							<cps:date id="beginDate" name="rizhiQuery.beginDate"
								dateFmt="yyyy-MM-dd"  cssStyle="width:40%;">
							</cps:date>
							-
							<cps:date id="endDate" name="rizhiQuery.endDate"
								dateFmt="yyyy-MM-dd"  cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid url="/gzgl/rzgl/queryRizhiList.action" 
			id="datagridList" title="日志列表"
			width="99.8%"
			searchform="searchform" autoload="false" mutilSelect="false" >
			<cps:column isNumber="true" title="序号" ></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
			<cps:column field="rzbt" title="日志标题" align="left"></cps:column>
			<cps:column field="gzmjxm" title="工作民警" align="left"></cps:column>
			<cps:column field="gzrq" title="工作日期" ></cps:column>
			<cps:column field="gznrms" title="工作内容" align="left" maxlength="20"></cps:column>
		</cps:tableGrid>
		
		<!-- 日志汇总 -->
		<div id="rzhzDiv" style="display:none;width:400px;height:120px;">
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="汇总" onclick="rzhz()"></cps:button>
					<cps:button value="清空" onclick="clearHzForm()"></cps:button>
					<cps:button value="关闭" onclick="closeRzhzWin()"></cps:button>
				</cps:tbar>
				<cps:panel title="日志汇总">
					<input type="hidden" id="sysdate" value="${sysdate}" />
					<form id="rzhz">
						<cps:table>
							<cps:row>
								<cps:tdLabel width="30%">汇总周期：</cps:tdLabel>
								<cps:tdContent>
									<s:radio id="rzzq" list="#{'0':'周报','1':'月报'}" name="rizhiQuery.rzzq" onclick="rzzqclick()"></s:radio>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>自定义时间：</cps:tdLabel>
								<cps:tdContent>
									<cps:date id="hz_starttime" dateFmt="yyyy-MM-dd" maxDateDepend="hz_endtime" name="rizhiQuery.beginDate" cssStyle="width:45%" onblur="clearHzzq()"/> 
								  - <cps:date id="hz_endtime" dateFmt="yyyy-MM-dd"  minDateDepend="hz_starttime" name="rizhiQuery.endDate" maxDate="sydate" cssStyle="width:45%" onblur="clearHzzq()"/>
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel><font color='red'>*</font>工作人：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield  id="hz_mjmx" appendPopuBtn="true" value="${loginInfo.realname}" onclick="userSelect('${loginInfo.orgcode}',${loginInfo.leve},'hz_mjmx','hz_mjjh')" cssStyle="width:96%" required="true"></cps:textfield>
									<input type="hidden" name="rizhiQuery.mjjh" id="hz_mjjh" value="${loginInfo.username}"/>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</form>
				</cps:panel>
			</cps:PanelView>
		</div>
		
		
		<!--  
		<div style="display:none">
			<form id="exportform" target="exportiframe" method="post">
				<input type="hidden" id="rzid" name="rzid"/>
			</form>
			<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
		</div>
		-->
	</creator:box>
</creator:view>
