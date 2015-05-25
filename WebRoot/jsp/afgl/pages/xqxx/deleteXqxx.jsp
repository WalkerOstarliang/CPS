<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<creator:view title="注销小区信息">
			<creator:panel id="zxxqxx" title="注销小区信息">
			
			<form id="add_xqxx_form" action="${contextPath}/xqxx/addXqxx.action" method="post">
				<input type="hidden" id="xqbh" name="xqxxBean.xqbh" value="${xqxxBean.xqbh }"/>
				<input type="hidden" id="czbs" name="xqxxBean.czbs" value="${xqxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">小区名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">小区地址：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqdz }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">小区负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqfzrxm }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">负责人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqfzrlxdh }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">管理类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.gllx }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">管理模式：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.glms }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">物业公司：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.wygsmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">物业公司负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.wygsfzr }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">负责人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.wygsfzrlxdh }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">大门数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.dms }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">楼栋数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.lds }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">户数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.hs }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">人口数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.rks}&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">单位数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.dws }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">小区面积：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xqmj }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">刑事案件数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xsajs}&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">治安案件数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.zaajs }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">行政案件数：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.xzajs }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">所属居委会：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.ssjwhmc }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">居委会负责人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.jwhfzr }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">负责人联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.jwhfzrlxdh}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">所属警务区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.ssjwsmc}&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">社区民警：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.sqmjxm }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${xqxxBean.jwslxdh}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">建立日期：</cps:tdLabel>
						<cps:tdContent  cssStyle="width:20%">
							${xqxxBean.jlrq }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">撤消日期：</cps:tdLabel>
						<cps:tdContent  cssStyle="width:20%">
							<cps:date id="cxrq" name="xqxxBean.cxrq" dateFmt="yyyy-MM-dd"  value="${xqxxBean.cxrq }"
								cssClass="validate[required] cps-input" cssStyle="width:80%"></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">撤消原因：</cps:tdLabel>
						<cps:tdContent  cssStyle="width:20%">
							<cps:textfield id="cxyy" name="xqxxBean.cxyy" cssClass="validate[required]"
								 value="${xqxxBean.cxyy}"  cssStyle="width:80%"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="xqxxBean.djrxm"
								 value="${loginInfo.realname}" readonly="true" cssStyle="width:80%"></cps:textfield>
							<input type="hidden" id="djrjh" name="xqxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="xqxxBean.djsj"  cssStyle="width:80%"
								 value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djdwmc" name="xqxxBean.djdwmc" cssStyle="width:80%"
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="xqxxBean.djdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="保存" onclick="addXqxx();"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/xqxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>