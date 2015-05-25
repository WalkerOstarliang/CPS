<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="实有单位信息">
	<creator:Script src="/jsp/sydw/js/sydwinfo.js"></creator:Script>
	<script type="text/javascript">
		var savesuccess = "${savesuccess}";
		//禁用上下文菜单
	 	//document.oncontextmenu = function(){return false;}
		$(function(){
			$("#frsfzhm").bind("blur",function(){
				checkLoadFrzjhmInfo();
			});
			if (savesuccess == "true")
			{
				alert("单位基本信息保存成功.");
			}
			else if (savesuccess == "false")
			{
				alert("单位基本信息保存失败，请重新再试.");
			}
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#sydwjbxxpanel").find(":input").attr("disabled","true");
			}
			var operType = $("#operType").val();
			if (operType == "add")
			{
				$("#dwjbxx_dwmc").bind("blur", function(){
					validateDwExists();
				})
			}
		});
	</script>
	<form id="sydwform" action="<c:url value='/sydw/dwgl/submitDwBeanForm.action'/>" method="post">
		<input type="hidden" name="dwBean.isupdatefield" value="true"/>
		<input type="hidden" id="jgbh" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
		<s:hidden id="operType" name="operType"/>
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="tzhybtn" value="特种行业" onclick="clickTzhyBtn()" display="${fn:contains(dwBean.dwjbxx.hylb,'01')}"></cps:button>
				<cps:button id="nbdwbtn" value="内保单位" onclick="clickNbdwBtn()" display="${fn:contains(dwBean.dwjbxx.hylb,'03')}"></cps:button>
				<cps:button id="ggcsbtn" value="公共场所" onclick="clickGgcsBtn()" display="${fn:contains(dwBean.dwjbxx.hylb,'02')}"></cps:button>
				<cps:button id="swfwcsbtn" value="上网服务场所" onclick="clickSwfwcsBtn()" display="${fn:contains(dwBean.dwjbxx.hylb,'05')}"></cps:button>
				<cps:button id="wxpdwbtn" value="危险品单位" onclick="clickWxpdwBtn()" display="${fn:contains(dwBean.dwjbxx.hylb,'04')}"></cps:button>
				<cps:button id="swdwbtn" value="涉外单位" onclick="clickSwdwxxBtn()" display="${fn:contains(dwBean.dwjbxx.hylb,'06')}"></cps:button>
				<cps:button id="savebtn" value="保存" onclick="submitDwBeanForm()" display="${operType !='detail'}"></cps:button>
				
				<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
			</cps:tbar>
			<cps:panel id="sydwjbxxpanel" title="单位基本信息">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>单位名称：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:textfield id="dwjbxx_dwmc" name="dwBean.dwjbxx.dwmc" value="${dwBean.dwjbxx.dwmc}" maxlength="100" required="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">组织机构代码：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:textfield name="dwBean.dwjbxx.dwdm" value="${dwBean.dwjbxx.dwdm}"  maxlength="20" id="dwdm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">营业执照号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.yyzzbh" id="yyzzbh" maxlength="25" value="${dwjbxx.yyzzbh}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>法人证件号码：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.frsfzhm" id="frsfzhm" value="${dwjbxx.frsfzhm}"></cps:textfield>
							<input type="checkbox" id="sfzjy" checked="checked" onclick="changeFrsfrz(this)" title="校验身份证号"/>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>法人姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.frdb" value="${dwBean.dwjbxx.frdb}" required="true" id="frdb" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>法人联系电话：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.frlxdh" value="${dwBean.dwjbxx.frlxdh}" id="frlxdh" isPhone="true" minlength="7" maxlength="15"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>单位类别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="dwlbxl" zdlb="JG_DWLB" name="dwBean.dwjbxx.dwlb" value="${dwBean.dwjbxx.dwlb}" optgroup="true" headerKey="" headerValue=" " required="true"></cps:select>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>单位电话：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.dwdh" value="${dwBean.dwjbxx.dwdh}" id="dwdh" minlength="7" isPhone="true" maxlength="20" required="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>单位传真：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.dwcz" value="${dwBean.dwjbxx.dwcz}" id="dwcz" isPhone="true"  maxlength="30"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>税务登记号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.swdjh" value="${dwBean.dwjbxx.swdjh}" id="swdjh"  maxlength="21"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>开业日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="dwBean.dwjbxx.kyrq" value="${dwBean.dwjbxx.kyrq}" id="dwjbxx_kyrq" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>从业人数(人)：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield inputType="integer" name="dwBean.dwjbxx.cyrs" id="cyrs" value="${dwBean.dwjbxx.cyrs}" maxlength="5"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>注册日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="dwBean.dwjbxx.zcrq" value="${dwBean.dwjbxx.zcrq}" maxDate="sysdate"
								id="zcrq" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>注册资本(万元)：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="zczb" inputType="number" name="dwBean.dwjbxx.zczb" maxlength="9" value="${dwBean.dwjbxx.zczb}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>注册地址：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield  name="dwBean.dwjbxx.zcdz" value="${dwBean.dwjbxx.zcdz}" id="zcdz" maxlength="50"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">外文名称：</cps:tdLabel>
						<cps:tdContent width="21%">
							<cps:textfield name="dwBean.dwjbxx.wwm" value="${dwBean.dwjbxx.wwm}" maxlength="30" id="dwjbxx_dwmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>营业执照发照日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="fzrq" name="dwBean.dwjbxx.fzrq" value="${dwBean.dwjbxx.fzrq}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>营业执照有效期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="yxqx"  name="dwBean.dwjbxx.yxqx" value="${dwBean.dwjbxx.yxqx}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>保密级别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select name="dwBean.dwjbxx.bmjb" value="${dwBean.dwjbxx.bmjb}"
								id="bmjb" headerValue=" " headerKey="" zdlb="ZAGL_BMJB" />
						</cps:tdContent>
						<cps:tdLabel>经营范围：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.dwjbxx.jyfw" value="${dwBean.dwjbxx.jyfw}" id="jyfw" maxlength="100"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="dwBean.dwjbxx.bz" value="${dwBean.dwjbxx.bz}" id="jyfw" maxlength="100"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>重点单位标识：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zddwbs" zdlb="ZAGL_ZDDJ" name="dwBean.dwjbxx.zddwbs" value="${dwBean.dwjbxx.zddwbs}" required="true" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>单位地址：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<input type="hidden" id="dwfwglid" name="dwBean.dwfwglBean.dwfwglid" value="${dwBean.dwfwglBean.dwfwglid}"/>
							<input type="hidden" id="oldfwid" name="dwBean.dwfwglBean.fwid" value="${dwBean.dwfwglBean.fwid}">
							<input type="hidden" id="fwid" name="dwBean.fwBean.fwid" value="${dwBean.fwBean.fwid}"/>
							<input type="hidden" id="dzid" name="dwBean.fwBean.dzid" value="${dwBean.fwBean.dzid}"/>
							<input type="hidden" id="sssqdm" name="dwBean.dwjbxx.sssqdm" value="${dwBean.fwBean.sssq}" />
							<cps:textfield id="dzmc" value="${dwBean.fwBean.dzmc}" name="dwBean.dwjbxx.dwdz" readonly="true" required="true" appendPopuBtn="true" onclick="openDwSelectFwInfoPage()" cssStyle="width:95%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>登记人：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${operType=='add'}">
									<cps:textfield name="dwBean.dwjbxx.djrxm" value="${loginInfo.realname}" id="djrxm" readonly="true" />
								</c:when>
								<c:otherwise>
									<cps:textfield name="dwBean.dwjbxx.djrxm" value="${dwBean.dwjbxx.djrxm}" id="djrxm" readonly="true" />
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${dwBean.dwjbxx.djsj != null}">
									<cps:textfield name="dwBean.dwjbxx.djsj" value="${dwBean.dwjbxx.djsj}" id="djsj" readonly="true"/>
								</c:when>
								<c:otherwise>
									<cps:textfield name="dwBean.dwjbxx.djsj" value="${currentSystemDate}" id="djsj" readonly="true"/>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>登记单位：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${not empty dwBean.dwjbxx.djdwdm}">
									<input type="hidden" name="dwBean.dwjbxx.djdwdm" value="${dwBean.dwjbxx.djdwdm}" />
									<cps:textfield name="dwBean.dwjbxx.djdwmc" value="${dwBean.dwjbxx.djdwmc}" id="djdwmc" readonly="true" />
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwBean.dwjbxx.djdwdm" value="${loginInfo.orgcode}" />
									<cps:textfield name="dwBean.dwjbxx.djdwmc" value="${loginInfo.orgname}" id="djdwmc" readonly="true" />
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="dwBean.dwjbxx.zrdwpcsdm" value="${dwBean.dwjbxx.zrdwpcsdm }">
							<input type="hidden" name="dwBean.dwjbxx.zrdwpcsmc" value="${dwBean.dwjbxx.zrdwpcsmc }">
							<input type="hidden" name="dwBean.dwjbxx.zrmjjh" value="${dwBean.dwjbxx.zrmjjh}">
							<input type="hidden" name="dwBean.dwjbxx.zrmjxm" value="${dwBean.dwjbxx.zrmjxm}">
							<input type="hidden" name="dwBean.dwjbxx.zrmjdh" value="${dwBean.dwjbxx.zrmjdh}">
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<c:choose>
							<c:when test="${empty dwBean.dwjbxx.yxtzj}">
								<cps:tdLabel>注销标识 ：</cps:tdLabel>
								<cps:tdContent>
									<s:select list="#{'0':'正常','1':'注销'}" cssClass="cps-select" id="zxbs"  name="dwBean.dwjbxx.zxbs" value="" onchange="zxChange(this.value)"></s:select>
								</cps:tdContent>
								<cps:tdLabel>注销日期：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="dwBean.dwjbxx.zxrq" id="zxrq" value="${dwBean.dwjbxx.zxrq}" readonly="true"></cps:textfield>
								</cps:tdContent>
								<cps:tdLabel>注销原因：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="dwBean.dwjbxx.zxyy" value="${dwBean.dwjbxx.zxyy}" id="zxyy" maxlength="50"></cps:textfield>
								</cps:tdContent>
							</c:when>
							<c:otherwise>
								<cps:tdLabel>注销标识：</cps:tdLabel>
								<cps:tdContent>
									<input type="hidden" name="dwBean.dwjbxx.zxbs" value="0" />
									<s:select list="#{'0':'正常','1':'注销'}" cssClass="cps-select" id="zxbs"  name="dwBean.dwjbxx.zxbs" disabled="true" value="" onchange="zxChange(this.value)"></s:select>
								</cps:tdContent>
								<cps:tdLabel>注销日期：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="dwBean.dwjbxx.zxrq" id="zxrq" disabled="true" value="${dwBean.dwjbxx.zxrq}" readonly="true"></cps:textfield>
								</cps:tdContent>
								<cps:tdLabel>注销原因：</cps:tdLabel>
								<cps:tdContent>
									<cps:textfield name="dwBean.dwjbxx.zxyy" value="${dwBean.dwjbxx.zxyy}" disabled="true" id="zxyy" maxlength="50"></cps:textfield>
								</cps:tdContent>
							</c:otherwise>
						</c:choose>
					</cps:row>
					<cps:row>
						<cps:tdLabel>单位属性：</cps:tdLabel>
						<cps:tdContent colspan="5" id="dwsx_td">
							<input type="hidden" id="oldhylb" name="dwBean.dwjbxx.oldhylb" value="${dwBean.dwjbxx.hylb}" />
							<c:choose>
								<c:when test="${(empty dwBean.dwjbxx.sfzagl) and (empty dwBean.dwjbxx.sfwjgl) and (empty dwBean.dwjbxx.sfnbgl)}">
									<s:checkboxlist list="hylbList" listKey="dm" listValue="mc" name="dwBean.dwjbxx.hylbs" onclick="changeDwsx(this)"></s:checkboxlist>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwBean.dwjbxx.hylb" value="${dwBean.dwjbxx.hylb}" />
									<s:checkboxlist list="hylbList" listKey="dm" listValue="mc" name="dwBean.dwjbxx.hylbs" onclick="changeDwsx(this)" disabled="true"></s:checkboxlist>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row id="tzhy_1" cssStyle="display:none">
						<cps:tdLabel><font color="red">*</font>特行类别：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="thbh" name="dwBean.tzhy.thbh" value="${dwBean.tzhy.thbh}">
							<cps:select id="thxl" zdlb="ZAGL_THLB" name="dwBean.tzhy.thxl" value="${dwBean.tzhy.thxl}" required="true" optgroup="true" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>经营类别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="jylb" name="dwBean.tzhy.jylb" value="${dwBean.tzhy.jylb}" zdlb="ZDY_JYLB" headerKey="" headerValue=" " />
						</cps:tdContent>
						<cps:tdContent colspan="2">
							<font color="red">说明：特种行业属性</font>
						</cps:tdContent>
					</cps:row>
					<cps:row id="ggcs_1" cssStyle="display:none">
						<cps:tdLabel><font color="red">*</font>场所类别：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="ggcsjlbh" name="dwBean.ggcs.jlbh" value="${dwBean.ggcs.jlbh}">
							<cps:select id="csxl" zdlb="GGCSLB" name="dwBean.ggcs.csxl" value="${dwBean.ggcs.csxl}" optgroup="true" headerKey="" headerValue=" " required="true"></cps:select>
						</cps:tdContent>
						<cps:tdLabel>场所编号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwBean.ggcs.ggcsbh" value="${dwBean.ggcs.ggcsbh}" id="badjh" inputType="onlychar" maxlength="20"/>
						</cps:tdContent>
						<cps:tdContent colspan="2">
							<font color="red">说明：公共场所属性</font>
						</cps:tdContent>
					</cps:row>
					<cps:row id="nbdw_1" cssStyle="display:none">
						<cps:tdLabel><font color="red">*</font>单位类别：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="nbdwbh" name="dwBean.nbdw.nbdwbh" value="${dwBean.nbdw.nbdwbh}">
							<cps:select id="dwxl" zdlb="ZDY_DWFL" name="dwBean.nbdw.dwxl" value="${dwBean.nbdw.dwxl}" optgroup="true" headerKey="" headerValue=" " required="true"></cps:select>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>单位性质：</cps:tdLabel>
						<cps:tdContent>
							<cps:select name="dwBean.nbdw.dwxz" value="${dwBean.nbdw.dwxz}" id="dwxz" required="true" headerValue=" " headerKey="" zdlb="ZAGL_DWXZ"/>
						</cps:tdContent>
						<cps:tdContent colspan="2">
							<font color="red">说明：内保单位属性</font>
						</cps:tdContent>
					</cps:row>
					<cps:row id="wxpdw_1" cssStyle="display:none">
						<cps:tdLabel><font color="red">*</font>危险物品类型：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="wxpdwjlbh" name="dwBean.wxwpdwBean.jlbh" value="${dwBean.wxwpdwBean.jlbh}">
							<cps:select zdlb="ZDY_HWLB" id="hwlb" name="dwBean.wxwpdwBean.hwlb" value="${dwBean.wxwpdwBean.hwlb}" required="true" headerKey="" headerValue="--请选择--"></cps:select>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>动作类别：</cps:tdLabel>
						<cps:tdContent colspan="2">
							<s:checkboxlist list="wxpdwflList" id="dwflchk" name="dwBean.wxwpdwBean.dwfls" listKey="dm" listValue="mc" required="true" labelSeparator="," onchange="changeWxwpdwfl(this)"></s:checkboxlist>
						</cps:tdContent>
						<cps:tdContent>
							<font color="red">说明：危险品单位属性</font>
						</cps:tdContent>
					</cps:row>
					<cps:row id="swfwcs_1" cssStyle="display:none">
						<cps:tdLabel>网吧编号：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="wbjlbh" name="dwBean.swfwcs.jlbh" value="${dwBean.swfwcs.jlbh}">
							<cps:textfield id="wbbh" name="dwBean.swfwcs.wbbh" value="${dwBean.swfwcs.wbbh}" maxlength="25"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>使用IP：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="xsyip"  name="dwBean.swfwcs.xsyip" value="${dwBean.swfwcs.xsyip}" inputType="onlychar"  maxlength="150" cssStyle="width:89%"/>
						</cps:tdContent>
						<cps:tdContent colspan="4">
							<font color="red">说明：上网服务场所属性</font>
						</cps:tdContent>
					</cps:row>
					<c:if test="${operType == 'detail'}">
						<cps:row>
							<cps:tdLabel>管理部门：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<c:choose>
									<c:when test="${dwBean.dwjbxx.sfnbgl=='1'}">
										<input type="checkbox" checked="checked">内保管理&nbsp;
									</c:when>
									<c:otherwise>
										<input type="checkbox">内保管理&nbsp;
									</c:otherwise>
								</c:choose>
								 
								 <c:choose>
								 	<c:when test="${dwBean.dwjbxx.sfxfgl=='1'}">
								 		<input type="checkbox" checked="checked">消防管理&nbsp;
								 	</c:when>
								 	<c:otherwise>
								 		<input type="checkbox">消防管理&nbsp;
								 	</c:otherwise>
								 </c:choose>
								 
							 	 <c:choose>
								 	<c:when test="${dwBean.dwjbxx.sfzagl=='1'}">
								 		<input type="checkbox" checked="checked">治安管理&nbsp;
								 	</c:when>
								 	<c:otherwise>
								 		<input type="checkbox">治安管理&nbsp;
								 	</c:otherwise>
								 </c:choose>
							 
							 	 <c:choose>
								 	<c:when test="${dwBean.dwjbxx.sfzagl=='1'}">
								 		<input type="checkbox" checked="checked">网监部门管理&nbsp;
								 	</c:when>
								 	<c:otherwise>
								 		<input type="checkbox">网监部门管理&nbsp;
								 	</c:otherwise>
								 </c:choose>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>内保单位核签结果：</cps:tdLabel>
							<cps:tdContent colspan="5">
								<c:choose>
									<c:when test="${dwBean.dwjbxx.sfnbgl=='1'}">
										&nbsp;<font color="red">是内保管理</font>
									</c:when>
									<c:when test="${dwBean.dwjbxx.sfnbgl=='0'}">
										&nbsp;<font color="red">非内保管理</font>
									</c:when>
									<c:otherwise>
										&nbsp;<font color="red">内保管理未核签</font>
									</c:otherwise>
								</c:choose>
							</cps:tdContent>
						</cps:row>
					</c:if>
					<cps:row>
						<cps:tdContent colspan="6">
							<input type="hidden" id="swdwjlbh" name="dwBean.swdwBean.jlbh" value="${dwBean.swdwBean.jlbh}">
							<input type="hidden" id="thlgylgbh" name="dwBean.thlgy.lgbh" value="${dwBean.thlgy.lgbh}">
							<input type="hidden" id="swdwjlbh" name="dwBean.thksyBean.ksbh" value="${dwBean.thksyBean.ksbh}">
							<%-- 内保管理--%>
							<input type="hidden" id="sfnbgl" name="dwBean.dwjbxx.sfnbgl" value="${dwBean.dwjbxx.sfnbgl}"> 
							<%-- 治安管理--%>
							<input type="hidden" id="sfzagl" name="dwBean.dwjbxx.sfzagl" value="${dwBean.dwjbxx.sfzagl}">
							<%-- 网监管理--%>
							<input type="hidden" id="sfwjgl" name="dwBean.dwjbxx.sfwjgl" value="${dwBean.dwjbxx.sfwjgl}">
							<%-- 消防管理--%>
							<input type="hidden" id="sfxfgl" name="dwBean.dwjbxx.sfxfgl" value="${dwBean.dwjbxx.sfxfgl}">
							
							<input type="hidden" id="dwfl" name="dwBean.dwjbxx.dwfl" value="${dwBean.dwjbxx.dwfl}">
							
							<font color="red">注意：单位基本信息发生变动后请注意保存.</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
	<creator:tbar id="cyrydjtbar">
		<cps:button id="cyrybtn" value="从业人员登记" onclick="clickDwInfoCyryDjBtn()" display="${operType !='detail'}"></cps:button>
		<cps:button id="cyrybatchbtn" value="从业人员批量导入" onclick="openImportCyryXls('${dwBean.dwjbxx.jgbh}')" display="${operType !='detail'}"></cps:button>
	</creator:tbar>
	<form id="queryCyryForm">
		<input type="hidden" name="cyrycx.jgbh" value="${dwBean.dwjbxx.jgbh}">
		<input type="hidden" name="cyrycx.zxbs" value="0">
		
	</form>
	<cps:tableGrid id="cyryList" title="从业人员列表" tbarId="cyrydjtbar"
			url="/zagl/dw/queryCyryListByJgbh.action"
			autoload="true"
			width="99.8%"
			mutilSelect="false"
			searchform="queryCyryForm"
			pageSize="10" 
			usepager="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true" expand="false"></cps:column>
		<cps:column title="操作" field="cz"></cps:column>
		<cps:column title="国籍" field="gjms"></cps:column>
		<cps:column title="证件类型" field="zjzlms"></cps:column>
		<cps:column title="证件号码" field="zjhm"></cps:column>
		<cps:column title="姓名" field="xmms" align="left"></cps:column>
		<cps:column title="性别" field="xbmc" align="left"></cps:column>
		<cps:column title="工作单位" field="dwmc" align="left" maxlength="10"></cps:column>
		<cps:column title="登记时间" field="djsj" maxlength="8"></cps:column>
		<cps:column title="注销标识" field="zxbs_mc" align="left"></cps:column>
	</cps:tableGrid>
</creator:view>