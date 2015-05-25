<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:table>
	<cps:row >
		<cps:tdLabel width="12%">身份证号：</cps:tdLabel>
		<cps:tdContent width="18%">
			&nbsp;<span onclick="openSyrkInfoPage('rydaxx','${rkBean.jbxxBean.rybh}','${rkBean.jbxxBean.rylb}')" class="cps_span_href" style="color:red">${rkBean.jbxxBean.sfzh}</span>
		</cps:tdContent>
		<cps:tdLabel width="12%">姓名：</cps:tdLabel>
		<cps:tdContent width="18%">
			&nbsp;${rkBean.jbxxBean.xm}
		</cps:tdContent>
		<cps:tdLabel width="12%">性别：</cps:tdLabel>
		<cps:tdContent width="18%">
			&nbsp;${rkBean.jbxxBean.xbms}
		</cps:tdContent>
		<cps:tdLabel rowspan="7">
			<img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${rkBean.jbxxBean.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
		</cps:tdLabel>
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
		<cps:tdLabel>户籍地派出所：</cps:tdLabel>
		<cps:tdContent colspan="3">
			&nbsp;${rkBean.jbxxBean.sspcsmc}
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>户籍地详址：</cps:tdLabel>
		<cps:tdContent colspan="5">
			&nbsp;${rkBean.jbxxBean.hjdxz}
		</cps:tdContent>
	</cps:row>	
	
	<cps:row>
		<cps:tdLabel>现住地区划：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${rkBean.jbxxBean.xzzqhmc}
		</cps:tdContent>
		<cps:tdLabel>现在地派出所：</cps:tdLabel>
		<cps:tdContent colspan="3">	
			&nbsp;${rkBean.jbxxBean.xzzzrqmc}
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>现住地址：</cps:tdLabel>
		<cps:tdContent colspan="5">	
			&nbsp;${rkBean.jbxxBean.xzzxz}
		</cps:tdContent>
	</cps:row>
</cps:table>

<script type="text/javascript">
	function openSyrkInfoPage(operType, rybh, rylb)
	{
		var rybh = rybh == undefined ? "" : rybh;
		$.openWindow({
			url : contextPath + "/lsgl/rk/toRkInfoPage.action",
			data : {"operType" : operType,"queryBean.rybh" : rybh,"queryBean.rylb" :rylb,  t:new Date().getTime()},
			width : 1000,
			height : 760
		});
	}
</script>
