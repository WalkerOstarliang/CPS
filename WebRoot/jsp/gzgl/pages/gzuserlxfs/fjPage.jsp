<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/gzgl/js/userlxfs.js"></creator:Script>
	<c:if test="${operType!='detail'}">
		<creator:tbar id="lxfsbar">
			<cps:button value="保&nbsp;存" onclick="saveFjBean();"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</creator:tbar>
	</c:if>
	<creator:panel id="fjPanel" title="${fjBean.fjlbms}基本信息" tbarId="lxfsbar">
			<form id="fjForm">
				<input type="hidden" id="id" name="fjBean.id" value="${fjBean.id}"/>
				<input type="hidden" id="xldbh" name="fjBean.xldbh" value="${fjBean.xldbh }"/>
				<cps:table>
					<cps:row>
						<cps:tdContent width="85%" valign="top">	
							<cps:table>
								<cps:row>
									<cps:tdLabel  width="10%"><font color="red">*</font>身份证号码：</cps:tdLabel>
									<cps:tdContent  width="20%">
										<c:if test="${operType=='add'}">
											<cps:textfield id="sfzh" name="fjBean.sfzh" value="${fjBean.sfzh}" onblur="loadRkxxBean(this.value)" isSfzh="true"  required="true"></cps:textfield>
										</c:if>
										<c:if test="${operType!='add'}">
											<cps:textfield id="sfzh" name="fjBean.sfzh" value="${fjBean.sfzh}" readonly="true" isSfzh="true"  required="true"></cps:textfield>
										</c:if>
									</cps:tdContent>
									<cps:tdLabel width="10%"><font color="red">*</font>姓名：</cps:tdLabel>
									<cps:tdContent width="20%">
										<cps:textfield id="fjxm" name="fjBean.fjxm" value="${fjBean.fjxm}"></cps:textfield>
									</cps:tdContent>
								</cps:row>
								<cps:row>
									<cps:tdLabel><font color="red">*</font>户籍地：</cps:tdLabel>
									<cps:tdContent  >
										<cps:textfield required="true" id="hjd" name="fjBean.hjd" value="${fjBean.hjd}" maxlength="100"  ></cps:textfield>
									</cps:tdContent>
									<cps:tdLabel><font color="red">*</font>民族：</cps:tdLabel>
									<cps:tdContent>
										<cps:select required="true" id="mz" name="fjBean.mz" value="${fjBean.mz}"  headerKey="" headerValue=" " zdlb="GB_MZ"></cps:select>
									</cps:tdContent>
								</cps:row>
								<cps:row>
									<cps:tdLabel><font color="red">*</font>文化程度：</cps:tdLabel>
									<cps:tdContent>
										<cps:select required="true" id="whcd" name="fjBean.whcd" value="${fjBean.whcd}" headerKey="" headerValue=" " zdlb="GB_WHCD"></cps:select>
									</cps:tdContent>
									<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
									<cps:tdContent>
									
										<cps:select  required="true" id="xb" name="fjBean.xb" value="${fjBean.xb}" zdlb="GB_XB" headerKey="" headerValue=" "></cps:select>
									</cps:tdContent>
								</cps:row>
								<cps:row>
									<cps:tdLabel ><font color="red">*</font>联系方式：</cps:tdLabel>	
									<cps:tdContent  > 
										<cps:textfield required="true" id="lxfs" name="fjBean.lxfs" value="${fjBean.lxfs}" cssClass="validate[custom[mobile],maxSize[11]]"></cps:textfield>	
									</cps:tdContent>
									<cps:tdLabel><font color="red">*</font>从事辅警年限(年)：</cps:tdLabel>
									<cps:tdContent>
										<cps:textfield  required="true" id="cyfjsj" name="fjBean.cyfjsj" value="${fjBean.cyfjsj}"  inputType="number" maxlength="3"></cps:textfield>
									</cps:tdContent>
									
								</cps:row>
								<cps:row>
									<cps:tdLabel><font color="red">*</font>辅警编号：</cps:tdLabel>	
									<cps:tdContent> 
										<c:choose>
											<c:when test="${'3' eq fjBean.fjlb}">
												<cps:textfield id="fjjh" name="fjBean.fjjh" value="${fjBean.fjjh}" required="true"  maxlength="10"></cps:textfield>
											</c:when>
											<c:otherwise>
												<cps:textfield id="fjjh" name="fjBean.fjjh" value="${fjBean.fjjh}" required="true" readonly="true" maxlength="10"></cps:textfield>
											</c:otherwise>
										</c:choose>									
									</cps:tdContent>
									<cps:tdLabel><font color="red">*</font>辅助人员类别：</cps:tdLabel>	
									<cps:tdContent>
										<input id ="fjlb" name="fjBean.fjlb" value="${fjBean.fjlb}" type="hidden"/>
										<cps:select id="fjlb" zdlb="ZDY_FJLB" value="${fjBean.fjlb}" disabled="true"></cps:select>
									</cps:tdContent>
								</cps:row>
								<cps:row>
									<cps:tdLabel>现住址：</cps:tdLabel>
									<cps:tdContent colspan="3">
										<cps:textfield  id="xzz" name="fjBean.xzz" value="${fjBean.xzz}" maxlength="50" cssStyle="width:95%"></cps:textfield>
									</cps:tdContent>
								</cps:row>
							</cps:table>
						</cps:tdContent>
						<cps:tdContent>
							<div>
								<div style="text-align: center;">
									 <img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${fjBean.sfzh}" width="120px" height="130px" />
								</div>
							</div> 
						</cps:tdContent>
					</cps:row>
				</cps:table>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>工作岗位：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select required="true"  id="gzgw" name="fjBean.gzgw" parentDm="${fjBean.fjlb}" value="${fjBean.gzgw}" zdlb = "ZDY_LKXGYGW" headerKey="" headerValue=" " ></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%"><font color="red">*</font>是否财政保障：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select required="true" id="sfczbz" name="fjBean.sfczbz" value="${fjBean.sfczbz}" headerKey="" headerValue=" " zdlb="ZDY_ZDSF"></cps:select>
						</cps:tdContent >
						<cps:tdLabel width="12%"><font color="red">*</font>是否公安管理使用考核：</cps:tdLabel>
						<cps:tdContent>
							<cps:select  id="sfgajgglsykh" name="fjBean.sfgajgglsykh" value="${fjBean.sfgajgglsykh}" headerKey="" headerValue=" " zdlb="ZDY_ZDSF" required="true"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>聘用时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date required="true" id="pysj" name="fjBean.pysj" value="${fjBean.pysj}" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>合同期限：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select required="true" id="htqx" name="fjBean.htqx" value="${fjBean.htqx}" headerKey="" headerValue=" " zdlb="ZDY_HTQX"></cps:select>
						</cps:tdContent >
						<cps:tdLabel width="15%">城区或乡镇社区协管员：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="cqorxz" name="fjBean.cqorxz" value="${fjBean.cqorxz}" headerKey="" headerValue=" " zdlb="XGY_CQORXZSQ" ></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>工资来源：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select required="true" id="gzly" name="fjBean.gzly" value="${fjBean.gzly}" headerKey="" headerValue=" " zdlb="ZDY_GZLY"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>工资额：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select required="true" id="gze" name="fjBean.gze" value="${fjBean.gze}" headerKey="" headerValue=" " zdlb="ZDY_GZE"></cps:select>
						</cps:tdContent >
						<cps:tdLabel width="15%">五险一金：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="wxyj" name="fjBean.wxyj" value="${fjBean.wxyj}" headerKey="" headerValue=" " zdlb="ZDY_5X1J" ></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>是否专职：</cps:tdLabel>
						<cps:tdContent>
							<cps:select required="true" zdlb="ZDY_ZDSF" id="sfzz" name="fjBean.sfzz" value="${fjBean.sfzz}" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>所属单位：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<c:choose>
								<c:when test="${not empty fjBean.ssdwdm}">
									<input id="ssdwdm"  type="hidden" name="fjBean.ssdwdm" value="${fjBean.ssdwdm }"/>
									<cps:textfield id="ssdwmc" appendPopuBtn="true" name="fjBean.ssdwmc" value="${fjBean.ssdwmc}" readonly="true" required="true"  maxlength="60" cssStyle="width:95%" onclick="selectOrg1('${loginInfo.rootOrgCode}','ssdwdm','ssdwmc')"></cps:textfield>
								</c:when>
								<c:otherwise>
									<input id="ssdwdm"  type="hidden" name="fjBean.ssdwdm" value="${loginInfo.orgcode}"/>
									<cps:textfield id="ssdwmc" name="fjBean.ssdwmc" value="${loginInfo.orgname}" readonly="true" required="true"  maxlength="60" cssStyle="width:95%" onclick="selectOrg1('${loginInfo.rootOrgCode}','ssdwdm','ssdwmc')" appendPopuBtn="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>工作经历：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" id="gzjl" name="fjBean.gzjl" value="${fjBean.gzjl}" cssStyle="height:50px;width:97%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>登记人姓名：</cps:tdLabel>	
						<cps:tdContent> 
						<c:choose>
							<c:when test="${empty fjBean.djrjh}">
									<input type="hidden" id="djrjh" name="fjBean.djrjh" value="${loginInfo.username}"/>
									<cps:textfield id="djrxm" name="fjBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
									<input type="hidden" id ="djrjh" name="fjBean.djrjh" value="${fjBean.djrjh}"/>
									<cps:textfield id="djrxm" name="fjBean.djrxm" value="${fjBean.djrxm}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>	
						<cps:tdContent>
						<c:choose>
							<c:when test="${empty fjBean.djdwdm}">
								<input type="hidden" name="fjBean.djdwdm" value="${loginInfo.orgcode }"/>
								<cps:textfield id="djdwmc" name="fjBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="fjBean.djdwdm" value="${fjBean.djdwdm}"/>
								<cps:textfield id="djdwmc" name="fjBean.djdwmc" value="${fjBean.djdwmc}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose> 
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>	
						<cps:tdContent> 
							<c:choose>
								<c:when test="${empty fjBean.djsj}">
									<cps:date id="djsj" name="fjBean.djsj" defaultSystemDate="true" readOnly="true"></cps:date>
								</c:when>
								<c:otherwise>
									<cps:date id="djsj" name="fjBean.djsj" value="${fjBean.djsj}" readOnly="true"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
</creator:view>