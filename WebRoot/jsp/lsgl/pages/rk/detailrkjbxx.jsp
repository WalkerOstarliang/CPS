<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
<cps:table>
	<c:if test="${queryBean.rylb != '4'}">
	<cps:row>
		<cps:tdContent width="85%">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">身份证号：</cps:tdLabel>
					<cps:tdContent width="22%">
						&nbsp;${rkBean.jbxxBean.sfzh}
					</cps:tdContent>
					<cps:tdLabel width="11%">姓名：</cps:tdLabel>
					<cps:tdContent width="22%">
						&nbsp;${rkBean.jbxxBean.xm}
					</cps:tdContent>
					<cps:tdLabel width="11%">别名/绰号：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.bmch}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>性别：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.xbms}
					</cps:tdContent>
					<cps:tdLabel>出生日期：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.csrq}
					</cps:tdContent>
					<cps:tdLabel>民族：</cps:tdLabel>
					<cps:tdContent>
					&nbsp;${rkBean.jbxxBean.mzms}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>政治面貌：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.zzmmms}
					</cps:tdContent>
					<cps:tdLabel>文化程度：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.whcdms}
					</cps:tdContent>
					<cps:tdLabel>婚姻状况：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.hyzkms}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>兵役状况：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.byzkms}
					</cps:tdContent>
					<cps:tdLabel>宗教信仰：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.zzxyms}
					</cps:tdContent>
					<cps:tdLabel>血型：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.xxms}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>身高(㎝)：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.sg} 
					</cps:tdContent>
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.lxdh}
					</cps:tdContent>
					<cps:tdLabel>电话备注：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.lxdhbz}
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
					<cps:tdLabel>专长：</cps:tdLabel>
					<cps:tdContent>
					<!-- rkBean.jbxxBean.zc -->
						&nbsp;${rkBean.jbxxBean.zc}
					</cps:tdContent>
				</cps:row>
				<cps:row >
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
					<cps:tdLabel width="12%">现住区划：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.xzzqhmc}
					</cps:tdContent>
					<cps:tdLabel width="12%">现住地址：</cps:tdLabel>
					<cps:tdContent colspan="3">
						&nbsp;${rkBean.jbxxBean.xzzxz}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >人员类别：</cps:tdLabel>
					<cps:tdContent  >
						&nbsp;${queryBean.rylbms}
						<%-- 
						<span onclick="openSyrkInfoPage('detail','${rkBean.jbxxBean.rybh}','${queryBean.rylb}')"   style="cursor: pointer;color:red;text-decoration:underline;"></span>
						--%>
					</cps:tdContent>
					<cps:tdLabel >户籍责任区：</cps:tdLabel>
					<cps:tdContent  >
						&nbsp;${rkBean.jbxxBean.sspcsmc}
					</cps:tdContent>
					<cps:tdLabel>身份：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${rkBean.jbxxBean.sfms}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>人员特殊属性：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:checkBoxList id="rytssx" zdlb="ZDY_RYTSSX" name="rkBean.jbxxBean.rytssx" value="${rkBean.jbxxBean.rytssx}" disabled="disabled"></cps:checkBoxList>
					</cps:tdContent>
				</cps:row>
			</cps:table>
	</cps:tdContent>
	<cps:tdContent align="center" valign="top">
		<div>
			<div style="text-align: center;">
				 <img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${rkBean.jbxxBean.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
			</div>
			<div style="margin-top:10px">
				<span class="cps_span_href" onclick="openSyrkInfoPage('rydaxx','${rkBean.jbxxBean.rybh }','${rkBean.jbxxBean.rylb}')">人员详细信息</span>
			</div>
		</div> 
	</cps:tdContent>
</cps:row>
</c:if>
<c:if test="${queryBean.rylb == '4'}">
	<%@include file="/jsp/lsgl/pages/rk/jwrk/rydajwrkjbxx.jsp"%>
</c:if>
</cps:table>

