<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:box>
	<creator:panel id="aaaa" title="安防管理>卡口信息登记">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">卡口名称：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield id="aa" name="adfaf" value="${contextPath}"></cps:textfield>
			    	<cps:button value="选择"></cps:button>
				</cps:tdContent>
				<cps:tdLabel width="10%">建立日期：</cps:tdLabel>
				<cps:tdContent width="15%">
					<cps:date id="1aa" name="aa" dateFmt="yyyy-MM-dd" cssClass="cps-input"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="10%">卡口类型：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="11" name="bb" zdlb="GB_XZQH" cssClass="cps-input" value="620525"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>字典显示：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:dicText zdlb="GB_XZQH" dm="620525"></cps:dicText>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6" align="center">
					 <cps:button value="查&nbsp;询"></cps:button>
	 				 <cps:button value="高级查询"></cps:button>	
				</cps:tdContent>
			</cps:row>
		</cps:table>
		
		</creator:panel>
		  <creator:tbar>
		  		<cps:button value="新&nbsp;增"></cps:button>
		  		<cps:button value="批量删除"></cps:button>
		  </creator:tbar>
		  <cps:tableGrid id="mysss" 
					pageSize="15"
					usepager="true"
					searchform="searchform"
					autothead="true"
					url="/test/queryTestData.action" 
					mutilSelect="false"
					autoload="false"
					>
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="姓名" field="sss" ></cps:column>
			<cps:column title="用户名" field="username"></cps:column>
			<cps:column title="回调函数测试" field="aaa" ></cps:column>
			<cps:column title="籍贯" field="jg"></cps:column>
			<cps:column title="操作" field="cz" expand="false"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
