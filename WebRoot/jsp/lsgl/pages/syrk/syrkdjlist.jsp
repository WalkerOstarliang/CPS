<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<creator:Script src="/jsp/lsgl/js/syrkdjlist.js"></creator:Script>
	<creator:box>
		<form id="queryForm">
			<input type="hidden" id="oldquerysfzh" value=""/>
			<cps:PanelView>
				<cps:tbar>
					<cps:button value="查询" onclick="queryList()"></cps:button>
					<cps:button value="下一步" onclick="clickNextBtn()" display="${displayAddBtn}"></cps:button>
					<cps:button value="实有人口导入" onclick="syrkDrNext()" display="${displayAddBtn}"></cps:button>
				</cps:tbar>
				<cps:panel id="fwquerypanel" title="实有人口登记之人口查询页面" >
					<cps:table>
						  <cps:row>
							  	<cps:tdLabel width="20%">请输入身份证号码：</cps:tdLabel>
							  	<cps:tdContent width="29%">
							  		<input type="hidden" name="queryBean.zjzl" value="111">
							  		<cps:textfield id="zjhm" name="queryBean.zjhm" value="${queryBean.zjhm}" onblur="changeSfzhTo18W(this.value)"></cps:textfield>
							  	</cps:tdContent>
							  	<cps:tdContent width="50%">
							  		<input type="hidden" id="sfzh" name="queryBean.sfzh" value="">
							  		<input type="checkbox" id="sftjsfzh" checked="checked"/>
							  		是否把身份证号码带入下一步操作
							  	</cps:tdContent>
						  </cps:row>
						  <cps:row>
						  		<cps:tdContent colspan="3">
						  			<font color="red">
						  				说明：该功能为实有人口登记页面，用户可以先通过身份证号码查询实有人口是否被登记或者实有人口当前的居住地址，
						  				复选框如果选中表示系统会把输入的身份证号码带入下一步操作中，以方便后续使用。其中15位身份证号码将自动转换为18位。
						  			</font>
						  		</cps:tdContent>
						  </cps:row>
					</cps:table>
				</cps:panel>
			</cps:PanelView>
		</form>
		<cps:tableGrid id="rktablegrid"  
				title="实有人口查询结果列表"
				url="/lsgl/rk/queryRkPageResultInfo.action" 
				searchform="queryForm"
				mutilSelect="true"
				autoload="false"
				width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="syrkdjcz" title="操作"></cps:column>
			<cps:column field="xm" title="姓名" ></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="xbms" title="性别"></cps:column>
			<cps:column field="hjdqhmc" title="户籍地区划"  align="left" maxlength="5"></cps:column>
			<cps:column field="hjdxz" title="户籍地详址" align="left" maxlength="8"></cps:column>
			<cps:column field="xzzxz" title="现住地" align="left" maxlength="8"></cps:column>
			<cps:column field="lxdh" title="联系电话"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>