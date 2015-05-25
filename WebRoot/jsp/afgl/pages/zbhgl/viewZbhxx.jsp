<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="查看治保会信息">
		<creator:panel id="viewzbhxxpanel" title="查看治保会信息">
			<form id="add_zbhxx_form" action="${contextPath}/zbhxx/addZbhxx.action" method="post">
				<input type="hidden" id="zbhbh" name="zbhxxBean.zbhbh" value="${zbhxxBean.zbhbh }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">治保会名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.zbhmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所属警务区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.sssqjwmc }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">所属派出所：</cps:tdLabel>
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
					<c:if test="${zxbs eq '1' }">
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">注消时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.zxsj }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">注消原因：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${zbhxxBean.zxyy }
						</cps:tdContent>
					</cps:row>
					</c:if>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.djrxm }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.djsj }
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							${zbhxxBean.djdwmc }
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
			<cps:tableGrid id="zbhcyrxxList" pageSize="20" usepager="true" 
			searchform="add_zbhxx_form" autothead="false" url="/zbhxx/zbhcyxxList.action?zbhbh=${zbhxxBean.zbhbh}"
			mutilSelect="true" autoload="true" width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="姓名" field="xm"></cps:column>
			<cps:column title="性别" field="xbmc"></cps:column>
			<cps:column title="身份证号" field="sfzh"></cps:column>
			<cps:column title="治保会" field="zbhmc"></cps:column>
			<cps:column title="参加日期" field="cjrq"></cps:column>
			<cps:column title="退出标识" field="tcbsmc"></cps:column>
		</cps:tableGrid>
		
		</creator:panel>
</creator:view>