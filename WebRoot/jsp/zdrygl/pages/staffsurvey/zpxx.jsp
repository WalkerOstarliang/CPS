<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<creator:panel id="zpxx" title="动态信息 > 照片信息">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="sqjw_list">
		<tr>
			<th width="10%">
				照片描述
			</th>
			<th width="10%">
				拍照时间
			</th>
			<th width="10%">
				附件
			</th>
			<th width="10%">
				操作
			</th>
		</tr>
		<tbody>
			<c:forEach items="${zpxxList}" var="zpxx" varStatus="index">
				<c:set value="${index.index + 1}" var="gxrCount"></c:set>
				<tr>
					<td align="center">
						${zpxx.zpms}
					</td>
					<td align="center">
						${zpxx.pzrq}
					</td>
					<td align="center">
						<a href="#" onclick="showZpxx('${zpxx.id}');">查看附件</a>
					</td>
					<td align="center">
						<cps:button value="删除" onclick="delZpxx(this,'${zpxx.id}');"></cps:button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="zpxxForm" enctype="multipart/form-data" method="post" action="${contextPath}/zdry/staffsurvey_saveStaffsurvey.action?modth=zpxx">
		<input type="hidden" value="${sfzh }" name="zpxx.sfzh" id="sfzh" />
		<input type="hidden" value="${gxrCount}" name="gxrCount" id="gxrCount" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="sqjw_list">
			<tbody id="zpxxTable"></tbody>
		</table>
		<cps:button value="新增" onclick="addZpxx();"></cps:button>
		<cps:button value="保存" onclick="ajaUploadFile('zpxxForm');"></cps:button>
	</form>
</creator:panel>
</creator:view>
