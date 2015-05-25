<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view title="列管/撤管流程信息">
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>

	<div class="sqjw_wk">
		<div>
			<table width="98%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="40%"  valign="top">
						<table width="98%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center">
									<img src="${contextPath }/jsp/zdrygl/images/sqjw_lc.gif"
										width="184" height="99" />
								</td>
							</tr>
							<tr>
								<td align="center">
									<img src="${contextPath }/jsp/zdrygl/images/sqjw_lc1.gif"
										width="184" height="99" />
								</td>
							</tr>
							<tr>
								<td align="center">
									<img src="${contextPath }/jsp/zdrygl/images/sqjw_lc2.gif"
										width="184" height="99" />
								</td>
							</tr>
							<tr>
								<td align="center">
									<img src="${contextPath }/jsp/zdrygl/images/sqjw_lc3.gif"
										width="184" height="99" />
								</td>
							</tr>
						</table>
					</td>
					<td width="55%" valign="top">
						<table width="98%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="35" class="lc_wz1">
									&nbsp;
									<img src="${contextPath}/jsp/zdrygl/images/sqjw_tb2.gif"
										width="16" height="16" style="margin-bottom: -4px;" />
									&nbsp;处理过程
								</td>
							</tr>
							<c:forEach items="${lzxxList}" var="lzxx">
								<tr>
									<td height="30" class="lc_wz">
										&nbsp;${lzxx.cldwlxmc }
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;受理人：${lzxx.clrxm }
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;处理时间：${lzxx.toChar_clsj }
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;处理意见：${lzxx.cljgyj }
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;处理结果：${lzxx.cljgmc }
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
</creator:view>
