<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="rkjbxxsavetbar">
	<cps:button value="保存" onclick="submitFormZdryGzdxDetailInfo()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="rkjbxx"  title="人口基本信息" tbarId="rkjbxxsavetbar">
	<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
</creator:panel>
<creator:panel id="jsbrzsxx"  title="动态信息>>精神病人肇事信息"  >
	<div id="zdrygzdxActivityDiv">
	<form id="zdrygzdxActivityForm" method="post" >
	<cps:table>										     
		<input type="hidden"  id="jsbrbh" name="zdryBean.jsbrzsBean.jsbrbh" value="${zdryBean.jsbrBean.jsbrbh }">
		<cps:row id="clear_row">
			<input type="hidden"  id="id" name="zdryBean.jsbrzsBean.id" value="${zdryBean.jsbrzsBean.id }" />
			<cps:tdLabel  width="12%"><font color="red">*</font>肇事时间：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:date id="zssj" name="zdryBean.jsbrzsBean.zssj" dateFmt="yyyy-MM-dd" value="${zdryBean.jsbrzsBean.zssj}" required="true"></cps:date>
			</cps:tdContent>
			<cps:tdLabel width="10%">肇事地点：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:textfield id="zsdd" name="zdryBean.jsbrzsBean.zsdd" value="${zdryBean.jsbrzsBean.zsdd}" maxlength="100"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>肇事性质：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="zsxz" name="zdryBean.jsbrzsBean.zsxz" value="${zdryBean.jsbrzsBean.zsxz}" maxlength="10" required="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row6">
			<cps:tdLabel width="12%">发案事由：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="fasy" name="zdryBean.jsbrzsBean.fasy"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row7">
			<cps:tdLabel width="12%">简要情况：</cps:tdLabel>
			<cps:tdContent colspan="5" >
				<s:textarea id="jyqk" name="zdryBean.jsbrzsBean.jyqk"    cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[150]]" ></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row >
			<cps:tdLabel><font color="red">*</font>登记人：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="djrxm" name="zdryBean.jsbrzsBean.djrxm" value="${loginInfo.realname}"  required="true"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>登记单位：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="djdwdm" name="zdryBean.jsbrzsBean.djdwdm" value="${loginInfo.orgcode}">
				<cps:textfield id="djdwmc" name="zdryBean.jsbrzsBean.djdwmc" value="${loginInfo.orgname}" required="true"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel><font color="red">*</font>登记时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="djsj" name="zdryBean.jsbrzsBean.djsj" defaultSystemDate="true"  required="true"></cps:date>
			</cps:tdContent>  
		</cps:row>
	</cps:table>
	</form>
	</div>
</creator:panel>
<creator:panel id="zdrygzdxActivityPanel" title="动态信息>>历史肇事信息">	
	<cps:tableGrid id="zdrygzdxActivityList"  
					dblclick="rowcallbackCzZdryGzdxActivity"	
				    url="/lsgl/zdry/queryZdryJsbrzsListPage.action"
					autoload="true"
				    width="98%"
				    searchform="zdrygzdxActivityForm"			   
				   	>
		<cps:column isNumber="true" title="序号"></cps:column>	
		<cps:column field="zssj" title="肇事时间"></cps:column>
		<cps:column field="zsdd" title="肇事地点"></cps:column>
		<cps:column field="zsxz" title="肇事性质"></cps:column>
		<cps:column field="fasy" title="发案事由"></cps:column>
		<cps:column field="djdwmc" title="登记单位"></cps:column>
	</cps:tableGrid>
</creator:panel>
