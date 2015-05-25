<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="迷途人员移送信息">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>
<creator:tbar id="mtryYjxxInfotbar">
	<c:choose>
		<c:when test="${operType=='update'}">
			<cps:button id="save" value="保&nbsp;存" onclick="submitSaveMtryYsxx('true')" display="${displayAddBtn}"></cps:button>
			<cps:button value="打&nbsp;印" onclick="printMtryYsxx(1)"></cps:button>
			<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</c:when>
	</c:choose>
</creator:tbar>
<!--startprint1-->
<form id="mtryysxxform" name="mtryysxxform"  action="/qzgl/wmfwgl/saveMtryYsxxBean.action" method="post">
<creator:panel id="addMtry" title="迷途人员移送信息" tbarId="mtryYjxxInfotbar">
	<s:hidden id="operType" name="operType"></s:hidden>
	<s:hidden id="id" name="mtrybean.id"></s:hidden>
		  <cps:table id="mtryTable">	
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>离所时间：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:date id="mtrylssj" name="mtrybean.mtrylssj" maxDate="${mtrybean.mtryysdjsj}" dateFmt="yyyy-MM-dd" value ="${mtrybean.mtrylssj}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>迷途人离所去向：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtrylsqx" name="mtrybean.mtrylsqx" cssClass="validate[maxSize[120],required]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">接收单位名称：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtryjsdwmc" name="mtrybean.mtryjsdwmc" cssClass="validate[maxSize[120]]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">接收单位电话：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtryjsdwdh" name="mtrybean.mtryjsdwdh" cssClass="validate[maxSize[50]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">接收单位地址：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="3">
					<cps:textfield id="mtryjsdwdz" name="mtrybean.mtryjsdwdz" cssClass="validate[maxSize[120]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>认领人/接收人姓名：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtryrlrxm" name="mtrybean.mtryrlrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>认领人证件类别：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="mtryrlrzjlb" name="mtrybean.mtryrlrzjlb" zdlb="GB_ZJZL" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryrlrzjlb}" ></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">认领人与迷途人关系：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:select id="mtryrlrgx" name="mtrybean.mtryrlrgx" zdlb="YHZGL" headerKey="" headerValue="--请选择--" value="${mtrybean.mtryrlrgx}" ></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%">认领人证件号码：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtryrlrzjhm" name="mtrybean.mtryrlrzjhm" cssClass="validate[maxSize[30]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">认领人联系方式：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtryrlrlxfs" name="mtrybean.mtryrlrlxfs" cssClass="validate[maxSize[30]]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%">认领人住址：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtryrlrzz" name="mtrybean.mtryrlrzz" cssClass="validate[maxSize[120]]"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">备注：</cps:tdLabel>
				<cps:tdContent width="25%" colspan="3">
					<s:textarea id="mtryysbz" name="mtrybean.mtryysbz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>所属警务区：</cps:tdLabel>
				<cps:tdContent width="25%"  colspan="3">
					<s:hidden id="mtryysssjwqdm" name="mtrybean.mtryysssjwqdm"></s:hidden>
					<cps:textfield id="mtryysssjwqmc" name="mtrybean.mtryysssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','mtryysssjwqdm','mtryysssjwqmc')" cssStyle="width:80%" value="${mtrybean.mtryysssjwqmc}" required="true"></cps:textfield>
					<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','mtryysssjwqdm','mtryysssjwqmc')"></cps:button>
				</cps:tdContent>	
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>经办人：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:textfield id="mtryysjbrxm" name="mtrybean.mtryysjbrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>采集人：</cps:tdLabel>
				<cps:tdContent width="25%">
					<s:hidden id="mtryysdjrxm" name="mtrybean.mtryysdjrxm"></s:hidden>
					<s:hidden id="mtryysdjrjh" name="mtrybean.mtryysdjrjh"></s:hidden>
					${mtrybean.mtryysdjrxm} &nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%"><c:if test="${operType!='detail'}"></c:if>采集单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<s:hidden id="mtryysdjdwdm" name="mtrybean.mtryysdjdwdm"></s:hidden>
					<s:hidden id="mtryysdjdwmc" name="mtrybean.mtryysdjdwmc"></s:hidden>
					${mtrybean.mtryysdjdwmc}
				</cps:tdContent>
				<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>采集时间：</cps:tdLabel>
				<cps:tdContent width="25%">
				<s:hidden id="mtryysdjsj" name="mtrybean.mtryysdjsj"></s:hidden>
					&nbsp;${mtrybean.mtryysdjsj}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</form>
<!--endprint1-->
</creator:view>