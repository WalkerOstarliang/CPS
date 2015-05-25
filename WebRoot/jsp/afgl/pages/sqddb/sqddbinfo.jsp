<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="代表委员管理">
	<creator:Script src="/jsp/afgl/js/sqddbinfo.js"></creator:Script>
	<script >
		var _operType = "${operType}";
		
		window.onload = function(){
							if(_operType != 'add'){
								var _rddb = "${ddbbean.sfrddb}";
								if(_rddb){
									var obj1 = document.getElementById("sfrddb"+_rddb) ;
									obj1.selected ='selected';
								}
								var _zxwy = "${ddbbean.sfzxwy}";
								if(_zxwy){
									var obj2 = document.getElementById("sfzxwy"+_zxwy) ;
									obj2.selected ='selected';
								}
							}
						}
	</script>
	<creator:tbar  id="sqglinfotab">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSave()"  display="${displayAddBtn}"></cps:button>
				<cps:button id="submitbtn" value="取&nbsp;消" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldglpanel" title="代表委员基本信息" tbarId="sqglinfotab">
		<form id="infoform" name="infoform" action="<c:url value='/afgl/sqgbgl/saveSqddbxxBean.action'/>" method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="id" name="ddbbean.id"></s:hidden>
		<input type="hidden" id="ip" name="ddbbean.ip" value="${ddbbean.ip}">
		<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="90%">
					<cps:table>
						<cps:row id="sq_row">
							<cps:tdLabel><font color="red">*</font>社区名称：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<c:choose>
									<c:when test="${operType=='detail'}">
										<cps:dicText value="${ddbbean.sqmc}"></cps:dicText>
									</c:when>
									<c:otherwise>
										<input type="hidden" id="sqdm" name="ddbbean.sqdm" value="${ddbbean.sqdm}">
										<cps:textfield id="sqmc"  name="ddbbean.sqmc" value="${ddbbean.sqmc}" cssClass="validate[required] cps-input" appendPopuBtn="true" cssStyle="width:100%" readonly="true" onclick="openSqxxSelectWin(setSqxxToPage)"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						
						<cps:row id="clear_row2">
							<cps:tdLabel width="12%"><font color="red">*</font>身份证号：</cps:tdLabel>
							<cps:tdContent width="25%">
								<cps:textfield id="ddbsfzh" name="ddbbean.ddbsfzh" onblur="loadRkxxBean(this.value)" maxlength="18" required="true" isSfzh="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%"><font color="red">*</font>姓名：</cps:tdLabel>
							<cps:tdContent width="22%">
								<cps:textfield id="ddbxm" name="ddbbean.ddbxm" required="true" maxlength="15" readonly="true"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel width="12%">性别：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="xbs" name="ddbbean.xb" value="${ddbbean.xb}"/>
								<cps:select id="xb" zdlb="GB_XB" name="ddbbean.xb" value="${ddbbean.xb}" headerKey="" headerValue=" "  disabled="true"></cps:select>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row3">
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="csrq" name="ddbbean.csrq" value="${ddbbean.csrq}" cssClass="cps-input" readonly="true"></cps:textfield>
							</cps:tdContent>
							
							<cps:tdLabel>政治面貌：</cps:tdLabel>
							<cps:tdContent>
								<cps:select id="zzmm" zdlb="GB_ZZMM" name="ddbbean.zzmm" value="${ddbbean.zzmm}" cssClass="cps-input" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
							<cps:tdLabel>联系电话：</cps:tdLabel>
							<cps:tdContent>
								<cps:textfield id="ddblxdh" name="ddbbean.ddblxdh" maxlength="20" minlength="7" isPhone="true" value="${ddbbean.ddblxdh}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
						<cps:row id="clear_row5">
							<cps:tdLabel>户籍地区划：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" id="hjdqh" name="ddbbean.hjdqh" value="${ddbbean.hjdqh}">
								<cps:textfield id="hjdqhmc" name="hjdqhmc" ondblclick="openHjdxzqh()" appendPopuBtn="true" value="${ddbbean.hjdqhmc}" onclick="openHjdxzqh()"></cps:textfield>
							</cps:tdContent>
							<cps:tdLabel>现住地详址：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield id="xzzxz" name="ddbbean.xzzxz" maxlength="60" value="${ddbbean.xzzxz}"></cps:textfield>
							</cps:tdContent>
						</cps:row>
					 	<cps:row id="clear_row8">
							<cps:tdLabel width="10%"><font color="red">*</font>身份：</cps:tdLabel>
							<cps:tdContent colspan="5">
							
								人大代表：
								<select id="sfrddb" name="ddbbean.sfrddb" >
									<option value="0" id="sfrddb0">&nbsp;&nbsp;</option>
									<option value="4" id="sfrddb4">区人大代表</option>
									<option value="1" id="sfrddb1">市人大代表</option>
									<option value="2" id="sfrddb2">省人大代表</option>
									<option value="3" id="sfrddb3">全国人大代表</option>
								</select>
								政协委员：
								<select id="sfzxwy" name="ddbbean.sfzxwy" >
									<option value="0" id="sfzxwy0">&nbsp;&nbsp;</option>
									<option value="4" id="sfzxwy1">区政协委员</option>
									<option value="1" id="sfzxwy1">市政协委员</option>
									<option value="2" id="sfzxwy2">省政协委员</option>
									<option value="3" id="sfzxwy3">全国政协委员</option>
								</select>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>登记人姓名：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djrjh" name="ddbbean.djrjh" value="${ddbbean.djrjh}"/>
									<input type="hidden" id="djrsfzh" name="ddbbean.djrsfzh" value="${ddbbean.djrsfzh}"/>
									<cps:textfield id="djrxm" name="ddbbean.djrxm" readonly="true" value="${ddbbean.djrxm}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djrjh" name="ddbbean.djrjh" value="${ddbbean.djrjh}"/>
									<cps:textfield id="djrxm" name="ddbbean.djrxm" readonly="true" value="${ddbbean.djrxm}"></cps:textfield>
								</c:when>
							</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<input type="hidden" id="djdwdm" name="ddbbean.djdwdm" value="${ddbbean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="ddbbean.ssjwqdm" value="${ddbbean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="ddbbean.ssjwqmc" value="${ddbbean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="ddbbean.djdwmc"  readonly="true" value="${ddbbean.djdwmc}"></cps:textfield>
								</c:when>
								<c:when test="${operType != 'add'}">
									<input type="hidden" id="djdwdm" name="ddbbean.djdwdm" value="${ddbbean.djdwdm}"/>
									<input type="hidden" id="ssjwqdm" name="ddbbean.ssjwqdm" value="${ddbbean.ssjwqdm}"/>
									<input type="hidden" id="ssjwqmc" name="ddbbean.ssjwqmc" value="${ddbbean.ssjwqmc}"/>
									<cps:textfield id="djdwmc" name="ddbbean.djdwmc"  readonly="true" value="${ddbbean.djdwmc}"></cps:textfield>
								</c:when>
							</c:choose>
							</cps:tdContent>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date id="djsj" name="ddbbean.djsj" defaultSystemDate="true" readOnly="true"></cps:date>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:tdContent>
				<cps:tdContent valign="top">
					<img id="zpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${ddbbean.ddbsfzh}" height="140" width="130"/>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
</creator:panel>
</creator:view>