<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
		function queryList(){
			$("#lsjzxxlist2").query("F","queryForm");
		}
	</script>
	<creator:panel id="ryjzxxcx"  title="人员历史居住查询">
		<form id="queryForm">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">身份证号：</cps:tdLabel>
					<cps:tdContent width="88%" colspan="5">
						<cps:textfield id="sfzh" name="queryBean.sfzh" onkeyup="this.value=this.value.replace('x','X');" cssStyle="width:20%"></cps:textfield>
						<cps:button value="查询" onclick="queryList();"></cps:button>
					</cps:tdContent>
				</cps:row>			
			</cps:table>
		</form>
	</creator:panel>
	<cps:tableGrid id="lsjzxxlist2"
					url="/lsgl/rk/queryRkFwglInfoPageByRybh.action"
				    width="99.5%" 
				    title="历史居住信息列表"
					pageSize="10" 
					autoload="false"
					searchform="queryForm"
		>
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="姓名" field="xm"></cps:column>
		<cps:column title="身份证号" field="sfzh"></cps:column>
		<cps:column title="性别" field="xbms"></cps:column>
		<cps:column title="人员类别" field="rylbms"></cps:column>
		<cps:column title="居住地址" field="dzmc" align="left" maxlength="15"></cps:column>
		<cps:column title="联系方式" field="lxdh"></cps:column>
		<cps:column title="居住时间" field="djsj"></cps:column>
		<cps:column title="注销时间" field="zxsj"></cps:column>
		<cps:column title="登记单位" field="djdwmc" maxlength="5" align="left"></cps:column>
		<cps:column title="注销标识" field="zxbsms"></cps:column>
	</cps:tableGrid>

</creator:view>