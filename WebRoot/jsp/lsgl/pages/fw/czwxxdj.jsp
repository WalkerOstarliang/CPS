<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="出租房屋信息登记">
 	<creator:Script src="/jsp/lsgl/js/czwxxdj.js"></creator:Script>
 	<cps:table>
		<input id="czfwfwbh" type="hidden" name="fwBean.czfwBean.fwbh"  value="${fwBean.czfwBean.fwbh}">
		<input id="czfwid"   type="hidden" name="fwBean.czfwBean.id"  value="${fwBean.czfwBean.id}">
		<cps:row>
			<cps:tdLabel width="12%">出租屋编码：</cps:tdLabel>
			<cps:tdContent width="24%">
				<cps:textfield id="czfwbh" name="fwBean.czfwBean.czfwbh" value="${fwBean.czfwBean.czfwbh}" readonly="true" maxlength="50"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="11%">出租屋标牌码：</cps:tdLabel>
			<cps:tdContent width="22%">
				<cps:textfield id="czfwbpbm" name="fwBean.czfwBean.czfwbpbm" value="${fwBean.czfwBean.czfwbpbm}" readonly="true" maxlength="50" cssStyle="width:90%"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>出租时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="czsj" name="fwBean.czfwBean.czsj" value="${fwBean.czfwBean.czsj}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>出租面积<font>(㎡)</font>：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="czmj" name="fwBean.czfwBean.czmj" value="${fwBean.czfwBean.czmj}" inputType="number" maxlength="5"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>出租间数：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield id="czjs" name="fwBean.czfwBean.czjs" value="${fwBean.czfwBean.czjs}" inputType="number" maxlength="5"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
			<cps:tdContent>
				&nbsp;
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
			<cps:tdLabel>是否签订责任状：</cps:tdLabel>
			<cps:tdContent>
			<cps:select zdlb="ZDY_ZDSF"  id="sfqdzrz" name="fwBean.czfwBean.sfqdzrz" value="${fwBean.czfwBean.sfqdzrz}" headerKey="" headerValue=" " ></cps:select>
			</cps:tdContent>
			<cps:tdLabel>备注：</cps:tdLabel>
		<cps:tdContent colspan="3">
			<cps:textfield type="textarea" id="bz" name="fwBean.czfwBean.bz" value="${fwBean.czfwBean.bz}" cssStyle="width:90%;"  maxlength="200"></cps:textfield>
		</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>
