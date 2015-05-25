<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script src="${contextPath}/FusionCharts/JSClass/FusionCharts.js"
		type="text/javascript"></script>
	<script src="${contextPath}/jsp/zdrygl/js/zdry_comm.js"
		type="text/javascript"></script>
	<script src="${contextPath}/jsp/zdrygl/js/home.js"
		type="text/javascript"></script>

	<div class="box02">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="box_title">
			<tr>
				<td width="23">
					<img src="${contextPath}/template/cps/images/img_title.jpg"
						width="23" height="28" />
				</td>
				<td>
					列管到期提醒
				</td>
				<td width="50" align="center">
					<a href="#" class="l_blue">更多</a>
				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="list_box" id="lgdqtxTable" rownumbers="true">
			<thead>
				<tr>
					<th width="40" field="">
						序号
					</th>
					<th field="txlxmc">
						提醒类型
					</th>
					<th field="xm">
						姓名
					</th>
					<th field="sfzh">
						身份证号
					</th>
					<th field="xzdxz">
						现住地址
					</th>
					<th field="sckcsj">
						上次考察时间
					</th>
					<th field="kcdqsj">
						下次考察时限
					</th>
					<th field="xxlbmc">
						人员类别
					</th>
					<th field="cz">
						操作
					</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="box_title">
			<tr>
				<td width="23">
					<img src="${contextPath}/template/cps/images/img_title.jpg"
						width="23" height="28" />
				</td>
				<td>
					列管审核提醒
				</td>
				<td width="50" align="center">
					<a href="#" class="l_blue">更多</a>
				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="list_box" id="lgsptxTable" rownumbers="true">
			<thead>
				<tr>
					<th width="40" field="opt">
						序号
					</th>
					<th field="xm">
						姓名
					</th>
					<th field="sfzh">
						身份证号
					</th>
					<th field="jtzz">
						现住地址
					</th>
					<th field="ajms">
						案件描述
					</th>
					<th field="toChar_jbsj">
						办理时间
					</th>
					<th field="txcz">
						操作
					</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	<creator:panel id="zdrylxrsfbChart" title="重点人员类型人数分布情况">
		<form id="zdrylxrylxForm">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">市/州：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty loginInfo.citydm}">
							<s:select list="cityXzqhList" id="citydm" name="statisticsQueryBean.citydm"
								listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
								cssClass="cps-input"
								onchange="initZdryLxChart();"></s:select>
						</c:when>
						<c:otherwise>
							<s:hidden id="citydm" name="statisticsQueryBean.citydm"></s:hidden>
							<s:select list="cityXzqhList" id="citydmselect"
								name="statisticsQueryBean.citydm" listKey="dm" listValue="mc" headerKey=""
								headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">县/区：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty loginInfo.countrydm}">
							<s:select list="countryXzqhList" id="countrydmselect"
								name="statisticsQueryBean.countrydm" listKey="dm" listValue="mc" headerKey=""
								headerValue="--请选择--" cssClass="cps-input"
								onchange="initZdryLxChart();"></s:select>
						</c:when>
						<c:otherwise>
							<s:hidden name="statisticsQueryBean.countrydm"></s:hidden>
							<s:select list="countryXzqhList" id="countrydmselect"
								name="statisticsQueryBean.countrydm" listKey="dm" listValue="mc" headerKey=""
								headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">派出所：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty loginInfo.pcsdm}">
							<s:select list="pcsOrgList" id="pcsdmselect" name="statisticsQueryBean.pcsdm"
								listKey="orgcode" listValue="orgjc" headerKey=""
								headerValue="--请选择--" cssClass="cps-input"
								onchange="initZdryLxChart();"></s:select>
						</c:when>
						<c:otherwise>
							<s:hidden name="statisticsQueryBean.pcsdm"></s:hidden>
							<s:select list="pcsOrgList" id="pcsdmselect" name="statisticsQueryBean.pcsdm"
								listKey="orgcode" listValue="orgjc" headerKey=""
								headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>			
			<cps:row>
				<cps:tdContent  colspan="6">
					<div id="zdrylxStatistics" style="height: 300px;"></div>
				</cps:tdContent>
			</cps:row>
		</cps:table>
		</form>
	</creator:panel>

	<creator:panel id="zdrylxrsgkChart" title="重点人员类型人数管控情况">
		<form id="zdrylxrygkForm">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市/州：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citydm}">
								<s:select list="cityXzqhList" id="citydm" name="statisticsQueryBean.citydm"
									listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--"
									cssClass="cps-input"
									onchange="initZdryGkChart();"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="citydm" name="statisticsQueryBean.citydm"></s:hidden>
								<s:select list="cityXzqhList" id="citydmselect"
									name="statisticsQueryBean.citydm" listKey="dm" listValue="mc" headerKey=""
									headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县/区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrydm}">
								<s:select list="countryXzqhList" id="countrydmselect"
									name="statisticsQueryBean.countrydm" listKey="dm" listValue="mc" headerKey=""
									headerValue="--请选择--" cssClass="cps-input"
									onchange="initZdryGkChart();"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="statisticsQueryBean.countrydm"></s:hidden>
								<s:select list="countryXzqhList" id="countrydmselect"
									name="statisticsQueryBean.countrydm" listKey="dm" listValue="mc" headerKey=""
									headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select list="pcsOrgList" id="pcsdmselect" name="statisticsQueryBean.pcsdm"
									listKey="orgcode" listValue="orgjc" headerKey=""
									headerValue="--请选择--" cssClass="cps-input"
									onchange="initZdryGkChart();"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="statisticsQueryBean.pcsdm"></s:hidden>
								<s:select list="pcsOrgList" id="pcsdmselect" name="statisticsQueryBean.pcsdm"
									listKey="orgcode" listValue="orgjc" headerKey=""
									headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<div id="zdrygkStatistics" style="width: 100%; height: 300px;"></div>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>
