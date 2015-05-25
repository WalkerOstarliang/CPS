<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="注消治保会">
		<creator:panel id="deletezbhxxpanel" title="注消治保会">
			
			<form id="add_zbhxx_form" action="${contextPath}/zbhxx/addZbhxx.action" method="post">
				<input type="hidden" id="zbhbh" name="zbhxxBean.zbhbh" value="${zbhxxBean.zbhbh }"/>
				<input type="hidden" id="czbs" name="zbhxxBean.czbs" value="${zbhxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">治保会名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.zbhmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.sssqjwmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">所在责任区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.sspcsmc }
							</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">责任人姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.zbhfzrxm }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">责任人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.zbhfzrlxdh }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">创建时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.cjsj }
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%"><font color="red">*</font>注消时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="zxsj" name="zbhxxBean.zxsj" dateFmt="yyyy-MM-dd HH:mm:ss"  value="${zbhxxBean.zxsj }"
								cssClass="cps-input validate[required]"></cps:date>
							
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%"><font color="red">*</font>注消原因：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield id="zxyy" name="zbhxxBean.zxyy"  value="${zbhxxBean.zxyy }" 
								cssClass="validate[required]" cssStyle="width:92%"></cps:textfield>
							
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="zbhxxBean.djrxm"
								 value="${loginInfo.realname}" readonly="true"></cps:textfield>
							<input type="hidden" id="djrjh" name="zbhxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="zbhxxBean.djsj" 
								 value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djdwmc" name="zbhxxBean.djdwmc"
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="zbhxxBean.djdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="保存" onclick="addZbhxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/zbhxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>