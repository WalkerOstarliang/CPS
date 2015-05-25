<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="弃婴移送信息">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>
<creator:tbar id="qyryYjxxInfotbar">
	<c:choose>
		<c:when test="${operType=='update'}">
			<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQyryYsxx('true')" display="${displayAddBtn}"></cps:button>
			<cps:button value="打&nbsp;印" onclick="printQyryYsxx(1)"></cps:button>
			<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</c:when>
	</c:choose>
</creator:tbar>
<!--startprint1-->
<form id="qyryysxxform" name="qyryysxxform"  action="/qzgl/wmfwgl/saveQyryYsxxBean.action" method="post">
<creator:panel id="addQyry" title="弃婴移送信息" tbarId="qyryYjxxInfotbar">
	<s:hidden id="operType" name="operType"></s:hidden>
	<s:hidden id="id" name="qyrybean.id"></s:hidden>
		  <cps:table id="qyryTable">	
			<cps:row>
				<cps:tdLabel width="14%"><font color="red">*</font>离所时间：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:date id="qyrylssj" name="qyrybean.qyrylssj" maxDate="${qyrybean.qyysdjsj}" dateFmt="yyyy-MM-dd" value ="${qyrybean.qyrylssj}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>弃婴离所去向：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyrylsqx" name="qyrybean.qyrylsqx" cssClass="validate[maxSize[120],required]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%">接收单位名称：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryjsdwmc" name="qyrybean.qyryjsdwmc" cssClass="validate[maxSize[120]]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">接收单位电话：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryjsdwdh" name="qyrybean.qyryjsdwdh" cssClass="validate[maxSize[50]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%">接收单位地址：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="3">
					<cps:textfield id="qyryjsdwdz" name="qyrybean.qyryjsdwdz" cssClass="validate[maxSize[120]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%"><font color="red">*</font>认领人/接收人姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryrlrxm" name="qyrybean.qyryrlrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">认领人证件类别：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="qyryrlrzjlb" name="qyrybean.qyryrlrzjlb" zdlb="GB_ZJZL" headerKey="" headerValue="--请选择--" value="${qyrybean.qyryrlrzjlb}" ></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%">认领人/接收身份证号：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryrlrsfzh" name="qyrybean.qyryrlrsfzh" cssClass="validate[maxSize[18]]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">认领人与弃婴关系：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="qyryyrlrgx" name="qyrybean.qyryyrlrgx" zdlb="YHZGL" headerKey="" headerValue="--请选择--" value="${qyrybean.qyryyrlrgx}" ></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%">认领人证件号码：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryrlrzjhm" name="qyrybean.qyryrlrzjhm" cssClass="validate[maxSize[30]]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">认领人联系方式：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryrlrlxfs" name="qyrybean.qyryrlrlxfs" cssClass="validate[maxSize[30]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%">认领人住址：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="3">
					<cps:textfield id="qyryrlrzz" name="qyrybean.qyryrlrzz" cssClass="validate[maxSize[120]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%">备注：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="3">
					<s:textarea id="qyryysbz" name="qyrybean.qyryysbz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%"><font color="red">*</font>所属警务区：</cps:tdLabel>
				<cps:tdContent width="25%"  colspan="3">
					<s:hidden id="qyysssjwqdm" name="qyrybean.qyysssjwqdm"></s:hidden>
					<cps:textfield id="qyysssjwqmc" name="qyrybean.qyysssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','qyysssjwqdm','qyysssjwqmc')" cssStyle="width:80%" value="${qyrybean.qyysssjwqmc}" required="true"></cps:textfield>
					<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','qyysssjwqdm','qyysssjwqmc')"></cps:button>
				</cps:tdContent>	
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%"><font color="red">*</font>经办人：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryysjbrxm" name="qyrybean.qyryysjbrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">审批人：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="qyryyssprxm" name="qyrybean.qyryyssprxm" cssClass="validate[maxSize[30]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%"><c:if test="${operType!='detail'}"></c:if>采集人：</cps:tdLabel>
				<cps:tdContent width="25%">
					<s:hidden id="qyysdjrxm" name="qyrybean.qyysdjrxm"></s:hidden>
					${qyrybean.qyysdjrxm} &nbsp;
				</cps:tdContent>
				<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>采集单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<s:hidden id="qyysdjdwdm" name="qyrybean.qyysdjdwdm"></s:hidden>
					<s:hidden id="qyysdjdwmc" name="qyrybean.qyysdjdwmc"></s:hidden>
					${qyrybean.qyysdjdwmc}
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="14%"><c:if test="${operType!='detail'}"></c:if>采集时间：</cps:tdLabel>
				<cps:tdContent width="25%">
				<s:hidden id="qyysdjsj" name="qyrybean.qyysdjsj"></s:hidden>
					&nbsp;${qyrybean.qyysdjsj}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</form>
<!--endprint1-->
</creator:view>