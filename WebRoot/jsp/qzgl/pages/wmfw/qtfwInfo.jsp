<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="其他服务登记表">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>

<style>
	body{margin:0;height:100%}
	html{height:100%}
	#left{width:800px;height:100%;float:left}
	#main{width:100%;height:100%;}
</style>
		<creator:tbar id="qtfwInfotbar">
			<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:button value="确&nbsp;定" onclick="$.closeWindow()" ></cps:button>
					<cps:button value="打&nbsp;印" onclick="printQtfw(1)"></cps:button>
				</c:when>
				<c:when test="${operType=='add'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQtfw('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
				<c:when test="${operType=='update'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQtfw('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</creator:tbar>
		<!--startprint1-->
		<form id="qtfwform" name="qtfwform"  action="/qzgl/wmfwgl/saveQtfwBean.action" method="post">
		<creator:panel id="addQtry" title="其他服务登记表" tbarId="qtfwInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="id" name="qtfwbean.id"></s:hidden>
			<div id="main"  style="height: 100%;width:100%">
				<div id ="left" >
				  <cps:table id="qtfwTable">	
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>服务时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${qtfwbean.fwsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="fwsj" name="qtfwbean.fwsj" cssClass="validate[required]" value ="${qtfwbean.fwsj}"  maxDate="${qtfwbean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>服务内容：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="3">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea id="fwnr" name="qtfwbean.fwnr" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea id="fwnr" name="qtfwbean.fwnr" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400],required]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">备注：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="3">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea id="bz" name="qtfwbean.bz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400]]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea id="bz" name="qtfwbean.bz" rows="5" cssStyle="width:100%" cssClass="validate[maxSize[400]]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>所属警务区：</cps:tdLabel>
					<cps:tdContent width="25%" >
						<c:if test="${operType=='detail'}">
							<cps:dicText value="${qtfwbean.ssjwqmc}"></cps:dicText>
						</c:if>
						<c:if test="${operType=='update'}">
							<s:hidden id="ssjwqdm" name="qtfwbean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="qtfwbean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:70%" value="${qtfwbean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
						<c:if test="${operType=='add'}">
							<s:hidden id="ssjwqdm" name="qtfwbean.ssjwqdm"></s:hidden>
							<cps:textfield id="ssjwqmc" name="qtfwbean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:70%" value="${qtfwbean.ssjwqmc}" required="true"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
						</c:if>
					</cps:tdContent>
					<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if><font color="red">*</font>经办人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qtfwbean.jbrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jbrxm" name="qtfwbean.jbrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>采集单位：</cps:tdLabel>
					<cps:tdContent width="25%" colspan="3">
						<s:hidden id="djdwdm" name="qtfwbean.djdwdm"></s:hidden>
						<s:hidden id="djdwmc" name="qtfwbean.djdwmc"></s:hidden>
						${qtfwbean.djdwmc}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>采集人：</cps:tdLabel>
					<cps:tdContent width="25%" >
						<s:hidden id="djrxm" name="qtfwbean.djrxm"></s:hidden>
						<s:hidden id="czrjh" name="qtfwbean.czrjh"></s:hidden>
						${qtfwbean.djrxm} &nbsp;
					</cps:tdContent>
					<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>采集时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${qtfwbean.djsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								&nbsp;${qtfwbean.djsj}&nbsp;
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				</cps:table>	
		</creator:panel>
	</form>	
	<!--endprint1-->
</creator:view>