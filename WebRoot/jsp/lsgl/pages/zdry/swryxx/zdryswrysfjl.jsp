<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="rkjbxxsavetbar">
	<cps:button value="保存" onclick="submitFormZdryGzdxDetailInfo()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="rkjbxx"  title="人口基本信息"  tbarId="rkjbxxsavetbar">
	<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
</creator:panel>
<creator:panel id="swrysfjl"  title="动态信息>>精神病人肇事信息" >
	<div id="zdrygzdxActivityDiv">
	<form id="zdrygzdxActivityForm" method="post" >
	<cps:table>
			<input type="hidden"  id="swrybh" name="zdryBean.swrysfjlBean.swrybh" value="${zdryBean.swryBean.swrybh }">
		<cps:row id="clear_row">
			<input type="hidden"  id="id" name="zdryBean.swrysfjlBean.id" value="${zdryBean.swrysfjlBean.id }" />
			<cps:tdLabel  width="12%"><font color="red">*</font>上访时间：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:date id="sfsj" name="zdryBean.swrysfjlBean.sfsj" dateFmt="yyyy-MM-dd" value="${zdryBean.swrysfjlBean.sfsj}" required="true"></cps:date>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>上访地点：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:textfield id="sfdd" name="zdryBean.swrysfjlBean.sfdd" value="${zdryBean.swrysfjlBean.sfdd}"  required="true"  maxlength="100"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="10%">经历信息来源：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="jlxxly" name="zdryBean.swrysfjlBean.jlxxly" value="${zdryBean.swrysfjlBean.jlxxly}" zdlb="ZDY_XXLY" headerKey=""  headerValue="---请选择---"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row7">
			<cps:tdLabel width="12%">表现行为：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="bxxw" name="zdryBean.swrysfjlBean.bxxw"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[100]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row8">
			<cps:tdLabel width="12%">处理情况：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="clqk" name="zdryBean.swrysfjlBean.clqk"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row9">
			<cps:tdLabel width="12%">备注：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="bz" name="zdryBean.swrysfjlBean.bz"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[100]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row >
			<cps:tdLabel>登记人：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="djrxm" name="zdryBean.swrysfjlBean.djrxm" value="${loginInfo.realname}"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>登记单位：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="djdwdm" name="zdryBean.swrysfjlBean.djdwdm" value="${loginInfo.orgcode}">
				<cps:textfield id="djdwmc" name="zdryBean.swrysfjlBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>登记时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="djsj" name="zdryBean.swrysfjlBean.djsj" defaultSystemDate="true"></cps:date>
			</cps:tdContent>  
		</cps:row>
	</cps:table>
	</form>
	</div>
</creator:panel>
<creator:panel id="zdrygzdxActivityPanel" title="动态信息>>历史上访记录">	
	<cps:tableGrid id="zdrygzdxActivityList"  
					click="rowcallbackCzZdryGzdxActivity"	
				   url="/lsgl/zdry/queryZdrySwrysfjlListPage.action"
				   autoload="true"
				   width="98%"
				   searchform="zdrygzdxActivityForm"			   
				   	>
		<cps:column isNumber="true" title="序号"></cps:column>	
		<cps:column field="sfsj" title="上访时间"></cps:column>
		<cps:column field="sfdd" title="上访地点"></cps:column>
		<cps:column field="bxxw" title="表现行为"></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
		<cps:column field="djdwmc" title="登记单位"></cps:column>
	</cps:tableGrid>
</creator:panel>
