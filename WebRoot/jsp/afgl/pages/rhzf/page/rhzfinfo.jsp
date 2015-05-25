<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 入户走访详细信息页面 --%>
<creator:view>
	<creator:Script src="/jsp/afgl/pages/rhzf/js/rhzfinfo.js"></creator:Script>	
	<form id="rhzfform">
		<cps:PanelView>
			<cps:tbar>
				<c:if test="${!(operType eq 'detail')}">
					<cps:button value="保存" onclick="saveRhzf()"></cps:button>
				</c:if>
				<cps:button value="关闭" onclick="window.close()"></cps:button>
			</cps:tbar>
		
			<cps:panel title="入户走访信息">
				<div id="rhzfpanel">
					<input type="hidden" name="zfxx.id" value="${zfxx.id}" id="id" />
					<input type="hidden" name="zfxx.rhzfry_old" value="${zfxx.rhzfry_old}" id="rhzfry_old" />
					<input type="hidden" name="operType" value="${operType}" id="opertype" />
					<input type="hidden" value="${loginInfo.leve}" id="userLeve" />
					<cps:table>
						<cps:row>
							<cps:tdLabel><span style="color:red">*</span>走访地址：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<s:if test="operType eq 'add'">
									<cps:textfield name="zfxx.dzmc" value="${zfxx.dzmc}" id="dzmc" required="true" readonly="true" appendPopuBtn="true" onclick="dzselect()" cssStyle="width:94%"/>
								</s:if>
								<s:else>
									<cps:textfield name="zfxx.dzmc" value="${zfxx.dzmc}" id="dzmc" required="true" readonly="true"  cssStyle="width:94%"/>
								</s:else>
								<input type="hidden" name="zfxx.dzid" value="${zfxx.dzid}" id="dzid" />
								<input type="hidden" name="zfxx.fwid" value="${zfxx.fwid}" id="fwid" />
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel width="15%"><span style="color:red">*</span>走访类型：</cps:tdLabel>
							<cps:tdContent>
								<cps:select name="zfxx.zflx" value="${zfxx.zflx}" id="zflx" zdlb="ZDY_ZFLX" headerKey="" headerValue="--请选择--" required="true"></cps:select>
							</cps:tdContent>
						
							<cps:tdLabel width="15%">走访原因：</cps:tdLabel>
							<cps:tdContent width="45%">
								<cps:textfield name="zfxx.zfyy" value="${zfxx.zfyy}" id="zfyy" maxlength="100"/>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><span style="color:red">*</span>走访内容：</cps:tdLabel>
							<cps:tdContent colspan="3">
								<cps:textfield type="textarea" cssStyle="height:100px;width:94%;" name="zfxx.zfnr" value="${zfxx.zfnr}" id="zfnr" cssClass="validate[required,maxSize[500]]"/>
							</cps:tdContent>
						</cps:row>
						
						<cps:row>
							<cps:tdLabel><span style="color:red">*</span>走访人：</cps:tdLabel>
							<cps:tdContent width="35%">
								<cps:textfield name="zfxx.zfrxm" value="${zfxx.zfrxm}" id="zfrxm" readonly="true" ></cps:textfield>
								<input type="hidden" name="zfxx.zfrjh" value="${zfxx.zfrjh}" id="zfrjh" />
							</cps:tdContent>
							
							<cps:tdLabel><span style="color:red">*</span>走访时间：</cps:tdLabel>
							<cps:tdContent>
								<cps:date dateFmt="yyyy-MM-dd" name="zfxx.zfsj" value="${zfxx.zfsj}" id="zfsj" maxDate="sysdate" required="true"></cps:date>
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdContent colspan="4">
								<span style="color:red">*新增实有人口或修改实有人口后请刷新走访人员列表.</span>
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</div>
			</cps:panel>
		</cps:PanelView>
		
		<cps:PanelView>
			<cps:tbar>
				<c:if test="${!(operType eq 'detail')}">
					<cps:button value="刷新" onclick="refreshZfryList()"></cps:button>
					<cps:button value="新增实有人口" onclick="openSyrkRkInfo('add','')"></cps:button>
				</c:if>
			</cps:tbar>
			<cps:panel title="走访人员">
				<cps:table id="zfryTab">
					<cps:row id="tabletitle">
						<cps:tdLabel cssStyle="text-align:center">序号</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">操作</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">姓名</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">身份证</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">户籍地</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">电话</cps:tdLabel>
						<cps:tdLabel cssStyle="text-align:center">是否见面</cps:tdLabel>
					</cps:row>
					
					<c:forEach items="${zfxx.zfryList}" var="zfry" varStatus="s">
						<cps:row id="datarow${s.index}">
							<cps:tdContent cssStyle="text-align:center">${s.index + 1}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:left">
								<span onclick="openSyrkInfoPage('rydaxx','${zfry.rybh}','${zfry.rylb}')" style="color:green" class="cps_span_href">详情</span>&nbsp;
								<c:if test="${(loginInfo.leve == 5) and !(operType eq 'detail')}">
									<span onclick="openRkInfo('update','${zfry.rkid}','${zfry.rybh}','${zfry.rylb}','${zfry.rkfwglid}')" style="color:green" class="cps_span_href">修改</span>
								</c:if>
								<%-- ${zfry.cz} --%>
							</cps:tdContent>
							<cps:tdContent cssStyle="text-align:left">${zfry.xm}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">${zfry.sfzh}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:left">${zfry.hjdxz}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:left">${zfry.lxdh}</cps:tdContent>
							<cps:tdContent cssStyle="text-align:center">
								
								<%-- 自动勾选已见面人员 --%>
								<c:choose>
									<c:when test="${zfxx.zfryList[s.index].sfjm eq '1'}">
										<c:set var="isChecked" value=" checked='checked' " />
									</c:when>
									<c:otherwise>
										<c:set var="isChecked" value="" />
									</c:otherwise>
								</c:choose>
								
								<%-- 详情页面禁止勾选走访人员 --%>
								<c:choose>
									<c:when test="${operType eq 'detail'}">
										<c:set var="isDisabled" value=" disabled='disabled' " />
									</c:when>
									<c:otherwise>
										<c:set var="isDisabled" value="" />
									</c:otherwise>
								</c:choose>
								
								<input type="checkbox" name="zfxx.zfryList[${s.index}].sfjm" value="1" ${isChecked} ${isDisabled} />
								<input type="hidden" name="zfxx.zfryList[${s.index}].rybh" value="${zfxx.zfryList[s.index].rybh}" />
							</cps:tdContent>
						</cps:row>
					</c:forEach>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>