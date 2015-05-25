<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
	function downloadlmpcExcel(){					
	    var size = $("#lmpcxxList").getTotalSize();
		var ddcjjbeans = $("#lmpcxxList").getSelected();
		if (ddcjjbeans.length==0 && size == 0){
			alert("请选择要导出的记录");
		}
		if(ddcjjbeans.length==0 && size>5000){
			alert("一次最多只能导出5000条记录");
		}
		
		if(ddcjjbeans.length==0 && size>0 && size <=5000){
			if (confirm("你确定导出满足条件的所有数据吗？"))
				{
					$("#searchform").attr("target","exportiframe");
					$("#searchform").attr("action",contextPath + "/afgl/lmpcxx/downloadlmpcExcel.action");
					$("#searchform").submit();
				}
		}
		if (ddcjjbeans.length >5000){
			alert("一次最多只能导出5000条记录");
		}
		if(ddcjjbeans.length>0 && ddcjjbeans.length <= 5000){
			if (ddcjjbeans.length > 0)
			{
				if (confirm("你确定导出选择的记录吗？"))
				{
					 var v_jlbhs = [];			 			 
					 $.each(ddcjjbeans,function(i){
						 	var ddcjjbean = ddcjjbeans[i];
						 	v_jlbhs.push(ddcjjbean["jlbh"]);	 	
						 });	
					var v_jlbhsstr = v_jlbhs.join(",");
					$("#v_jlbh").val(v_jlbhsstr);	
					
					$("#searchform").attr("target","exportiframe");
					$("#searchform").attr("action",contextPath + "/afgl/lmpcxx/downloadxzlmpcExcel.action");
					$("#searchform").submit();
				 }
			}
			
		}
	};
	</script>
	<creator:box>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/lmpc.js"></script>
		<creator:tbar id="tbar">
			<cps:button value="查&nbsp;询" onclick="queryLmpcxx();"></cps:button>
			<cps:button value="重&nbsp;置" onclick="resetForm()"></cps:button>
			<cps:button value="注&nbsp;销" onclick="zxLmpcxx()"></cps:button>
			<cps:button value="导&nbsp;出" onclick="downloadlmpcExcel()"></cps:button>
		</creator:tbar>
		<creator:panel id="afgllmpcxx" title="路面盘查管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
					<input type="hidden" id="v_jlbh" name="v_jlbh"/>
					<input type="hidden" id="username" value="${loginInfo.username}"/>
				<!-- 	
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="23%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县区局：</cps:tdLabel>
						<cps:tdContent width="23%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.pcsdm"></s:hidden>
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryLmpcxx()" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				 -->	
					<cps:row>
				<!-- 
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
				-->	
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="22%">
							<input type="hidden" name="queryBean.orgcode" id="orgcode" value="${userOrgCode}" />
							<cps:textfield id="orgname" appendPopuBtn="true" value="${userOrgName}" onclick="selectDw('${userOrgCode}','orgcode','orgname')" readonly="true"/>
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查地点：</cps:tdLabel>
						<cps:tdContent width="22%">
						<!--  
							<cps:textfield id="pcdd" name="queryBean.pcdd"></cps:textfield>
						-->	
							<input id="pcdd" name="queryBean.pcdd" type="text" class="cps-input"/>
						</cps:tdContent>
						<cps:tdLabel width="12%">修改时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="pcsj_from" name="queryBean.pcsj_from" dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:37%" maxDate="${currentSystemDate}"></cps:date>
							至
							<cps:date id="pcsj_to" name="queryBean.pcsj_to" dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:38%" maxDate="${currentSystemDate}" minDateDepend="pcsj_from"></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>盘查对象：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="pcdxxm" name="queryBean.pcdxxm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>身份证号：</cps:tdLabel>
						<cps:tdContent>
						<!--  
							<cps:textfield id="pcdxsfzh" name="queryBean.pcdxsfzh"></cps:textfield>
						-->	
							<input id="pcdxsfzh" name="queryBean.pcdxsfzh" type="text" class="cps-input"/>
						</cps:tdContent>
						<cps:tdLabel>登记人姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="djrxm" name="queryBean.djrxm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>记录编号：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="queryBean.jlbh" id="jlbh" cssStyle="width:94%" />
						</cps:tdContent>
						
						<cps:tdLabel>有效标识;</cps:tdLabel>
						<cps:tdContent>
							<select name="queryBean.yxx" id ="yxx" class="cps-select">
								<option value="3">所有数据</option>
								<option value ="0">有效数据</option>
								<option value ="1">无效数据</option>
							</select>
						</cps:tdContent>
					</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<!-- 各位，变动列表字段位置或者添加、删减字段的时候一定注意，
	登记人警号，盘查时间不能去动，因为注销功能涉及到这两个字段，且位置变动，
	要修改lmpc.js中的zxLmpcxx()方法中获取警号，和时间相应索引号。 -->
	<cps:tableGrid id="lmpcxxList" title="路面盘查登记列表--(不勾选默认导出查询的全部记录)"
			pageSize="10" usepager="true"
			searchform="searchform" autothead="false"
			url="/afgl/lmpcxx/queryLmpcList.action" 
			width="99.8%"
			autoload="false">
		<cps:column isNumber="true" title="序号" ></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column title="操作"    field="cz" align="left"></cps:column>
		<cps:column title="记录编号" field="jlbh" align="left"></cps:column>
		<cps:column title="被盘查人" field="pcdxxm" align="left"></cps:column>
		<cps:column title="身份证号" field="pcdxsfzh" maxlength="18" align="left"></cps:column>
		<cps:column title="盘查地点" field="pcdd"  maxlength="10" width="8%" align="left"></cps:column>
		<cps:column title="盘查原因" field="pcyyms" maxlength="20" align="left"></cps:column>
		<cps:column title="登记人" field="djrxm" align="left"></cps:column>
		<cps:column title="登记时间" field="xgsj" maxlength="10" width="8%"></cps:column>
		<cps:column title="登记人<br/>警号" field="djrjh" ></cps:column>
		<cps:column title="有效性" field="yxxms" ></cps:column>
		<cps:column title="登记单位" field="djrdwmc" maxlength="10" width="10%" align="left"></cps:column>
	</cps:tableGrid>
	<!-- 各位，变动列表字段位置或者添加、删减字段的时候一定注意，
	登记人警号，盘查时间不能去动，因为注销功能涉及到这两个字段，且位置变动，
	要修改lmpc.js中的zxLmpcxx()方法中获取警号，和时间相应索引号。 -->
	</creator:box>
</creator:view>