<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<script type="text/javascript">
		function queryList()
		{
			$("#pcstablegrid").query("F","queryForm");
		}
		
		function exportPcsjbqkList()
		{
			$("#queryForm").attr("target","_blank");
			$("#queryForm").attr("action",contextPath + "/tjbb/exportPcsjbqkList.action");
			$("#queryForm").submit();
		}
	</script>
	<creator:box>
		<form id="queryForm" method="post">
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="查询" onclick="queryList();"></cps:button>
					<cps:button value="导出" onclick="exportPcsjbqkList()"></cps:button>
				</cps:tbar>
				<cps:panel title="派出所情况查询">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="10%">市局：</cps:tdLabel>
							<cps:tdContent width="23%">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="pcstjQueryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</cps:tdContent>
							<cps:tdLabel width="13%">县区局：</cps:tdLabel>
							<cps:tdContent width="23%">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="pcstjQueryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</cps:tdContent>
							<cps:tdLabel width="10%">派出所：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="pcstjQueryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="queryList()"></s:select>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel width="13%">是否完善信息：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'1':'是','0':'否'}" name="pcstjQueryBean.sfwsxx" headerKey=" " headerValue=" " cssClass="cps-select"></s:select>
							</cps:tdContent>
							<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
							<cps:tdContent>
								&nbsp;
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
		
		<cps:tableGrid id="pcstablegrid"  width="100%"
				url="/tjbb/queryPcsJwqJbqkListPageResult.action" 
				searchform="queryForm"
				mutilSelect="false"
				pageSize="20"
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="orgname" title="单位名称" maxlength="15" width="100"></cps:column>
			<cps:column field="pcsszxm" title="所长姓名" width="70"></cps:column>
			<cps:column field="jbms" title="级别" width="40"></cps:column>
			<cps:column field="lbms" title="派出所类别" width="70"></cps:column>
			<cps:column field="djms" title="派出所等级" width="40"></cps:column>
			<cps:column field="rjgyjfbz" title="人均公用经费保障(万)"></cps:column>
			<cps:column field="sjbfdw" title="实际拨付到位(万)"></cps:column>
			<cps:column field="xqmj" title="辖区面积(㎡)"></cps:column>
			<cps:column field="qcs" title="汽车(辆)"></cps:column>
			<cps:column field="dnts" title="电脑(台)"></cps:column>
			<cps:column field="djzbs" title="单警装备(套)"></cps:column>
			<cps:column field="fdtks" title="防弹头盔(套)"></cps:column>
			<cps:column field="fdbxs" title="防弹背心(套)"></cps:column>
			<cps:column field="fcbxs" title="防刺背心(套)"></cps:column>
			<cps:column field="jls" title="警力数" maxlength="8"></cps:column>
			<cps:column field="fjs" title="辅警数" maxlength="8"></cps:column>
			<cps:column field="sqs" title="社区数" maxlength="8"></cps:column>
			<cps:column field="sqjwss" title="建立警务室数"></cps:column>
			<cps:column field="sqmjs" title="社区民警数" maxlength="8"></cps:column>
			<cps:column field="zcmjs" title="驻村民警数" maxlength="8"></cps:column>
			<cps:column field="sqmjpbfjs" title="社区民警配备辅警数"></cps:column>
			<cps:column field="ncjwss" title="农村警务室数"></cps:column>
			<cps:column field="hjrks" title="户籍人口数"></cps:column>
			<cps:column field="zzrks" title="流动人口数"></cps:column>
			<cps:column field="zddxs" title="重点人员数"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>