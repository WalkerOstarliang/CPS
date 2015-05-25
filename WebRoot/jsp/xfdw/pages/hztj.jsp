<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="火灾统计">
	<creator:Script src="/jsp/xfdw/js/hztj.js"></creator:Script>
	<creator:Script src="/jsp/xfdw/js/tableload.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" type="button" onclick="submitForm()"></cps:button>
		</cps:tbar>
		<cps:panel title="统计条件">
			<form action="<c:url value='/xfdw/hztj/toHztjList.action'/>"
				id="queryFormId" method="post">
				<input type="hidden" id="org_code" name="tjBean.org_code" value="" />
				<input type="hidden" id="leve" name="tjBean.leve" value="${leve }" />
				<input type="hidden" id="p_code" name="tjBean.p_code"
					value="${tjBean.p_code }" />
				<input type="hidden" id="last_code" name="tjBean.last_code"
					value="${tjBean.last_code }" />
				<input type="hidden" id="_key" name="_key" value="${tjBean.key }" />
				<div>
						<input type='radio' value='last' name="tjBean.key" id="lastM"
							<c:if test=" ">checked='checked'</c:if> />
						<font>上月&nbsp;&nbsp;&nbsp;&nbsp;</font>
						<input type='radio' value='this' name="tjBean.key" id="thisM"
							<c:if test=" ">checked='checked'</c:if> />
						<font>本月&nbsp;&nbsp;&nbsp;&nbsp;</font>
						<input type='radio' value='other' name="tjBean.key" id="otherM"
							checked='checked' />
						<font>其他&nbsp;&nbsp;&nbsp;&nbsp;</font>
						<label id="_time1">
							开始日期：
						</label>
						<cps:date maxDate="sysdate" cssStyle="width:100px"
							dateFmt="yyyy-MM-dd" id="kssj" name="tjBean.kssj"
							value="${tjBean.kssj}" defaultSystemDate="false" />
						<label id="_time3">
							结束日期：
						</label>
						<cps:date maxDate="sysdate" cssStyle="width:100px;"
							dateFmt="yyyy-MM-dd" id="jssj" name="tjBean.jssj"
							value="${tjBean.jssj}" defaultSystemDate="true" />
						<span style="color:red;display:block;" id="_time5">(注：查询结果包含开始日期，不包含结束日期。)</span>
				</div>
			</form>
		</cps:panel>
	</cps:PanelView>
	
	<cps:PanelView>
		<cps:tbar id="tjBar">
			<c:if test="${leve == '5' || leve == '6'}">
				<cps:button value="上一级" type="button" onclick="lastSubmitForm()"></cps:button>
			</c:if>
			<cps:button value="导出" type="button" onclick="exportHztj()"></cps:button>
		</cps:tbar>
	
		<cps:panel id="Panel_hztj" title="火灾统计">
			<input type="hidden" id="titleText" value="火灾统计" />
			<cps:table id="tableHztj"
				cssStyle="margin-left: 0px auto;margin-right: 0px auto;">
				<thead>
					<cps:row>
						<cps:tdLabel colspan="2" rowspan="3"
							cssStyle="text-align:center;width:30%;font-weight:bold;">项目</cps:tdLabel>
						<cps:tdLabel colspan="5"
							cssStyle="text-align:center;width:70%;font-weight:bold;">火灾概况</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdLabel rowspan="2"
							cssStyle="text-align:center;font-weight:bold;">起数</cps:tdLabel>
						<cps:tdLabel rowspan="2"
							cssStyle="text-align:center;font-weight:bold;">死人</cps:tdLabel>
						<cps:tdLabel rowspan="2"
							cssStyle="text-align:center;font-weight:bold;">伤人</cps:tdLabel>
						<cps:tdLabel colspan="2"
							cssStyle="text-align:center;font-weight:bold;">损失</cps:tdLabel>
					</cps:row>
					<cps:row>
						<cps:tdLabel
							cssStyle="text-align:center;width:15%;font-weight:bold;">直接财产损失(元)</cps:tdLabel>
						<cps:tdLabel
							cssStyle="text-align:center;width:15%;font-weight:bold;">受灾户数</cps:tdLabel>
					</cps:row>
				</thead>
				<tbody>
					<c:forEach var="list" items="${hztjList}" varStatus="i">
						<cps:row>
							<c:if test="${(i.count+2) % 3 == 0 && ((i.count+2)/3)%2 == 1 }">
								<cps:tdContent cssStyle="text-align:center;width:15%" rowspan="3">
									<input type="hidden" id="${list.ssdwdm }"
										value="${list.ssdwdm }" />
									<a href="###" onclick="queryNext('${list.ssdwdm }')">${list.xzqybm}</a>
								</cps:tdContent>
							</c:if>
							<c:if test="${(i.count+2) % 3 == 0 && ((i.count+2)/3)%2 == 0 }">
								<cps:tdContent
									cssStyle="text-align:center;width:15%;background-color: #f0f0f0;"
									rowspan="3">
									<input type="hidden" id="${list.ssdwdm }"
										value="${list.ssdwdm }" />
									<a href="###" onclick="queryNext('${list.ssdwdm }')">${list.xzqybm}</a>
								</cps:tdContent>
							</c:if>
							<c:if
								test="${i.count % 6 == 1 || i.count % 6 == 2 || i.count % 6 == 3 }">
								<cps:tdContent cssStyle="text-align:center;width:15%;">
									<c:if test="${list.hzdj == 1}">一般火灾</c:if>
									<c:if test="${list.hzdj == 2}">重大火灾</c:if>
									<c:if test="${list.hzdj == 3}">特大火灾</c:if>
								</cps:tdContent>
								<cps:tdContent cssStyle="text-align:center;width:15%;">
									<a href="###"
										onclick="queryXq('${list.ssdwdm }','${list.hzdj }')">${list.hzxh}</a>
								</cps:tdContent>
								<cps:tdContent cssStyle="text-align:center;width:15%">${list.swrs}</cps:tdContent>
								<cps:tdContent cssStyle="text-align:center;width:15%">${list.ssrs}</cps:tdContent>
								<cps:tdContent cssStyle="text-align:center;width:15%">${list.zjccss}</cps:tdContent>
								<cps:tdContent cssStyle="text-align:center;">${list.szhs}</cps:tdContent>
							</c:if>
							<c:if
								test="${i.count % 6 == 0 || i.count % 6 == 4 || i.count % 6 == 5 }">
								<cps:tdContent
									cssStyle="text-align:center;width:15%;background-color: #f0f0f0;">
									<c:if test="${list.hzdj == 1}">一般火灾</c:if>
									<c:if test="${list.hzdj == 2}">重大火灾</c:if>
									<c:if test="${list.hzdj == 3}">特大火灾</c:if>
								</cps:tdContent>
								<cps:tdContent
									cssStyle="text-align:center;width:15%;background-color: #f0f0f0;">
									<a href="###"
										onclick="queryXq('${list.ssdwdm }','${list.hzdj }')">${list.hzxh}</a>
								</cps:tdContent>
								<cps:tdContent
									cssStyle="text-align:center;width:15%;background-color: #f0f0f0;">${list.swrs}</cps:tdContent>
								<cps:tdContent
									cssStyle="text-align:center;width:15%;background-color: #f0f0f0;">${list.ssrs}</cps:tdContent>
								<cps:tdContent
									cssStyle="text-align:center;width:15%;background-color: #f0f0f0;">${list.zjccss}</cps:tdContent>
								<cps:tdContent
									cssStyle="text-align:center;background-color: #f0f0f0;">${list.szhs}</cps:tdContent>
							</c:if>
						</cps:row>
					</c:forEach>
				</tbody>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
</creator:view>