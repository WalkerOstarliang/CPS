<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="box_title">
		<tr>
			<td width="23">
				<img src="${contextPath}/template/cps/images/img_title.jpg"
					width="23" height="28" />
			</td>
			<td>
				动态信息 > 联系方式
			</td>
		</tr>
	</table>
	<form id="llfsForm">
		<input type="hidden" name="lxfs.sfzh" value="${sfzh }" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="cps-table-list">
			<tr>
				<th>手机号码</th>
				<td><input type="type" name="lxfs.sjhm" id="sjhm" value="${lxfs.sjhm }"/></td>
				<th>家庭电话</th>
				<td><input type="type" name="lxfs.jtdh" value="${lxfs.jtdh} "/></td>
			</tr>
			<tr>
				<th>工作电话</th>
				<td><input type="type" name="lxfs.gzdh" value="${lxfs.gzdh}"/></td>
				<th>公司电话</th>
				<td><input type="type" name="lxfs.gsdh" value="${lxfs.gsdh}"/></td>
			</tr>
			<tr>
				<th>QQ号码</th>
				<td><input type="type" name="lxfs.qqhm" value="${lxfs.qqhm}"/></td>
				<th>电子邮箱</th>
				<td><input type="type" name="lxfs.dzyjhm" value="${lxfs.dzyjhm}"/></td>
			</tr>
			<tr>
				<th>旺旺ID</th>
				<td><input type="type" name="lxfs.wwid" value="${lxfs.wwid}"/></td>
				<th>MSN</th>
				<td><input type="type" name="lxfs.msn" value="${lxfs.msn}"/></td>
			</tr>
			<tr>
				<th>传真号码</th>
				<td colspan="3"><input type="type" name="lxfs.czhm" value="${lxfs.czhm}"/></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><cps:button onclick="saveValue('llfsForm','llfs');" value="保存"></cps:button></td>
			</tr>
		</table>
	</form>
</creator:view>
