<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="小区/组干部管理">
	<creator:Script src="/jsp/afgl/js/sqgbinfo.js"></creator:Script>
	<creator:tbar  id="sqglinfotab">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSave()"></cps:button>
				<cps:button id="submitbtn" value="取&nbsp;消" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldglpanel" title="小区/组干部基本信息" tbarId="sqglinfotab">
		<form id="infoform" name="infoform" action="<c:url value='/afgl/sqgbgl/saveSqgbxxBean.action'/>" method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="gbbh" name="bean.gbbh"></s:hidden>
		<input type="hidden" id="lx" name="bean.lx" value="2">
		<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="90%">
					<cps:table>
						<cps:row id="sq_row">
							<cps:tdLabel><font color="red">*</font>小区/组名称：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<c:choose>
									<c:when test="${operType=='detail'}">
										<cps:dicText value="${bean.sssqmc}"></cps:dicText>
									</c:when>
									<c:otherwise>
										<input type="hidden" id="sssqbh" name="bean.sssqbh" value="${bean.sssqbh}">
										<cps:textfield id="sssqmc"  name="bean.sssqmc" value="${bean.sssqmc}" cssClass="validate[required] cps-input" appendPopuBtn="true" cssStyle="width:96%" readonly="true" onclick="openWyxqxxSelectWin()"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						
						<cps:row id="clear_row2">
							<cps:tdLabel width="11%"><font color="red">*</font>身份证号：</cps:tdLabel>
							<cps:tdContent width="22%">
								<c:choose>
									<c:when test="${operType=='add'}">
										<cps:textfield id="gbsfzh" name="bean.gbsfzh" onblur="loadRkxxBean(this.value)" maxlength="18" required="true" isSfzh="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										<cps:textfield id="gbsfzh" name="bean.gbsfzh" readonly="true" maxlength="18" required="true" isSfzh="true"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="11%"><font color="red">*</font>姓名：</cps:tdLabel>
							<cps:tdContent width="22%">
								<cps:textfield id="gbxm" name="bean.gbxm" required="true" maxlength="15"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="11%"><font color="red">*</font>性别：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="gbxb" zdlb="GB_XB" name="bean.gbxb" value="${bean.gbxb}" headerKey="" headerValue=" " required="true"></cps:select>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row3">
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="gbcsrq" name="bean.gbcsrq" value="${bean.gbcsrq}" cssClass="cps-input" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel><font color="red">*</font>${bean.whcd}学历：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="whcd" zdlb="GB_WHCD" name="bean.whcd" value="${bean.whcd}" required="true" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="gblxdh" name="bean.gblxdh" maxlength="20" minlength="7" isPhone="true" value="${bean.gblxdh}" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row3">
							<cps:tdLabel>户籍地区划：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="gbhjdqh" name="bean.gbhjdqh" value="${bean.gbhjdqh}">
								<cps:textfield id="gbhjdqhmc" name="gbhjdqhmc" ondblclick="openHjdxzqh()" appendPopuBtn="true" value="${bean.gbhjdqhmc}" onclick="openHjdxzqh()"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>政治面貌：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="gbzzmm" zdlb="GB_ZZMM" name="bean.gbzzmm" value="${bean.gbzzmm}" cssClass="cps-input" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							<cps:tdLabel>调入时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="gbdrsj" name="bean.gbdrsj" value="${bean.gbdrsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row5">
							<cps:tdLabel><font color="red">*</font>家庭住址：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<cps:textfield id="gbxzdxz" name="bean.gbxzdxz" maxlength="60" value="${bean.gbxzdxz}" cssStyle="width:96%" required="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					 	<cps:row id="clear_row8">
							<cps:tdLabel width="10%">职务：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<s:checkboxlist list="xqzgbzwList" id="gbzw" name="bean.gbzws" listKey="dm" listValue="mc" cssClass="validate[required]"></s:checkboxlist>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row7">
							<cps:tdLabel>是否调离：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="sfdl" name="bean.sfdl" zdlb="RYSFDL" value="${bean.sfdl}" cssClass="cps-input"></cps:select>
							</cps:tdContent>
							<cps:tdLabel>调离时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="gbdcsj" name="bean.gbdcsj" value="${bean.gbdcsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
							</cps:tdContent>
							<cps:tdLabel>备注：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="gbxzdxz" name="bean.bz" maxlength="60" value="${bean.gbxzdxz}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						 
						<cps:row>
							<cps:tdLabel>登记人姓名：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="djrjh" name="bean.djrjh" value="${loginInfo.username}"/>
								<cps:textfield id="djrxm" name="bean.djrxm" readonly="true" value="${loginInfo.realname}"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="djdwdm" name="bean.djdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="djdwmc" name="bean.djdwmc"  readonly="true" value="${loginInfo.orgname}"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="djsj" name="bean.djsj" readonly="true"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:tdContent>
				<cps:tdContent valign="top">
					<img id="gbzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${bean.gbsfzh}" height="140" width="130"/>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
<c:if test="${operType != 'detail'}">
	<creator:panel id="gbrylist" title="小区/组干部列表">
		<form id="gblistqueryform">
			<input type="hidden" id="sqbh" name="queryBean.sqdm" value="${bean.sssqbh }" />
			<input type="hidden" name="queryBean.lx" value="2" />
		</form>
		<cps:tableGrid id="gbquerylist" 
					mutilSelect="true"
					autoload="${bean.sssqbh !=null && bean.sssqbh != ''  ? true : false}"
					usepager="true"
					click="setValueToForm"
					url="/afgl/sqgbgl/querySqgbPageResult.action" 
					searchform="gblistqueryform" width="99.8%" pageSize="10">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作" rowcallback="czRowCallBack"></cps:column>
			<cps:column field="gbxm" title="姓名"></cps:column>
			<cps:column field="gbxbmc" title="性别"></cps:column>
			<cps:column field="gbsfzh" title="身份证号"></cps:column>
			<cps:column field="gbxzdxz" title="住址" maxlength="15"></cps:column>
			<cps:column field="gbzwmc" title="职务" maxlength="15"></cps:column>
			<cps:column field="gbdrsj" title="调入时间"></cps:column>
			
		</cps:tableGrid>
	</creator:panel>
</c:if>
</creator:view>