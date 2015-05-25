<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
	<script type="text/javascript">
	  //居住证延期
		function jzzyq(){
			var selectes = $("#jzztablegrid").getSelected();
			if (selectes.length == 0)
			{
				alert("请选择要延期的居住证记录");
				return false;
			}
			if (selectes.length >1)
			{
				alert("只能选择其中一条居住证记录延期");
				return false;
			}
			var jzzzxbs = selectes[0]["jzzzxbs"];
			if(jzzzxbs == 1){
				alert("只能对有效的居住证记录延期");
				return false;
			}
			if (confirm("该人已经办理居住证，是否确定要延期?")){
				var rybh = selectes[0]["jzzrybh"];
				var zzbh = selectes[0]["zzbh"];
				$.openWindow({
					name : "jzzxxWin",
					url : contextPath + "/lsgl/jzzxx/toYqJzzxxPage.action",
					width:1000,
					height:600,
					data : 
					{
						"bean.jzzrybh":rybh,
						"zzbh":zzbh
					}
				});
			}
		}
	</script>
	<creator:box>
	<div class="Noprint">
		<form id="queryForm">
			<creator:tbar id="jzztooltbar">
				<cps:button value="查询" onclick="queryList();"></cps:button>
				<cps:button value="导出" onclick="downloadJzz()"></cps:button>
				<cps:button value="重置" onclick="reset()"></cps:button>
				<cps:button value="首次打印" onclick="openPreviewNone('1')"></cps:button>
				<cps:button value="遗失补打" onclick="openPreviewNone('2')"></cps:button>
				<cps:button value="错证重打" onclick="openPreviewNone('3')"></cps:button>
				<cps:button value="居住证延期" onclick="jzzyq()"></cps:button>
			</creator:tbar>
			<creator:panel id="jzzxxquerypanel" title="居住证信息查询" tbarId="jzztooltbar">
					<input type="hidden" name="queryBean.leve" value="${loginInfo.leve}">
					<input type="hidden" name="queryBean.orgcode" value="${loginInfo.orgcode}">
				<cps:table>
					<cps:row>
						<cps:tdLabel  width="10%">市局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
								</c:when>
								<c:otherwise>
										<s:hidden name="queryBean.pcsdm"></s:hidden>
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>状态：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_JZZ_DYZT" id="dyzt" name="queryBean.dyzt" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >身份证号码：</cps:tdLabel>
						<cps:tdContent >
							 <cps:textfield id="jzzsfzh" name="queryBean.jzzsfzh"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>性别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="GB_XB" id="xb" name="queryBean.xb" value="${queryBean.xb}" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel >出生日期：
						</cps:tdLabel>
						<cps:tdContent id="birthContent">
							<cps:date id="csrq_start" cssStyle="width:40%" name="queryBean.csrq_start" dateFmt="yyyy-MM-dd"></cps:date>-
							<cps:date id="csrq_end"   cssStyle="width:40%" name="queryBean.csrq_end" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >年龄段：</cps:tdLabel>
						<cps:tdContent id="ageContent"  >
							<cps:textfield id="age_start" cssStyle="width:40%" name="queryBean.age_start"  inputType="integer" onblur="minAge(this.value)" maxlength="2"></cps:textfield>-
							<cps:textfield id="age_end"   cssStyle="width:40%" name="queryBean.age_end" inputType="integer" onblur="maxAge(this.value)" maxlength="2"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>签发日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="fzrq_start" cssStyle="width:40%" name="queryBean.fzrq_start" dateFmt="yyyy-MM-dd"></cps:date>-
							<cps:date id="fzrq_end"   cssStyle="width:40%" name="queryBean.fzrq_end" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel >打印状态：</cps:tdLabel>
						<cps:tdContent >
							 <cps:select zdlb="ZDY_JZZDYZT" id="jzzdyzt" name="queryBean.jzzdyzt" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>是否有照片：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="ywzp" list="#{'':' ','1' : '有照片','0':'无照片'}" name="queryBean.ywzp" cssClass="cps-select"/>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent >
							 <cps:select zdlb="ZDY_ZXBS" id="jzzzxbs" name="queryBean.jzzzxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>
								&nbsp;					
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6">
							<font color="red">
								注意：居住证如果已经"首次打印"后，将不能再"首次打印"，只能"遗失补打"或者"错证重打"，已经的注销的居住证不能再进行制证,
								还未制证的居住证信息不能进行"遗失补打"或者"错证重打".<br/>
								特别注意:只要点击了“首次打印”、“遗失补打”、“错证重打” 按钮，选择的数据状态就会发生变化。
							</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</creator:panel>
			</form>
				<cps:tableGrid id="jzztablegrid"  
					title="居住证信息列表"
					url="/lsgl/jzzxx/queryLdrkJzzxxBeanPageInfo.action" 
					searchform="queryForm"
					mutilSelect="true"
					autoload="false"
					width="99.8%">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="cz" title="操作"></cps:column>
				<cps:column field="xm" title="姓名"></cps:column>
				<cps:column field="sfzh" title="身份证号码"></cps:column>
				<cps:column field="xbms" title="性别"></cps:column>
				<cps:column field="xzzxz" title="现住地址" maxlength="5"></cps:column>
				<cps:column field="hjdxz" title="户籍详址" maxlength="5"></cps:column>
				<cps:column field="yxqxms" title="有效期(年)"></cps:column>
				<cps:column field="dyztms" title="打印状态"></cps:column>
				<cps:column field="jzzdyztms" title="打印标志"></cps:column>
				<cps:column field="zzsj" title="制证时间"></cps:column>
				<cps:column field="jzzzxbsms" title="居住证标识"></cps:column>
				<cps:column field="ldrkzxbsms" title="流口标识"></cps:column>
				<cps:column field="djrxm" title="制证人"></cps:column>
				<cps:column field="dyrxm" title="打印人"></cps:column>
			</cps:tableGrid>
		</div>
	</creator:box>
	<form id="jzzdyform" action="<c:url value='/lsgl/jzzxx/toBatchPrintPage.action'/>" method="post" target="_blank">
		<input type="hidden" id="rybhs" name="rybhs">
		<input type="hidden" id="jzzbhs" name="jzzbhs">
		<input type="hidden" id="hiddendyzt" name="dyzt">
	</form>
	
	<div>
		<iframe name="jjzdcFrame" id="jjzdcFrame" style="display:none" height="0" width="0"></iframe>
	</div>
</creator:view>