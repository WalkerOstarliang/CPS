<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
<style type="text/css"> 
	.tox36 {
		border-collapse: collapse;
		margin: 0px auto;
	}
	 
	.tox36 td {
		border: 1px solid #528fc8;
		padding: 2px 5px;
		height: 30px;
		font-size: 12px;
	}
	 
	.tox36 td.td1 {
		color: #4d4d4d;
		text-align: right;
		background-color: #F3F8FC;
	}
	 
	.tox36 td.td2 {
		color: #4d4d4d;
	}
	 
	.tox36 td.td3 {
		background-color: #eff9f9;
		text-align: center;
		font-size: 16px;
		font-weight: bold;
		letter-spacing: 5px;
	}
</style>
	<center>
		<h1 style="color: #c30; margin: 20px;">${ajxxBean.anjianmingcheng }</h1>
	</center>
	<table width="90%" cellpadding="1" cellspacing="0" class="tox36">
		<tr>
			<td colspan="4" class="td3">
				案件信息
			</td>
		</tr>
		<tr>
			<td class="td1" width="15%">
				案件编号：
			</td>
			<td width="35%">
				${ajxxBean.anjianbianhao }
			</td>
			<td class="td1" width="15%">
				案件名称：
			</td>
			<td width="35%">
				${ajxxBean.anjianmingcheng }
			</td>
		</tr>
		<tr>
			<td class="td1">
				案件类别：
			</td>
			<td>
				${ajxxBean.anjianleibiems }
			</td>
			<td class="td1">
				案件性质：
			</td>
			<td>
				
			</td>
		</tr>
		<tr>
			<td class="td1">
				案件来源：
			</td>
			<td>
				 
			</td>
			<td class="td1">
				案件状态：
			</td>
			<td>
				 
			</td>
		</tr>
		<tr>
			<td class="td1">
				立案日期：
			</td>
			<td>
				${ajxxBean.lianriqi }
			</td>
			<td class="td1">
				立案类型：
			</td>
			<td>

			</td>
		</tr>
		 
		<tr>
			<td class="td1">
				发案开始时间：
			</td>
			<td>
				${ajxxBean.faanshijiankaishi }
			</td>
			<td class="td1">
				发案结束时间：
			</td>
			<td>
				${ajxxBean.faanshijianjieshu }
			</td>
		</tr>
		 <tr>
		 	<td class="td1">
				报案时间：
			</td>
			<td>
				${ajxxBean.baoanriqi }
			</td>
			<td class="td1">
				发案社区：
			</td>
			<td >
				${ajxxBean.faanshequms }
			</td>
		</tr>
		<tr>
			<td class="td1">
				简要案情：
			</td>
			<td colspan="3" style="padding-right: 20px; text-indent: 20px;">
				${ajxxBean.jianyaoanqing }
			</td>
		</tr>
		 
		<tr>
			<td colspan="4" class="td3">
				作案规律
			</td>
		</tr>
		<tr>
			<td class="td1">
				涉案金额：
			</td>
			<td>

			</td>
			<td class="td1">
				案发场所：
			</td>
			<td>

			</td>
		</tr>
		<tr>
			<td class="td1">
				选择处所：
			</td>
			<td>

			</td>
			<td class="td1">
				作案手段：
			</td>
			<td>

			</td>
		</tr>
		<tr>
			<td class="td1">
				作案工具：
			</td>
			<td>

			</td>
			<td class="td1">
				选择物品：
			</td>
			<td>

			</td>
		</tr>
		<tr>
			<td class="td1">
				选择时机：
			</td>
			<td colspan="3">
			</td>
		</tr>
	</table>
</creator:view>
