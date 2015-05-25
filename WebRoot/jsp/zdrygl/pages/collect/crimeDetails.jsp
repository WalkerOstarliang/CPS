<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>

<creator:view title="社区警务-重点人员管理">
	<creator:Script src="/jsp/zdrygl/js/zdry_comm.js"></creator:Script>
	<TABLE border=1 height=600px align=left>
		<tr>
			<TD width=180px align=left valign=top
				style="BORDER-RIGHT: #999999 1px dashed">
				<img src="${contextPath}/jsp/zdrygl/images/sqjw_04.gif"
									width="101" height="141" />			
				<!-- 
					<img
					src="<c:url value='/cps/common/showPoto.action?sfzh=433101199310186521'/> "
					width="101" height="141" />
							
				 -->
			</TD>
			<TD rowspan="2" width=900px align=left valign=top>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="box_title">
					<tr>
						<td width="23">
							<img src="${contextPath}/template/cps/images/img_title.jpg"
								width="23" height="28" />
						</td>
						<td>
							人员基本信息
						</td>
					</tr>
				</table>

				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="cps-table-list" id="personnelInfo">
					<tr>
						<th>
							姓名：
						</th>
						<td field="xm">
							${crimePersonnel.xm }&nbsp;
						</td>
						<th>
							身份证号：
						</th>
						<td field="sfzh">
							${crimePersonnel.sfzh }&nbsp;
						</td>
						<th>
							出生日期：
						</th>
						<td field="csrq">
							${crimePersonnel.csrq }&nbsp;
						</td>
					</tr>
					<tr>
						<th>
							性别：
						</th>
						<td field="xb">
							${crimePersonnel.xb }&nbsp;
						</td>
						<th>
							民族：
						</th>
						<td field="mz">
							${crimePersonnel.mz }&nbsp;
						</td>
						<th>
							政治面貌：
						</th>
						<td field="zzmm">
							${crimePersonnel.zzmm }&nbsp;
						</td>
					</tr>
					<tr>
						<th>
							文化程度：
						</th>
						<td field="wwcd">
							${crimePersonnel.wwcd }&nbsp;
						</td>
						<th>
							户籍地详址：
						</th>
						<td field="hjdxz">
							${crimePersonnel.hjdxz }&nbsp;
						</td>
						<th>
							职业：
						</th>
						<td field="zy">
							${crimePersonnel.zy }&nbsp;
						</td>
					</tr>
					<tr>
						<th>
							案件名称：
						</th>
						<td field="ajmc">
							${crimePersonnel.ajmc }&nbsp;
						</td>
						<th>
							案件类别：
						</th>
						<td field="ajlb">
							${crimePersonnel.ajlb }&nbsp;
						</td>
						<th>
							现实表现：
						</th>
						<td field="jdjg">
							 ${crimePersonnel.jdjg } &nbsp;
						</td>
					</tr>
					<tr>
						<th>
							决定时间：
						</th>
						<td field="jdsj">
							${crimePersonnel.jdsj }&nbsp;
						</td>
						<th>
							涉嫌罪名：
						</th>
						<td field="sxzm">
							${crimePersonnel.sxzm }&nbsp;
						</td>
						<th>
							保证人：
						</th>
						<td field="bzrxm">
							${crimePersonnel.bzrxm }&nbsp;
						</td>
					</tr>
					<tr>
						<th>
							保证金：
						</th>
						<td field="bzj">
							${crimePersonnel.bzj }&nbsp;
						</td>
						<th>
							罚款金额：
						</th>
						<td field="fkje">
							${crimePersonnel.fkje }&nbsp;
						</td>
						<th>
							办案人：
						</th>
						<td field="barxm">
							${crimePersonnel.barxm }&nbsp;
						</td>
					</tr>
					<tr>
						<th>
							所属派出所：
						</th>
						<td colspan="5" field="sspcsmc">
							${crimePersonnel.sspcsmc }&nbsp;
						</td>
					</tr>
					<tr>
						<th>
							办案单位：
						</th>
						<td  colspan="5" field="badwmc">
							${crimePersonnel.badwmc }&nbsp;
						</td>
					</tr>
					<tr>
						<th>
							简要案情：
						</th>
						<td colspan="5" align="left"  field="jyaq">
							${crimePersonnel.jyaq }&nbsp;
						</td>
					</tr>
				</table>
				<div class="clearDiv"></div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="box_title">
					<tr>
						<td width="23">
							<img src="${contextPath}/template/cps/images/img_title.jpg"
								width="23" height="28" />
						</td>
						<td>
							其他历史记录
						</td>
					</tr>
				</table>
				<form id="searchform">
					<input type="hidden" value="${crimePersonnel.sfzh }" name="crime.sfzh" />
				</form>
				<cps:tableGrid id="fzryQtInfo" 
					usepager="false"
					searchform="searchform"
					autothead="true"
					click="showCrimDetail"
					url="/zdry/crime_queryCrimePersonnel.action"
					mutilSelect="false"
					autoload="true"
					>
					<cps:column isNumber="true" title="序号"></cps:column>
					<cps:column title="姓名" field="xm" ></cps:column>
					<cps:column title="身份证号" field="sfzh"></cps:column>
					<cps:column title="案件名称" field="ajmc" ></cps:column>
					<cps:column title="决定时间" field="jdsj"></cps:column>
					<cps:column title="决定结果" field="jdjg"></cps:column>
				</cps:tableGrid>
			</TD>
		</tr>
	</TABLE>
</creator:view>