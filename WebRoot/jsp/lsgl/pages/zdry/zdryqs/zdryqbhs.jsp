<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 重点人员取保候审信息 --%>
<creator:view>
	<cps:panel title="取保候审">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="15%">案件名称：</cps:tdLabel>
				<cps:tdContent width="18%">&nbsp;${zdry.qbhs.anjianmingcheng}</cps:tdContent>
				
				<cps:tdLabel width="15%">案件编号：</cps:tdLabel>
				<cps:tdContent width="18%">&nbsp;${zdry.qbhs.anjianbianhao}</cps:tdContent>
				
				<cps:tdLabel width="15%">涉嫌罪名：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.shexianzuiming}</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>取保原因：</cps:tdLabel>
				<cps:tdContent colspan="5">&nbsp;${zdry.qbhs.qubaoyuanyin}</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>保证金数额：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzjshuee}</cps:tdContent>
				
				<cps:tdLabel>保证金期限：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzjqixian}</cps:tdContent>
				
				<cps:tdLabel>保证金银行：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzjyinhang}</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>保证人姓名：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzrxingming}</cps:tdContent>
				
				<cps:tdLabel>保证人性别：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.xbmc}</cps:tdContent>
				
				<cps:tdLabel>保证人年龄：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzrnianling}</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>保证人身份证：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzrhaoma}</cps:tdContent>
				
				<cps:tdLabel>保证人联系电话：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzrphone}</cps:tdContent>
				
				<cps:tdLabel>与保证人关系：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzrguanxi}</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>保证人工作单位：</cps:tdLabel>
				<cps:tdContent>&nbsp;${zdry.qbhs.bzrdanwei}</cps:tdContent>
				
				<cps:tdLabel>保证人住址：</cps:tdLabel>
				<cps:tdContent colspan="3">&nbsp;${zdry.qbhs.bzrzhuzhi}</cps:tdContent>
			</cps:row>
		</cps:table>
	</cps:panel>
</creator:view>