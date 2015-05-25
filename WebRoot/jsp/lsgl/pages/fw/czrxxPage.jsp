<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<creator:tbar  id="czxxtbar">
	<c:if test="${operType != 'detail'}">
		<cps:button value="保存"  onclick="saveCzrxx()"></cps:button>
	</c:if>
	<cps:button value="关闭"  onclick="$.closeWindow()" ></cps:button>
</creator:tbar>
<creator:panel id="czfwczxxPanel"   title="承租人信息" tbarId="czxxtbar" >
<form  id="czxxform">
	<div id="czxxdiv">
		<input type="hidden" id="fwid" name="fwBean.fwid" value="${fwBean.fwid}">
		<input id="czfwbh" type="hidden" name="czxxBean.czfwbh" value="${czxxBean.czfwbh }">
		<cps:table>
			<cps:row id="clear_row2">
				<cps:tdLabel width="11%">承租人类型：</cps:tdLabel>
				<cps:tdContent width="24%">
					<s:select list="#{'1':'单位租凭','2':'个人租凭'}" id="czrlx" name="czxxBean.czrlx"  onchange="changeCzrlx(this.value)" value="2" cssStyle="30%" cssClass="cps-select"></s:select>
				</cps:tdContent>
				<cps:tdLabel width="12%" ><font color="red">*</font>租赁日期：</cps:tdLabel>
				<cps:tdContent width="22%" >
					<cps:date id="zlrq" name="czxxBean.zlrq" value="${czxxBean.zlrq}" dateFmt="yyyy-MM-dd" maxDate="tzrq"  required="true"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			<input type="hidden" id="czxxbh" name="czxxBean.czxxbh" value="${czxxBean.czxxbh}"/>
			<input type="hidden" id="ryjgbh" name="czxxBean.ryjgbh" value="${czxxBean.ryjgbh}"/>
			<cps:row id="clear_row1">
				<cps:tdLabel width="12%"><font color="red">*</font>承租人身份证：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="hzrsfzh"   name="czxxBean.hzrsfzh" value="${czxxBean.hzrsfzh}" isSfzh="true" onblur="queryRkJbxxBeanBySfzh(this.value,callbackHzrsfzxx)" required="true"></cps:textfield>
				</cps:tdContent> 
				<cps:tdLabel width="12%">承租人姓名：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="hzrxm" name="czxxBean.hzrxm" value="${czxxBean.hzrxm}" maxlength="15" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel  width="12%">性别：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:select id="hzrxb" name="czxxBean.hzrxb" value="${czxxBean.hzrxb}" zdlb="GB_XB" headerKey="" headerValue=" " ></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row id="clear_row_czdwxx" cssStyle="display:none;">
				<cps:tdLabel width="12%"><font color="red">*</font>承租单位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="jgdwmc" name="czxxBean.jgdwmc" value="${czxxBean.jgdwmc}" appendPopuBtn="true" maxlength="60" required="true" cssStyle="width:86%" onclick="openDwSelect()"></cps:textfield>
				</cps:tdContent> 
			</cps:row>
			
			
			<cps:row id="clear_row2">
				<cps:tdLabel >承租状态：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'1' : '正常','2':'退租'}" id="czzt" name="czxxBean.czzt" cssClass="cps-select"></s:select>
				</cps:tdContent>
				<cps:tdLabel width="12%">退租日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="tzrq" name="czxxBean.tzrq" value="${czxxBean.tzrq}" dateFmt="yyyy-MM-dd" minDate="zlrq"></cps:date>
				</cps:tdContent>
				<cps:tdLabel >退租原因：</cps:tdLabel>
				<cps:tdContent >
					<cps:select id="tzyy" name="czxxBean.tzyy" value="${czxxBean.tzyy}" zdlb="ZDY_ZXYY" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>录入人：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty czxxBean.djr}">
							<input id="djr" type="hidden" name="czxxBean.djr" value="${loginInfo.username }">
							<cps:textfield id="djrxm" name="czxxBean.djrxm" value="${loginInfo.realname}" maxlength="15" ></cps:textfield>				
						</c:when>
						<c:otherwise>
							<input id="djr" type="hidden" name="czxxBean.djr" value="${czxxBean.djr }">
							<cps:textfield id="djrxm" name="czxxBean.djrxm" value="${czxxBean.djrxm}" maxlength="15" ></cps:textfield>				
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>录入单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty czxxBean.djdwdm}">
							<input id="djdwdm" type="hidden" name="czxxBean.djdwdm" value="${loginInfo.orgcode }">
							<cps:textfield id="djdwmc" name="czxxBean.djdwmc" value="${loginInfo.orgname}" maxlength="60" ></cps:textfield>
						</c:when>
						<c:otherwise>
							<input id="djdwdm" type="hidden" name="czxxBean.djdwdm" value="${czxxBean.djdwdm }">
							<cps:textfield id="djdwmc" name="czxxBean.djdwmc" value="${czxxBean.djdwmc}" maxlength="60" ></cps:textfield>
						</c:otherwise>
					</c:choose>				
				</cps:tdContent>
				<cps:tdLabel>录入时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty czxxBean.djdwdm}">
							<cps:date id="djsj" name="czxxBean.djsj"  defaultSystemDate="true" ></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="czxxBean.djsj" value="${czxxBean.djsj}" ></cps:date>
						</c:otherwise>
					</c:choose>	
				</cps:tdContent>
			</cps:row>
		</cps:table>
 	</div>
</form>
</creator:panel>	
</creator:view>

