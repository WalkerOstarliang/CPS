<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/xxygl.js"></script>
	<creator:tbar id="tbar">
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel id="xxyPanel" title="信息员（耳目）登记" tbarId="tbar">
		<form id="xxyform" action="${contextPath}/gzgl/tzgl/saveXxyBean.action" method="post">
			<input type="hidden" id="beanOp" name="op" value="${op}" />
			<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="85%">
				<cps:table >
				<cps:row>
					<cps:tdLabel width="10%">
						<font color="red">*&nbsp;</font>身份证号：
					</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="sfzh" name="emxxBean.sfzh" isSfzh="true" onblur="queryRkBean(this.value,setGbryxx)" value="${emxxBean.sfzh}" required="true">
						</cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>
						<font color="red">*&nbsp;</font>姓名：
					</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xm" name="emxxBean.xm" required="true" value="${emxxBean.xm}" readonly="true"></cps:textfield>
					</cps:tdContent>
						
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*&nbsp;</font>性别：
					</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="xb" name="emxxBean.xb"  zdlb="GB_XB" value="${emxxBean.xb}" headerValue="--请选择--" required="true" disabled="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>
						出生日期：
					</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="csrq" name="emxxBean.csrq" value="${emxxBean.csrq}" dateFmt="yyyy-MM-dd" readOnly="true"></cps:date>
					</cps:tdContent>
						
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						管理使用民警：
					</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="glsymj" name="emxxBean.glsymj"  value="${emxxBean.glsymj}" readonly="true" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">
					<font color="red">*</font>人员类别：
					</cps:tdLabel>
					<cps:tdContent width="25%">
					<cps:select id="xxyrylb" name="emxxBean.xxyrylb" value="${emxxBean.xxyrylb}" zdlb="GZGL_XXY_RYLB"  headerValue="--请选择--"  headerKey=" " disabled="true">
					</cps:select>
					</cps:tdContent>
					
				</cps:row>


				<cps:row>
					<cps:tdLabel width="10%">
						工作单位：</cps:tdLabel>
					<cps:tdContent width="25%">
							<cps:textfield id="gzdw" name="emxxBean.gzdw" readonly="true"
								value="${emxxBean.gzdw}"
								cssClass="validate[required] cps-input" ></cps:textfield>
					</cps:tdContent>

					<cps:tdLabel width="10%">
						职业：</cps:tdLabel>
					<cps:tdContent width="25%">
							<cps:textfield id="zy" name="emxxBean.zymc" readonly="true" value="${emxxBean.zymc}"
								cssClass="cps-input"  />
					</cps:tdContent>
						
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>物建人姓名：</cps:tdLabel>
					<cps:tdContent>
					<cps:textfield cssClass="cps-input" id="wjrxm" name="emxxBean.wjrxm"  readonly="true"></cps:textfield>
					</cps:tdContent>
			
					<cps:tdLabel>领导姓名：</cps:tdLabel>
					<cps:tdContent>
					<cps:textfield cssClass="cps-input" id="ldxm" name="emxxBean.ldxm"  readonly="true"></cps:textfield>
					</cps:tdContent>
						
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>领导所在单位：</cps:tdLabel>
					<cps:tdContent>
					<cps:textfield cssClass="cps-input" id="ldszdwmc" name="emxxBean.ldszdwmc" readonly="true"></cps:textfield>
					<input id="ldszdwdm" name="emxxBean.ldszdwdm" value="${emxxBean.ldszdwdm }" type="hidden"/>
					</cps:tdContent>
					<cps:tdLabel>领导审核时间：</cps:tdLabel>
					<cps:tdContent>
							<cps:textfield id="ldshsj" name="emxxBean.ldshsj" readonly="true" value="${emxxBean.ldshsj}"
							cssClass="cps-input" ></cps:textfield>
				</cps:tdContent>
				</cps:row>
				</cps:table>
				</cps:tdContent>
				<cps:tdContent valign="top">
					<div id="zpxx" style="text-align: center;background-color: #DFF0F8">
				<img src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${emxxBean.sfzh}" title="全国人口库照片" alt="全国人口库照片" height="140" width="130"/>
			        </div>
				</cps:tdContent>
				</cps:row>
				</cps:table>
				<cps:table width="100%">
				<cps:row>
					<cps:tdLabel width="12%">前科情况：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="qkqk" cssStyle="width:93%;height:30px;"
								cssClass="validate[required, maxSize[250]]"
								name="emxxBean.qkqk" readonly="true" />
					</cps:tdContent>
				</cps:row>

				<cps:row>
					<cps:tdLabel>个人简历：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="grjl" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.grjl" readonly="true" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>家庭及社会关系：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="jtjsh" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.jtjsh" readonly="true" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>思想政治情况：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="sxzzqk" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.sxzzqk" readonly="true" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>现实表现：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="xsbx" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.xsbx" readonly="true" />
					</cps:tdContent>
				</cps:row>
				

				
				<cps:row>
					<cps:tdLabel>物建人意见：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="wjryj" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.wjryj" readonly="true" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>领导意见：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="ldyj" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.ldyj" readonly="true" />
					</cps:tdContent>
				</cps:row>
						
				<cps:row>
				<cps:tdLabel>启用时间：</cps:tdLabel>
				<cps:tdContent>
							<cps:textfield id="qysj" name="emxxBean.qysj" readonly="true" value="${emxxBean.qysj}"
							cssClass="validate[required] cps-input" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>停用时间：</cps:tdLabel>
				<cps:tdContent>
							<cps:textfield id="tysj" name="emxxBean.tysj" readonly="true" value="${emxxBean.tysj}" ></cps:textfield>
				</cps:tdContent>
					
					<cps:tdLabel>物件时间：</cps:tdLabel>
					<cps:tdContent>
							<cps:textfield id="wjsj" name="emxxBean.wjsj" readonly="true" value="${emxxBean.wjsj}"></cps:textfield>
				</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>停止使用所长意见：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="tzsyszyj" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.tzsyszyj" readonly="true" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>停止使用原因：</cps:tdLabel>
					<cps:tdContent colspan="5" width="100%;">
							<s:textarea id="tzsyyy" cssStyle="width:93%;height:30px;"
								cssClass="validate[maxSize[200]] textarea"
								name="emxxBean.tzsyyy" readonly="true" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*&nbsp;</font>登记人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djrxm" readonly="true"
							value="${loginInfo.realname}" 
							cssClass="validate[required]" name="emxxBean.djrxm" />
					</cps:tdContent>

					<cps:tdLabel>
						<font color="red">*&nbsp;</font>所属单位：</cps:tdLabel>
					<cps:tdContent width="18%">
						<input type="hidden" value="${loginInfo.orgcode}"
							name="emxxBean.djdwdm" />
						<input type="hidden" value="${loginInfo.username}"
							name="emxxBean.djmjjh" />
						<cps:textfield id="djdwmc" value="${loginInfo.orgname}"
							readonly="true" 
							cssClass="validate[required]" name="emxxBean.djdwmc" />
					</cps:tdContent>

					<cps:tdLabel>
						<font color="red">*&nbsp;</font>登记日期：</cps:tdLabel>
					<cps:tdContent>
							<cps:textfield id="djsj" name="emxxBean.djsj" readonly="true"
								value="${emxxBean.djsj}"
								cssClass="validate[required] cps-input" >
							</cps:textfield>
					</cps:tdContent>
				</cps:row>	
			</cps:table>
		</form>
		</creator:panel>
		<cps:tableGrid id="fyqk" autoload="true" url="${contextPath}/gzgl/tzgl/queryXxyfyqkList.action?zaembh=${zaembh }" searchform="xxyform" pageSize="3">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="xxtgsj" title="信息提供时间"></cps:column>
			<cps:column field="fyqkxx" title="反映情况" maxlength="20"></cps:column>
			<cps:column field="djrxm" title="登记人姓名"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
			<cps:column field="djdwmc" title="登记单位" maxlength="10"></cps:column>
		</cps:tableGrid>
</creator:view>