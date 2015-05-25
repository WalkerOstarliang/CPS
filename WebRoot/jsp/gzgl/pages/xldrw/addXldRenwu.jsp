<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript"
		src="${contextPath}/jsp/gzgl/js/xunldRw.js"></script>
	<creator:tbar id="xltbar">
		<s:if test="bean.op != 'detail'">
			<cps:button value="保存" onclick="save();"></cps:button>
		</s:if>
		<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
	<creator:panel title="巡逻登记" tbarId="xltbar" id="xlrwpanel">
		<form action="${contextPath}/gzgl/xldrw/saveXunldRW.action"
			method="post" id="xunldRwform">
			<input type="hidden" name="bean.op" value="${bean.op}" />
			<s:hidden id="bh" name="bean.bh"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel >巡逻时间：</cps:tdLabel>
					<cps:tdContent colspan="2" >
						<s:if test="bean.op != 'detail'">
							<cps:date id="xlsj" dateFmt="yyyy-MM-dd" value="${bean.xlsj}"
								name="bean.xlsj"></cps:date>
						</s:if>
						<s:else>
							<cps:date id="xlsj" dateFmt="yyyy-MM-dd" value="${bean.xlsj}"
								name="bean.xlsj" readOnly="true"></cps:date>
						</s:else>
					</cps:tdContent>
					<cps:tdLabel>巡逻方式：</cps:tdLabel>
					<cps:tdContent colspan="2" >
						<s:if test="bean.op != 'detail'">
							<cps:textfield id="xlfs" name="bean.xlfs" value="${bean.xlfs}"
								maxlength="30" cssStyle="width:80%"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield id="xlfs" name="bean.xlfs" value="${bean.xlfs}"
								maxlength="30" readonly="true" cssStyle="width:80%"></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">
						<font color="red">*</font>带队民警：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<s:if test="bean.op !='detail'">
							<cps:textfield id="ddmj" value="${bean.ddmj}" name="bean.ddmj"
								required="true" cssStyle="width:93%"/>
							
						</s:if>
						<s:else>
							<cps:textfield id="ddmj" value="${bean.ddmj}" name="bean.ddmj"
								required="true"  readonly="true" cssStyle="width:93%"/>
						</s:else>
					</cps:tdContent>
					</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">
						<font color="red">*</font>巡逻队员：</cps:tdLabel>
					<cps:tdContent  colspan="5">
						<s:if test="bean.op !='detail'">
							<cps:textfield id="zxryxm" value="${bean.zxryxm}"
								name="bean.zxryxm" required="true" cssStyle="width:93%"/>
						</s:if>
						<s:else>
							<cps:textfield id="zxryxm" value="${bean.zxryxm}"
								name="bean.zxryxm" required="true" cssStyle="width:93%"
								readonly="true" />
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>巡逻地点：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<s:if test="bean.op != 'detail'">
							<cps:textfield name="bean.zxdyfw" id='xlfw'
								value="${bean.zxdyfw}" maxlength="200" cssStyle="width:93%"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield name="bean.zxdyfw" id='xlfw'
								value="${bean.zxdyfw}" readonly="true" cssStyle="width:93%"></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>巡逻情况：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<s:if test="bean.op != 'detail'">
							<textarea name="bean.zxrwms" style="width: 93%; height: 60px;"
								id='rwms' class="validate[maxSize[200]]">${bean.zxrwms}</textarea>
						</s:if>
						<s:else>
							<textarea name="bean.zxrwms" style="width: 93%; height: 60px;"
								readonly="readonly">${bean.zxrwms}</textarea>
						</s:else>
					</cps:tdContent>
				</cps:row>
					<cps:row>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:if test="bean.op == 'add'">
							<cps:textfield readonly="true" name="bean.djrxm"
								value="${loginInfo.realname}"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield readonly="true" name="bean.djrxm"
								value="${bean.djrxm}"></cps:textfield>
						</s:else>
					</cps:tdContent>

					<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:if test="bean.op == 'add'">
							<cps:textfield name="bean.djdwmc" value="${loginInfo.orgname}"
								readonly="true"></cps:textfield>
							<input type="hidden" name="bean.djdwdm"
								value="${loginInfo.orgcode}" />
						</s:if>
						<s:else>
							<cps:textfield name="bean.djdwmc" value="${bean.djdwmc}"
								readonly="true"></cps:textfield>
							<input type="hidden" name="bean.djdwdm" value="${bean.djdwdm}" />
						</s:else>
					</cps:tdContent>

					<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:if test="bean.op == 'add'">
							<cps:textfield name="bean.djsj" value="${now}" readonly="true"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield name="bean.djsj" value="${bean.djsj}"
								readonly="true"></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				
			<%-- 	<cps:row>
					<cps:tdLabel width="10%">
						<font color="red">*</font>巡逻队：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" name="bean.op" value="${bean.op}" />
						<s:hidden id="bh" name="bean.bh"></s:hidden>
						<s:hidden id="xldbh" name="bean.zxxldbh"></s:hidden>
						<c:choose>
							<c:when test="${bean.op == 'detail'}">${bean.xldmc}&nbsp;
							</c:when>
							<c:otherwise>
								<cps:textfield id="xldmc" name="bean.xldmc"
									cssClass="validate[required]" readonly="true"
									ondblclick="openXldSelectWin()" value="${bean.xldmc}"></cps:textfield>
								<cps:button value="选择" onclick="openXldSelectWin()"></cps:button>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">
						<font color="red">*</font>带队民警：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:if test="bean.op !='detail'">
							<cps:textfield id="ddmj" value="${bean.ddmj}" name="bean.ddmj"
								required="true" cssStyle="width:83%"
								ondblclick="queryXldySelectWin('ddmj');" />
							<cps:button value="选择" onclick="queryXldySelectWin('ddmj')"></cps:button>
						</s:if>
						<s:else>
							<cps:textfield id="ddmj" value="${bean.ddmj}" name="bean.ddmj"
								required="true" cssStyle="width:83%" readonly="true" />
						</s:else>
					</cps:tdContent>
					<cps:tdLabel width="10%">
						<font color="red">*</font>巡逻队员：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:if test="bean.op !='detail'">
							<cps:textfield id="zxryxm" value="${bean.zxryxm}"
								name="bean.zxryxm" required="true" cssStyle="width:83%"
								ondblclick="queryXldySelectWin('zxryxm');" />
							<cps:button value="选择" onclick="queryXldySelectWin('zxryxm')"></cps:button>
						</s:if>
						<s:else>
							<cps:textfield id="zxryxm" value="${bean.zxryxm}"
								name="bean.zxryxm" required="true" cssStyle="width:83%"
								readonly="true" />
						</s:else>
					</cps:tdContent>
				</cps:row>

				<cps:row>
					<cps:tdLabel><font color="red">*</font>工作日期：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op !='detail'" >
							<cps:date name="bean.gzqsrq" value="${bean.gzqsrq}" cssStyle="width:35%" cssClass="validate[required]" id="gzrq_s" dateFmt="yyyy-MM-dd"></cps:date>&nbsp;-
							<cps:date name="bean.gzjzrq" value="${bean.gzjzrq}" cssStyle="width:35%" cssClass="validate[required]" id="gzrq_e" dateFmt="yyyy-MM-dd"></cps:date>
						</s:if>
						<s:else>
							<cps:textfield value="${bean.gzqsrq}" cssStyle="width:35%"></cps:textfield>-
							<cps:textfield value="${bean.gzjzrq}" cssStyle="width:35%"></cps:textfield>
						</s:else>
					</cps:tdContent>
					
					<cps:tdLabel><font color="red">*</font>工作时间：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op != 'detail'" >
							<s:select list="#{'00:00':'00:00','01:00':'01:00','02:00':'02:00','03:00':'03:00','04:00':'04:00',
												'05:00':'05:00','06:00':'06:00','07:00':'07:00','08:00':'08:00','09:00':'09:00',
												'10:00':'10:00','11:00':'11:00','12:00':'12:00','13:00':'13:00','14:00':'14:00',
												'15:00':'15:00','16:00':'16:00','17:00':'17:00','18:00':'18:00','19:00':'19:00',
												'20:00':'20:00','21:00':'21:00','22:00':'22:00','23:00':'23:00'}" id="gzsj_s" cssClass="validate[required]"
									headerKey="" headerValue="--请选择--" cssStyle="width:40%" name="bean.gzqstime" value="bean.gzqstime" />-
							<s:select list="#{'00:00':'00:00','01:00':'01:00','02:00':'02:00','03:00':'03:00','04:00':'04:00',
												'05:00':'05:00','06:00':'06:00','07:00':'07:00','08:00':'08:00','09:00':'09:00',
												'10:00':'10:00','11:00':'11:00','12:00':'12:00','13:00':'13:00','14:00':'14:00',
												'15:00':'15:00','16:00':'16:00','17:00':'17:00','18:00':'18:00','19:00':'19:00',
												'20:00':'20:00','21:00':'21:00','22:00':'22:00','23:00':'23:00'}" id="gzsj_e" cssClass="validate[required]"
									headerKey="" headerValue="--请选择--" cssStyle="width:40%" name="bean.gzjstime" value="bean.gzjstime" />
						</s:if>
						<s:else>
							<cps:textfield value="${bean.gzqstime}" cssStyle="width:40%" readonly="true" />-
							<cps:textfield value="${bean.gzjstime}" cssStyle="width:40%" readonly="true" />
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>巡逻时间：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op != 'detail'">
							<cps:date id="xlsj" dateFmt="yyyy-MM-dd" value="${bean.xlsj}"
								name="bean.xlsj"></cps:date>
						</s:if>
						<s:else>
							<cps:date id="xlsj" dateFmt="yyyy-MM-dd" value="${bean.xlsj}"
								name="bean.xlsj" readOnly="true"></cps:date>
						</s:else>
					</cps:tdContent>
					<cps:tdLabel>巡逻方式：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op != 'detail'">
							<cps:textfield id="xlfs" name="bean.xlfs" value="${bean.xlfs}"
								maxlength="30"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield id="xlfs" name="bean.xlfs" value="${bean.xlfs}"
								maxlength="30" readonly="true"></cps:textfield>
						</s:else>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>巡逻地点：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<s:if test="bean.op != 'detail'">
							<cps:textfield name="bean.zxdyfw" id='xlfw'
								value="${bean.zxdyfw}" maxlength="200"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield name="bean.zxdyfw" id='xlfw'
								value="${bean.zxdyfw}" readonly="true"></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>巡逻情况：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<s:if test="bean.op != 'detail'">
							<textarea name="bean.zxrwms" style="width: 93%; height: 60px;"
								id='rwms' class="validate[maxSize[200]]">${bean.zxrwms}</textarea>
						</s:if>
						<s:else>
							<textarea name="bean.zxrwms" style="width: 93%; height: 60px;"
								readonly="readonly">${bean.zxrwms}</textarea>
						</s:else>
					</cps:tdContent>
				</cps:row>


			</cps:table>

			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">登记人：</cps:tdLabel>
					<cps:tdContent width="12%">
						<s:if test="bean.op == 'add'">
							<cps:textfield readonly="true" name="bean.djrxm"
								value="${loginInfo.realname}"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield readonly="true" name="bean.djrxm"
								value="${bean.djrxm}"></cps:textfield>
						</s:else>
					</cps:tdContent>

					<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
					<cps:tdContent>
						<s:if test="bean.op == 'add'">
							<cps:textfield name="bean.djdwmc" value="${loginInfo.orgname}"
								readonly="true"></cps:textfield>
							<input type="hidden" name="bean.djdwdm"
								value="${loginInfo.orgcode}" />
						</s:if>
						<s:else>
							<cps:textfield name="bean.djdwmc" value="${bean.djdwmc}"
								readonly="true"></cps:textfield>
							<input type="hidden" name="bean.djdwdm" value="${bean.djdwdm}" />
						</s:else>
					</cps:tdContent>

					<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
					<cps:tdContent width="18%">
						<s:if test="bean.op == 'add'">
							<cps:textfield name="bean.djsj" value="${now}" readonly="true"></cps:textfield>
						</s:if>
						<s:else>
							<cps:textfield name="bean.djsj" value="${bean.djsj}"
								readonly="true"></cps:textfield>
						</s:else>
					</cps:tdContent>
				</cps:row>
				--%>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>