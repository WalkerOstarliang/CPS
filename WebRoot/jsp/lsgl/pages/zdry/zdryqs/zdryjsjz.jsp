<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 重点人员监视居住信息 --%>
<creator:view>
	<cps:panel title="监视居住信息">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="15%">案件名称：</cps:tdLabel>
				<cps:tdContent width="18%">
					&nbsp;${zdry.jsjz.anjianmingcheng}
				</cps:tdContent>
				
				<cps:tdLabel width="15%">案件编号：</cps:tdLabel>
				<cps:tdContent width="18%">
					&nbsp;${zdry.jsjz.anjianbianhao}
				</cps:tdContent>
				
				<cps:tdLabel width="15%">涉嫌罪名：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.jsjz.shexianzuiming}
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>法律依据：</cps:tdLabel>
				<cps:tdContent colspan="5">
					&nbsp;${zdry.jsjz.falvyiju}
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>监视地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					&nbsp;${zdry.jsjz.jianshidizhi}
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>监视原因：</cps:tdLabel>
				<cps:tdContent colspan="5">
					&nbsp;${zdry.jsjz.jianshiyuanyin}
				</cps:tdContent>
			</cps:row>	
			
			<cps:row>
				<cps:tdLabel>开始时间：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.jsjz.kaishiriqi}
				</cps:tdContent>
				
				<cps:tdLabel>执行机关：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.jsjz.zhixingjiguan}
				</cps:tdContent>
				
				<cps:tdLabel>家属姓名：</cps:tdLabel>
				<cps:tdContent>
					&nbsp;${zdry.jsjz.jiashuxingming}
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>家属住址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					&nbsp;${zdry.jsjz.jiashuzhuzhi}
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</cps:panel>
</creator:view>