<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="box_title">
		<tr>
			<td width="23">
				<img src="${contextPath}/template/cps/images/img_title.jpg"
					width="23" height="28" />
			</td>
			<td>
				动态信息 > 社会关系
			</td>
		</tr>
	</table>
	<form id="shgxForm">
		<input type="hidden" value="${sfzh }" name="gxr.sfzh" id="sfzh" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="sqjw_list">
			<tr>
				<th width="10%">
					与本人关系
				</th>
				<th width="10%">
					姓名
				</th>
				<th width="10%">
					性别
				</th>
				<th width="10%">
					身份证号
				</th>
				<th width="10%">
					电话号码
				</th>
				<th width="10%">
					操作
				</th>
			</tr>
			<tbody>
				<c:forEach items="${gxrList}" var="gxr" varStatus="index">
					<c:set value="${index.index + 1}" var="gxrCount"></c:set>
					<tr>
						<td align="center">
							<cps:select name="jtgx" zdlb="ZDRY_JTGX" cssClass="select160"
								value="${gxr.ydsrgx}" headerKey="" headerValue="--请选择--"></cps:select>
						</td>
						<td align="center">
							<input type="text" name="xm" value="${gxr.gxrxm }" class="input100" />
						</td>
						<td align="center">
							<cps:select name="xb" zdlb="GB_XB" cssClass="select100" value="${gxr.xb}"
								headerKey="" headerValue="--请选择--"></cps:select>
						</td>
						<td align="center">
							<input type="text" name="sfzh" value="${gxr.gxrsfzh }"
								class="input160" />
						</td>
						<td align="center">
							<input type="text" name="dhhm" value="${gxr.gxrlxdh}"
								class="input100" />
						</td>
						<td align="center">
							<c:if test="${index.index == '0'}">
								<input type="button" onclick="addTabJwry(this);" value="新增"
								class="sqjw_an" />
							</c:if>
							<c:if test="${index.index != '0'}">
								<input type="button" onclick="delTabJwry(this);" value="删除"
								class="sqjw_an" />
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty gxrList}">
					<c:set value="1" var="gxrCount"></c:set>
					<tr>
						<td align="center">
							<cps:select name="jtgx" zdlb="ZDRY_JTGX" cssClass="select160"
								value="${gxr.ydsrgx}" headerKey="" headerValue="--请选择--"></cps:select>
						</td>
						<td align="center">
							<input type="text" name="xm" value="${gxr.gxrxm }" class="input100" />
						</td>
						<td align="center">
							<cps:select name="xb" zdlb="GB_XB" cssClass="select100" value="${gxr.xb}"
								headerKey="" headerValue="--请选择--"></cps:select>
						</td>
						<td align="center">
							<input type="text" name="sfzh" value="${gxr.gxrsfzh }"
								class="input160" />
						</td>
						<td align="center">
							<input type="text" name="dhhm" value="${gxr.gxrlxdh}"
								class="input100" />
						</td>
						<td align="center">
							<input type="button" onclick="addTabJwry(this);" value="新增"
								class="sqjw_an" />
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<input type="hidden" value="${gxrCount}" name="gxrCount" id="gxrCount" />
	</form>
	<cps:button value="保存" onclick="saveValue('shgxForm','shgx');"></cps:button>
</creator:view>
