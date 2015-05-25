<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:table>
	<cps:row >
		<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
		<cps:tdContent width="25%">
			&nbsp;<span onclick="openSyrkInfoPage('rydaxx','${rkBean.jbxxBean.rybh}','${rkBean.jbxxBean.rylb}')" class="cps_span_href" style="color:red">${rkBean.jbxxBean.sfzh}</span>
		</cps:tdContent>
		<cps:tdLabel width="10%">姓名：</cps:tdLabel>
		<cps:tdContent width="25%">
			&nbsp;${rkBean.jbxxBean.xm}
		</cps:tdContent>
		<cps:tdLabel width="10%">性别：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.xbms}
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>出生日期：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.csrq}
		</cps:tdContent>
		<cps:tdLabel>民族：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.mzms}
		</cps:tdContent>
		<cps:tdLabel>婚姻状况：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.hyzkms}
		</cps:tdContent>
	</cps:row>

	<cps:row>
		<cps:tdLabel>户籍地区划：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.hjdqhmc}
		</cps:tdContent>
		<cps:tdLabel>户籍地详址：</cps:tdLabel>
		<cps:tdContent colspan="3">
			&nbsp;${rkBean.jbxxBean.hjdxz}
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>现住区划：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.xzzqhmc}
		</cps:tdContent>
		<cps:tdLabel>现住地址：</cps:tdLabel>
		<cps:tdContent colspan="3">	
			&nbsp;${rkBean.jbxxBean.xzzxz}
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel>现住责任区：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.xzzzrqmc}
		</cps:tdContent>
		<cps:tdLabel>现住派出所：</cps:tdLabel>
		<cps:tdContent>	
			&nbsp;${rkBean.jbxxBean.xzzzrqmc}
		</cps:tdContent>
		<cps:tdLabel>户籍派出所：</cps:tdLabel>
		<cps:tdContent>	
			&nbsp;${rkBean.jbxxBean.sspcsmc}
		</cps:tdContent>
	</cps:row>
</cps:table>
