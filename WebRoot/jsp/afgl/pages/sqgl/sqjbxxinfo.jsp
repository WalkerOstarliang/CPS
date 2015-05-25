<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="社区管理">
	<creator:Script src="/jsp/afgl/js/sqjbxxinfo.js"></creator:Script>
	<creator:tbar  id="sqjbxxtab">
						<c:choose>
							<c:when test="${operType != 'detail'}">
								<cps:button value="保&nbsp;存" onclick="submitSave()"></cps:button>
								<%--<cps:button value="重&nbsp;置" type="reset"></cps:button>--%>
							</c:when>
						</c:choose>
						<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</creator:tbar>
	<creator:panel id="infopanel" title="社区基本信息"  tbarId="sqjbxxtab">
		<form id="infoform" name="xldyform" action="<c:url value='/afgl/sqjbgl/saveSqJbxxBean.action'/>" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>社区名称：</cps:tdLabel>
					<cps:tdContent width="25%" colspan="3">
						<s:hidden id="sqbh" name="sqBean.sqbh"></s:hidden>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${sqBean.sqmc}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="sqmc" name="sqBean.sqmc" cssClass="validate[required] cps-input" cssStyle="width:88%" maxlength="125"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>社区类型：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								<cps:dicText zdlb="SQLX" dm="${sqBean.sqlx}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<cps:select id="sqlx" name="sqBean.sqlx" zdlb="SQLX" value="${sqBean.sqlx}" headerKey="" headerValue="--请选择--" cssClass="validate[required] cps-select"></cps:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel ><font color="red">*</font>街道乡镇：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								<cps:dicText zdlb="HN_XZQH" dm="${sqBean.ssjdxz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<s:select list="xqxzqhList" id="ssxzqh" name="sqBean.ssxzqh" listKey="id" listValue="name" cssStyle="width:70%" cssClass="validate[required] cps-select"  headerKey="" headerValue="--县区-" onchange="setSqXzqh(this.value)"></s:select>
							</c:otherwise>
						</c:choose>
						<%--行政区划 县
						<c:choose>
							<c:when test="${operType == 'detail'}">
								<cps:dicText zdlb="GB_XZQH" dm="${sqBean.ssxzqh}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<s:select list="xqxzqhList" id="ssxzqh" name="sqBean.ssxzqh" listKey="id" listValue="name" cssStyle="width:95%" cssClass="validate[required] cps-select"  headerKey="" headerValue="--请选择--" onchange="setSqXzqh(this.value)"></s:select>
								<s:hidden id="ssxzqh" name="sqBean.ssxzqh"></s:hidden>
								<cps:textfield id="ssxzqhmc" name="sqBean.ssxzqhmc" value="${sqBean.ssxzqhmc}" cssStyle="width:19%" ></cps:textfield>
							</c:otherwise>
						</c:choose>
						--%>
						<%--街道乡镇
						<c:choose>
							<c:when test="${operType=='detail'}">
								<cps:dicText zdlb="HN_XZQH" dm="${sqBean.ssjdxz}"></cps:dicText>
							</c:when>
							<c:otherwise>
								<input type="hidden" id="ssjdxzhidden" name="ssjdxz" value="${sqBean.ssjdxz}">
								<s:select list="xzjdqhList" id="ssjdxz" name="sqBean.ssjdxz" listKey="dm" listValue="jc" cssStyle="width:95%" cssClass="validate[required] cps-select" headerKey="" headerValue="--请选择--"></s:select>
							</c:otherwise>
						</c:choose>
						 --%>
					</cps:tdContent>
					<cps:tdContent colspan="4">
						<c:choose>
							<c:when test="${operType=='detail'}">
							</c:when>
							<c:otherwise>
								<input type="hidden" id="ssjdxzhidden" name="ssjdxz" value="${sqBean.ssjdxz}">
								<s:select list="xzjdqhList" id="ssjdxz" name="sqBean.ssjdxz" listKey="dm" listValue="jc" cssStyle="width:29%" cssClass="validate[required] cps-select" headerKey="" headerValue="--街道乡镇--"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>所属派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${sqBean.sspcsmc}&nbsp;
							</c:when>
							<c:otherwise>
								<s:hidden id="sspcsdm" name="sqBean.sspcsdm"></s:hidden>
								<cps:textfield id="sspcsmc" name="sqBean.sspcsmc" maxlength="60" cssClass="validate[required] cps-input" cssStyle="width:70%" ondblclick="openSelectPcsWin()"  readonly="true"></cps:textfield>
								<cps:button value="选择" onclick="openSelectPcsWin()"></cps:button>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="9%">社区警务区：</cps:tdLabel>
					<cps:tdContent width="23%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${sqBean.gxsqjwsmc}&nbsp;
							</c:when>
							<c:otherwise>
								<s:hidden id="gxsqjwsdm" name="sqBean.gxsqjwsdm"></s:hidden>
								<cps:textfield id="gxsqjwsmc" name="sqBean.gxsqjwsmc" cssClass="cps-input"  ondblclick="openSelectSqjwsWin()"  readonly="true"></cps:textfield>
								<cps:button value="选择" onclick="openSelectSqjwsWin()"></cps:button>
								
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="8%">社区民警：</cps:tdLabel>
					<cps:tdContent >
						<c:choose>
							<c:when test="${operType=='detail'}">
								${sqBean.sqmjxm}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="sqmjxm" name="sqBean.sqmjxm" value="${sqBean.sqmjxm}" cssClass="cps-input"   readonly="true"  ></cps:textfield>
								<%--<cps:button value="选择" onclick="openSelectSqmjSelectWin()"></cps:button>--%>
								
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>负责人：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								${sqBean.jdxzfzr}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textfield id="jdxzfzr" name="sqBean.jdxzfzr" cssClass="cps-input" cssStyle="width:70%" maxlength="15"></s:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${sqBean.jdxzfzrdh}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textfield id="jdxzfzrdh" name="sqBean.jdxzfzrdh" cssClass="validate[custom[phone]] cps-input" minlength="7" cssStyle="width:86%"  maxlength="15"></s:textfield>
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
									<cps:dicText zdlb="ZXBS" dm="${sqBean.zxbs}"></cps:dicText>
								</c:when>
								<c:otherwise>
									<cps:select id="zxbs" name="sqBean.zxbs" zdlb="ZXBS" value="${sqBean.zxbs}"  cssClass="cps-select" onchange="setZxsj(this.value)"></cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>注销时间：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'detail'}">
									${sqBean.zxsj}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:date id="zxsj" name="sqBean.zxsj" dateFmt="yyyy-MM-dd HH:mm:ss" value="${sqBean.zxsj}" maxDate="${currentSystemDate}"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>注销原因：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'detail'}">
									${sqBean.zxyy}&nbsp;
								</c:when>
								<c:otherwise>
									<cps:textfield id="zxyy" name="sqBean.zxyy" value="${sqBean.zxyy}"></cps:textfield>
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
								${sqBean.djrxm} &nbsp;
							</c:when>
							<c:otherwise>
								<input type="hidden" name="sqBean.djrjh" value="${loginInfo.username}"/>
								<cps:textfield id="djrxm" name="sqBean.djrxm" value="${loginInfo.realname}" cssClass="cps-input" readonly="true" cssStyle="width:70%"  ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${sqBean.djdwmc}&nbsp;
							</c:when>
							<c:otherwise>
								<input type="hidden" name="sqBean.djdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="djdwmc" name="sqBean.djdwmc"  value="${loginInfo.orgname}" readonly="true"></cps:textfield>
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
								<cps:date id="djsj" name="sqBean.djsj" value="${sqBean.djsj}" readOnly="true"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				
			</cps:table>
		</form>
	</creator:panel>
</creator:view>