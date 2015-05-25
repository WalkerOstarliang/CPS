<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<creator:view width="99.8%">
	<creator:box>
	<creator:Script src="/jsp/gzgl/js/jws.js"></creator:Script>
	<creator:Script src="/jsp/xtgl/js/pcs.js"></creator:Script>
	<creator:Script src="/jsp/gzgl/js/userlxfs.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var countrygajgjgdm = $("#countrygajgjgdm").val();
			var pcsdm = $("#pcsdm").val();
			if((countrygajgjgdm !=null || countrygajgjgdm!="") &&(pcsdm==null || pcsdm ==""))
			{
				doublePcsGajgjgForLkXgy(countrygajgjgdm,'pcsdm');
			}
		})
	</script>
	<form id="hiddenform">
	<input type="hidden" id="fjlb" name="queryBean.fjlb" value="2">
	<input type="hidden" id="loginorgcode" name="loginorgcode" value="${loginInfo.orgcode }">
	<cps:PanelView>
	<cps:tbar>
		<cps:button value="查询" onclick="queryFjList()"></cps:button>
		<cps:button value="重置" onclick="reset()"></cps:button>
		<cps:button value="新增" onclick="addNewXfdy()"></cps:button>
		<cps:button value="添加队友" onclick="addXldydyxx()"></cps:button>
		<cps:button value="导出" onclick="exportLkXgyInfo()"></cps:button>
	</cps:tbar>
	<cps:panel id="fwquerypanel" title="巡防队员查询" >
			<cps:table>
					<cps:row>
						<cps:tdLabel  width="9%">市局：</cps:tdLabel>
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
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjgForLkXgy(this.value,'pcsdm')" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel   width="10%">单位：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')" ></s:select>
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
						<%--
					<cps:row>
						<input id ="leve" name ="queryBean.leve" type="hidden" value="${loginInfo.leve }"/>
						<cps:tdLabel width="10%">所属单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							<input id ="ssdwdm" name="queryBean.ssdwdm" type="hidden" value="${queryBean.ssdwdm }"/>
							<cps:textfield id="ssdwmc" name="queryBean.ssdwmc" appendPopuBtn="true" onclick="selectOrg('${loginInfo.rootOrgCode}')" ></cps:textfield>						
						</cps:tdContent>
						--%>
						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="fjxm" name="queryBean.xm" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <cps:textfield id="zjhm" name="queryBean.zjhm" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
				</cps:row>
				<cps:row>
						<cps:tdLabel width="10%">性别：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <cps:select zdlb="GB_XB" id="xb" name="queryBean.xb"  headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>辅警编号：</cps:tdLabel>
						<cps:tdContent>
								<cps:textfield id="fjjh"  name="queryBean.fjjh "></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="djsj_start" cssStyle="width:40%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>-
						<cps:date id="djsj_end"   cssStyle="width:40%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>	
					<cps:tdLabel>工作岗位</cps:tdLabel>	
					<cps:tdContent>
						<cps:select zdlb="ZDY_LKXGYGW" parentDm="2" id="gzgw" name="queryBean.gzgw" headerKey="" headerValue=" " value="0"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>	
					<cps:tdContent>&nbsp;</cps:tdContent>		
				</cps:row>
			</cps:table>
		</cps:panel>
		</cps:PanelView>
	</form>
	
	<div id="fjList" >
	    <cps:tableGrid id="fjtableList"
	             url="/gzgl/gzjwsgl/queryFjListPageInfoByQueryBean.action"
	             autoload="false"
	             searchform="hiddenform"
	             mutilSelect="true"
	             title="巡防队员列表" 
	             width="99.6%">
	      <cps:column isNumber="true" title="序号"></cps:column>
	      <cps:column isCheckbox="true"></cps:column>
	      <cps:column title="操作" rowcallback="fjCallback" align="left" width="100px"></cps:column>       
	      <cps:column field="fjxm" title="姓名"></cps:column>
	      <cps:column field="xbms" title="性别"></cps:column>
	      <cps:column field="sfzh" title="身份证号码"></cps:column>
	      <cps:column field="fjjh" title="辅警编号"></cps:column>
	      <cps:column field="lxfs" title="联系方式"></cps:column>
	      <cps:column field="cyfjsj" title="从事辅警年限"></cps:column>
	      <cps:column field="ssdwmc" title="所属单位" maxlength="10" align="left"></cps:column>
	      <cps:column field="xldmc" title="所属巡逻队"></cps:column>
	    </cps:tableGrid>
    </div>
	</creator:box>
	<div style="display:none">
		<form id="exportform" target="exportiframe" method="post">
			<input type="hidden" id="ids" name="ids"/>
		</form>
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>