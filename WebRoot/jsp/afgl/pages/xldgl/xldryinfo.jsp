<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="巡防队成员管理">
	<creator:Script src="/jsp/afgl/js/xldryinfo.js"></creator:Script>
	<creator:tbar id="tbar">
	<c:choose>
		<c:when test="${operType != 'detail'}">
			<cps:button value="保&nbsp;存" onclick="submitSaveXldryxx()"></cps:button>
			<cps:button value="重&nbsp;置" onclick="clearForm()"></cps:button>
		</c:when>
	</c:choose>
		<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldglpanel" title="巡逻队成员信息" tbarId="tbar">
		<form id="xldinfoform">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>巡防组织名称：</cps:tdLabel>
					<cps:tdContent width="22%">
						<input value="${xldBean.xldbh }" id="xldbh" name="xldBean.xldbh" type="hidden"/>
							
							<c:if test="${operType == 'detail'||operType == 'update'}">
								&nbsp; ${xldBean.xldmc}
							 </c:if>
							 <c:if test="${operType == 'add' && empty(xldBean.xldbh)}">
								<cps:textfield id="xldmc" name="xldBean.xldmc" cssClass="validate[required] cps-input" readonly="true" ondblclick="openXldSelectWin('${queryBean.xldlx}')" cssStyle="width:63%"></cps:textfield>
								<cps:button value="选择" onclick="openXldSelectWin('${queryBean.xldlx}')"></cps:button>
							 </c:if>
							 <c:if test="${operType == 'add' && xldBean.xldbh!=''}">
							 	 ${xldBean.xldmc}
							 </c:if>
							
					</cps:tdContent>
					<cps:tdLabel width="10%">责任人：</cps:tdLabel>
					<cps:tdContent width="24%">
						<span id="xldzrrxm">${xldBean.xldzrrxm}&nbsp;</span>
					</cps:tdContent>
					<cps:tdLabel width="10%">所属单位：</cps:tdLabel>
					<cps:tdContent>
						 <span id="ssdwmc">${xldBean.ssdwmc}&nbsp;</span>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		<form id="xldyform" name="xldyform" action="<c:url value='/afgl/xldxx/saveXldyxx.action'/>" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="xldybh" name="xldRyxxBean.xldybh"></s:hidden>
			<input type="hidden"  name="xldRyxxBean.xldbh" value="${xldBean.xldbh}">
			<input type="hidden" id="xldbh_ry" name="xldbh" value="${xldBean.xldbh}">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="6"><hr style="height: 3px;"/></cps:tdContent>
				</cps:row>
				<cps:row >
					<cps:tdLabel width="12%"><font color="red">*</font>身份证号：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldRyxxBean.xldysfzh}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldysfzh" name="xldRyxxBean.xldysfzh" onblur="queryRkBean(this.value,setxlddyxx);" cssClass="validate[required,maxSize[18],funcCall[checkIDC]] cps-input" maxlength="50"  ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>姓名：</cps:tdLabel>
					<cps:tdContent width="24%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldRyxxBean.xldyxm}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldyxm" name="xldRyxxBean.xldyxm" value="${xldRyxxBean.xldyxm}" cssClass="validate[required] cps-input" appendPopuBtn="true" onclick="openSelectMjWin('${loginInfo.rootOrgCode}')"  ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="13%">性别：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText zdlb="GB_XB" dm="${xldRyxxBean.xldyxb}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="xldyxb" name="xldRyxxBean.xldyxb" zdlb="GB_XB" cssClass="cps-input" headerKey="" headerValue=" "></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>出生日期：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldRyxxBean.xldycsrq}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldycsrq" name="xldRyxxBean.xldycsrq"  readonly="true" cssClass="validate[required] cps-input" value="${xldRyxxBean.xldycsrq}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${ xldRyxxBean.xldylxdh}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldylxdh" name="xldRyxxBean.xldylxdh" value="${xldRyxxBean.xldylxdh}" minlength="7" isPhone="true" maxlength="20"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>是否复退军转人员：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'1':'是','0':'否'}" id="sfftjzry" name="xldRyxxBean.sfftjzry" required="true" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>户籍地详址：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.xldyhjdxz}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textfield id="xldyhjdxz" name="xldRyxxBean.xldyhjdxz"  maxlength="60" cssClass="cps-input" required="true"></s:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>家庭住地：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.xldyxzdxz}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldyxzdxz" name="xldRyxxBean.xldyxzdxz" cssClass="cps-input" maxlength="60" value="${xldRyxxBean.xldyxzdxz}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>行政职务：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xzzw" name="xldRyxxBean.xzzw" maxlength="25"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>保卫职务：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bwzw" name="xldRyxxBean.bwzw" maxlength="25" value="${xldRyxxBean.bwzw}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>职务类别：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="zzhjz" list="#{'1':'专职','2':'兼职'}" name="xldRyxxBean.zzhjz" cssClass="cps-select"></s:select>
					</cps:tdContent>
					<cps:tdLabel>单位电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bwzw" name="xldRyxxBean.dwdh" maxlength="25" value="${xldRyxxBean.dwdh}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>参加工作时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.ssdwmc}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:date id="sgrq" name="xldRyxxBean.sgrq" readOnly="true" cssClass="validate[required] cps-input" value="${xldRyxxBean.sgrq}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>在岗状态：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								<cps:dicText zdlb="AF_ZGZT" dm="${xldRyxxBean.zgzt}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="zgzt" name="xldRyxxBean.zgzt" zdlb="AF_ZGZT" value="${xldRyxxBean.zgzt}" cssClass="cps-input"></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">离岗时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.tcrq}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:date id="tcrq" name="xldRyxxBean.tcrq" readOnly="true" value="${xldRyxxBean.tcrq}" dateFmt="yyyy-MM-dd"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>登记人姓名：</cps:tdLabel>
					<cps:tdContent>
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
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
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
							<c:otherwise>
								<cps:date id="djsj" name="xldRyxxBean.djsj" value="${xldRyxxBean.djsj}" readOnly="true" ></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>有何特长：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.tc}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="tc" name="xldRyxxBean.tc" value="${xldRyxxBean.tc}" type="textarea" cssStyle="height:50px;width:97%"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>奖励情况：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.jlqk}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="jlqk" name="xldRyxxBean.jlqk" value="${xldRyxxBean.jlqk}" type="textarea" cssStyle="height:50px;width:97%"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>个人简历：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.grjl}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield type="textarea" id="grjl" name="xldRyxxBean.grjl" value="${xldRyxxBean.grjl}" cssStyle="height:50px;width:97%"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>家庭成员：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldRyxxBean.jtcy}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield type="textarea" id="jtcy" name="xldRyxxBean.jtcy" value="${xldRyxxBean.jtcy}" cssStyle="height:50px;width:97%"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<cps:tableGrid id="xldyquerylist" 
				mutilSelect="false"
				autoload="true"
				click="rowSetFormValue"
				url="/afgl/xldxx/queryXldryListByXldbh.action" 
				searchform="xldinfoform" width="99.8%" title="巡逻队员列表">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="xldysfzh" title="身份证号"></cps:column>
		<cps:column field="xldyxm" title="姓名"></cps:column>
		<cps:column field="xldyxbmc" title="性别"></cps:column>
		<cps:column field="xldyxzdxz" title="家庭住址"></cps:column>
		<cps:column field="sgrq" title="上岗时间"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czrowbackcallfun"></cps:column>
	</cps:tableGrid>
</creator:view>