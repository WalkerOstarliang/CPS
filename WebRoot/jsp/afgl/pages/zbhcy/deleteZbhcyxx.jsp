<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="注消治保会成员信息">
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/zbhcyxx.js"></script>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
	<creator:tbar id="tbar">
	    <cps:button value="保存" onclick="addZbhcyxx();"></cps:button>
		<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
			<creator:panel id="head_deletezbhcyxx" title="注消治保会成员信息" tbarId="tbar">
			<form id="add_zbhcyxx_form" action="${contextPath}/zbhcyxx/addZbhcyxx.action" method="post">
				<input type="hidden" id="zbhcybh" name="zbhcyxxBean.zbhcybh" value="${zbhcyxxBean.zbhcybh }"/>
				<input type="hidden" id="czbs" name="zbhcyxxBean.czbs" value="${zbhcyxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">治保会名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.zbhmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.sssqjwmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">所在责任区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.sspcsmc }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">身份证号：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.sfzh }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.xm }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">性别：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.xbmc }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">出生日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.csrq }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">户籍地：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
						${zbhcyxxBean.hjdxz }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">现住地：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.xzdxz }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.lxdh }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">工作单位：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${zbhcyxxBean.gzdw }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">文化程度：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.whcdmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">婚姻状况：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.hyzkmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">工作表现：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.gzbxmc }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">参加日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.cjrq }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">会中职务：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.zbhzwmc }&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel cssStyle="width:12%">报酬情况：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.bcqk }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">奖惩次数：</cps:tdLabel>
						<cps:tdContent colspan="5">
							${zbhcyxxBean.jccs }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">人员简历：</cps:tdLabel>
						<cps:tdContent colspan="5">
							${zbhcyxxBean.ryjl }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">社会关系：</cps:tdLabel>
						<cps:tdContent colspan="5">
							${zbhcyxxBean.shgx }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">退出日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="tcrq" name="zbhcyxxBean.tcrq" cssStyle="width:80%" dateFmt="yyyy-MM-dd HH:mm:ss"  value="${zbhcyxxBean.tcrq }"
								cssClass="cps-input validate[required]"></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">退出原因：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield id="tcyy" name="zbhcyxxBean.tcyy"  cssStyle="width:92%" 
							 	cssClass="validate[required]" value="${zbhcyxxBean.tcyy }" ></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="zbhcyxxBean.djrxm" cssStyle="width:80%" 
								 value="${loginInfo.realname}" readonly="true"></cps:textfield>
							<input type="hidden" id="djrjh" name="zbhcyxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="zbhcyxxBean.djsj"  cssStyle="width:80%" 
								 value="${zbhcyxxBean.djsj}" 
								 readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djdwmc" name="zbhcyxxBean.djdwmc" cssStyle="width:80%" 
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="zbhcyxxBean.djdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
</creator:view>