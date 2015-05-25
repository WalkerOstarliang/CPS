<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="卡口信息">
	<div id="head_djkkxx">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="box_title">
			<tr>
				<td width="23">
					<img src="<c:url value='/template/cps/images/img_title.jpg'/>" width="23" height="28" />
				</td>
				<td>
					<c:if test="${kkxxBean.czbs eq '1' }">登记卡口信息</c:if>
					<c:if test="${kkxxBean.czbs eq '2' }">修改卡口信息</c:if>
					<c:if test="${kkxxBean.czbs eq '3' }">注销卡口信息</c:if>
				</td>
				<td width="28">
					<a href="javascript:void(0)">
						<img id="img_djkkxx" src="<c:url value='/template/cps/images/cx_zk.jpg'/>" width="28" height="28" />
					</a>
				</td>
			</tr>
		</table>

		<form id="add_kkxx_form" action="${contextPath}/kkxx/addKkxx.action" method="post">
			<input type="hidden" id="kkbh" name="kkxxBean.kkbh" value="${kkxxBean.kkbh }" />
			<input type="hidden" id="czbs" name="kkxxBean.czbs" value="${kkxxBean.czbs }" />
			<cps:table>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">卡口名称：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="kkmc" name="kkxxBean.kkmc"
							value="${kkxxBean.kkmc }" cssClass="validate[required]"
							cssStyle="width:80%"></cps:textfield>
						<font color="red">*</font>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%">卡口警力数：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="kkjls" name="kkxxBean.kkjls"
							value="${kkxxBean.kkjls }" cssClass="validate[required]"
							cssStyle="width:80%"></cps:textfield>
						<font color="red">*</font>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">专职巡防人数：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="kkzzxfrs" name="kkxxBean.kkzzxfrs"
							value="${kkxxBean.kkzzxfrs }" cssStyle="width:80%"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">卡口位置：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="kkwz" name="kkxxBean.kkwz"
							value="${kkxxBean.kkwz }" cssStyle="width:80%"
							cssClass="validate[required]"></cps:textfield>
						<font color="red">*</font>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%">卡口范围：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="kkfw" name="kkxxBean.kkfw"
							value="${kkxxBean.kkfw }" cssStyle="width:80%"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%">装备情况：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="zbqk" name="kkxxBean.kkzbqk"
							value="${kkxxBean.kkzbqk }" cssStyle="width:80%"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">警务责任区：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<input type="hidden" id="sszrqdm" name="kkxxBean.sszrqdm"
							value="${kkxxBean.sszrqdm }" />
						<cps:textfield id="sszrqmc" name="kkxxBean.sszrqmc"
							cssStyle="width:50%" value="${kkxxBean.sszrqmc }"
							cssClass="validate[required]"
							ondblclick="selectDw('${loginInfo.orgcode }','sszrqdm','sszrqmc')"></cps:textfield>
						<cps:button value="选择"
							onclick="selectDw('${loginInfo.orgcode }','sszrqdm','sszrqmc')"></cps:button>
						<font color="red">*</font>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%">建立日期：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:date id="kkcjsj" name="kkxxBean.kkcjsj"
							dateFmt="yyyy-MM-dd HH:mm:ss" value="${kkxxBean.kkcjsj }"
							cssClass="validate[required] cps-input" cssStyle="width:80%"></cps:date>
						<font color="red">*</font>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%">&nbsp;</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
							&nbsp;
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="djrxm" name="kkxxBean.djrxm"
							cssStyle="width:80%" value="${loginInfo.realname}"
							readonly="true"></cps:textfield>
						<input type="hidden" id="djrjh" name="kkxxBean.djrjh"
							value="${loginInfo.username }" />
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="djsj" name="kkxxBean.djsj" cssStyle="width:80%"
							value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>"
							readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="djdwmc" name="kkxxBean.djdwmc"
							cssStyle="width:80%" value="${loginInfo.orgname }"
							readonly="true"></cps:textfield>
						<input id="djdwdm" name="kkxxBean.djdwdm" type="hidden"
							"value="${loginInfo.orgcode }" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6" align="center">
						<cps:button value="清空" type="reset"></cps:button>
						<cps:button value="保存" onclick="addKkxx();"></cps:button>
						<cps:button value="关闭" onclick="window.close();"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</div>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/kkxx.js"></script>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>