<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="提供证明登记表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js"></script>
		<creator:tbar id="tgzmInfotbar">
			<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:button value="确&nbsp;定" onclick="$.closeWindow()"></cps:button>
					<cps:button value="打&nbsp;印" onclick="printTgzm(1)"></cps:button>
				</c:when>
				<c:otherwise>
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveTgzm('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
					<!-- 
					<cps:button value="打&nbsp;印" onclick="printTgzm(1)"></cps:button>
					 -->
				</c:otherwise>
			</c:choose>
		</creator:tbar>
		<!--startprint1-->
		<form id="tgzmform" action="<c:url value='/qzgl/wmfwgl/saveTgzmBean.action'/>" method="post">
		<creator:panel id="addTgzm" title="提供证明登记表" tbarId="tgzmInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="id" name="tgzmbean.id"></s:hidden>
				<cps:table id="tgzmTable">
					<cps:row>
						<cps:tdLabel width="13%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>申请人姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${tgzmbean.sqrxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="sqrxm" name="tgzmbean.sqrxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>申请人性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
								<!-- 
									<cps:select id="sqrxb" name="tgzmbean.sqrxb" zdlb="GB_XB" headerKey="" headerValue="--请选择--" value="${tgzmbean.sqrxb}" cssClass="validate[required]" enableEdit="false">
									</cps:select>
								 -->	
									<cps:dicText value="${tgzmbean.sqrxbms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="sqrxb" name="tgzmbean.sqrxb" zdlb="GB_XB" headerKey="" headerValue="--请选择--" value="${tgzmbean.sqrxb}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>申请人电话：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${tgzmbean.sqrlxfs}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="sqrlxfs" name="tgzmbean.sqrlxfs" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">证件类型：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
								<!--  
									<cps:select id="sqrzjzl" name="tgzmbean.sqrzjzl" zdlb="GB_ZJZL" headerKey="" headerValue="--请选择--" value="${tgzmbean.sqrzjzl}" disabled="true">
									</cps:select>
								-->	
									<cps:dicText value="${tgzmbean.sqrzjzlms}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="sqrzjzl" name="tgzmbean.sqrzjzl" zdlb="GB_ZJZL" headerKey="" headerValue="--请选择--" value="${tgzmbean.sqrzjzl}" >
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${tgzmbean.sqrzjhm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="sqrzjhm" name="tgzmbean.sqrzjhm" cssClass="validate[maxSize[30]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>申请时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${tgzmbean.sqsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="sqsj" name="tgzmbean.sqsj" cssClass="validate[required]" value ="${tgzmbean.sqsj}"  maxDate="${tgzmbean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%"><font color="red">*</font>证明类型：</cps:tdLabel>
						<cps:tdContent width="60%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${tgzmbean.tgzmlx}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="tgzmlx" name="tgzmbean.tgzmlx" cssStyle="width:93%" cssClass="validate[required]" maxlength="60"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%"><font color="red">*</font>证明内容：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea id="tgzmnr" name="tgzmbean.tgzmnr" rows="10" cssStyle="width:100%" cssClass="validate[maxSize[2000],required]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea id="tgzmnr" name="tgzmbean.tgzmnr" rows="10" cssStyle="width:100%" cssClass="validate[maxSize[2000],required]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%"><c:if test="${operType!='detail'}"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if></c:if>承办单位：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="3">
							<c:if test="${operType=='detail'}">
								<cps:dicText value="${tgzmbean.cbdwmc}"></cps:dicText>
							</c:if>
							<c:if test="${operType=='update'}">
								<s:hidden id="cbdwdm" name="tgzmbean.cbdwdm"></s:hidden>
								<cps:textfield id="cbdwmc" name="tgzmbean.cbdwmc"  onclick="selectDw('${loginInfo.orgcode}','cbdwdm','cbdwmc')" cssStyle="width:50%" value="${tgzmbean.cbdwmc}" required="true"></cps:textfield>
								<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','cbdwdm','cbdwmc')"></cps:button>
							</c:if>
							<c:if test="${operType=='add'}">
								<s:hidden id="cbdwdm" name="tgzmbean.cbdwdm"></s:hidden>
								<cps:textfield id="cbdwmc" name="tgzmbean.cbdwmc"  onclick="selectDw('${loginInfo.orgcode}','cbdwdm','cbdwmc')" cssStyle="width:50%" value="${tgzmbean.cbdwmc}" required="true"></cps:textfield>
								<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','cbdwdm','cbdwmc')"></cps:button>
							</c:if>
						</cps:tdContent>
						<cps:tdLabel width="10%">承办时间：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="3">
						<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${tgzmbean.cbsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="cbsj" name="tgzmbean.cbsj"  maxDate="${tgzmbean.djsj}"  value ="${tgzmbean.cbsj}" dateFmt="yyyy-MM-dd"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>	
						<cps:tdLabel width="13%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>承办人：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="3">
							<c:if test="${operType=='detail'}">
								<cps:dicText value="${tgzmbean.cbrxm}"></cps:dicText>
							</c:if>
							<c:if test="${operType=='update'}">
								<cps:textfield id="cbrxm"  name="tgzmbean.cbrxm" value="${tgzmbean.cbrxm }" cssClass="validate[required]" cssStyle="width:50%" maxlength="30"></cps:textfield>
							</c:if>
							<c:if test="${operType=='add'}">
								<cps:textfield id="cbrxm"  name="tgzmbean.cbrxm" value="${tgzmbean.cbrxm }" cssClass="validate[required]" cssStyle="width:50%" maxlength="30"></cps:textfield>
							</c:if>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>签发人：</cps:tdLabel>
						<cps:tdContent width="25%" colspan="3">
							<c:if test="${operType=='detail'}">
								<cps:dicText value="${tgzmbean.qfrxm}"></cps:dicText>
							</c:if>
							<c:if test="${operType=='update'}">
								<cps:textfield id="qfrxm"  name="tgzmbean.qfrxm" value="${tgzmbean.qfrxm }" cssClass="validate[required]" maxlength="30"></cps:textfield>
							</c:if>
							<c:if test="${operType=='add'}">
								<cps:textfield id="qfrxm"  name="tgzmbean.qfrxm" value="${tgzmbean.qfrxm }" cssClass="validate[required]" maxlength="30"></cps:textfield>
							</c:if>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">处理结果：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea id="cljg" name="tgzmbean.cljg" rows="6" cssStyle="width:100%" cssClass="validate[maxSize[200]]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea id="cljg" name="tgzmbean.cljg" rows="6" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">备注：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea id="bz" name="tgzmbean.bz" rows="3" cssStyle="width:100%" cssClass="validate[maxSize[200]]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea id="bz" name="tgzmbean.bz" rows="3" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%"><font color="red">*</font>所属警务区：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									${tgzmbean.ssjwqmc}&nbsp;
								</c:when>
								<c:otherwise>
									<s:hidden id="ssjwqdm" name="tgzmbean.ssjwqdm"></s:hidden>
									<cps:textfield id="ssjwqmc" name="tgzmbean.ssjwqmc"  onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')" cssStyle="width:30%" value="${bean.ssjwqmc}" required="true"></cps:textfield>
									<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','ssjwqdm','ssjwqmc')"></cps:button>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">录入人：</cps:tdLabel>
						<cps:tdContent>
							<s:hidden id="djrxm" name="tgzmbean.djrxm"></s:hidden>
							<s:hidden id="czrjh" name="tgzmbean.czrjh"></s:hidden>
							${tgzmbean.djrxm} &nbsp;
						</cps:tdContent>
						<cps:tdLabel>录入单位：</cps:tdLabel>
						<cps:tdContent>
							<s:hidden id="djdwdm" name="tgzmbean.djdwdm"></s:hidden>
							<s:hidden id="djdwmc" name="tgzmbean.djdwmc"></s:hidden>
							${tgzmbean.djdwmc}
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"></c:if>录入时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${tgzmbean.djsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									&nbsp;${tgzmbean.djsj}&nbsp;
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
	</form>
	<!--endprint1-->
</creator:view>