<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="走访单位登记表">
	<creator:Script src="/jsp/qzgl/js/zfdwdjxx.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/af.js"></creator:Script>
	<creator:tbar  id="zfdwdjxxinfotbar">
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
	<creator:panel id="infopanel" title="走访单位登记表"  tbarId="zfdwdjxxinfotbar">
		<form id="infoform" name="xldyform" action="<c:url value='/qzgl/zfdwdj/updateZfdwdjInfo.action'/>" method="post">
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
							
							<cps:textfield id="zfmjxm" name="bean.zfmjxm" value="${bean.zfmjxm}" cssClass="validate[required]  cps-input"  readonly="true"
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
								<cps:select id="zfsy" name="bean.zfsy" zdlb="ZFGL_ZFSY" value="${bean.zfsy}" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-select" ></cps:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>单位名称：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfdwmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdwmc" name="bean.zfdwmc" cssClass="validate[required,maxSize[15]] cps-input" ></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>法人姓名：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfdwfrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdwfrxm" name="bean.zfdwfrxm" cssClass="validate[required,maxSize[6]] cps-input" ></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%">单位电话：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.zfdwlxdh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zfdwlxdh" name="bean.zfdwlxdh" minlength="7" maxlength="11" isPhone="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel width="10%">走访对象姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.jdrxm}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jdrxm" name="bean.jdrxm" maxlength="15"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%">走访对象职务：</cps:tdLabel>
					<cps:tdContent width="25%">
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.jdrzw}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jdrzw" name="bean.jdrzw" maxlength="500"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
					
					<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.jdrlxdh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="jdrlxdh" name="bean.jdrlxdh"  cssClass="validate[custom[mobile],maxSize[11]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<!--<cps:tdLabel width="10%"><font color="red">*</font>单位属性：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.dwsxmc}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="dwsx" name="bean.dwsx" zdlb="ZAGL_DWSX" value="${bean.dwsx}" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-input" ></cps:select>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>-->
					
					<cps:tdLabel width="10%">单位地址：</cps:tdLabel>
					<cps:tdContent width="25%" colspan="5" >
					<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText value="${bean.dwszdz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="DWSZDZ" name="bean.dwszdz"  cssStyle="width:94%" cssClass="validate[maxSize[60]] cps-input"></cps:textfield>
							</c:otherwise>
						</c:choose>
								
					</cps:tdContent>
				</cps:row>
			
					
				<cps:row>
					
					<cps:tdLabel width="10%">走访调查内容：</cps:tdLabel>
					<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType=='detail'}">
									<s:textarea  id="zfdcnr" name="bean.zfdcnr" rows="10" cssStyle="width:94%" readonly="true"></s:textarea>
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
									<s:textarea  id="zfdcjg" name="bean.zfdcjg" rows="5" cssStyle="width:94%"  readonly="true"></s:textarea>
								</c:when>
								<c:otherwise>
									<s:textarea  id="zfdcjg" name="bean.zfdcjg" rows="5" cssStyle="width:94%" ></s:textarea>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>所属单位：</cps:tdLabel>
					<cps:tdContent width="25%" >
					<s:hidden id="djdwdm" name="bean.djdwdm" ></s:hidden>
					<cps:textfield id="djdwmc" name="bean.djdwmc" value="${bean.djdwmc}" readonly="true"></cps:textfield>
					
					</cps:tdContent>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="25%" >
						<cps:textfield  id="djrxm" name="bean.djrxm" value="${bean.djrxm }" readonly="true"></cps:textfield>
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