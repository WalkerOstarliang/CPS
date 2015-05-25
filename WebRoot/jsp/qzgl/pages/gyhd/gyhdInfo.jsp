<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="公益活动${operType=='add'?'登记':'详情'}表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/gyhd.js"></script>
<link type="text/css" rel="stylesheet" href="${contextPath}/uploadify/uploadify.css" />  
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/gyhdinfo.js"></script>
<script type="text/javascript" src="${contextPath}/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${contextPath}/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/uploadify/swfobject.js"></script> 
	<creator:tbar  id="gyhdInfotbar">
		<c:choose>
			<c:when test="${operType=='detail'}">
				<cps:button value="确&nbsp;定" onclick="$.closeWindow()"></cps:button>
			</c:when>
			<c:otherwise>
				<cps:button id="save" value="保存" onclick="submitSave()"></cps:button>
				<cps:button value="清&nbsp;空" onclick="cleargyhdForm()"></cps:button>
				<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
			</c:otherwise>
		</c:choose>
	</creator:tbar>
	<form id="gyhdInfoform" action="<c:url value='/qzgl/gyhdgl/updateGyhd.action'/>" method="post" enctype="application/x-www-form-urlencoded">
	<creator:panel id="hbgzInfo" title="公益活动${operType=='add'?'登记':'详情'}表"  tbarId="gyhdInfotbar">
			<input type="hidden" id="operType" name="operType" value="${operType}" />
			<input type="hidden" id="bh" name="bean.bh" value="${bean.bh}" />
				<cps:table id="hbgzTable">
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>活动主题：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.hdzt}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="hdzt" cssStyle="width:94%"  name="bean.hdzt" cssClass="validate[required] cps-input" maxlength="25"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						</cps:row>
						<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>活动时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.hdsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="hdsj" dateFmt="yyyy-MM-dd" value="${bean.hdsj}" name="bean.hdsj" cssClass="validate[required] cps-input" ></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>活动地点：</cps:tdLabel>
						<cps:tdContent colspan="3" >
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.hddz}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="hddz" name="bean.hddz" cssClass="validate[required] cps-input" cssStyle="width:90%" maxlength="60"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">参与单位：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.cydwjry}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="cydw" name="bean.cydwjry" cssClass="cps-input"  maxlength="500" cssStyle="width:94%"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">参与人员：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.cyry}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="cyry" name="bean.cyry" cssClass=" cps-input"  maxlength="150" cssStyle="width:94%"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>活动内容：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea  id="hdnr" name="bean.hdnr" rows="5" cssStyle="width:94%" cssClass="validate[required,maxSize[250]]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="hdnr" name="bean.hdnr" rows="5" cssStyle="width:94%" cssClass="validate[required, maxSize[250]]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<%--<cps:row>
						<cps:tdLabel>附件：</cps:tdLabel>
						<cps:tdContent colspan="5">
						<c:choose>
						<c:when test="${operType=='detail'}">
						<c:forEach var="bean" items="${fjList}">
						${bean.fjmc }&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						</c:when>
						<c:otherwise>
						 <div id="fileQueue"></div>
						<div id="result" style="float: left; width: 100%; padding-top: 6px;"></div>
						<input type="file" name="fileInput" id="fileInput"  class="cps-file" onclick="uploadify()"/>
     						 <a href="#" onclick="$('#fileInput').uploadifyUpload()">上传</a>| 
     						 <a href="#" onclick="$('#fileInput').uploadifyClearQueue()">取消上传</a>
						<c:if test="${operType=='update'}">
						<c:forEach var="bean" items="${fjList}">
										&nbsp;已保存附件：${bean.fjmc } <font color="blue" size="10"> 重新选择附件将会覆盖原附件！</font>&nbsp;			
						</c:forEach>
						</c:if>
						</c:otherwise>
						</c:choose>
						</cps:tdContent>
					</cps:row>--%>
					</cps:table>
			
					<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">登记人姓名：</cps:tdLabel>
						<cps:tdContent width="25%"> 
							<c:choose>
							<c:when test="${operType=='detail'}">
							<cps:dicText value="${bean.djrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
							<cps:textfield value="${bean.djrxm}" id="djrxm" name="bean.djrxm" readonly="true" cssStyle="width:97%"></cps:textfield>
							</c:otherwise>
							</c:choose>
							<s:hidden id="djrjh" name="bean.djrjh"></s:hidden>
							
						</cps:tdContent>
						<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.djsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date value="${bean.djsj}"  name="bean.djsj" id="djsj" dateFmt="yyyy-MM-dd HH:mm:ss" cssStyle="width:97%"></cps:date> 
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:hidden id="djdwdm" name="bean.djdwdm"></s:hidden>
							<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.djdwmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
							<cps:textfield value="${bean.djdwmc}" id="djdwmc" name="bean.djdwmc" readonly="true" cssStyle="width:97%"></cps:textfield>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
	
 	<c:if test="${operType!='detail'}">
	<creator:tbar id="fjstbar">
 	 	<div style="width: 100%;text-align: right;">
 	 		<cps:button value="新增" onclick="addFjTrObj()"></cps:button>
 	 	</div>
 	</creator:tbar>
 	</c:if>
 	 <creator:panel id="fjqpanel" title="公益附件" tbarId="fjstbar">
 	 	
 	 	
 		<cps:table id="fjtable" cssClass="cps-tablegrid ">
 			<c:choose>
 			<c:when test="${operType!='detail'}">
 			<tr>
 				<th align="center" width="80%">附件</th>
 				<th align="center" width="20%">操作</th>
 			</tr>
 			<c:forEach items="${fjList}" var="bean">
 				<tr>
 					<td align="center" width="80%">
						<span onclick="dbFileDown('t_fwqz_fjxx','bh','fj','${bean.bh}','${bean.fjmc}')" style="cursor: pointer;" class="cps_span_href">${bean.fjmc}</span>
					</td>
					 <td align="center" width="20%">
						<cps:button value="删除" onclick="deleteTjTrObj(this, '${bean.bh}','update')"></cps:button>
					</td>
 				</tr>
 			</c:forEach>
 			</c:when>
 			<c:otherwise>
 				<tr>
 				<th align="center">附件</th>
 			</tr>
 			<c:forEach items="${fjList}" var="bean">
 				<tr>
 					<td align="center" >
						<span onclick="dbFileDown('t_fwqz_fjxx','bh','fj','${bean.bh}','${bean.fjmc}')" style="cursor: pointer;" class="cps_span_href">${bean.fjmc}</span>
					</td>
 				</tr>
 			</c:forEach>
			</c:otherwise>
 			</c:choose>
		
		</cps:table>
		
	</creator:panel>	
	</form>
</creator:view>