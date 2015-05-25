<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="拆除技防物防设施">
			<creator:panel id="head_djxqjfwfssxx" title="拆除技防物防设施">
			<form id="add_xqjfwfssxx_form" action="${contextPath}/xqjfwfssxx/addXqjfwfssxx.action" method="post">
				<input type="hidden" id="ssbh" name="xqjfwfssxxBean.ssbh" value="${xqjfwfssxxBean.ssbh }"/>
				<input type="hidden" id="czbs" name="xqjfwfssxxBean.czbs" value="${xqjfwfssxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">设施名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.ssmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sqmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在小区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.xqmc }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">设施类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sslxmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">安装时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.azsj }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">安装位置：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.azwz }&nbsp;
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">位置类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.wzlx }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">设备数量：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sssl }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">运行情况：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.sbyxqk }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">是否发挥作用：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<${xqjfwfssxxBean.isfhzymc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">报警设施连接：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqjfwfssxxBean.bjssljmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">&nbsp;</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">拆除时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="ccsj" name="xqjfwfssxxBean.ccsj"  cssStyle="width:80%" 
								dateFmt="yyyy-MM-dd" cssClass="cps-input validate[required]">
							</cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">拆除原因：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield id="ccyy" name="xqjfwfssxxBean.ccyy" cssClass="validate[required]" cssStyle="width:92%"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="xqjfwfssxxBean.djrxm" 
								 value="${loginInfo.realname}" readonly="true" cssStyle="width:80%"></cps:textfield>
							<input type="hidden" id="djrjh" name="xqjfwfssxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="xqjfwfssxxBean.djsj"  cssStyle="width:80%"
								 value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djdwmc" name="xqjfwfssxxBean.djdwmc" cssStyle="width:80%"
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="xqjfwfssxxBean.djdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="保存" onclick="addXqjfwfssxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/xqjfwfssxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>