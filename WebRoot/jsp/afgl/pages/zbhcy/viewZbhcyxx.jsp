<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="查看治保会成员信息">
			<creator:panel id="head_viewzbhcyxx" title="查看治保会成员信息">
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
							${zbhcyxxBean.tcrq }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">退出原因：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${zbhcyxxBean.tcyy }&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.djrxm }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.djsj }&nbsp;
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhcyxxBean.djdwmc }&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
</creator:view>