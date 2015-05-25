<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<creator:Script src="/jsp/lsgl/js/fwinfo.js"></creator:Script>
<creator:tbar id="fwtooltbar">
	<c:if test="${operType != 'detail'}">
		<cps:button value="保存" onclick="saveCzjlInfo()"></cps:button>
	</c:if>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="fwquerypanel" title="出租记录信息" tbarId="fwtooltbar">
<form id="czjlform"> 
	<div id="czfwdivid">
		<cps:table>
			<input id="czfwfwbh" type="hidden" name="fwBean.czfwBean.fwbh"  value="${fwBean.czfwBean.fwbh}">
			<input id="id"   type="hidden" name="fwBean.czfwBean.id"  value="${fwBean.czfwBean.id}">
			<input id="czfwbh"   type="hidden" name="fwBean.czfwBean.czfwbh"  value="${fwBean.czfwBean.czfwbh}">
			<cps:row  id="clear_row10">
				<cps:tdLabel width="12%"><font color="red">*</font>承租用途：</cps:tdLabel>
				<cps:tdContent width="22%"  >
				<cps:select zdlb="ZDY_CZYT" required="true" id="czyt" name="fwBean.czfwBean.czyt" value="${fwBean.czfwBean.czyt}" headerKey="" headerValue=" " ></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>出租时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="czsj" name="fwBean.czfwBean.czsj" value="${fwBean.czfwBean.czsj}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="12%">租住类型：</cps:tdLabel>
				<cps:tdContent >
				<cps:select zdlb="ZDY_ZZLX" id="zzlx" name="fwBean.czfwBean.zzlx" value="${fwBean.czfwBean.zzlx}" headerKey="" headerValue=" " ></cps:select>
			</cps:tdContent>
				
			</cps:row>
			<cps:row id="clear_row11">
				<cps:tdLabel>出租间数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="czjs" name="fwBean.czfwBean.czjs" value="${fwBean.czfwBean.czjs}" inputType="number" maxlength="5"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>出租面积：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="czmj" name="fwBean.czfwBean.czmj" value="${fwBean.czfwBean.czmj}" inputType="number" maxlength="5"></cps:textfield>
				<font color="red">(㎡)</font>
			</cps:tdContent>
				<cps:tdLabel>月租金：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="czyz" name="fwBean.czfwBean.czyz" value="${fwBean.czfwBean.czyz}" inputType="number" maxlength="20"></cps:textfield>
					<font color="red">(元)</font>
				</cps:tdContent>
			</cps:row>
			<cps:row  id="clear_row12">
				<cps:tdLabel>是否签订责任状：</cps:tdLabel>
				<cps:tdContent>
				<cps:select zdlb="ZDY_ZDSF"  id="sfqdzrz" name="fwBean.czfwBean.sfqdzrz" value="${fwBean.czfwBean.sfqdzrz}" headerKey="" headerValue=" " ></cps:select>
				</cps:tdContent>
				<cps:tdLabel>实际租住人数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="sjzzrs" name="fwBean.czfwBean.sjzzrs" value="${fwBean.czfwBean.sjzzrs}" inputType="number" maxlength="5"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row13">
				<cps:tdLabel>出租房屋状态：</cps:tdLabel>
				<cps:tdContent>
					<s:select id="fwzt" list="#{'0':'正常','1' : '已注销'}" name="fwBean.czfwBean.fwzt" cssClass="cps-select" />
				</cps:tdContent>
				<cps:tdLabel>房屋终止时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="czzzsj" name="fwBean.czfwBean.czzzsj" value="${fwBean.czfwBean.czzzsj}" dateFmt="yyyy-MM-dd" minDate="czsj"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>房屋注销原因：</cps:tdLabel>
				<cps:tdContent>
				<cps:select zdlb="FW_ZXYY" id="zxyy"   name="fwBean.czfwBean.zxyy" value="${fwBean.czfwBean.zxyy}" headerKey="" headerValue=" " ></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row14">
				
				<cps:tdLabel>责任人身份证号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dlrsfzh" name="fwBean.czfwBean.dlrsfzh" value="${fwBean.czfwBean.dlrsfzh}"  isSfzh="true" maxlength="20" onblur="queryRkBean(this.value,callbackZazrrxx)"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>治安责任人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dlr" name="fwBean.czfwBean.dlr" value="${fwBean.czfwBean.dlr}"  maxlength="15"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>责任人联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dlrlxfs" name="fwBean.czfwBean.dlrlxfs" value="${fwBean.czfwBean.dlrlxfs}" minlength="7" isPhone="true" maxlength="20"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row15">
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
				<cps:textfield type="textarea" id="bz" name="fwBean.czfwBean.bz" value="${fwBean.czfwBean.bz}" cssStyle="width:93%;height:50px"  maxlength="200"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row >
				<cps:tdLabel>登记人姓名：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty fwBean.czfwBean.djrxm}">
								<cps:textfield id="djrxm" name="fwBean.czfwBean.djrxm" value="${loginInfo.realname}" readonly="true"  maxlength="15"></cps:textfield>
						</c:when>
						<c:otherwise>
								<cps:textfield id="djrxm" name="fwBean.czfwBean.djrxm" value="${fwBean.czfwBean.djrxm}" readonly="true"  maxlength="15"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
				<c:choose>
						<c:when test="${empty fwBean.czfwBean.djdwdm}">
							<input id="djdwdm" type="hidden" name="fwBean.czfwBean.djdwdm" value="${loginInfo.orgcode }"/>
							<cps:textfield id="djdwmc" name="fwBean.czfwBean.djdwmc" value="${loginInfo.orgname}" readonly="true"  maxlength="60"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input id="djdwdm" type="hidden" name="fwBean.czfwBean.djdwdm" value="${fwBean.czfwBean.djdwdm }"/>
							<cps:textfield id="djdwmc" name="fwBean.czfwBean.djdwmc" value="${fwBean.czfwBean.djdwmc}" readonly="true"  maxlength="60"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
				<c:choose>
						<c:when test="fwBean.czfwBean.djsj">
							<cps:date id="djsj" name="fwBean.czfwBean.djsj"  readOnly="true" defaultSystemDate="true" ></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="fwBean.czfwBean.djsj" value="${fwBean.czfwBean.djsj}" readOnly="true"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
