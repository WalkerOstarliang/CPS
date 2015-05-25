<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view title="重点人员基本信息">
	<cps:PanelView>
	<cps:tbar>
		<cps:button value="关闭" onclick="$.closeWindow()" ></cps:button>
	</cps:tbar>
	<cps:panel id="zdrypanel" title="重点人员基本信息">
		<cps:table>
			<cps:row>
				<cps:tdContent valign="top">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="20%">重点人员编号：</cps:tdLabel>
							<cps:tdContent width="33%"><cps:dicText value="${qgzdryBean.bjzdrybh}"/></cps:tdContent>
							<cps:tdLabel width="15%">姓名：</cps:tdLabel>
							<cps:tdContent width="30%"><cps:dicText value="${qgzdryBean.xm}"/></cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>性别：</cps:tdLabel>
							<cps:tdContent><cps:dicText zdlb="GB_XB" dm="${qgzdryBean.xb}"/></cps:tdContent>
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent><cps:dicText value="${qgzdryBean.csrq}"/></cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>姓名拼音：</cps:tdLabel>
							<cps:tdContent><cps:dicText value="${qgzdryBean.xmpy}"/></cps:tdContent>
							<cps:tdLabel>外文姓名：</cps:tdLabel>
							<cps:tdContent><cps:dicText value="${qgzdryBean.wwxm}"/></cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>国籍：</cps:tdLabel>
							<cps:tdContent>中国</cps:tdContent>
							<cps:tdLabel>民族：</cps:tdLabel>
							<cps:tdContent><cps:dicText zdlb="GB_MZ" dm="${qgzdryBean.mz}"/></cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>籍贯：</cps:tdLabel>
							<cps:tdContent><cps:dicText zdlb="GB_XZQH" dm="${qgzdryBean.jg}"/></cps:tdContent>
							<cps:tdLabel>户籍地区划：</cps:tdLabel>
							<cps:tdContent><cps:dicText zdlb="GB_XZQH" dm="${qgzdryBean.hjdqh}"/></cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>户籍地详址：</cps:tdLabel>
							<cps:tdContent><cps:dicText value="${qgzdryBean.hjdxz}"/></cps:tdContent>
							<cps:tdLabel>户籍地派出所：</cps:tdLabel>
							<cps:tdContent><cps:dicText value="${qgzdryBean.hjdpcs}"/></cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>重点人员人员类别：</cps:tdLabel>
							<cps:tdContent><cps:dicText value="${qgzdryBean.zdrylbbjms}"/></cps:tdContent>
							<cps:tdLabel>重点人员人员细类：</cps:tdLabel>
							<cps:tdContent><cps:dicText value="${qgzdryBean.zdryxlms}"/></cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:tdContent>
				<cps:tdContent width="100">
					<div><img src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${qgzdryBean.sfzh}" width="130" height="140"></div>
				</cps:tdContent>
			</cps:row>
		</cps:table>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="17%">现住地区划：</cps:tdLabel>
				<cps:tdContent width="28%"><cps:dicText zdlb="GB_XZQH" dm="${qgzdryBean.xzdqh}"/></cps:tdContent>
				<cps:tdLabel width="20%">现住地派出所：</cps:tdLabel>
				<cps:tdContent width="30%"><cps:dicText value="${qgzdryBean.xzdpcs}"/></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>现住地详址：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.xzdxz}"/></cps:tdContent>
				<cps:tdLabel>管辖单位：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.gxdw}"/></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>立案单位：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.ladw}"/></cps:tdContent>
				<cps:tdLabel>立案时间：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.zjlasj}"/></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>入部级库时间：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.nrbjzdryksj}"/></cps:tdContent>
				<cps:tdLabel>记录新增时间：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.jlxzsj}"/></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>记录查询时间：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.jlcxsj}"/></cps:tdContent>
				<cps:tdLabel>变更时间：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.jlbgsj}"/></cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>记录查询时间：</cps:tdLabel>
				<cps:tdContent><cps:dicText value="${qgzdryBean.rksj}"/></cps:tdContent>
				<cps:tdLabel>有效性：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${qgzdryBean.yxx=='1'}">有效</c:when>
						<c:otherwise>无效</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</cps:panel>
	</cps:PanelView>
</creator:view>