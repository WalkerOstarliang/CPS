<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="涉外单位信息">
	<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#swfwform").find(":input").attr("disabled","true")
			}
		});
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveSwdwBean()" display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="涉外单位信息">
			<form id="swfwform" action="<c:url value='/sydw/dwgl/saveSwdwBean.action'/>" method="post">
				<input type="hidden" id="swdwlbh" name="dwBean.swdwBean.jlbh"  value="${dwBean.swdwBean.jlbh}" />
				<input type="hidden" id="swdwjgbh" name="dwBean.swdwBean.jgbh" value="${dwBean.dwjbxx.jgbh}" />
				<input type="hidden" id="jgbh" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}" >
				<s:hidden id="operType" name="operType"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="14%">外文名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wmmc" name="dwBean.swdwBean.wmmc" value="${dwBean.swdwBean.wmmc}" maxlength="60"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="14%">投资国家和地区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="tzgjdq" name="dwBean.swdwBean.tzgjdq" value="${dwBean.swdwBean.tzgjdq}"  maxlength="100"/>
						</cps:tdContent>
						<cps:tdLabel width="14%">中方投资单位：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="zftzdw" name="dwBean.swdwBean.zftzdw" value="${dwBean.swdwBean.zftzdw}"  maxlength="100"/>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >外方投资单位：</cps:tdLabel>
						<cps:tdContent  >
							<cps:textfield id="wftzdw" name="dwBean.swdwBean.wftzdw" value="${dwBean.swdwBean.wftzdw}"  maxlength="100"/>
						</cps:tdContent>
						
						<cps:tdLabel>董事长：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="dsz" name="dwBean.swdwBean.dsz" value="${dwBean.swdwBean.dsz}" maxlength="15"/>
						</cps:tdContent>
						
						<cps:tdLabel>副董事长：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="fdsz" name="dwBean.swdwBean.fdsz"  value="${dwBean.swdwBean.fdsz}"  maxlength="15"/>
						</cps:tdContent>
					</cps:row>
		
					<cps:row>
						<cps:tdLabel>总经理：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="zjl" name="dwBean.swdwBean.zjl" value="${dwBean.swdwBean.zjl}" maxlength="15" />
						</cps:tdContent>
						<cps:tdLabel>副总经理：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="fzjl" name="dwBean.swdwBean.fzjl" value="${dwBean.swdwBean.fzjl}"  maxlength="15"/>
						</cps:tdContent>
						<cps:tdLabel>联系人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="lxr" name="dwBean.swdwBean.lxr" value="${dwBean.swdwBean.lxr}"  maxlength="15" />
						</cps:tdContent>
					</cps:row>
		
					<cps:row>
						<cps:tdLabel>涉外外方资本(万美元)：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield  id="swwfzb"  name="dwBean.swdwBean.swwfzb" value="${dwBean.swdwBean.swwfzb}" inputType="number" maxlength="10"/>
						</cps:tdContent>
						<cps:tdLabel>涉外中方资本(万元)：</cps:tdLabel>
						<cps:tdContent >
							<cps:textfield  id="swzfzb"  name="dwBean.swdwBean.swzfzb" value="${dwBean.swdwBean.swzfzb}" inputType="number" maxlength="10"/>
						</cps:tdContent>
						<cps:tdLabel>电子邮箱：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="email"  name="dwBean.swdwBean.email" value="${dwBean.swdwBean.email}" isEmail="true" maxlength="150"/>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>实际办公地址：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="sjbgdz" name="dwBean.swdwBean.sjbgdz" value="${dwBean.swdwBean.sjbgdz}" maxlength="100" cssStyle="width: 97%;"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>企业情况记载：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="qyqkjz" type="textarea" name="dwBean.swdwBean.qyqkjz" value="${dwBean.swdwBean.qyqkjz}" maxlength="250" cssStyle="width: 97%; height: 60px;"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="bz" type="textarea" name="dwBean.swdwBean.bz" value="${dwBean.swdwBean.bz}" maxlength="250" cssStyle="width: 97%; height: 60px;"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>