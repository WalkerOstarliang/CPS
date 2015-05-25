<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<creator:tbar id="fwtooltbar">
	<cps:button value="新增出租记录" onclick="openCzjlWin('add','')"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="fwquerypanel" title="出租记录信息" tbarId="fwtooltbar">
<form id="queryForm"> 
	<div id="czfwdivid">
		<cps:table>
			<input id="czfwfwbh" type="hidden" name="fwBean.czfwBean.fwbh"  value="${fwBean.fwid}">
			<%--
			<input id="id"   type="text" name="fwBean.czfwBean.id"  value="${fwBean.czfwBean.id}">
			
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
					<cps:textfield id="dlrlxfs" name="fwBean.czfwBean.dlrlxfs" value="${fwBean.czfwBean.dlrlxfs}" inputType="number" isPhone="true" maxlength="20"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row15">
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
				<cps:textfield type="textarea" id="bz" name="fwBean.czfwBean.bz" value="${fwBean.czfwBean.bz}" cssStyle="width:93%;height:50px"  maxlength="200"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row  cssStyle="display:none">
				<cps:tdLabel>登记人姓名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djrxm" name="fwBean.czfwBean.djrxm" value="${loginInfo.realname}" readonly="true"  maxlength="15"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<input id="djdwdm" type="hidden" name="fwBean.czfwBean.djdwdm" value="${loginInfo.orgcode }"/>
					<cps:textfield id="djdwmc" name="fwBean.czfwBean.djdwmc" value="${loginInfo.orgname}" readonly="true"  maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="djsj" name="fwBean.czfwBean.djsj" value="${fwBean.czfwBean.djsj}" readOnly="true" defaultSystemDate="true" ></cps:date>
				</cps:tdContent>
			</cps:row>
			--%>
		</cps:table>
		<cps:tableGrid  id="czfwtableid"  
						url="/lsgl/fw/queryCzfwListPageByFwid.action" 
						searchform="queryForm"	
						width="99.6%"
						mutilSelect="false"
						pageSize="10"
						click="rowcallbackCzfwJbxx">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
			<cps:column field="id"  title="主键ID"></cps:column>
			<cps:column field="czytms"  title="承租用途"></cps:column>
			<cps:column field="czsj"  title="出租时间"></cps:column>
			<cps:column field="zzlx"  title="租住类型"></cps:column>
			<cps:column field="czyz"  title="月租金"></cps:column>
			<cps:column field="sfqdzrzms"  title="是否签订责任状"></cps:column>
			<cps:column field="djrxm"  title="登记人姓名"></cps:column>
			<cps:column field="djsj"    title="登记日期"></cps:column>
		</cps:tableGrid>
	</div>
</form>
</creator:panel>
<%--
<creator:tbar  id="czxxtbar">
	<cps:button value="保存"  onclick="saveCzrxx()"></cps:button>
	<cps:button value="重置"  onclick="clearform()" ></cps:button>
