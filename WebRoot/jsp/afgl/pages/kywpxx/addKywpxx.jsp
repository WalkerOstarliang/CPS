<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="可疑物品信息">
		<div id="head_djkywpxx">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_title">
				    <tr>
				      <td width="23"><img src="<c:url value='/template/cps/images/img_title.jpg'/>" width="23" height="28" /></td>
				      <td>
				      	<c:if test="${kywpxxBean.czbs eq '1' }">登记可疑物品信息</c:if>
				      	<c:if test="${kywpxxBean.czbs eq '2' }">修改可疑物品信息</c:if>
				      </td>
				      <td width="28"><a href="javascript:void(0)"><img id="img_djkywp" src="<c:url value='/template/cps/images/cx_zk.jpg'/>" width="28" height="28" /></a></td>
				    </tr>
				</table>
			<form id="add_kywpxx_form" action="${contextPath }/kywpxx/addKywpxx.action" method="post">
				<input type="hidden" id="pcbh" name="kywpxxBean.pcbh" value="${kywpxxBean.pcbh }"/>
				<input type="hidden" id="kywpbh" name="kywpxxBean.kywpbh" value="${kywpxxBean.kywpbh }"/>
				<input type="hidden" id="czbs" name="kywpxxBean.czbs" value="${kywpxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">物品名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpmc" name="kywpxxBean.wpmc" cssStyle="width:80%"  
								cssClass="validate[required]" value="${kywpxxBean.wpmc }"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="wplx" name="kywpxxBean.wplx"  cssStyle="width:80%" 
									zdlb="GB_WPLB" headerValue="--选择--" headerKey=""  value="${kywpxxBean.wplx }"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品型号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpxh" name="kywpxxBean.wpxh" cssStyle="width:80%"  value="${kywpxxBean.wpxh }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">物品规格：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpgg" name="kywpxxBean.wpgg" cssStyle="width:80%"  value="${kywpxxBean.wpgg }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品样式：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpys" name="kywpxxBean.wpys" cssStyle="width:80%"  value="${kywpxxBean.wpys }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品颜色：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpyas" name="kywpxxBean.wpyas" cssStyle="width:80%"  value="${kywpxxBean.wpyas }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">物品数量：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpsl" name="kywpxxBean.wpsl" cssClass="validate[required]" 
								cssStyle="width:80%"  value="${kywpxxBean.wpsl }"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">数量单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="wpsldw" name="kywpxxBean.wpsldw"  cssStyle="width:80%" cssClass="validate[required]" 
									zdlb="AF_WPSLDW" headerValue="--选择--" headerKey=""  value="${kywpxxBean.wpsldw }"></cps:select>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品重量：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpzl" name="kywpxxBean.wpzl" cssStyle="width:80%"  value="${kywpxxBean.wpzl }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">重量单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="zldw" name="kywpxxBean.wpzldw"  cssStyle="width:80%" 
									zdlb="AF_WPZLDW" headerValue="--选择--" headerKey=""  value="${kywpxxBean.wpzldw }"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品长度：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpcd" name="kywpxxBean.wpcd" cssStyle="width:80%"  value="${kywpxxBean.wpcd }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">长度单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="wpcddw" name="kywpxxBean.wpcddw"  cssStyle="width:80%" 
									zdlb="AF_WPCDDW" headerValue="--选择--" headerKey=""  value="${kywpxxBean.wpcddw }"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">追缴单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="zjdwdm" name="kywpxxBean.zjdwdm"  value="${kywpxxBean.zjdwdm }"/>
							<cps:textfield id="zjdwmc" name="kywpxxBean.zjdwmc" value="${kywpxxBean.zjdwmc }"
								cssClass="validate[required]"  cssStyle="width:50%" ondblclick="selectDw('${loginInfo.orgcode }','zjdwdm','zjdwmc')"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode }','zjdwdm','zjdwmc')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">追缴时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="zjsj" name="kywpxxBean.zjsj" dateFmt="yyyy-MM-dd HH:mm:ss" value="${kywpxxBean.zjsj }"
								cssClass="validate[required] cps-input" cssStyle="width:80%" ></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">性质：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="wpxz" name="kywpxxBean.wpxz"  cssStyle="width:80%" 
									zdlb="GB_WPXZ" headerValue="--选择--" headerKey=""  value="${kywpxxBean.wpxz }"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">物品价值：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpjz" name="kywpxxBean.wpjz" cssStyle="width:80%"  value="${kywpxxBean.wpjz }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">特征描述：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpms" name="kywpxxBean.wpms" cssStyle="width:80%"  value="${kywpxxBean.wpms }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">处理状态：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="clzt" name="kywpxxBean.clzt"  cssStyle="width:80%" 
									cssClass="validate[required]" zdlb="GB_WPZT" headerValue="--选择--" headerKey=""  value="${kywpxxBean.clzt }"></cps:select>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">处理情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="clqk" name="kywpxxBean.clqk"  cssStyle="width:80%" cssClass="validate[required]"
									zdlb="GB_WPCLQK" headerValue="--选择--" headerKey=""  value="${kywpxxBean.clqk }"></cps:select>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">处理人姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="clrjh" name="kywpxxBean.clrjh"  value="${kywpxxBean.clrjh }"/>
							<cps:textfield id="clrxm" name="kywpxxBean.clrxm" value="${kywpxxBean.clrxm }" cssClass="validate[required]"
								cssStyle="width:50%" ondblclick="selectDwry('${loginInfo.orgcode }','clrjh','clrxm','cldwdm','cldwmc')"></cps:textfield>
							<cps:button value="选择" onclick="selectDwry('${loginInfo.orgcode }','clrjh','clrxm','cldwdm','cldwmc')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">处理单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="cldwdm" name="kywpxxBean.cldwdm"  value="${kywpxxBean.cldwdm }"/>
							<cps:textfield id="cldwmc" name="kywpxxBean.cldwmc" value="${kywpxxBean.cldwmc }" cssClass="validate[required]"
								cssStyle="width:50%" ondblclick="selectDw('${loginInfo.orgcode }','cldwdm','cldwmc')"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode }','cldwdm','cldwmc')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">处理日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="clrq" name="kywpxxBean.clrq" dateFmt="yyyy-MM-dd HH:mm:ss" 
								 value="${kywpxxBean.clrq }"
								cssClass="validate[required] cps-input" cssStyle="width:80%" ></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品存放地点：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpcfdz" name="kywpxxBean.wpcfdz" cssClass="validate[required]" cssStyle="width:80%"  value="${kywpxxBean.wpcfdz }"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="bz" name="kywpxxBean.bz" cssStyle="width:92%"  value="${kywpxxBean.bz }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">图片：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="wptp" name="kywpxxBean.wptp" cssStyle="width:92%"  value="${kywpxxBean.wptp }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djrxm" name="kywpxxBean.djrxm" cssStyle="width:80%" 
								value="${loginInfo.realname}" readonly="true"></cps:textfield>
							<input type="hidden" id="djrjh" name="kywpxxBean.djrjh" 
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djsj" name="kywpxxBean.djsj" cssStyle="width:80%"  
								value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>"
								readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djdwmc" name="kywpxxBean.djdwmc" cssStyle="width:80%" 
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="kywpxxBean.djdwdm" type="hidden" value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="保存" onclick="addKywpxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</div>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kywpxx.js"></script>
</creator:view>