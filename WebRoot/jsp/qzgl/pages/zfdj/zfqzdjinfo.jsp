<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="走访群众登记表">
	<creator:Script src="/jsp/qzgl/js/zfdwdjxx.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/af.js"></creator:Script>
	<creator:tbar  id="zfqzdjinfotbar">
		<c:choose>
			<c:when test="${operType=='detail'}">
				<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
			</c:when>
			<c:otherwise>
				<cps:button id="save" value="保存" onclick="submitSave()"></cps:button>
				<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
			</c:otherwise>
		</c:choose>
	</creator:tbar>
	<creator:panel id="infopanel" title="走访群众登记表"  tbarId="zfqzdjinfotbar">
		<form id="infoform" name="xldyform" action="<c:url value='/qzgl/zfqzdj/updateZfqzdjInfo.action'/>" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="bh" name="bean.bh"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>走访民警：</cps:tdLabel>
					<cps:tdContent width="25%" >
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfmjxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<input type="hidden" id="zfmjjh" name="bean.zfmjjh"  value="${bean.zfmjjh}"/>
								<input type="hidden" id="zfmjdwdm" name="bean.zfmjdwdm"  value="${bean.zfmjdwdm}"/>
							<input type="hidden" id="zfmjdwmc" name="bean.zfmjdwmc"  value="${bean.zfmjdwmc}"/>
								<cps:textfield id="zfmjxm" name="bean.zfmjxm" value="${bean.zfmjxm}" cssClass="validate[required] cps-input" readonly="true"
								 ondblclick="selectDwryTree('${log.orgcode }','zfmjjh','zfmjxm','zfmjdwdm','zfmjdwmc')"></cps:textfield>
								<cps:button value="选择" onclick="selectDwryTree('${log.orgcode }','zfmjjh','zfmjxm','zfmjdwdm','zfmjdwmc')"></cps:button>
							</c:otherwise>
						</c:choose>			
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>走访时间：</cps:tdLabel>
					<cps:tdContent width="25%">
					<c:choose>
							<c:when test="${operType=='detail'}">
								${bean.zfsj }
							</c:when>
							<c:otherwise>
								<cps:date id="zfsj" name="bean.zfsj" dateFmt="yyyy-MM-dd" value="${bean.zfsj}" cssClass="validate[required]" ></cps:date>
							
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>走访事由：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfsymc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="zfsy" name="bean.zfsy" zdlb="ZFGL_ZFSY" value="${bean.zfsy}" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-select"></cps:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>群众姓名：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfdxxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdxxm" name="bean.zfdxxm" cssClass="validate[required,maxSize[16]] cps-input" ></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>身份证号码：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfdxsfzh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdxsfzh" name="bean.zfdxsfzh" cssClass="validate[funcCall[checkIDC]],required cps-input" ></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfdxlxdh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdxlxdh" name="bean.zfdxlxdh"  cssClass="validate[custom[mobile],maxSize[11]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>

				
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>群众属性：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfdxlxmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="zfdxlx" name="bean.zfdxlx" zdlb="ZFGL_QZSX" value="${bean.zfdxlx}" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-select" ></cps:select>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					
					<cps:tdLabel width="10%">家庭住址：</cps:tdLabel>
					<cps:tdContent width="25%" colspan="4" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.jtzz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jtzz" name="bean.jtzz"  cssStyle="width:90%" cssClass="validate[maxSize[60]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
				</cps:row>
			
					
				<cps:row>
					
					<cps:tdLabel width="10%">走访调查内容：</cps:tdLabel>
					<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea  id="zfdcnr" name="bean.zfdcnr" rows="10" cssStyle="width:94%"  readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="zfdcnr" name="bean.zfdcnr" rows="10" cssStyle="width:94%" ></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					
					<cps:tdLabel width="10%">走访调查结果：</cps:tdLabel>
					<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea  id="zfdcjg" name="bean.zfdcjg" rows="5" cssStyle="width:94%"  readonly="true" ></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="zfdcjg" name="bean.zfdcjg" rows="5" cssStyle="width:94%"  ></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>所属单位：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<s:hidden id="djdwmc" name="bean.djdwmc"></s:hidden>
					<s:hidden id="djdwdm" name="bean.djdwdm"></s:hidden>
						${bean.djdwmc }
					</cps:tdContent>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<s:hidden id="djrxm" name="bean.djrxm"></s:hidden>
								${bean.djrxm }
					</cps:tdContent>
					<cps:tdLabel width="10%">登记日期：</cps:tdLabel>
					<cps:tdContent width="25%">
					<s:hidden id="djsj" name="bean.djsj"></s:hidden>
							${bean.djsj}
					</cps:tdContent>
				
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>