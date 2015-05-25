<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="jwrkjbxx">
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
			<cps:tdContent width="25%">
				&nbsp;${rkBean.jbxxBean.gjms}
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
			<cps:tdContent width="25%">
				&nbsp;${rkBean.jbxxBean.zjzlms}
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.zjhm}
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>英文姓：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jwrkBean.ywx}
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>英文名：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jwrkBean.ywm}
			</cps:tdContent>
			<cps:tdLabel>中文姓名：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.xm}
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.xbms}
			</cps:tdContent>
			<cps:tdLabel>出生日期：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.csrq}
			</cps:tdContent>
			<cps:tdLabel>联系电话：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.lxdh}
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>服务处所：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.fwcs}
			</cps:tdContent>
			<cps:tdLabel>职务：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.zw}
			</cps:tdContent>
			<cps:tdLabel>电话备注：</cps:tdLabel>
			<cps:tdContent>
				&nbsp;${rkBean.jbxxBean.lxdhbz}
			</cps:tdContent>
		</cps:row>
		<%--
		<cps:row>
			<cps:tdLabel>现住责任区：</cps:tdLabel>
			<cps:tdContent colspan="5">
				&nbsp;${rkBean.jbxxBean.xzzzrqms }
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>现居地址：</cps:tdLabel>
			<cps:tdContent colspan="5">
				&nbsp;${rkBean.jbxxBean.xzzxz }
			</cps:tdContent>
		</cps:row>
		 --%>
	</cps:table>
</div>