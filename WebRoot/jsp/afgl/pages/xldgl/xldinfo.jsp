<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="巡逻队管理">
	<creator:Script src="/jsp/afgl/js/xldinfo.js"></creator:Script>
		<creator:tbar id="tbar">
		<c:choose>
				<c:when test="${operType != 'detail'}">
					<cps:button id="savebtn" value="保&nbsp;存" onclick="submitSaveXldxx()"></cps:button>
					<cps:button id="submitbtn" value="确&nbsp;定" onclick="$.closeWindow()" cssStyle="display:none"></cps:button>
					<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</creator:tbar>
		<creator:panel id="xldglpanel" title="巡防队信息维护" tbarId="tbar">
			<form id="xldform" name="xldform" action="<c:url value='/afgl/xldxx/saveXldxx.action'/>" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<input id="xldbh" name="xldBean.xldbh" value="${xldBean.xldbh }" type="hidden"/>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>巡防组织名称：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.xldmc}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textfield id="xldmc" name="xldBean.xldmc" cssClass="validate[required] cps-input" maxlength="60"></s:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>巡防队类型：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.xldlx=='1' ? '专职' : '义务'}巡防队
							</c:when>
							<c:otherwise>
								<s:select list="#{'1' : '专职巡防队','2' : '义务巡防队'}" id="xldlx" name="xldBean.xldlx" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>组建日期：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldBean.xldzrrlxdh}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:date id="zjsj" name="xldBean.zjsj" dateFmt="yyyy-MM-dd" readOnly="true" cssClass="validate[required]" value="${xldBean.zjsj}"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>组织负责任人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldBean.xldzrrxm }&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldzrrxm" name="xldBean.xldzrrxm" cssClass="validate[required] cps-input" maxlength="50" appendPopuBtn="true" onclick="openSelectZrrInfo('${loginInfo.rootOrgCode}')" ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${operType=='detail'}">
								${xldBean.xldzrrlxdh}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldzzrlxdh" name="xldBean.xldzrrlxdh" value="${xldBean.xldzrrlxdh}" minlength="7" maxlength="100"  cssClass="validate[custom[phone]] cps-input" ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>分管领导：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.ssdwfgld}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="ssdwfgld" name="xldBean.ssdwfgld" cssClass="validate[required] cps-input" appendPopuBtn="true" onclick="openFgdwldrWid('${loginInfo.rootOrgCode}')" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>所属单位：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.ssdwmc}&nbsp;
							</c:when>
							<c:otherwise>
								<s:hidden id="ssdwdm" name="xldBean.ssdwdm"></s:hidden>
								<cps:textfield id="ssdwmc" name="xldBean.ssdwmc" cssClass="validate[required] cps-input" readonly="true" cssStyle="width:94%" appendPopuBtn="true" onclick="openSsdwSelectWin('${loginInfo.rootOrgCode}','ssdwdm','ssdwmc')" ></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">单位联系电话：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.ssdwfgldlxdh}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textfield id="ssdwfgldlxdh" name="xldBean.ssdwfgldlxdh" cssClass="validate[custom[phone]] cps-input" maxLength="20"></s:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<c:if test="${operType != 'add'}">
					<cps:row>
						<cps:tdLabel >撤销标示：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<s:hidden name="xldBean.cxbs" value="1"></s:hidden>
									<cps:select id="cxbs" name="xldBean.cxbs" zdlb="AF_CXBS" cssClass="cps-input" value="1" disabled="true"></cps:select>
								</c:when>
								<c:when test="${operType == 'update'}">
									<cps:select id="cxbs" name="xldBean.cxbs" zdlb="AF_CXBS" cssClass="cps-input" value="${xldBean.cxbs}" onchange="changeCxbs(this.value)"></cps:select>
								</c:when>
								<c:when test="${operType == 'detail'}">
									<cps:dicText zdlb="AF_CXBS" dm="${xldBean.cxbs}"></cps:dicText>
								</c:when>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel >撤销日期：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType == 'add'}">
									<cps:date id="cxsj" name="xldBean.cxsj" dateFmt="yyyy-MM-dd" readOnly="true"  cssClass="cps-input" disabled="true"></cps:date>
								</c:when>
								<c:when test="${operType == 'update'}">
									<cps:date id="cxsj" name="xldBean.cxsj" dateFmt="yyyy-MM-dd HH:mm:ss" readOnly="true" cssClass="cps-input" value="${xldBean.cxsj}"></cps:date>
								</c:when>
								<c:when test="${operType == 'detail'}">
									${xldBean.cxsj}&nbsp;
								</c:when>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>撤销原因：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType != 'detail'}">
									<s:textfield id="cxyy" name="xldBean.cxyy" maxlength="100" cssClass="cps-input"></s:textfield>
								</c:when>
								<c:otherwise>
									${xldBean.cxyy}&nbsp;
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</c:if>
				<cps:row>
					<cps:tdLabel>
						巡逻区域：
					</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.xlqy}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield  id="xlqy" name="xldBean.xlqy" cssStyle="width:97%;height:30px;" maxlength="150" type="textarea"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注说明：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.bz}&nbsp;
							</c:when>
							<c:otherwise>
								<s:textarea id="bz" name="xldBean.bz" rows="3" cssStyle="width:97%;height:30px;" cssClass="validate[maxSize[250]]"></s:textarea>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>登记人姓名：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.djrxm} &nbsp;
							</c:when>
							<c:otherwise>
								<s:hidden id="djrjh" name="xldBean.djrjh"></s:hidden>
								<s:textfield id="djrxm" name="xldBean.djrxm" cssClass="cps-input" readonly="true"></s:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.djdwmc}&nbsp;
							</c:when>
							<c:otherwise>
								<s:hidden id="djdwdm" name="xldBean.djdwdm"></s:hidden>
								<cps:textfield id="djdwmc" name="xldBean.djdwmc"  readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType == 'detail'}">
								${xldBean.djsj}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:date id="djsj" name="xldBean.djsj" value="${xldBean.djsj}" readOnly="true"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</creator:panel>
		<creator:tbar id="tbar2">
			<cps:button id="saveanddjbtn" value="添加队员" onclick="addXldyxx();"></cps:button>
			<cps:button id="referebtn" value="刷新" onclick="$('#xldyquerylist').query('F')"></cps:button>
		</creator:tbar>
		<cps:tableGrid id="xldyquerylist" 
					mutilSelect="false"
					autoload="true"
					tbarId="tbar2"
					url="/afgl/xldxx/queryXldryListByXldbh.action?xldbh=${xldBean.xldbh}"
					width="99.8%" title="巡逻队员列表" pageSize="10">
			      <cps:column isNumber="true" title="序号"></cps:column>
	      <cps:column isCheckbox="true"></cps:column>
	      <cps:column title="操作" rowcallback="fjCallback" align="left" width="100px"></cps:column>       
	      <cps:column field="fjxm" title="姓名"></cps:column>
	      <cps:column field="xbms" title="性别"></cps:column>
	      <cps:column field="sfzh" title="身份证号码"></cps:column>
	      <cps:column field="fjjh" title="辅警编号"></cps:column>
	      <cps:column field="lxfs" title="联系方式"></cps:column>
	      <cps:column field="cyfjsj" title="从事辅警年限"></cps:column>
	      <cps:column field="ssdwmc" title="所属单位" maxlength="15" align="left"></cps:column>
		</cps:tableGrid>
</creator:view>