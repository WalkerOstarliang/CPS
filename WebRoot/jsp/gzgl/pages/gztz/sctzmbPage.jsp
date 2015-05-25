<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/tzmb.js"></script>
	<creator:box>
	<creator:tbar id="tzmbpanel">
		<cps:button value="保存" onclick="submitFormTzmbInfo()"/>
		<cps:button value="新增" onclick="addFjscTr()"/>
		<cps:button value="关闭" onclick="$.closeWindow()"/>
    </creator:tbar>
	<creator:panel id="tzmbpanel" width="99.8%" height="window" title="台账模本信息" tbarId="tzmbpanel">
		<input type="hidden" id="jsppage" value=""/>
		<form method="post" enctype="multipart/form-data" id="tzmbForm">
		<table id="tzmbtable" width="99.8%" class="cps-tablegrid" id="table_lsczrkxxtablegrid" border="0" cellSpacing="0" cellPadding="0">
			<thead>
				<th>附件</th>
				<th>操作</th>
			</thead>
			<tbody>
				<tr class="fjscmode">
					<td>
						<input type="file" name="tzmbUploads" class="cps-file" id="tzmbUploads"/>
					</td>
					<td>
						 <cps:button value="删除" onclick="deleteFjscTr(this)"></cps:button>
					</td>
				</tr>
			</tbody>
		</table>
		</form>	
</creator:panel>
</creator:box>
</creator:view>