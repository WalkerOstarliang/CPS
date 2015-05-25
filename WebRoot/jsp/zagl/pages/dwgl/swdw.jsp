<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="swfwcs_div">
	<%-- 
	<creator:tbar id="dw_op">
		<cps:button value="保存" onclick="saveSwdwBean()"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="swfwcs_panel" title="涉外单位" tbarId="dw_op" height="window">
	--%>
		<input type="hidden" name="dw.swdwBean.jlbh" id="swdw_jlbh" value="${dw.swdwBean.jlbh}" />
		<input type="hidden" name="dw.swdwBean.jgbh" value="${dw.swdwBean.jgbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%">外文名称：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield id="wmmc" name="dw.swdwBean.wmmc" value="${dw.swdwBean.wmmc}" maxlength="60"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="13%">投资国家和地区：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield id="tzgjdq" name="dw.swdwBean.tzgjdq" value="${dw.swdwBean.tzgjdq}"  maxlength="100"/>
				</cps:tdContent>
				<cps:tdLabel width="13%">中方投资单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zftzdw" name="dw.swdwBean.zftzdw" value="${dw.swdwBean.zftzdw}"  maxlength="100"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel  >外方投资单位：</cps:tdLabel>
				<cps:tdContent  >
					<cps:textfield id="wftzdw" name="dw.swdwBean.wftzdw" value="${dw.swdwBean.wftzdw}"  maxlength="100"/>
				</cps:tdContent>
				
				<cps:tdLabel>董事长：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="dsz" name="dw.swdwBean.dsz" value="${dw.swdwBean.dsz}" maxlength="15"/>
				</cps:tdContent>
				
				<cps:tdLabel>副董事长：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fdsz" name="dw.swdwBean.fdsz"  value="${dw.swdwBean.fdsz}"  maxlength="15"/>
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>总经理：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zjl" name="dw.swdwBean.zjl" value="${dw.swdwBean.zjl}" maxlength="15" />
				</cps:tdContent>
				<cps:tdLabel>副总经理：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fzjl" name="dw.swdwBean.fzjl" value="${dw.swdwBean.fzjl}"  maxlength="15"/>
				</cps:tdContent>
				<cps:tdLabel>联系人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="lxr" name="dw.swdwBean.lxr" value="${dw.swdwBean.lxr}"  maxlength="15" />
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>涉外外方资本(万美元)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield  id="swwfzb"  name="dw.swdwBean.swwfzb" value="${dw.swdwBean.swwfzb}" inputType="number" maxlength="10"/>
				</cps:tdContent>
				<cps:tdLabel>涉外中方资本(万元)：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield  id="swzfzb"  name="dw.swdwBean.swzfzb" value="${dw.swdwBean.swzfzb}" inputType="number" maxlength="10"/>
				</cps:tdContent>
				<cps:tdLabel>电子邮箱：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="email"  name="dw.swdwBean.email" value="${dw.swdwBean.email}" isEmail="true" maxlength="150"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>实际办公地址：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="sjbgdz" name="dw.swdwBean.sjbgdz" value="${dw.swdwBean.sjbgdz}" maxlength="100" cssStyle="width: 94%;"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>企业情况记载：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="qyqkjz" type="textarea" name="dw.swdwBean.qyqkjz" value="${dw.swdwBean.qyqkjz}" maxlength="250" cssStyle="width: 94%; height: 60px;"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="bz" type="textarea" name="dw.swdwBean.bz" value="${dw.swdwBean.bz}" maxlength="250" cssStyle="width: 94%; height: 60px;"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	<%-- 
	</creator:panel>
	--%>	
</div>