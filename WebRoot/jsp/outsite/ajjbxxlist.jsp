<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
<script type="text/javascript">
	function queryList()
	{
		$("#rktablegrid").query("F","queryForm");
	}
	function clickAjxxDetail(trobj,rowdata)
	{
		$.openWindow({
			url : contextPath + "/schedule/toAjxxDetail.action?queryBean.id=" + rowdata["id"],
			width:1000,
			height:800
		})
	}
	
	function selectOrg(){
		var parent_code = "${loginInfo.orgcode}";
		var userLeve = "${loginInfo.leve}";
		if(userLeve == "1"){
			parent_code = parent_code.substring(0,2) + "0000000000";
		}else if(userLeve == "2"){
			parent_code = parent_code.substring(0,4) + "00000000";
		}else if(userLeve == "3"){
			parent_code = parent_code.substring(0,6) + "000000";
		}else if(userLeve == "4"){
			parent_code = parent_code.substring(0,8) + "0000";
		}
		
		
		openDwSelect2({
			rootOrgCode : parent_code ,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					if(orgbeans.ispcs !="1"){
						alert("请选择派出所.");
						$("#fapcsmc").val("");
						$("#fapcs").val("");
						return;
					}else{
						$("#fapcs").val(orgbeans.id);
						$("#fapcsmc").val(orgbeans.name);
					}
				}
			});
	}
	
	
	function selectSq(){
		$.openDialogWindow({
		url : contextPath + "/afgl/sqjbgl/toOpenSqListSelectWin.action",
		width : 900,
		height : 500,
		data : {
			t: new Date().getTime()
		},
		callback : function(sqjbxxBean)
		{
			if (sqjbxxBean)
			{
				//行政社区
				$("#fasq").val(sqjbxxBean.sqbh);
				$("#fasqmc").val(sqjbxxBean.sqmc);
			}
		}
	});
	}
	
	function clearSq(){
		$("#fasqmc").val("");
		$("#fasq").val("");
	}
	
	function clearPcs(){
		$("#fapcsmc").val("");
		$("#fapcs").val("");
	}
	
	
</script>
<creator:box>
	<form id="queryForm">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="queryList()"></cps:button>
				<cps:button value="重置" onclick="reset()"></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="案件信息查询" >
				<cps:table>
					<cps:row>
						<cps:tdLabel width="9%">案件编号：</cps:tdLabel>
						<cps:tdContent width="25%">
							 <cps:textfield id="ajbh" name="queryBean.ajbh" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">案件名称：</cps:tdLabel>
						<cps:tdContent width="25%">
							 <cps:textfield id="ajmc" name="queryBean.ajmc" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>派出所：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="fapcsmc"  appendPopuBtn="true" readonly="true" onclick="selectOrg()" cssStyle="width:70%"></cps:textfield>
							 <input type="hidden" name="queryBean.fapcs" id="fapcs" />
							 <cps:button value="清空" onclick="clearPcs()"></cps:button>
						</cps:tdContent>
						
						<cps:tdLabel>发案社区：</cps:tdLabel>
						<cps:tdContent >
							 <cps:textfield id="fasqmc" appendPopuBtn="true" readonly="true" onclick="selectSq()" cssStyle="width:70%"></cps:textfield>
							 <input type="hidden" name="queryBean.fasq" id="fasq" />
							 <cps:button value="清空" onclick="clearSq()"></cps:button>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>案件类别：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="DXF_AJLB" id="ajlb" name="queryBean.ajlb" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent >
							&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
	
		<cps:tableGrid id="rktablegrid"  
			title="案件信息列表"
			url="/schedule/queryAjjbxxListPageInfo.action" 
			searchform="queryForm"
			click="clickAjxxDetail"
			mutilSelect="true"
			autoload="true"
			width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="anjianbianhao" title="案件编号" ></cps:column>
			<cps:column field="anjianmingcheng" title="案件名称" align="left"></cps:column>
			<cps:column field="anjianleibiems" title="案件类别"></cps:column>
			<cps:column field="jianyaoanqing" title="简要案情" align="left" maxlength="20"></cps:column>
		</cps:tableGrid>
</creator:box>
</creator:view>