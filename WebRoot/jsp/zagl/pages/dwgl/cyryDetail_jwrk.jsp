<%@page contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员信息">
	<creator:Script src="/jsp/zagl/js/cyry.js"></creator:Script>
	<creator:tbar id="cyry_op">
		<cps:button value="关闭" type="button" onclick="window.close();" />
	</creator:tbar>
	<creator:panel id="crry_panel" title="人口基本信息" tbarId="cyry_op">
		<div id="cyry_div">
			<form id="cyry_form">
				<input type="hidden" id="opertype" name="operType" value="${dw.opertype}" />
				<input type="hidden" id="dwjbxx_hylb" value="${hylb}" /> 
				<div id="rkjbxx">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
							<cps:tdContent width="25%">
								${dw.cyry.gjms}&nbsp;
							</cps:tdContent>
							<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
							<cps:tdContent width="25%">
								${dw.cyry.zjzlms}&nbsp;
							</cps:tdContent>
							<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
							<cps:tdContent>
								${dw.cyry.zjhm}&nbsp;
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>外文姓：</cps:tdLabel>
							<cps:tdContent>
								${dw.cyry.ywx}&nbsp;
							</cps:tdContent>
							<cps:tdLabel><font color="red">*</font>外文名：</cps:tdLabel>
							<cps:tdContent>
								${dw.cyry.ywm}&nbsp;
							</cps:tdContent>
							<cps:tdLabel>中文姓名：</cps:tdLabel>
							<cps:tdContent>
								${dw.cyry.xm}&nbsp;
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
							<cps:tdContent>
								${dw.cyry.xbms}&nbsp;
							</cps:tdContent>
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent>
								${dw.cyry.csrq}&nbsp;
							</cps:tdContent>
							<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
							<cps:tdContent>
								${dw.cyry.lxdh}&nbsp;
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</div>
				<creator:panel id="lscyrypanel" title="从业信息历史">
					<%@include file="/jsp/zagl/pages/dwgl/dwcyryinfo.jsp" %>
				</creator:panel>
			</form>
		</div>
	</creator:panel>
</creator:view>