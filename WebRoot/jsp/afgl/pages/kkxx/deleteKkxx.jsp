<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="注销卡口信息">
	<creator:panel id="head_deletekkxx" title="注销卡口信息">
			<form id="add_kkxx_form" action="${contextPath}/kkxx/addKkxx.action" method="post">
				<input type="hidden" id="kkbh" name="kkxxBean.kkbh" value="${kkxxBean.kkbh }"/>
				<input type="hidden" id="czbs" name="kkxxBean.czbs" value="${kkxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">卡口名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">卡口警力数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkjls }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">专职巡防人数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkzzxfrs }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">卡口位置：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkwz }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">卡口范围：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkfw }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">装备情况：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkzbqk }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">警务责任区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.sszrqmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">建立日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${kkxxBean.kkcjsj }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">撤销日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="zxrq" name="kkxxBean.zxrq" dateFmt="yyyy-MM-dd HH:mm:ss"  value="${kkxxBean.zxrq }"
								cssClass="cps-input validate[required]"></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">撤销原因：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="zxyy" name="kkxxBean.zxyy"  value="${kkxxBean.zxyy }" 
								cssClass="validate[required]" cssStyle="width:92%"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="kkxxBean.djrxm"
								 value="${loginInfo.realname}" readonly="true"></cps:textfield>
							<input type="hidden" id="djrjh" name="kkxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="kkxxBean.djsj" 
								 value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>" 
								 readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djdwmc" name="kkxxBean.djdwmc"
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="kkxxBean.djdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
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
	</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/kkxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>