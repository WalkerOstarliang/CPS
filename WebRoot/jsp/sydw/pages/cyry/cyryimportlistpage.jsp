<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:PanelView>
	<cps:panel id="zdrycyrylist" title="重点人员列表">
		<div class="cps-panel-content" id="cyryzdrytablegrid" style="width: 99.8%;" >
		<table id="cyryimporttable" width="100%" class="cps-tablegrid"  style="width: 100%;" border="0" cellSpacing="0" cellPadding="0">
			<tr>
				<th>序号</th>
				<th>姓名</th>
				<th>身份证号码</th>
				<th>电话号码</th>
				<th>居住地派出所</th>
				<th>居住地址</th>
				<th>重点人员标识</th>
			</tr>
			<c:forEach items="${zdryCyryBeans}" var="bean" varStatus="st">
				<tr id="tr_${st.index }">
					<td>${bean.num}</td>
					<td>${bean.xm}</td>
					<td>${bean.sfzh}</td>
					<td>${bean.lxdh}</td>
					<td>${bean.jzdpcs}</td>
					<td>${bean.jzdz}</td>
					<td style="color:red">${bean.zdrylbms}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</cps:panel>
</cps:PanelView>
<%-- 
<creator:panel id="cyryimmportpanel" title="从业人员导入列表">
	<div class="cps-panel-content" id="cyrytablegrid" style="width: 99.8%;" >
		<table id="cyryimporttable" width="100%" class="cps-tablegrid"  style="width: 100%;" border="0" cellSpacing="0" cellPadding="0">
			<tr>
				<th>序号</th>
				<th>姓名</th>
				<th>身份证号码</th>
				<th>电话号码</th>
				<th>职务</th>
				<th>入职时间</th>
				<th>离职时间</th>
				<th>居住地派出所</th>
				<th>居住地址</th>
				<th>备注</th>
				<th>错误信息</th>
			</tr>
			<c:choose>
				<c:when test="${not empty importErrorInfo}">
					<tr>
						<td colspan="10" align="center">
							<font color="red">${importErrorInfo}</font>
						</td>
					</tr>
				</c:when>
				<c:when test="${empty cyryBeans}">
					<tr>
						<td colspan="10" align="center">
							<font color="red">导入文件没有数据.</font>
						</td>
					</tr>
				</c:when>
				<c:when test="${not empty cyryBeans}">
					<c:forEach items="${cyryBeans}" var="bean" varStatus="st">
						<tr id="tr_${st.index }">
							<td>${bean.num}</td>
							<td><cps:textfield id="xm_${st.index}" name="cyryBeans[${st.index}].xm" value="${bean.xm}" required="true" maxlength="30"/></td>
							<td><cps:textfield id="sfzh_${st.index}" name="cyryBeans[${st.index}].sfzh" value="${bean.sfzh}" required="true" isSfzh="true" /></td>
							<td><cps:textfield id="lxdh_${st.index}" name="cyryBeans[${st.index}].lxdh" value="${bean.lxdh}" required="true" isPhone="true"/></td>
							<td><cps:select zdlb="ZAGL_RY_ZW" valuetextmode="true"  id="zw_${st.index}" name="cyryBeans[${st.index}].zw" value="${bean.zw}" required="true" cssStyle="width:100"/></td>
							<td><cps:date id="rzsj_${st.index}" name="cyryBeans[${st.index}].rzsj" value="${bean.rzsj}" dateFmt="yyyy-MM-dd"/></td>
							<td><cps:date id="lzsj_${st.index}" name="cyryBeans[${st.index}].lzsj" value="${bean.lzsj}" dateFmt="yyyy-MM-dd"/></td>
							<td><cps:textfield id="jzdpcs_${st.index}" name="cyryBeans[${st.index}].jzdpcs" value="${bean.jzdpcs}" required="true" readonly="true" onclick="openSelectJzdpcs('jzdpcs_${st.index}')" appendPopuBtn="true" cssStyle="width:150"/></td>
							<td><cps:textfield id="jzdz_${st.index}" name="cyryBeans[${st.index}].jzdz" value="${bean.jzdz}" maxlength="100"/></td>
							<td><cps:textfield id="bz_${st.index}" name="cyryBeans[${st.index}].bz" value="${bean.bz}" maxlength="200"/></td>
							<td>
								<cps:textfield value="${bean.errorInfo}" cssStyle="color:red"/>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
</creator:panel>
--%>