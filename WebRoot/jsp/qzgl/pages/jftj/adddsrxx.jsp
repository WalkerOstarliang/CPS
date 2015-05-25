<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="纠纷调解表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/jftj.js"></script>
<creator:tbar id="addsrxxtbar">
				<cps:button value="保&nbsp;存" onclick="save()"></cps:button>
				<cps:button value="重&nbsp;置" type="reset();"></cps:button>
				<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</creator:tbar>
	<creator:panel id="jftjInfo" title="当事人登记表" tbarId="addsrxxtbar">
		<form id="jftjInfoform"
			action="<c:url value='/qzgl/jftjgl/saveorupdatedsrxx.action'/>" method="post" enctype="application/x-www-form-urlencoded">
			<input type="hidden" id="jfbh" name="jfcyrxxBean.jfbh" value="${bh }"/>
			<input type="hidden" name="jfcyrxxBean.bh" value="${dsrbh }"/>
			<input type="hidden" name="operType" id="operType" value="${operType }"/>
			<cps:table id="jftjTable">
				<cps:row>
				<cps:tdLabel width="10%"><font color="red">*</font>身份证号：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="sfzh" name="jfcyrxxBean.sfzh" value="${jfcyrxxBean.sfzh}" isSfzh="true" onblur="isExistSfzh(this.value)" maxlength="18" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">当事人姓名：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:textfield id="dsrxm" name="jfcyrxxBean.xm" value="${jfcyrxxBean.xm}" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">民族：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select id="mz" name="jfcyrxxBean.mz" zdlb="GB_MZ" 
							headerKey="" headerValue="--请选择--"
							cssClass="cps-input" value="${jfcyrxxBean.mz}"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdh" name="jfcyrxxBean.lxdh" value="${jfcyrxxBean.lxdh}" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">现住地址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xzdz" name="jfcyrxxBean.xzdz" value="${jfcyrxxBean.xzdz}" maxlength="100"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
						</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
		
	</creator:view>