</creator:tbar>
<creator:panel id="czfwczxxPanel"   title="承租人信息" tbarId="czxxtbar" >
<form  id="czxxform">
 <div id="czxxdiv">
 		<fieldset>
		<legend>承租人信息</legend> 	
		<cps:table>
			<cps:row id="clear_row2">
				<cps:tdLabel width="11%">承租人类型：</cps:tdLabel>
				<cps:tdContent width="24%">
					<s:select list="#{'1':'单位租凭','2':'个人租凭'}" id="czrlx" name="czxxBean.czrlx"  onchange="changeCzrlx(this.value)" value="2" cssStyle="30%" cssClass="cps-select"></s:select>
				</cps:tdContent>
				<cps:tdLabel width="12%" ><font color="red">*</font>租赁日期：</cps:tdLabel>
				<cps:tdContent width="22%" >
					<cps:date id="zlrq" name="czxxBean.zlrq" value="${czxxBean.zlrq}" dateFmt="yyyy-MM-dd" maxDate="tzrq"  required="true"></cps:date>
				</cps:tdContent>
				<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			<input type="hidden" id="czxxbh" name="czxxBean.czxxbh" value="${czxxBean.czxxbh}"/>
			<input type="hidden" id="ryjgbh" name="czxxBean.ryjgbh" value="${czxxBean.ryjgbh}"/>
			<cps:row id="clear_row1">
				<cps:tdLabel width="12%"><font color="red">*</font>承租人身份证：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="hzrsfzh"   name="czxxBean.hzrsfzh" value="${czxxBean.hzrsfzh}" isSfzh="true" onblur="queryRkBean(this.value,callbackHzrsfzxx)" required="true"></cps:textfield>
					<cps:button value="选择" onclick="openSyrkSelectWin()"></cps:button>
				</cps:tdContent> 
				<cps:tdLabel width="12%">承租人姓名：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="hzrxm" name="czxxBean.hzrxm" value="${czxxBean.hzrxm}" maxlength="15" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel  width="12%">性别：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:select id="hzrxb" name="czxxBean.hzrxb" value="${czxxBean.hzrxb}" zdlb="GB_XB" headerKey="" headerValue="---请选择---" ></cps:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row id="clear_row_czdwxx" cssStyle="display:none;">
				<cps:tdLabel width="12%"><font color="red">*</font>承租单位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="jgdwmc" name="czxxBean.jgdwmc" value="${czxxBean.jgdwmc}" maxlength="60" required="true" cssStyle="width:86%" ondblclick="openDwSelect()"></cps:textfield>
					<cps:button value="选择" onclick="openDwSelect()"></cps:button>
				</cps:tdContent> 
			</cps:row>
			
			
			<cps:row id="clear_row2">
				<cps:tdLabel >承租状态：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'1' : '正常','2':'退租'}" id="czzt" name="czxxBean.czzt" cssClass="cps-select"></s:select>
				</cps:tdContent>
				<cps:tdLabel width="12%">退租日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="tzrq" name="czxxBean.tzrq" value="${czxxBean.tzrq}" dateFmt="yyyy-MM-dd" minDate="zlrq"></cps:date>
				</cps:tdContent>
				<cps:tdLabel >退租原因：</cps:tdLabel>
				<cps:tdContent >
					<cps:select id="tzyy" name="czxxBean.tzyy" value="${czxxBean.tzyy}" zdlb="ZDY_ZXYY" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>录入人：</cps:tdLabel>
				<cps:tdContent>
					<input id="djr" type="hidden" name="czxxBean.djr" value="${loginInfo.username }">
					<cps:textfield id="djrxm" name="czxxBean.djrxm" value="${loginInfo.realname}" maxlength="15" ></cps:textfield>				
				</cps:tdContent>
				<cps:tdLabel>录入单位：</cps:tdLabel>
				<cps:tdContent>
					<input id="djdwdm" type="hidden" name="czxxBean.djdwdm" value="${loginInfo.orgcode }">
					<cps:textfield id="djdwmc" name="czxxBean.djdwmc" value="${loginInfo.orgname}" maxlength="60" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>录入时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="djsj" name="czxxBean.djsj" value="${czxxBean.djsj}" defaultSystemDate="true" ></cps:date>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</fieldset>
	
	<cps:tableGrid  id="fwtablegrid"  
					url="/lsgl/czfwczxx/queryCzxxPageInfo.action" 
					searchform="queryForm"	
					width="99.6%"
					mutilSelect="false"
					pageSize="10"
					title="承租人信息"
					click="rowcallbackCzxxdj">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="czytms" title="承租用途"></cps:column>
		<cps:column field="czstmc" title="承租人/单位"></cps:column>
		<cps:column field="zlrq" title="租赁日期"></cps:column>
		<cps:column field="tzrq" title="退租日期"></cps:column>
		<cps:column field="czrlx" title="承租状态" rowcallback="czztRowCallback"></cps:column>
		<cps:column field="djsj" title="登记日期"></cps:column>
	</cps:tableGrid>
 </div>
 </form>
</creator:panel>	
--%>
