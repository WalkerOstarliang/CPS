<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="社区管理">
	<creator:Script src="/jsp/afgl/js/sqjbxxinfo.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/sqgblist.js"></creator:Script>
	<creator:tbar  id="sqjbxxtab">
		<cps:button value="保&nbsp;存" onclick="saveSqJbxxBean()"></cps:button>
	</creator:tbar>
	<creator:panel id="infopanel" title="社区基本信息"  tbarId="sqjbxxtab">
		<form id="infoform" name="xldyform" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden name="modename" value="社区基本信息"></s:hidden>
			<s:hidden id="sqid" name="sqBean.sqid"></s:hidden>
			<s:hidden id="ssxzqh" name="sqBean.ssxzqh"></s:hidden>
			<s:hidden id="ssjdxz" name="sqBean.ssjdxz"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">社区编码：</cps:tdLabel>
					<cps:tdContent width="23%">
						<cps:textfield id="sqbh" name="sqBean.sqbh" required="true" readonly="true" maxlength="12" value="${sqBean.sqbh}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">社区全称：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="sqmc" name="sqBean.sqmc" required="true"  maxlength="125"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">社区简称：</cps:tdLabel>
					<cps:tdContent >
						 <cps:textfield id="jc" name="sqBean.jc" required="true" maxlength="125"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>所属派出所：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<s:hidden id="sspcsdm" name="sqBean.sspcsdm"></s:hidden>
						<cps:textfield id="sspcsmc" name="sqBean.sspcsmc" maxlength="60" cssStyle="width:97%" cssClass="validate[required] cps-input"  onclick="openSelectPcsWin('430000000000')"  appendPopuBtn="true" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>所辖警务区：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<input type="hidden" id="fromJwqdm" name="sqBean.fromJwqdm" value="${sqBean.gxsqjwsdm}">
						<s:hidden id="gxsqjwsdm" name="sqBean.gxsqjwsdm"></s:hidden>
						<cps:textfield id="gxsqjwsmc" name="sqBean.gxsqjwsmc" cssClass="cps-input" cssStyle="width:97%" onclick="openSelectSqjwsWin()"  readonly="true" appendPopuBtn="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>社区民警：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="sqmjxm" name="sqBean.sqmjxm" value="${sqBean.sqmjxm}" cssClass="cps-input" readonly="true" appendPopuBtn="true" onclick="openSqmjMutilSelect()" cssStyle="width:94%"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="sqmjlxdh" name="sqBean.sqmjlxdh" value="${sqBean.sqmjlxdh}" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>社区负责人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="jdxzfzr" name="sqBean.jdxzfzr" cssClass="cps-input"  maxlength="50" value="${sqBean.jdxzfzr}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>社区电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="jdxzfzrdh" name="sqBean.jdxzfzrdh" value="${sqBean.jdxzfzrdh}" isPhone="true" minlength="7" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>城乡分类：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_CXFL" id="sqlx" name="sqBean.sqlx" value="${sqBean.sqlx}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>修改人：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="sqBean.djrjh" value="${loginInfo.username}"/>
						<cps:textfield id="djrxm" name="sqBean.djrxm" value="${loginInfo.realname}" cssClass="cps-input" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>修改单位：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="sqBean.djdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="djdwmc" name="sqBean.djdwmc"  value="${loginInfo.orgname}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>修改时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj" name="sqBean.djsj" value="${sqBean.djsj}" defaultSystemDate="true" readOnly="true"></cps:date>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<form id="queryform">
		<input id="sqbh" type="hidden" name="queryBean.sqdm" value="${sqBean.sqbh}">
	</form>
	<creator:tbar id="sqjbxxtar">
		<cps:button value="新增干部"  onclick="openSqgbDetailInfo('add','')"></cps:button>
		<cps:button value="删除干部" onclick="batchDeleteGbxx()"></cps:button>
	</creator:tbar>
	<cps:tableGrid id="xldquerylist"  
				title="&nbsp;社区干部列表"
				mutilSelect="true" 
				tbarId="sqjbxxtar"
				width="99.7%"
				url="/afgl/sqgbgl/querySqgbPageResult.action" 
				searchform="queryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="sqgbczRowCallback"></cps:column>
		<cps:column field="gbxm" title="姓名"></cps:column>
		<cps:column field="gbsfzh" title="身份证号"></cps:column>
		<cps:column field="gbxbmc" title="性别"></cps:column>
		<cps:column field="gbxzdxz" title="住址" align="left" maxlength="10"></cps:column>
		<cps:column field="gbzwmc" title="职务" maxlength="5"></cps:column>
	</cps:tableGrid>
</creator:view>