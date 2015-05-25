<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:tbar id="tbar">
	<cps:button id="addbtn" value="新&nbsp;增" onclick="openXzqhInfoNew('add')"></cps:button>
</creator:tbar>
<creator:panel id="listpanel" title="行政区划列表" tbarId="tbar">
	<form id="hiddenform">
		<input type="hidden" id="currentlistgrid" value="">
		<input type="hidden" id="rootParentDm" name="rootParentDm" value="">
		<input type="hidden" id="leve" name="leve" value="${leve }">
	</form>
	<div id="onediv" style="display: none">
		<cps:tableGrid id="onelistgrid" 
	 				url="/xtgl/xzqh/queryHnxzqhPageResult.action" 
	 				autoload="false"
	 				width="99%"
	 				usepager="false"
	 				mutilSelect="true"
	 				searchform="hiddenform">
	 		<cps:column isNumber="true" title="序号"></cps:column>
	 		<cps:column title="代码" field="dm"></cps:column>
	 		<cps:column title="简称" field="jc"></cps:column>
	 		<cps:column title="状态" field="zt" rowcallback="ztRowCall"></cps:column>
	 		<cps:column title="操作" field="cz" rowcallback="czRowCall"></cps:column>
	 	</cps:tableGrid>
	</div>
	<div id="twodiv" style="display: none">
	 	<cps:tableGrid id="twolistgrid" 
	 				url="/xtgl/xzqh/queryHnxzqhPageResult.action" 
	 				autoload="false"
	 				width="99%"
	 				usepager="false"
	 				mutilSelect="true"
	 				searchform="hiddenform">
	 		<cps:column isNumber="true" title="序号"></cps:column>
	 		<cps:column title="代码" field="dm"></cps:column>
	 		<cps:column title="简称" field="jc"></cps:column>
	 		<cps:column title="状态" field="zt" rowcallback="ztRowCall"></cps:column>
	 		<cps:column title="操作" field="cz" rowcallback="czRowCall"></cps:column>
	 	</cps:tableGrid>
 	</div>
	<div id="otherdiv">
	 	<cps:tableGrid id="otherlistgrid" 
	 				url="/xtgl/xzqh/queryHnxzqhPageResult.action" 
	 				autoload="false"
	 				width="99%"
	 				usepager="false"
	 				mutilSelect="true"
	 				searchform="hiddenform">
	 		<cps:column isNumber="true" title="序号"></cps:column>
	 		<cps:column title="代码" field="dm"></cps:column>
	 		<cps:column title="简称" field="jc"></cps:column>
	 		<cps:column title="管辖派出所" field="sspcsmc" maxlength="10"></cps:column>
	 		<cps:column title="管辖警务区" field="gxsqjwsmc" maxlength="10"></cps:column>
	 		<cps:column title="状态" field="zt" rowcallback="ztRowCall"></cps:column>
	 		<cps:column title="操作" field="cz" rowcallback="czRowCall"></cps:column>
	 	</cps:tableGrid>
 	</div>
 	
 	<div id="gbdiv" style="display:none;">
 		<form id="queryform">
			<input id="sqbh" type="hidden" name="queryBean.sqdm" />
			<input id="jc" type="hidden" />
			<input id="lx" type="hidden" name="queryBean.lx" value="3" />
		</form>
 	
	 	<creator:tbar id="sqjbxxtar">
			<cps:button value="新增干部"  onclick="openSqgbDetailInfo('add','')"></cps:button>
			<cps:button value="删除干部" onclick="batchDeleteGbxx()"></cps:button>
		</creator:tbar>
		<cps:tableGrid id="xldquerylist"  
					title="&nbsp;乡镇/街道干部列表"
					mutilSelect="true" 
					tbarId="sqjbxxtar"
					width="99.7%"
					url="/afgl/sqgbgl/querySqgbPageResult.action" 
					searchform="queryform">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="cz" title="操作" rowcallback="sqgbczRowCallback"></cps:column>
			<cps:column field="gbxm" title="姓名"></cps:column>
			<cps:column field="gbsfzh" title="身份证号"></cps:column>
			<cps:column field="gbxbmc" title="性别"></cps:column>
			<cps:column field="gbxzdxz" title="住址" align="left" maxlength="10"></cps:column>
			<cps:column field="gbzwmc" title="职务" maxlength="5"></cps:column>
		</cps:tableGrid>
 	</div>
</creator:panel>
<div id="sqjbxxdiv" style="display: none">
	<iframe id="sqjbxxiframe" src="" width="100%" frameborder="01"></iframe>
</div>