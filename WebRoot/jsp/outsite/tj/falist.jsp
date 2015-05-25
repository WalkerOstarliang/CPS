<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="table_box">
		<tr>
			<th rowspan="2">
				辖区
			</th>
			<th colspan="3">
				总数
			</th>
			<th colspan="3">
				抢劫案
			</th>
			<th colspan="3">
				抢夺案
			</th>
			<th colspan="3">
				盗窃案
			</th>
			<th colspan="3">
				诈骗案
			</th>
			<th colspan="3">
				其他案件
			</th>
		</tr>
		<tr>
			<th>
				当天
			</th>
			<th>
				本月
			</th>
			<th>
				本年
			</th>
			<th>
				当天
			</th>
			<th>
				本月
			</th>
			<th>
				本年
			</th>
			<th>
				当天
			</th>
			<th>
				本月
			</th>
			<th>
				本年
			</th>
			<th>
				当天
			</th>
			<th>
				本月
			</th>
			<th>
				本年
			</th>
			<th>
				当天
			</th>
			<th>
				本月
			</th>
			<th>
				本年
			</th>
			<th>
				当天
			</th>
			<th>
				本月
			</th>
			<th>
				本年
			</th>
		</tr>
		<c:forEach items="${xqfaqktjBean.byfatjList}" var="xqajtjBean">
			<tr>
				<td width="130px" style="text-align: left;">
					${xqajtjBean.dwmc}
				</td>

				<td>
					${xqajtjBean.ajzsl}
				</td>
				<td>
					${xqajtjBean.ajzsl_y}
				</td>
				<td>
					${xqajtjBean.ajzsl_n}
				</td>

				<td>
					${xqajtjBean.qjasl}
				</td>
				<td>
					${xqajtjBean.qjasl_y}
				</td>
				<td>
					${xqajtjBean.qjasl_n}
				</td>

				<td>
					${xqajtjBean.qdasl}
				</td>
				<td>
					${xqajtjBean.qdasl_y}
				</td>
				<td>
					${xqajtjBean.qdasl_n}
				</td>

				<td>
					${xqajtjBean.dqasl}
				</td>
				<td>
					${xqajtjBean.dqasl_y}
				</td>
				<td>
					${xqajtjBean.dqasl_n}
				</td>

				<td>
					${xqajtjBean.zpasl}
				</td>
				<td>
					${xqajtjBean.zpasl_y}
				</td>
				<td>
					${xqajtjBean.zpasl_n}
				</td>

				<td>
					${xqajtjBean.qtasl}
				</td>
				<td>
					${xqajtjBean.qtasl_y}
				</td>
				<td>
					${xqajtjBean.qtasl_n}
				</td>
			</tr>
		</c:forEach>
	</table>
