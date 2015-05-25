<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="走访单位登记表">
	<creator:Script src="/jsp/qzgl/js/zfdwdcxx.js"></creator:Script>
	<creator:tbar  id="zddwdcxxinfotbar">
		<c:choose>
			<c:when test="${operType=='detail'}">
				<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
			</c:when>
			<c:otherwise>
				<cps:button id="save" value="保存" onclick="submitSave()"></cps:button>
				<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
			</c:otherwise>
		</c:choose>
	</creator:tbar>
	<creator:panel id="infopanel" title="走访单位登记表"  tbarId="zddwdcxxinfotbar">
		<form id="infoform" name="xldyform" action="<c:url value='/qzgl/zfdwdc/updateZfdwdcInfo.action'/>" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="bh" name="bean.bh"></s:hidden>
			<s:hidden id="zfmjjh" name="bean.zfmjjh"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>走访民警：</cps:tdLabel>
					<cps:tdContent width="25%" >
						<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.zfmjxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfmjxm" name="bean.zfmjxm" cssClass="validate[maxSize[15],required] cps-input" ></cps:textfield>
							</c:otherwise>
						</c:choose>
					
								
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>走访时间：</cps:tdLabel>
					<cps:tdContent width="25%">
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }" >
								${bean.zfsj }
							</c:when>
							<c:otherwise>
								<cps:date id="zfsj" name="bean.zfsj" dateFmt="yyyy-MM-dd" value="${bean.zfsj}" cssClass="validate[required] "   ></cps:date>
							
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>走访事由：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.zfsymc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="zfsy" name="bean.zfsy" zdlb="ZFGL_ZFSY" value="${bean.zfsy}" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-input"></cps:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>单位名称：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.zfdwmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdwmc" name="bean.zfdwmc" cssClass="validate[required,maxSize[15]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>法人姓名：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.zfdwfrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdwfrxm" name="bean.zfdwfrxm" cssClass="validate[required,maxSize[6]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%">单位电话：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.zfdwlxdh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdwlxdh" name="bean.zfdwlxdh"  isPhone="true" minlength="7" maxlength="20"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%">走访对象姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.jdrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jdrxm" name="bean.jdrxm"  ></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%">走访对象职务：</cps:tdLabel>
					<cps:tdContent width="25%">
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.jdrzw}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jdrzw" name="bean.jdrzw"  ></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.jdrlxdh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jdrlxdh" name="bean.jdrlxdh" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<%--<cps:tdLabel width="10%"><font color="red">*</font>单位属性：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.dwsxmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="dwsx" name="bean.dwsx" zdlb="ZAGL_DWSX" value="${bean.dwsx}" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-input" ></cps:select>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>--%>
					
					<cps:tdLabel width="10%">单位地址：</cps:tdLabel>
					<cps:tdContent width="25%" colspan="6" >
					<c:choose>
							<c:when test="${operType=='detail' || operType=='update' }">
								<cps:dicText value="${bean.dwszdz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="DWSZDZ" name="bean.dwszdz" ></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
				</cps:row>
					
				<cps:row>
					
					<cps:tdLabel width="10%">走访调查内容：</cps:tdLabel>
					<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail' || operType=='update' }">
									<s:textarea  id="zfdcnr" name="bean.zfdcnr" rows="10" cssStyle="width:93%" readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="zfdcnr" name="bean.zfdcnr" rows="10" cssStyle="width:93%" ></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					
					<cps:tdLabel width="10%">走访调查结果：</cps:tdLabel>
					<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail' || operType=='update' }">
								<s:textarea  id="zfdcjg" name="bean.zfdcjg" rows="5" cssStyle="width:93%" readonly="true" ></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="zfdcjg" name="bean.zfdcjg" rows="5" cssStyle="width:93%" ></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>所属单位：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<s:hidden id="djdwmc" name="bean.djdwmc"></s:hidden>
					<s:hidden id="djdwdm" name="bean.djdwdm"></s:hidden>
					${bean.djdwmc}
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
				<cps:row>			
				<cps:tdContent colspan="6"  cssClass="box_title">&nbsp;&nbsp;&nbsp;警务调查结果</cps:tdContent>		
				</cps:row>	
				<cps:row>
					<cps:tdLabel width="10%">信息真伪</cps:tdLabel>
					<cps:tdContent colspan="5">
					<c:choose>
					    <c:when test="${operType=='detail' }">
							<s:radio list="%{#{'1':'属实','0':'不属实'}}" value="bean.xxsfss" id="xxsfss" name="bean.xxsfss" cssClass="validate[required]" disabled="true"  ></s:radio>					
						</c:when>
						<c:otherwise>
							<s:radio list="%{#{'1':'属实','0':'不属实'}}" value="bean.xxsfss" id="xxsfss" name="bean.xxsfss" cssClass="validate[required]"   ></s:radio>
						</c:otherwise>
					</c:choose>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%">备注</cps:tdLabel>
					<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea  id="dcjgms" name="bean.dcjgms" rows="5" cssStyle="width:93%"  readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="dcjgms" name="bean.dcjgms" rows="5" cssStyle="width:93%"  cssClass="validate[maxSize[400]]"></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>			
					<cps:tdLabel width="10%">调查人：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<s:hidden id="dcrxm" name="bean.dcrxm"></s:hidden>
								${bean.dcrxm }
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>所属单位：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<s:hidden id="dcrdwmc" name="bean.dcrdwmc"></s:hidden>
					${bean.dcrdwmc}
					</cps:tdContent>
					
					<cps:tdLabel width="10%">调查时间：</cps:tdLabel>
					<cps:tdContent width="25%">				
							${bean.djsj}
					</cps:tdContent>
				</cps:row>				
			</cps:table>			
		</form>
	</creator:panel>
</creator:view>