<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<creator:view title="小区信息管理">
	<creator:Script src="/jsp/afgl/js/xqxx.js"></creator:Script>
	<creator:Script src="/jsp/afgl/js/af.js"></creator:Script>
	<form id="add_xqxx_form" action="${contextPath}/xqxx/addXqxx.action" method="post">
		<c:if test="${operType != 'detail'}">
		<creator:tbar  id="addxqxxtbar">
			<cps:tdContent colspan="6" align="center">
				<cps:button value="保存" onclick="saveXqxxBean();"></cps:button>
				<cps:button value="关闭" onclick="window.close();"></cps:button>
			</cps:tdContent>
		</creator:tbar>
		</c:if>
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="xqbh" name="xqxxBean.xqbh"></s:hidden>
		<creator:panel id="sqxxgl" title="${operType == 'add' ? '登记小区信息' :  '修改小区信息'}"  tbarId="addxqxxtbar">
			<cps:table>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>所在社区：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<s:hidden id="sssqbh" name="xqxxBean.sssqbh"></s:hidden>
									<cps:textfield id="sssqmc" name="xqxxBean.sssqmc" cssClass="validate[required] cps-input" cssStyle="width:88%" ondblclick="openSqxxSelectWin('sssqbh','sssqmc') " readonly="true"/>
									<cps:button value="选择" onclick="openSqxxSelectWin('sssqbh','sssqmc')"></cps:button>
								</c:when>
								<c:otherwise>
									${xqxxBean.sssqmc}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%"><font color="red">*</font>小区名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="xqmc" name="xqxxBean.xqmc" value="${xqxxBean.xqmc }" cssClass="validate[required] cps-input"  cssStyle="width:80%" maxlength="60"></cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.xqmc}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">小区负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="xqfzrxm" name="xqxxBean.xqfzrxm" cssClass="validate[maxSize[30]] cps-input" maxlength="20" cssStyle="width:80%"  value="${xqxxBean.xqfzrxm }"/>
								</c:when>
								<c:otherwise>
									${xqxxBean.xqfzrxm}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">负责人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="xqfzrlxdh" name="xqxxBean.xqfzrlxdh" minlength="7" value="${xqxxBean.xqfzrlxdh }" maxlength="20" cssClass="validate[custom[phone]] cps-input"  cssStyle="width:80%"></cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.xqfzrlxdh}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%"><font color="red">*</font>小区地址：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="xqdz" name="xqxxBean.xqdz"  cssStyle="width:80%"  value="${xqxxBean.xqdz }" maxlength="150" required="true" ></cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.xqdz}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">物业公司：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="wygsmc" name="xqxxBean.wygsmc"  cssClass="validate[maxSize[60]] cps-input" cssStyle="width:80%"  value="${xqxxBean.wygsmc }">
									</cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.wygsmc }
								</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="wygsfzr" name="xqxxBean.wygsfzr" cssClass="validate[maxSize[20]] cps-input" cssStyle="width:80%"  value="${xqxxBean.wygsfzr }">
									</cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.wygsfzr }
								</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="wygsfzrlxdh" name="xqxxBean.wygsfzrlxdh"  value="${xqxxBean.wygsfzrlxdh }" cssClass="validate[custom[phone] maxSize[20]] cps-input"  cssStyle="width:80%"></cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.wygsfzrlxdh}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">大门数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="dms" name="xqxxBean.dms" inputType="integer" value="${xqxxBean.dms }" maxlength="3" cssClass="validate[number] cps-input"  cssStyle="width:80%" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" ></cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.dms}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">楼栋数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="lds" name="xqxxBean.lds" inputType="integer" cssStyle="width:80%" maxlength="3" value="${xqxxBean.lds }" cssClass="validate[number] cps-input" />
								</c:when>
								<c:otherwise>
									${xqxxBean.lds}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">小区面积(㎡)：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="xqmj" name="xqxxBean.xqmj" inputType="number" cssStyle="width:80%" value="${xqxxBean.xqmj }" cssClass="validate[number] cps-input" />
								</c:when>
								<c:otherwise>
									${xqxxBean.xqmj}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">建立日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							 <c:choose>
								<c:when test="${operType != 'detail'}">
									 <cps:date id="jlrq" name="xqxxBean.jlrq" dateFmt="yyyy-MM-dd" cssStyle="width:80%" defaultSystemDate="true"></cps:date>
								</c:when>
								<c:otherwise>
									${xqxxBean.jlrq}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">管理类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:select zdlb="AFGL_GLLX" id="gllx" name="xqxxBean.gllx" cssStyle="width:80%" value="${xqxxBean.gllx}" headerKey="" headerValue="---选择--"></cps:select>
								</c:when>
								<c:otherwise>
									<cps:dicText zdlb="AF_GLMS" dm="${xqxxBean.gllxmc}"></cps:dicText>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">管理模式：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:select id="glms" name="xqxxBean.glms"  cssStyle="width:80%"  cssClass="cps-select" value="${xqxxBean.glms }" zdlb="AF_GLMS" headerKey="" headerValue="---选择--">
									</cps:select>
								</c:when>
								<c:otherwise>
									<cps:dicText zdlb="AF_GLMS" dm="${xqxxBean.glms}"></cps:dicText>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">注消标识：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							 <c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:select zdlb="ZXBS" id="cxbs" name="xqxxBean.cxbs" value="${xqxxBean.cxrq != null && xqxxBean.cxrq != '' ? xqxxBean.cxrq : '1'}" cssStyle="width:80%" onchange="setZxsj(this.value)"></cps:select>
								</c:when>
								<c:otherwise>
									<cps:dicText zdlb="ZXBS" dm="${xqxxBean.cxbs}"></cps:dicText>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">注消日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:date id="cxrq" name="xqxxBean.cxrq" dateFmt="yyyy-MM-dd" value="${xqxxBean.cxrq}" cssStyle="width:80%" defaultSystemDate="false"></cps:date>
								</c:when>
								<c:otherwise>
									${xqxxBean.cxrq}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">注消原因：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="cxyy" name="xqxxBean.cxyy" value="${xqxxBean.cxyy}" cssStyle="width:80%"></cps:textfield>
								</c:when>
								<c:otherwise>
									${xqxxBean.cxyy}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="djrxm" name="xqxxBean.djrxm" value="${xqxxBean.djrxm !=null && xqxxBean.djrxm !='' ? xqxxBean.djrxm : loginInfo.realname}" readonly="true" cssStyle="width:80%" cssClass="cps-input"></cps:textfield>
									<input type="hidden" id="djrjh" name="xqxxBean.djrjh" value="${xqxxBean.djrjh !=null && xqxxBean.djrjh !='' ? xqxxBean.djrjh : loginInfo.username }" />
								</c:when>
								<c:otherwise>
									${xqxxBean.djrxm}
								</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:date id="djsj" name="xqxxBean.djsj" value="${xqxxBean.djsj !=null && xqxxBean.djsj !='' ? xqxxBean.djsj : xqxxBean.djsj}" cssStyle="width:80%" maxDate="${currentSystemDate}" cssClass="cps-input" dateFmt="yyyy-MM-dd HH:mm:ss" readOnly="true" defaultSystemDate="${xqxxBean.djsj == null || xqxxBean.djsj == '' ? true : false}"></cps:date>
								</c:when>
								<c:otherwise>
									${xqxxBean.djsj}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<cps:textfield id="djdwmc" name="xqxxBean.djdwmc" cssStyle="width:80%" cssClass="cps-input" value="${xqxxBean.djdwmc !=null && xqxxBean.djdwmc !='' ? xqxxBean.djdwmc : loginInfo.orgname }" readonly="true"></cps:textfield>
									<input id="djdwdm" name="xqxxBean.djdwdm" type="hidden" value="${xqxxBean.djdwdm !=null && xqxxBean.djdwdm !='' ? xqxxBean.djdwdm : loginInfo.orgcode }" />
								</c:when>
								<c:otherwise>
									${xqxxBean.djdwmc}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
				</cps:table>
		</creator:panel>
	</form>
</creator:view>