</form>
<c:if test="${operType != 'detail'}">
	<creator:tbar id="czrid">
		<cps:button value="添加承租人" onclick="openCzrPage('add','')"></cps:button>
</creator:tbar>
		<cps:tableGrid  id="fwtablegrid"  
					url="/lsgl/czfwczxx/queryCzxxPageInfo.action" 
					searchform="czjlform"	
					width="99.6%"
					mutilSelect="false"
					pageSize="10"
					title="承租人信息"
					click="rowcallbackCzxxdj"
					tbarId="czrid">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field = "cz" title = "操作" align="left"></cps:column>
		<cps:column field="czstmc" title="承租人/单位"></cps:column>
		<cps:column field="zlrq" title="租赁日期"></cps:column>
		<cps:column field="tzrq" title="退租日期"></cps:column>
		<cps:column field="czrlx" title="承租状态" rowcallback="czztRowCallback"></cps:column>
		<cps:column field="djsj" title="登记日期"></cps:column>
	</cps:tableGrid>
</c:if>
<c:if test="${operType == 'detail'}">
	<cps:tableGrid  id="fwtablegrid"  
						url="/lsgl/czfwczxx/queryCzxxPageInfo.action" 
						searchform="czjlform"	
						width="99.6%"
						mutilSelect="false"
						pageSize="10"
						title="承租人信息"
						click="rowcallbackCzxxdj"
						>
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field = "czDetail" title = "操作" align="left"></cps:column>
			<cps:column field="czstmc" title="承租人/单位"></cps:column>
			<cps:column field="zlrq" title="租赁日期"></cps:column>
			<cps:column field="tzrq" title="退租日期"></cps:column>
			<cps:column field="czrlx" title="承租状态" rowcallback="czztRowCallback"></cps:column>
			<cps:column field="djsj" title="登记日期"></cps:column>
		</cps:tableGrid>

</c:if>
</creator:panel>
</creator:view>

