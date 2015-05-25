<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="fwtbarpanel">
	<cps:button value="保存" onclick="saveFwBean(saveAfterCallback,'savejbxx');"></cps:button>
	<cps:button id="czfwdjbtn" value="出租房屋登记" onclick="openCzfwDjInfoWin()" cssStyle="display:${fwBean.sfczw=='1'?'none':'inline'}"></cps:button>
	<cps:button id="syrkdjbtn" value="实有人口登记" onclick="openNewSyrkInfo()"></cps:button>
	<cps:button id="jwrkdjbtn" value="境外人口登记" onclick="openNewJwrkInfo()"></cps:button>
	<cps:button id="dwdjbtn" value="实有单位登记" onclick="openNewDwInfo()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="fwinfopanel" tbarId="fwtbarpanel"  title="房屋信息出租信息" height="window" width="99.5%">
	<div id="czwxxxx"  style="display:${fwBean.sfczw =='1'?'inline':'none' }">
		<fieldset>
		<legend>出租屋信息</legend> 			
			<cps:table>
				<input id="czfwfwbh" type="hidden" name="fwBean.czfwBean.fwbh"  value="${fwBean.czfwBean.fwbh}">
				<input id="czfwid"   type="hidden" name="fwBean.czfwBean.id"  value="${fwBean.czfwBean.id}">
				<cps:row>
					<cps:tdLabel width="13%">出租屋编码：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="czfwbh" name="fwBean.czfwBean.czfwbh" value="${fwBean.czfwBean.czfwbh}" readonly="true" maxlength="50"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="11%">出租屋标牌码：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="czfwbpbm" name="fwBean.czfwBean.czfwbpbm" value="${fwBean.czfwBean.czfwbpbm}"  maxlength="50" cssStyle="width:94%" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row  id="clear_row10">
					<cps:tdLabel width="12%"><font color="red">*</font>承租用途：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select zdlb="ZDY_CZYT" required="true" id="czyt" name="fwBean.czfwBean.czyt" value="${fwBean.czfwBean.czyt}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>出租时间：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:date id="czsj" name="fwBean.czfwBean.czsj" value="${fwBean.czfwBean.czsj}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="12%">租住类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZZLX" id="zzlx" name="fwBean.czfwBean.zzlx" value="${fwBean.czfwBean.zzlx}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>出租面积<font>(㎡)</font>：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czmj" name="fwBean.czfwBean.czmj" value="${fwBean.czfwBean.czmj}" inputType="number" maxlength="5"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>出租间数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czjs" name="fwBean.czfwBean.czjs" value="${fwBean.czfwBean.czjs}" inputType="number" maxlength="2"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">月租金(元)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czyz" name="fwBean.czfwBean.czyz" value="${fwBean.czfwBean.czyz}" inputType="number" maxlength="20"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
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
				<cps:row>
					<cps:tdLabel><font color="red">*</font>是否签订责任书：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZDSF"  id="sfqdzrz" name="fwBean.czfwBean.sfqdzrz" value="${fwBean.czfwBean.sfqdzrz}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>租赁备案证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djbh" name="fwBean.czfwBean.djbh" value="${fwBean.czfwBean.djbh}" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>最新核签时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="zxhqsj" name="fwBean.czfwBean.zxhqsj" value="${fwBean.czfwBean.zxhqsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>房屋状态：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="fwzt" list="#{'0':'正常','1' : '停租'}" name="fwBean.czfwBean.fwzt" cssClass="cps-select"/>
					</cps:tdContent>
					<cps:tdLabel>出租终止时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="czzzsj" name="fwBean.czfwBean.czzzsj" value="${fwBean.czfwBean.czzzsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>注销原因：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zxyy" name="fwBean.czfwBean.zxyy" value="${fwBean.czfwBean.zxyy}" maxlength="100"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" id="bz" name="fwBean.czfwBean.bz" value="${fwBean.czfwBean.bz}" cssStyle="width:97%;"  maxlength="200"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
	</div>
</creator:panel>
 
