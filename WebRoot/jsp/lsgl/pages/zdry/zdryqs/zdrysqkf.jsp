<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 重点人员社区康复 --%>
<creator:view>
	<cps:panel title="社区康复">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="15%">案件名称：</cps:tdLabel>
				<cps:tdContent width="18%">
					&nbsp;${zdry.sqkf.anjianmingcheng}
				</cps:tdContent>
				
				<cps:tdLabel width="15%">案件编号：</cps:tdLabel>
				<cps:tdContent width="18%">
					&nbsp;${zdry.sqkf.anjianbianhao}
				</cps:tdContent>
				
				<cps:tdLabel width="15%">诉讼机关：</cps:tdLabel>
				<cps:tdContent width="18%">
					&nbsp;${zdry.sqkf.susongjiguan}
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>服役机关：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.sqkf.fuyijiguan}
				</cps:tdContent>
				
				<cps:tdLabel>法律依据：</cps:tdLabel>
				<cps:tdContent colspan="3">
					&nbsp;${zdry.sqkf.zelingyiju}
				</cps:tdContent>
			</cps:row>	
			
			<cps:row>
				<cps:tdLabel>违法事实：</cps:tdLabel>
				<cps:tdContent colspan="5">
					&nbsp;${zdry.sqkf.weifashishi}
				</cps:tdContent>
			</cps:row>	
			
			<cps:row>
				<cps:tdLabel>康复期限：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.sqkf.kangfuqixian}
				</cps:tdContent>
				
				<cps:tdLabel>起始时间：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.sqkf.qishishijian}
				</cps:tdContent>
				
				<cps:tdLabel>终止时间：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.sqkf.zhongzhishijian}
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>执行社区:</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.sqkf.zhixingshequ}
				</cps:tdContent>
				
				<cps:tdLabel>社区地址：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.sqkf.shequdizhi}
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</cps:panel>
</creator:view>