<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="cps-panel-content" id="rktablegrid" style="width: 99.8%;" >
	<table id="cyryimporttable" width="100%" class="cps-tablegrid"  style="width: 100%;" border="0" cellSpacing="0" cellPadding="0">
		<tr>
			<th>序号</th>
			<th>姓名</th>
			<th>身份证号码</th>
			<th>民族</th>
			<th>电话号码</th>
			<th>居住时间</th>
			<th>居住事由</th>
			<th>居住处所</th>
			<th>与户主关系</th>
			<th>拟居住期限</th>
			<th>备注</th>
			<th>错误信息</th>
		</tr>
		<c:choose>
			<c:when test="${not empty importErrorInfo}">
				<tr>
					<td colspan="12" align="center">
						<font color="red">${importErrorInfo}</font>
					</td>
				</tr>
			</c:when>
			<c:when test="${empty syrkBeans}">
				<tr>
					<td colspan="12" align="center">
						<font color="red">导入文件没有数据.</font>
					</td>
				</tr>
			</c:when>
			<c:when test="${not empty syrkBeans}">
				<c:forEach items="${syrkBeans}" var="bean" varStatus="st">
					<tr>
						<td>${bean.num}</td>
						<td><cps:textfield id="xm_${st.index}" name="syrkBeans[${st.index}].xm" value="${bean.xm}" required="true" maxlength="30"/></td>
						<td><cps:textfield id="sfzh_${st.index}" name="syrkBeans[${st.index}].sfzh" value="${bean.sfzh}" required="true" isSfzh="true" /></td>
						<td><cps:select zdlb="GB_MZ" valuetextmode="true" id="mz_${st.index}" name="syrkBeans[${st.index}].mz" value="${bean.mz}" required="true" cssStyle="width:80"/></td>
						<td><cps:textfield id="lxdh_${st.index}" name="syrkBeans[${st.index}].lxdh" value="${bean.lxdh}" required="true" isPhone="true"/></td>
						<td><cps:date id="jzsj_${st.index}" name="syrkBeans[${st.index}].jzsj" value="${bean.jzsj}" required="true" dateFmt="yyyy-MM-dd"/></td>
						<td><cps:select zdlb="ZDY_ZZSY" valuetextmode="true" id="jzsy_${st.index}" name="syrkBeans[${st.index}].jzsy" value="${bean.jzsy}" required="true" cssStyle="width:100"/></td>
						<td><cps:select zdlb="GA_ZZCS" valuetextmode="true" id="jzcs_${st.index}" name="syrkBeans[${st.index}].jzcs" value="${bean.jzcs}" required="true" cssStyle="width:100"/></td>
						<td><cps:textfield id="yhzgx_${st.index}" name="syrkBeans[${st.index}].yhzgx" value="${bean.yhzgx}" required="true" maxlength="200"/></td>
						<td><cps:select zdlb="ZDY_NJZQX" valuetextmode="true" id="njzqx_${st.index}" name="syrkBeans[${st.index}].njzqx" value="${bean.njzqx}" required="true" cssStyle="width:80"/></td>
						<td><cps:textfield id="bz_${st.index}" name="syrkBeans[${st.index}].bz" value="${bean.bz}" maxlength="200"/></td>
						<td>
							<cps:textfield value="${bean.errorInfo}" cssStyle="color:red"/>
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</div>
