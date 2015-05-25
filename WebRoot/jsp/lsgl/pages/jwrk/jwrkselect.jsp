<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/jwrklist.js"></creator:Script>
	<script type="text/javascript">
		function queryList()
		{
			if ($.isBlank($("#gj").val()) 
				|| $.isBlank($("#zjzl").val()) 
				|| $.isBlank($("#zjhm").val()) 
				|| $.isBlank($("#ywx").val()) 
				|| $.isBlank($("#ywm").val()) 
				|| $.isBlank($("#xb").val()))
			{
				alert("查询之前必须输入所以项[国籍,证件种类,证件号码,英文姓,英文名,性别].");
			}
			else
			{
				$("#rktablegrid").query("F","queryForm",function(){
					$("#oldgj").val($("#gj").val());
					$("#oldzjzl").val($("#zjzl").val());
					$("#oldzjhm").val($("#zjhm").val());
					$("#oldywx").val($("#ywx").val());
					$("#oldywm").val($("#ywm").val());
					$("#oldxb").val($("#xb").val());
					$("#query").val("true");
				});
			}
		}
		
		function openJwrkInfoWin()
		{
			if ($("#query").val() != "true"
			    || $("#gj").val() != $("#oldgj").val()
				|| $("#zjzl").val() != $("#oldzjzl").val()
				|| $("#zjhm").val() != $("#oldzjhm").val()
				|| $("#ywx").val() != $("#oldywx").val()
				|| $("#ywm").val() != $("#oldywm").val()
				|| $("#xb").val() != $("#oldxb").val()
				)
			{
				alert("请先输入条件进行查询");
			}
			else
			{
				var size = $("#rktablegrid").getDataSize();
				if (size <=0)
				{
					$.openWindow({
						name : "jwrkwin",
						url : contextPath + "/lsgl/jwrk/toJwrkInfoPage.action",
						data : {
							"queryBean.fwid" : $("#fwid").val(),
							"queryBean.gj" : $("#oldgj").val(),
							"queryBean.zjzl" : $("#oldzjzl").val(),
							"queryBean.zjhm" : $("#oldzjhm").val(),
							"queryBean.ywm":$("#oldywm").val(),
							"queryBean.ywx":$("#oldywx").val(),
							"queryBean.xb" : $("#oldxb").val(),
							"queryBean.cyrybh" : $("#cyrybh").val()
						},
						width:1000,
						height:800,
						scroll:false
					});
				}
				else if (size > 0)
				{
					alert("境外人口信息已经在辖区内登记，不需要重复登记.")
				}
			}
		}
	</script>
	<creator:box>
		<form id="queryForm">
			<input type="hidden" id="cyrybh" value="${queryBean.cyrybh}">
			<input type="hidden" id="query">
			<input type="hidden" id="oldgj">
			<input type="hidden" id="oldzjzl">
			<input type="hidden" id="oldzjhm">
			<input type="hidden" id="oldywm">
			<input type="hidden" id="oldywx">
			<input type="hidden" id="oldxb">
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="查询" onclick="queryList()"></cps:button>
					<cps:button value="重置" onclick="reset()"></cps:button>
					<cps:button value="返回" onclick="history.go(-1)"></cps:button>
				</cps:tbar>
				<cps:panel id="fwquerypanel" title="境外人员登记查询" >
					<input type="hidden" id="fwid" name="queryBean.fwid" value="${queryBean.fwid}">
					<cps:table>
						<input type="hidden" name="queryBean.leve" value="${loginInfo.leve}">
						<input type="hidden" name="queryBean.orgcode" value="${loginInfo.orgcode}">
						<cps:row>
						 	<cps:tdLabel width="10%">国籍：</cps:tdLabel>
							<cps:tdContent width="22%">
								<c:choose>
									<c:when test="${not empty queryBean.gj}">
										<s:hidden  id="gj" name="queryBean.gj"></s:hidden>
										<cps:select zdlb="GB_GJ"  value="${queryBean.gj}" headerKey="" headerValue=" " disabled="true"></cps:select>
									</c:when>
									<c:otherwise>
										<cps:select zdlb="GB_GJ" id="gj" name="queryBean.gj" value="${queryBean.gj}" headerKey="" headerValue=" "></cps:select>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="10%">证件种类：</cps:tdLabel>
							<cps:tdContent width="22%">
								<c:choose>
									<c:when test="${not empty queryBean.zjzl}">
										<s:hidden id="zjzl" name="queryBean.zjzl"></s:hidden>
										<cps:select zdlb="GB_ZJZL"  value="${queryBean.zjzl}" headerKey="" headerValue=" " disabled="true"></cps:select>
									</c:when>
									<c:otherwise>
										 <cps:select zdlb="GB_ZJZL" id="zjzl" name="queryBean.zjzl" value="${queryBean.zjzl}" headerKey="" headerValue=" "></cps:select>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${not empty queryBean.zjhm}">
										<s:hidden id="zjhm" name="queryBean.zjhm"></s:hidden>
										 <cps:textfield  value="${queryBean.zjhm}" disabled="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										 <cps:textfield id="zjhm" name="queryBean.zjhm" value="${queryBean.zjhm}"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>英文姓：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${not empty queryBean.ywx}">
										<s:hidden id="ywx" name="queryBean.ywx"></s:hidden>
										 <cps:textfield  value="${queryBean.ywx}" disabled="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										 <cps:textfield id="ywx" name="queryBean.ywx" value="${queryBean.ywx}"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel>英文名：</cps:tdLabel>
							<cps:tdContent>
								<c:choose>
									<c:when test="${not empty queryBean.ywm}">
										<s:hidden  id="ywm" name="queryBean.ywm"></s:hidden>
										 <cps:textfield  value="${queryBean.ywm}" disabled="true"></cps:textfield>
									</c:when>
									<c:otherwise>
										 <cps:textfield id="ywm" name="queryBean.ywm" value="${queryBean.ywm}"></cps:textfield>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
							<cps:tdLabel >性别：</cps:tdLabel>
							<cps:tdContent >
								<c:choose>
									<c:when test="${not empty queryBean.xb}">
										<s:hidden id="xb" name="queryBean.xb"></s:hidden>
										<cps:select zdlb="GB_XB"  value="${queryBean.xb}" headerKey="" headerValue=" " disabled="true"></cps:select>
									</c:when>
									<c:otherwise>
										 <cps:select zdlb="GB_XB" id="xb" name="queryBean.xb" value="${queryBean.xb}" headerKey="" headerValue=" "></cps:select>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent colspan="6">
								<font color="red">
									说明：在进行境外人员登记之前请先进行查询，以免重复登记。
								</font>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
	 	<creator:tbar id="jwrkdjtbar">
	 		<cps:button value="境外人口登记" onclick="openJwrkInfoWin()" display="${displayAddBtn}"></cps:button>
	 	</creator:tbar>
		<cps:tableGrid id="rktablegrid" tbarId="jwrkdjtbar"
					title="境外人员列表"
					url="/lsgl/jwrk/queryJwrkPageResultInfo.action" 
					searchform="queryForm"
					mutilSelect="true"
					autoload="false"
					width="99.8%">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="cz" title="操作" align="center"></cps:column>
				<cps:column field="gjms" title="国籍" ></cps:column>
				<cps:column field="ywx" title="英文姓" maxlength="5"></cps:column>
				<cps:column field="ywm" title="英文名" maxlength="5"></cps:column>
				<cps:column field="zjzlms" title="证件种类" ></cps:column>
				<cps:column field="zjhm" title="证件号码" maxlength="7"></cps:column>
				<cps:column field="xbms" title="性别"></cps:column>
				<cps:column field="csrq" title="出生日期"></cps:column>
				<cps:column field="xzzxz" title="现住地" align="left" maxlength="8"></cps:column>
				<cps:column field="lxdh" title="联系电话" maxlength="7"></cps:column>
				<cps:column field="zxbsms" title="注销状态"></cps:column>	
		</cps:tableGrid>
	</creator:box>
</creator:view>