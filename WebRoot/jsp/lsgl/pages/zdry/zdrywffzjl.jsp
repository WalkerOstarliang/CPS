<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="rkjbxxsavetbar">
	<cps:button value="保存" onclick="submitFormZdryWffzjlInfo()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="rkjbxx"  title="人口基本信息" tbarId="rkjbxxsavetbar" >
	<%@include file="/jsp/lsgl/pages/zdry/newrkjbxx.jsp"%>
</creator:panel>
<creator:panel id="zdrygzdx"  title="动态信息>>违法犯罪经历" >
	<div id="wffzjlxxdj">
	<form id="wffzjlform" method="post" >
	<cps:table>
			<input type="hidden" id="wffzjlsfzh" name="wffzjlBean.sfzh" value="${queryBean.sfzh }"/>	
			<input type="hidden"  id="rybh1" name="wffzjlBean.rybh" value="${queryBean.rybh }">
			<cps:row id="clear_row">
			<input type="hidden"  id="id" name="wffzjlBean.id" value="${wffzjlBean.id }">
			<cps:tdLabel  width="8%"><font color="red">*</font>犯罪时间：</cps:tdLabel>
			<cps:tdContent width="23%">
				<cps:date id="fzsj" name="wffzjlBean.fzsj" dateFmt="yyyy-MM-dd" value="${wffzjlBean.fzsj}" maxDate="sysdate" required="true"></cps:date>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>犯罪地点：</cps:tdLabel>
			<cps:tdContent width="23%">
				<cps:textfield id="fzdd" name="wffzjlBean.fzdd" value="${wffzjlBean.fzdd}"  required="true"  maxlength="60"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>案件类别：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="ajle" name="wffzjlBean.ajle" value="${wffzjlBean.ajle }" title="ZDY_AJLB"/>
				<cps:textfield appendPopuBtn="true" id="ajlemc" name="wffzjlBean.ajlemc" value="${wffzjlBean.ajlemc}"  readonly="true"  onclick="openDictionSelectWinxx('ajle','ajle','ajlemc','false')"></cps:textfield>
			</cps:tdContent>   
		</cps:row>
		<cps:row id="clear_row4">
			<cps:tdLabel>选择对象：</cps:tdLabel>
			<cps:tdContent>
			<%--
				<cps:select id="xzdx" name="wffzjlBean.xzdx"  value="${wffzjlBean.xzdx}" required="true"  zdlb="GA_XZDX"  headerKey="" headerValue="---请选择---"></cps:select>
			--%>
				<input type="hidden" id="xzdx" name="wffzjlBean.xzdx" value="${wffzjlBean.xzdx }" title="GA_XZDX" />
				<cps:textfield appendPopuBtn="true" id="xzdxmc" name="wffzjlBean.xzdxmc" value="${wffzjlBean.xzdxmc}"  readonly="true"  onclick="openDictionSelectWinxx('xzdx','xzdx','xzdxmc','true')" ></cps:textfield>				
			
			</cps:tdContent>   
			<cps:tdLabel>选择物品：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="xzwp" name="wffzjlBean.xzwp" value="${wffzjlBean.xzwp }" title="ZATZ_XZWP" />
				<cps:textfield id="xzwpmc" name="wffzjlBean.xzwpmc" value="${wffzjlBean.xzwpmc}"   readonly="true" appendPopuBtn="true" onclick="openDictionSelectWinxx('xzwp','xzwp','xzwpmc','true')"></cps:textfield>				
			</cps:tdContent>
			<cps:tdLabel>作案手段：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="zasd" name="wffzjlBean.zasd" value="${wffzjlBean.zasd }" title="GA_ZASD"/>
				<cps:textfield id="zasdmc" name="wffzjlBean.zasdmc" value="${wffzjlBean.zasdmc}"  readonly="true" appendPopuBtn="true"  onclick="openDictionSelectWinxx('zasd','zasd','zasdmc','true')"></cps:textfield>
			</cps:tdContent>	  
		</cps:row>
		
		<cps:row id="clear_row5">
			<cps:tdLabel>作案工具：</cps:tdLabel>
			<cps:tdContent>
				<%--
				<cps:select id="zagj" name="wffzjlBean.zagj" value="${wffzjlBean.zagj}" required="true"  zdlb="ZDY_ZAGJ"  headerKey="" headerValue="---请选择---"></cps:select>			
				--%>
				<input type="hidden" id="zagj" name="wffzjlBean.zagj" value="${wffzjlBean.zagj }" title="ZDY_ZAGJ"/>
				<cps:textfield id="zagjmc" name="wffzjlBean.zagjmc" value="${wffzjlBean.zagjmc}"  readonly="true"  appendPopuBtn="true" onclick="openDictionSelectWinxx('zagj','zagj','zagjmc','true')"></cps:textfield>
			
			</cps:tdContent>
			<cps:tdLabel>销赃方式：</cps:tdLabel>
			<cps:tdContent>
				<%--
				<cps:select id="xzfs" name="wffzjlBean.xzfs" value="${wffzjlBean.xzfs}" zdlb="GA_XZFS"  headerKey="" headerValue="---请选择---"></cps:select>			
				--%>
				<input type="hidden" id="xzfs" name="wffzjlBean.xzfs" value="${wffzjlBean.xzfs }" title="GA_XZFS"/>
				<cps:textfield id="xzfsmc" name="wffzjlBean.xzfsmc" value="${wffzjlBean.xzfsmc}"  readonly="true" appendPopuBtn="true"  onclick="openDictionSelectWinxx('xzfs','xzfs','xzfsmc','true')" ></cps:textfield>
			
			</cps:tdContent>   
			<cps:tdLabel>作案特点：</cps:tdLabel>
			<cps:tdContent>
				<%--
				<cps:select id="zatd" name="wffzjlBean.zatd" value="${wffzjlBean.zatd}" zdlb="GA_ZATD"  headerKey="" headerValue="---请选择---"></cps:select>
				--%>
				<input type="hidden" id="zatd" name="wffzjlBean.zatd" value="${wffzjlBean.zatd }" title="GA_ZATD"/>
				<cps:textfield id="zatdmc" name="wffzjlBean.zatdmc" value="${wffzjlBean.zatdmc}"   readonly="true" appendPopuBtn="true" onclick="openDictionSelectWinxx('zatd','zatd','zatdmc','true')"></cps:textfield>
			</cps:tdContent>   	
		</cps:row>
		<cps:row id="clear_row6">
			<cps:tdLabel>选择时机：</cps:tdLabel>
			<cps:tdContent>
				<%--
				<cps:select id="xzsj" name="wffzjlBean.xzsj" value="${wffzjlBean.xzsj}" zdlb="ZDY_XZSJ"  headerKey="" headerValue="---请选择---"></cps:select>
				--%>
				<input type="hidden" id="xzsj" name="wffzjlBean.xzsj" value="${wffzjlBean.xzsj }" title="ZDY_XZSJ"/>
				<cps:textfield id="xzsjmc" name="wffzjlBean.xzsjmc" value="${wffzjlBean.xzsjmc}"  readonly="true" appendPopuBtn="true" onclick="openDictionSelectWinxx('xzsj','xzsj','xzsjmc','true')"></cps:textfield>
			</cps:tdContent>   
			<cps:tdLabel>选择处所：</cps:tdLabel>
			<cps:tdContent>
				<%--
				<cps:select id="xzcs" name="wffzjlBean.xzcs" value="${wffzjlBean.xzcs}" required="true" zdlb="GA_XZCS"  headerKey="" headerValue="---请选择---"></cps:select>
				--%>
				<input type="hidden" id="xzcs" name="wffzjlBean.xzcs" value="${wffzjlBean.xzcs }" title="GA_XZCS"/>
				<cps:textfield id="xzcsmc" name="wffzjlBean.xzcsmc" value="${wffzjlBean.xzcsmc}"  readonly="true" appendPopuBtn="true" onclick="openDictionSelectWinxx('xzcs','xzcs','xzcsmc','true')"></cps:textfield>
			</cps:tdContent>   
			
			<cps:tdLabel width="10%">问题性质：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" id="wtxz" name="wffzjlBean.wtxz" value="${wffzjlBean.wtxz }" title="ZDY_WTXZ" />
				<cps:textfield id="wtxzmc" name="wffzjlBean.wtxzmc" value="${wffzjlBean.wtxzmc}"   readonly="true" appendPopuBtn="true" onclick="openDictionSelectWinxx('wtxz','wtxz','wtxzmc','false')"></cps:textfield>				
			</cps:tdContent> 
		</cps:row>
		<cps:row>
			<cps:tdLabel>活动地区：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="hddq" name="wffzjlBean.hddq" value="${wffzjlBean.hddq}"  maxlength="60"></cps:textfield>
			</cps:tdContent>  
			<cps:tdLabel>维护人：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="whr" name="wffzjlBean.whr" value="${wffzjlBean.whr}" maxlength="15" readonly="true" onclick="openDwRyxxSelect('430000000000',callbackWhr)"></cps:textfield>
			</cps:tdContent>  
			
			<cps:tdLabel>维护单位：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="whdw" name="wffzjlBean.whdw" value="${wffzjlBean.whdw}" maxlength="60" readonly="true"></cps:textfield>
			</cps:tdContent>   
		</cps:row>
		<cps:row id="clear_row2">
			<cps:tdLabel>处理结果：</cps:tdLabel>
			<cps:tdContent colspan="5">
				<s:textarea id="cljg" name="wffzjlBean.cljg"  cssStyle="width:94%;height:40px;" cssClass="validate[maxSize[60]]" ></s:textarea>
			</cps:tdContent>    	
		</cps:row>
		<cps:row id="clear_row7">
			<cps:tdLabel><font color="red">*</font>简要案情：</cps:tdLabel>
			<cps:tdContent colspan="5">
				<s:textarea id="bz" name="wffzjlBean.bz"    cssStyle="width:94%;height:80px;" cssClass="validate[maxSize[150]]"  required="true"></s:textarea>
			</cps:tdContent>
		</cps:row>
		<cps:row >
			<c:if test="${operType !='detail'}">
				<cps:tdLabel><font color="red">*</font>操作人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="czrxm" name="wffzjlBean.czrxm" value="${loginInfo.realname}" required="true"></cps:textfield>
				</cps:tdContent>   
				<cps:tdLabel><font color="red">*</font>操作单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="czdwdm" name="wffzjlBean.czdwdm" value="${loginInfo.orgcode}" >
					<cps:textfield id="czdwmc" name="wffzjlBean.czdwmc" value="${loginInfo.orgname}" required="true"></cps:textfield>
				</cps:tdContent>   
				<cps:tdLabel><font color="red">*</font>操作时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="czsj" name="wffzjlBean.czsj" defaultSystemDate="true"    required="true"></cps:date>
				</cps:tdContent>  
			</c:if>
			<c:if test="${operType == 'detail'}">
				<cps:tdLabel><font color="red">*</font>操作人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="czrxm" name="wffzjlBean.czrxm" value="${wffzjlBean.czrxm}" required="true"></cps:textfield>
				</cps:tdContent>   
				<cps:tdLabel><font color="red">*</font>操作单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="czdwdm" name="wffzjlBean.czdwdm" value="${wffzjlBean.czdwdm}" >
					<cps:textfield id="czdwmc" name="wffzjlBean.czdwmc" value="${wffzjlBean.czdwmc}" required="true"></cps:textfield>
				</cps:tdContent>   
				<cps:tdLabel><font color="red">*</font>操作时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="czsj" name="wffzjlBean.czsj" value="${wffzjlBean.czsj}"   required="true"></cps:date>
				</cps:tdContent> 
			</c:if>
		</cps:row>
	</cps:table>
	</form>
	</div>
</creator:panel>
<creator:panel id="lswffzjl" title="动态信息>>历史违法犯罪经历">	
	<cps:tableGrid id="lswffzjlTable"  
					click="rowcallbackCzWffzjldj"	
				   url="/lsgl/zdry/queryZdryWffzjlListPage.action"
				   autoload="true"
				   width="98%"
				   searchform="wffzjlform"	
				   pageSize="5"		   
				   	>
		<cps:column isNumber="true" title="序号"></cps:column>	
		<cps:column field="fzsj" title="犯罪时间"></cps:column>
		<cps:column field="fzdd" title="犯罪地点"></cps:column>
		<cps:column field="bz" title="简要案情" align="left" maxlength="15" width="40%"></cps:column>
		<cps:column field="czdwmc" title="操作单位" align="left"  width="30%"></cps:column>
	</cps:tableGrid>
</creator:panel>
