<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="来信来访登记表">
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/lxlfxz.js"></script>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/lxlf.js"></script>
		<creator:tbar id="lxdjInfotbar">
			<c:choose>
				<c:when test="${operType=='detail'}">
					<cps:button value="确&nbsp;定" onclick="$.closeWindow()"></cps:button>
				</c:when>
				<c:otherwise>
					<cps:button id="save" value="保&nbsp;存" onclick="submitSave('true')"></cps:button>
					<cps:button value="清&nbsp;空" onclick="clearForm()"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:otherwise>
			</c:choose>
		</creator:tbar>
		<form id="lxlfform" action="<c:url value='/qzgl/lxdjgl/addLxdj.action'/>" method="post">
		<creator:panel id="addLxlfdj" title="来信来访登记表" tbarId="lxdjInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="bh" name="bean.bh"></s:hidden>
			<s:hidden id="cllx" name="bean.cllx"></s:hidden>
				<cps:table id="lxlfTable">
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>来访主题：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.xjzt}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="lfzt" name="bean.xjzt" cssClass="validate[maxSize[30],required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>属性：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.nfwfs}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="lxsx" name="bean.fwfs" zdlb="FWQZ_LFLXSX" headerKey="" headerValue="--请选择--" value="${bean.fwfs}" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>来访类型</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.nnrlx}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="lflx" name="bean.nrlx" zdlb="FWQZ_NRLX" value="${bean.nrlx}" headerKey="" headerValue="--请选择--" cssClass="validate[required]">
									</cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">来访人身份证：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.lflxrsfzh}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="lflxrsfzh" name="bean.lflxrsfzh" cssClass="validate[funcCall[checkIDC]] cps-input" onblur="queryRkBean(this.value,setLflxryxx)" maxlength="18"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">来访人姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.lflxrxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="lflxrxm" name="bean.lflxrxm" cssClass="validate[maxSize[30]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.lflxrlxdh}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="lflxrlxdh" name="bean.lflxrlxdh" cssClass="validate[maxSize[20]]" minlength="7" maxlength="20" isPhone="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">现住地址：</cps:tdLabel>
						<cps:tdContent width="60%" colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.lflxrjtzz}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="lflxrjtzz" name="bean.lflxrjtzz" cssStyle="width:93%" cssClass="validate[maxSize[150]]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>接待民警：</cps:tdLabel>
						<cps:tdContent width="25%">
								<c:if test="${operType=='detail'}">
									<cps:dicText value="${bean.sjjdmjxm}"></cps:dicText>
								</c:if>
								<c:if test="${operType=='update'}">
									<input type="hidden" id="sjjdmjdm" name="bean.sjjdmjjh" value="${bean.sjjdmjjh }"/>
									<cps:textfield id="sjjdmjxm" onclick="selectDwry('${loginInfo.orgcode }','sjjdmjdm','sjjdmjxm')" onfocus="selectDwry('${loginInfo.orgcode }','sjjdmjdm','sjjdmjxm')" name="bean.sjjdmjxm" value="${bean.sjjdmjxm }" cssClass="validate[required]" maxlength="15"></cps:textfield>
									<cps:button value="选择" onclick="selectDwry('${loginInfo.orgcode }','sjjdmjdm','sjjdmjxm')"></cps:button>
								</c:if>
								<c:if test="${operType=='add'}">
									<input type="hidden" id="sjjdmjdm" name="bean.sjjdmjjh" value="${loginInfo.username }"/>
									<cps:textfield id="sjjdmjxm" onclick="selectDwry('${loginInfo.orgcode }','sjjdmjdm','sjjdmjxm')" onfocus="selectDwry('${loginInfo.orgcode }','sjjdmjdm','sjjdmjxm')" name="bean.sjjdmjxm" value="${loginInfo.realname}" cssClass="validate[required]" maxlength="15"></cps:textfield>
									<cps:button value="选择" onclick="selectDwry('${loginInfo.orgcode }','sjjdmjdm','sjjdmjxm')"></cps:button>
								</c:if>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if></c:if>接待单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							
								<c:if test="${operType=='detail'}">
									<cps:dicText value="${bean.sjjdmjdwmc}"></cps:dicText>
								</c:if>
								<c:if test="${operType=='update'}">
									<input type="hidden" id="sjjdmjdwdm" name="bean.sjjdmjdwdm" value="${bean.sjjdmjdwdm }"/>
									<cps:textfield id="sjjdmjdw" readonly="true" name="bean.sjjdmjdwmc" cssClass="validate[required]" value="${bean.sjjdmjdwmc}" maxlength="12"></cps:textfield>
								</c:if>
								<c:if test="${operType=='add'}">
									<input type="hidden" id="sjjdmjdwdm" name="bean.sjjdmjdwdm" value="${loginInfo.orgcode}"/>
									<cps:textfield id="sjjdmjdw"  name="bean.sjjdmjdwmc" cssClass="validate[required]" value="${loginInfo.orgname}" maxlength="60"></cps:textfield>
								</c:if>
							
						</cps:tdContent>
						<cps:tdLabel>接待民警电话：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="sjjdmjlxdh" name="bean.sjjdmjlxdh" value="${bean.sjjdmjlxdh }" isPhone="true" maxlength="11"></cps:textfield>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>来访时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.lflxsj}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:date id="lfsj" name="bean.lflxsj" dateFmt="yyyy-MM-dd" value="${bean.lflxsj}" cssClass="validate[required]" ></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>接收单位：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<c:choose>
								<c:when test="${operType=='detail'}">
									${bean.jsdwmc}&nbsp;
								</c:when>
								<c:otherwise>
									<s:hidden id="jsdwdm" name="bean.jsdwdm"></s:hidden>
									<cps:textfield id="jsdwmc" name="bean.jsdwmc"  onclick="selectDw('${loginInfo.orgcode}','jsdwdm','jsdwmc')" cssStyle="width:88%" value="${bean.jsdwmc}" required="true"></cps:textfield>
									<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','jsdwdm','jsdwmc')"></cps:button>
									<%--<cps:button id="zhuanfa" value="转发" onclick="submitSave('false');" cssStyle="display:none"></cps:button>--%>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>来访内容：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea  id="lfnr" name="bean.lfxjnr" rows="10" cssStyle="width:93%" cssClass="validate[required]" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="lfnr" name="bean.lfxjnr" rows="10" cssStyle="width:93%" cssClass="validate[required]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
							<cps:tdLabel>登记人姓名：</cps:tdLabel>
							<cps:tdContent>
								<s:hidden id="djrxm" name="bean.djrxm"></s:hidden>
								<s:hidden id="djrjh" name="bean.djrjh"></s:hidden>
								${bean.djrxm} &nbsp;
							</cps:tdContent>
							
							<cps:tdLabel>登记单位：</cps:tdLabel>
							<cps:tdContent>
								<s:hidden id="djdwdm" name="bean.djdwdm"></s:hidden>
								<s:hidden id="djdwmc" name="bean.djdwmc"></s:hidden>
								${bean.djdwmc}&nbsp;
							</cps:tdContent>
							<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent>
								<s:hidden id="djsj" name="bean.djsj"></s:hidden>
								${bean.djsj}&nbsp;
							</cps:tdContent>
					</cps:row>
					<c:if test="${bean.cllx=='3'}">
						<cps:row>
							<cps:tdLabel>处理人：</cps:tdLabel>
							<cps:tdContent>
								${bean.clrxm} &nbsp;
							</cps:tdContent>
							<cps:tdLabel>处理时间：</cps:tdLabel>
							<cps:tdContent>
								${bean.clsj}&nbsp;
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>处理单位：</cps:tdLabel>
							<cps:tdContent colspan="5">${bean.jsdwmc}&nbsp;</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>处理结果描述：</cps:tdLabel>
							<cps:tdContent colspan="5">${bean.cljgms}&nbsp;</cps:tdContent>
						</cps:row>
					</c:if>
				</cps:table>
		</creator:panel>
	</form>
</creator:view>