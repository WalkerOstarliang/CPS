<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 重点人员基本信息 --%>
<cps:table id="rkjbxxtable">
	<cps:row>
		<cps:tdLabel width="12%">姓名：</cps:tdLabel>
		<cps:tdContent width="18%">
			&nbsp;${zdry.jbxx.xingming}
		</cps:tdContent>
		
		<cps:tdLabel width="12%">性别：</cps:tdLabel>
		<cps:tdContent width="18%">
			&nbsp;${zdry.jbxx.xbmc}
		</cps:tdContent>
		
		<cps:tdLabel width="12%">身份证号：</cps:tdLabel>
		<cps:tdContent width="18%">
			&nbsp;${zdry.jbxx.shenfenzhenghao}
		</cps:tdContent>
		
		<cps:tdLabel rowspan="5">
			<div>
				<div style="text-align: center;">
						<img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${zdry.jbxx.shenfenzhenghao}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
				</div>
			</div> 
		</cps:tdLabel>
	</cps:row>
	<cps:row>
		<cps:tdLabel>出生日期：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${zdry.jbxx.chushengriqi}
		</cps:tdContent>
		<cps:tdLabel>年龄：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${zdry.jbxx.nianling}
		</cps:tdContent>
		
		<cps:tdLabel>联系电话：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${zdry.jbxx.lianxidianhua}
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>工作单位：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${zdry.jbxx.gongzuodanwei}
		</cps:tdContent>
		
		<cps:tdLabel> 现住地址：</cps:tdLabel>
		<cps:tdContent colspan="3">
			&nbsp;${zdry.jbxx.zhuzhidizhi}
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>重点人员类型：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${zdry.jbxx.rylxmc}
		</cps:tdContent>
	
		<cps:tdLabel>取保方式：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${zdry.jbxx.qubaofangshi}
		</cps:tdContent>
		
		<cps:tdLabel>取保期限：</cps:tdLabel>
		<cps:tdContent>
			&nbsp;${zdry.jbxx.qubaoqixian}
		</cps:tdContent>
	</cps:row>
</cps:table>
