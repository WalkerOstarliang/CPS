<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/ldrktj.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			Zqorgcode('','');
		})
	</script>
	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="Zqorgcode('','');"></cps:button>
			<cps:button value="导出" onclick="exportLdrkTjxx();"></cps:button>
			<cps:button value="重置" onclick="chongzhi();"></cps:button>
		</creator:tbar>
		<creator:panel id="ddd" title="流动人口查询" tbarId="op">
			<form id="queryldrktj">
				<input type="hidden" id ="orgcode" name = "queryBean.orgcode" value="${loginInfo.orgcode}">
				<input type="hidden" id ="leve" name = "queryBean.leve" value="${loginInfo.leve}">
				
				<input type="hidden" id ="moveLeve" >
				
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">户籍地区划：</cps:tdLabel>
						<cps:tdContent width="23%">
							<input type="hidden" id="hjdqh" name="queryBean.hjdqh">
							<cps:textfield id="hjdqhmc" appendPopuBtn="true" onclick="openSelectXzqh('0',callbackHjdqh)"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">民族：</cps:tdLabel>
						<cps:tdContent width="23%">
							<cps:select id = "mz" zdlb="GB_MZ" name="queryBean.mz" headerKey="" headerValue=" " ></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:40%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}" ></cps:date>-
							<cps:date id="djsj_end"   cssStyle="width:40%" minDateDepend="djsj_start"  name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<div id ="bgdiv" >
		</div>
		<div style="display:none">
			<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
		</div>
	</creator:box>
</creator:view>	