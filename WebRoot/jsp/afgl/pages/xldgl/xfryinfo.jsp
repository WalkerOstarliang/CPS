<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="巡防人员管理">
	<creator:Script src="/jsp/afgl/js/xldryinfo.js"></creator:Script>
		<creator:tbar id="tbar">
		<c:choose>
				<c:when test="${operType != 'detail'}">
					<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSaveXfryxx()"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</creator:tbar>
	
		<creator:panel id="xldglpanel" title="巡防人员信息" tbarId="tbar">
			<form id="xfryform" name="xfryform" action="<c:url value='/afgl/xldxx/saveXfryxx.action'/>" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="xfrybh" name="xldRyxxBean.xldybh"></s:hidden>
			<c:choose>
				<c:when test="${operType=='add'}">
				<font color="red">&nbsp;&nbsp;&nbsp;先填写身份证号</font>
				</c:when>
			</c:choose>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>身份证号码：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.xldysfzh}&nbsp;
							</c:when>
							<c:when test="${operType == 'add'}">
								<cps:textfield id="xldysfzh" name="xldRyxxBean.xldysfzh" value="${xldRyxxBean.xldysfzh}" onblur="selectXfryBySfzh(this.value)" isSfzh="true" required="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldysfzh" name="xldRyxxBean.xldysfzh" value="${xldRyxxBean.xldysfzh}" cssClass="validate[required] cps-input" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="10%"><font color="red">*</font>户籍详址：</cps:tdLabel>
					<cps:tdContent width="25%" colspan="3">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldRyxxBean.xldyhjdxz}&nbsp;
							</c:when>
							<c:when test="${operType == 'add'}">
								<cps:textfield id="xldyhjdxz" name="xldRyxxBean.xldyhjdxz" value="${xldRyxxBean.xldyhjdxz}" minlength="7" maxlength="120"  readonly="true" cssStyle="width:93.5%"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldyhjdxz" name="xldRyxxBean.xldyhjdxz" value="${xldRyxxBean.xldyhjdxz}" minlength="7" maxlength="110"  readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>巡防员姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldRyxxBean.xldyxm }&nbsp;
							</c:when>
							<c:when test="${operType=='add'}">
								<cps:textfield id="xldyxm" name="xldRyxxBean.xldyxm"  maxlength="10"  readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldyxm" name="xldRyxxBean.xldyxm" required="true" maxlength="10" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="5%" align="left"><font color="red">*</font>性别：</cps:tdLabel>
					<cps:tdContent width="5%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldRyxxBean.xldyxb}&nbsp;
							</c:when>
							<c:when test="${operType=='add'}">
								<cps:select id="xldyxb" name="xldRyxxBean.xldyxb" zdlb="GB_XB" value="${xldRyxxBean.xldyxb}"  disabled="true"></cps:select>
							</c:when>
							<c:otherwise>
								<cps:select id="xldyxb" name="xldRyxxBean.xldyxb" zdlb="GB_XB" value="${xldRyxxBean.xldyxb}"  disabled="true"></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.xldylxdh}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textfield id="xldylxdh" name="xldRyxxBean.xldylxdh" cssClass="validate[custom[phone]] cps-input" maxLength="20"></s:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >现住详址：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.xldyxzdxz}&nbsp;
							</c:when>
							<c:when test="${operType == 'add'}">
								<cps:textfield id="xldyxzdxz" name="xldRyxxBean.xldyxzdxz" cssStyle="width:98%"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldyxzdxz" name="xldRyxxBean.xldyxzdxz" cssStyle="width:98%"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
					<cps:row>
						<cps:tdLabel >在岗状态：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'detail'}">
								${xldRyxxBean.zgztmc}&nbsp;
							</c:when>
							<c:when test="${operType == 'add'}">
								<cps:select id="zgzt" name="xldRyxxBean.zgzt"  zdlb="AF_ZGZT" value="${xldRyxxBean.zgzt}" headerKey="" headerValue=" " cssClass="cps-input" disabled="true"></cps:select>
							</c:when>
							<c:otherwise>
								<cps:select id="zgzt" name="xldRyxxBean.zgzt" zdlb="AF_ZGZT" value="${xldRyxxBean.zgzt}" headerKey="" headerValue=" " cssClass="cps-input" disabled="true"></cps:select>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel >上岗日期：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'detail'}">
									${xldRyxxBean.sgrq}&nbsp;
								</c:when>
								<c:when test="${operType == 'add'}">
									<cps:date id="sgrq" name="xldRyxxBean.sgrq" value="${xldRyxxBean.sgrq}" readOnly="true" dateFmt="yyyy-MM-dd"></cps:date>
								</c:when>
							<c:otherwise>
								<cps:date id="sgrq" name="xldRyxxBean.sgrq" required="true" value="${xldRyxxBean.sgrq}" readOnly="true" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>退出日期：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'detail'}">
									${xldRyxxBean.tcrq}&nbsp;
								</c:when>
								<c:when test="${operType == 'add'}">
									<cps:textfield id="tcrq" name="xldRyxxBean.tcrq" maxlength="100" cssClass="cps-input" readonly="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									${xldRyxxBean.tcrq}&nbsp;
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
		
				<cps:row>
					<cps:tdLabel>登记人姓名：</cps:tdLabel>
					<cps:tdContent width="5%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.djrxm} &nbsp;
							</c:when>
							<c:otherwise>
								<s:hidden id="djrjh" name="xldRyxxBean.djrjh"></s:hidden>
								<s:textfield id="djrxm" name="xldRyxxBean.djrxm" cssClass="cps-input" readonly="true"></s:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel >登记单位：</cps:tdLabel>
					<cps:tdContent width="20%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.djdwmc}&nbsp;
							</c:when>
							<c:otherwise>
								<s:hidden id="djdwdm" name="xldRyxxBean.djdwdm"></s:hidden>
								<cps:textfield id="djdwmc" name="xldRyxxBean.djdwmc"  readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.djsj}&nbsp;
							</c:when>
							<c:when test="${operType == 'add'}">
								<cps:textfield id="djsj" name="xldRyxxBean.djsj" value="${xldRyxxBean.djsj}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="gxsj" name="xldRyxxBean.gxsj" value="${xldRyxxBean.gxsj}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>备注说明：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.bz}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textarea id="bz" name="xldRyxxBean.bz" rows="3" cssStyle="width:96.5%;height:50px;" cssClass="validate[maxSize[250]]"></s:textarea>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</creator:panel>
</creator:view>