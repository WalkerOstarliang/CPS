<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/lxlfcl.js"></script>
<creator:view>
	<creator:box>
		<creator:tbar id="lxcrorzftbar">
			<c:choose>
				<c:when test="${operType=='chuli'}">
					<cps:button id="save" value="保&nbsp;存" onclick="chuli()"></cps:button>
				</c:when>
				<c:otherwise>
					<cps:button value="转&nbsp;发" onclick="chuli()"></cps:button>
				</c:otherwise>
			</c:choose>
			<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
		</creator:tbar>
		<creator:panel id="lxdjcx" title="${operType=='chuli' ? '处理结果登记' : '转发'}" tbarId="lxcrorzftbar">
			<form id="lxclqueryform" action="<c:url value='/qzgl/lxclgl/clOrZf.action'/>" method="post">
				<s:hidden id="operType" name="operType"></s:hidden>
				<s:hidden id="bh" name="bean.bh"></s:hidden>
				<s:hidden id="czlx" name="bean.czlx"></s:hidden>
				<cps:table id="lxlfTable">
						<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>来访主题：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.xjzt}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:textfield id="lfzt" name="bean.xjzt" cssClass="validate[maxSize[30],required]" readonly="true"></cps:textfield>
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
									<cps:select id="lxsx" name="bean.fwfs" zdlb="FWQZ_LFLXSX" headerKey="" headerValue="--请选择--" value="${bean.fwfs}" cssClass="validate[required]" disabled="true">
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
									<cps:select id="lflx" name="bean.nrlx" zdlb="FWQZ_NRLX" value="${bean.nrlx}" headerKey="" headerValue="--请选择--" cssClass="validate[required]" disabled="true">
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
									<cps:textfield id="lflxrsfzh" name="bean.lflxrsfzh" cssClass="validate[funcCall[checkIDC]] cps-input" onblur="queryRyxxBean(this.value,setLflxryxx)" maxlength="18" readonly="true"></cps:textfield>
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
									<cps:textfield id="lflxrxm" name="bean.lflxrxm" cssClass="validate[maxSize[30]]" readonly="true"></cps:textfield>
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
									<cps:textfield id="lflxrlxdh" name="bean.lflxrlxdh" maxlength="20" minlength="7" isPhone="true" readonly="true"></cps:textfield>
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
									<cps:textfield id="lflxrjtzz" name="bean.lflxrjtzz" cssStyle="width:93%" cssClass="validate[maxSize[150]]" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if>接待民警：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.sjjdmjxm}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<input type="hidden" id="sjjdmjdm" name="bean.sjjdmjjh" value="${bean.sjjdmjjh }"/>
									<cps:textfield id="sjjdmjxm"  name="bean.sjjdmjxm" value="${bean.sjjdmjxm }" cssClass="validate[required]" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><c:if test="${operType!='detail'}"><c:if test="${operType!='detail'}"><font color="red">*</font></c:if></c:if>接待单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<cps:dicText value="${bean.sjjdmjdwmc}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<input type="hidden" id="sjjdmjdwdm" name="bean.sjjdmjdwdm" value="${bean.sjjdmjdwdm }"/>
									<cps:textfield id="sjjdmjdw" readonly="true" name="bean.sjjdmjdwmc" cssClass="validate[required]"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>接待民警电话：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="sjjdmjlxdh" name="bean.sjjdmjlxdh" value="${bean.sjjdmjlxdh }" isPhone="true" readonly="true"></cps:textfield>
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
									<cps:date id="lfsj" name="bean.lflxsj" dateFmt="yyyy-MM-dd" value="${bean.lflxsj}" cssClass="validate[required]" readOnly="true"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>接收单位：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<c:choose>
								<c:when test="${operType=='detail'}">
									${bean.jsdwmc}&nbsp;
								</c:when>
								<c:otherwise>
									<s:hidden id="jsdwdm" name="bean.jsdwdm"></s:hidden>
									<cps:textfield id="jsdwmc" name="bean.jsdwmc" readonly="true"  cssStyle="width:88%"></cps:textfield>
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
									<s:textarea  id="lfnr" name="bean.lfxjnr" rows="10" cssStyle="width:93%" cssClass="validate[required]" readonly="true"></s:textarea>
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
						<c:choose>
								<c:when test="${operType!='chuli'}">
									<cps:row>
										<cps:tdLabel width="10%">操作人姓名：</cps:tdLabel>
										<cps:tdContent >
											<c:choose>
												<c:when test="${empty bean.czrjh}">
													<input type="hidden" id="czrjh" name="bean.czrjh" value="${loginInfo.username}"/>
													<cps:textfield id="czrxm" name="bean.czrxm" value="${loginInfo.realname}"></cps:textfield>
												</c:when>
												<c:otherwise>
													<input type="hidden" id="czrjh" name="bean.czrjh" value="${bean.czrjh}"/>
													<cps:textfield id="czrxm" name="bean.czrxm" value="${bean.czrxm}"></cps:textfield>
												</c:otherwise>
											</c:choose>
										</cps:tdContent>
										<cps:tdLabel width="10%">操作人联系电话：</cps:tdLabel>
										<cps:tdContent>
											<cps:textfield id="czrlxdh" name="bean.czrlxdh" value="${bean.czrlxdh}" isPhone="true"></cps:textfield>
										</cps:tdContent>
										<cps:tdLabel width="10%">操作人单位：</cps:tdLabel>
											<cps:tdContent colspan="3">
												<c:choose>
													<c:when test="${empty bean.czrdwdm}">
														<input type="hidden" id="czrdwdm" name="bean.czrdwdm" value="${loginInfo.orgcode}"/>
														<cps:textfield id="czrdwmc" name="bean.czrdwmc" value="${loginInfo.orgname }"></cps:textfield>
													</c:when>
													<c:otherwise>
														<input type="hidden" id="czrdwdm" name="bean.czrdwdm" value="${bean.czrdwdm}"/>
														<cps:textfield id="czrdwmc" name="bean.czrdwmc" value="${bean.czrdwmc }"></cps:textfield>
													</c:otherwise>
												</c:choose>
											</cps:tdContent>
									</cps:row>
									<cps:row>
										<cps:tdLabel><font color="red">*</font>转发单位：</cps:tdLabel>
										<cps:tdContent colspan="5">
											<s:hidden id="zfdwdm" name="bean.zfdwdm"></s:hidden>
											<cps:textfield id="zfdwmc" name="bean.zfdwmc" readonly="true" cssClass="validate[required]" onclick="selectDw('${loginInfo.orgcode}','zfdwdm','zfdwmc')"></cps:textfield>
											<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode}','zfdwdm','zfdwmc')"></cps:button>
										</cps:tdContent>
									</cps:row>
							</c:when>
							<c:otherwise>
								<cps:row>
									<cps:tdLabel>处理人姓名：</cps:tdLabel>
									<cps:tdContent>
										<c:choose>
											<c:when test="${empty bean.clrxm}">
												<cps:textfield  id="clrxm" name="bean.clrxm" value="${loginInfo.realname}"></cps:textfield>
												<input type="hidden" id="clrjh" name="bean.clrjh" value="${loginInfo.username}"/>
											</c:when>
											<c:otherwise>
												<cps:textfield  id="clrxm" name="bean.clrxm" value="${bean.clrxm}"></cps:textfield>
												<input type="hidden" id="clrjh" name="bean.clrjh" value="${bean.clrjh}"/>
											</c:otherwise>
										</c:choose>
		 							</cps:tdContent>
									<cps:tdLabel>处理人单位：</cps:tdLabel>
									<cps:tdContent>
										<c:choose>
											<c:when test="${empty bean.cldwdm}">
												<input type="hidden" id="cldwdm" name="bean.cldwdm" value="${loginInfo.orgcode}" />
												<cps:textfield  id="cldwmc" name="bean.cldwmc" value="${loginInfo.orgname }" readonly="true"></cps:textfield>
											</c:when>
											<c:otherwise>
												<input type="hidden" id="cldwdm" name="bean.cldwdm" value="${bean.cldwdm}" />
												<cps:textfield  id="cldwmc" name="bean.cldwmc" value="${bean.cldwmc }" readonly="true"></cps:textfield>
											</c:otherwise>
										</c:choose>										
									</cps:tdContent>
									<cps:tdLabel>处理时间：</cps:tdLabel>
									<cps:tdContent>
										<cps:date id="clsj" name="bean.clsj" dateFmt="yyyy-MM-dd"  value="${bean.clsj}" readOnly="true"></cps:date>
									</cps:tdContent>
									</cps:row>
									<cps:row>
									<cps:tdLabel>处理结果：</cps:tdLabel>
									<cps:tdContent colspan="5">
									<s:textarea id="cljgms" name="bean.cljgms" rows="3" cssStyle="width:93%;"></s:textarea>
									</cps:tdContent>
								</cps:row>
							</c:otherwise>
							</c:choose>
				</cps:table>
			</form>
		</creator:panel>
	</creator:box>
</creator:view>