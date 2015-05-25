<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="居/村委会管理">
	<creator:Script src="/jsp/afgl/js/jwhinfo.js"></creator:Script>
	<creator:tbar id="jwhinfotab">
		<c:choose>
			<c:when test="${operType != 'detail'}">
				<cps:button id="saveanddjbtn" value="保存并登记干部信息" onclick="saveAndSaveDjRyxx()"></cps:button>
				<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSave()"></cps:button>
				<cps:button id="submitbtn" value="确&nbsp;定" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
			</c:when>
		</c:choose>
		<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldglpanel" title="居/村委会"  tbarId="jwhinfotab">
		<form id="infoform" name="infoform" action="<c:url value='/afgl/jwhgl/saveJwhxxBean.action'/>" method="post">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="jwhbh" name="bean.jwhbh"></s:hidden>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%"><font color="red">*</font>居/村委会名称：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${operType == 'detail'}">
							<cps:dicText value="${bean.jwhmc}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<s:textfield id="jwhmc" name="bean.jwhmc" cssClass="validate[required,maxSize[60]] cps-input" ></s:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>类型：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:dicText zdlb="JWHLX" dm="${bean.jwhlx}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<cps:select id="jwhlx" name="bean.jwhlx" zdlb="JWHLX" value="${bean.jwhlx}" headerKey="" headerValue="--请选择--"  cssClass="validate[required] cps-select"></cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>创建日期：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:dicText value="${bean.cjrq}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<cps:date id="cjrq" name="bean.cjrq" dateFmt="yyyy-MM-dd" readOnly="true" cssClass="cps-input" value="${bean.cjrq}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel >居/村委会负责人：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:dicText value="${bean.jwhfzrxm}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<cps:textfield id="jwhfzrxm" name="bean.jwhfzrxm" maxlength="15"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel >联系电话：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:dicText value="${bean.jwhfzrlxdh}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<cps:textfield id="jwhfzrlxdh" name="bean.jwhfzrlxdh" value="${bean.jwhfzrlxdh}" minlength="7" cssClass="validate[custom[phone]] cps-input" maxlength="20" cssStyle="width:87%" ></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>所在社区：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:dicText value="${bean.sssqmc}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<s:hidden id="sssqbh" name="bean.sssqbh"></s:hidden>
							<cps:textfield id="sssqmc" name="bean.sssqmc" cssClass="validate[required] cps-input" readonly="true" ondblclick="openSqxxSelectWin(setSqxxToPage)"></cps:textfield>
							<cps:button value="选择" onclick="openSqxxSelectWin(setSqxxToPage)"></cps:button>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>所在县/区：</cps:tdLabel>
				<cps:tdContent colspan="3">
					<c:choose>
						<c:when test="${operType=='detail'}">
							<cps:dicText value="${bean.ssxzqh}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<s:hidden id="ssxzqhdm" name="bean.ssxzqh"></s:hidden>
							<cps:textfield id="ssxzqhmc" name="ssxzqhmc" cssClass="cps-select" readonly="true" value="${bean.ssxzqhmc}" cssStyle="width:74%" ondblclick="openXzqhSelectTree('${loginInfo.rootOrgCode}',setSqXzqh)"></cps:textfield>
							<cps:button value="选择" onclick="openXzqhSelectTree('${loginInfo.rootOrgCode}',setSqXzqh)"></cps:button>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>所属街道/乡镇：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${operType == 'detail'}">
							<cps:dicText zdlb="HN_XZQH" dm="${bean.ssjdxz}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="ssjdxzhidden" value="${bean.ssjdxz}">
							<s:select list="xzjdqhList" id="ssjdxz" name="bean.ssjdxz" listKey="dm" listValue="jc" cssClass="cps-select" headerKey="" headerValue="--请选择--"></s:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>街道/乡镇负责人：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType == 'detail'}">
							<cps:dicText value="${bean.ssjdxzfzrxm}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<cps:textfield id="ssjdxzfzrxm" name="bean.ssjdxzfzrxm" maxlength="15"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>联系电话：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType == 'detail'}">
							<cps:dicText value="${bean.ssjdfzrlxdh}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<cps:textfield id="ssjdfzrlxdh" name="bean.ssjdfzrlxdh" minlength="7" cssClass="validate[custom[phone]]"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>居/村委会地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<c:choose>
						<c:when test="${operType == 'detail'}">
							<cps:dicText value="${bean.jwhdz}"></cps:dicText>
						</c:when>
						<c:otherwise>
							<cps:textfield id="jwhdz" name="bean.jwhdz" cssStyle="width:93%" maxlength="150"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
			<c:if test="${operType != 'add'}">
				 <cps:row>
					<cps:tdLabel>注销标识：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								<cps:dicText zdlb="ZXBS" dm="${bean.zxbs}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="zxbs" name="bean.zxbs" zdlb="ZXBS" value="${bean.zxbs}" cssClass="cps-input" onchange="setZxsj(this.value)"></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>注销时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								<cps:dicText value="${bean.zxsj}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:date id="zxsj" name="bean.zxsj" dateFmt="yyyy-MM-dd HH:mm:ss" value="${bean.zxsj}" maxDate="${currentSystemDate}"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>注销原因：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								<cps:dicText value="${bean.zxyy}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:textfield id="zxyy" name="bean.zxyy" value="${bean.zxyy}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</c:if>
			<cps:row>
				<cps:tdLabel>登记人姓名：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType == 'detail'}">
							${bean.djrxm} &nbsp;
						</c:when>
						<c:otherwise>
							<s:hidden id="djrjh" name="bean.djrjh"></s:hidden>
							<s:textfield id="djrxm" name="bean.djrxm" cssClass="cps-input" readonly="true"></s:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType == 'detail'}">
							${bean.djdwmc}&nbsp;
						</c:when>
						<c:otherwise>
							<s:hidden id="djdwdm" name="bean.djdwdm"></s:hidden>
							<cps:textfield id="djdwmc" name="bean.djdwmc"  readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${operType == 'detail'}">
							${bean.djsj}&nbsp;
						</c:when>
						<c:otherwise>
							<cps:textfield id="djsj" name="bean.djsj" value="${bean.djsj}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
		</form>
	</creator:panel>
</creator:view>