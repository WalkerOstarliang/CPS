<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="特行旅馆信息">
	<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#tzhyform").find(":input").attr("disabled","true")
			}
		});
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveTzhyBean()"  display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="特种行业">
		<form id="tzhyform" action="<c:url value='/sydw/dwgl/saveTzhyBean.action'/>" method="post">
			<input type="hidden" id="thbh" name="dwBean.tzhy.thbh" value="${dwBean.tzhy.thbh}"/>
			<input type="hidden" id="tzhyjgbh" name="dwBean.tzhy.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
			<input type="hidden" id="dwjbxxjgbh" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
			<input type="hidden" id="thmc" name="dwBean.tzhy.thmc" value="${dwBean.tzhy.thmc}"/>
			<s:hidden name="operType"/>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>特行类别：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="thlb" zdlb="ZAGL_THLB" name="dwBean.tzhy.thxl" value="${dwBean.tzhy.thxl}" required="true" optgroup="true" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>经营类别：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select value="${dwBean.tzhy.jylb}" name="dwBean.tzhy.jylb" zdlb="ZDY_JYLB" headerKey="" headerValue=" "/>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>许可证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.tzhyxkz" value="${dwBean.tzhy.tzhyxkz}" inputType="onlychar" id="tzhyxkz" required="true" cssClass="validate[maxSize[20]]" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">有效日期：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date dateFmt="yyyy-MM-dd" name="dwBean.tzhy.xkzyxrq" id="xkzyxrq" value="${dwBean.tzhy.xkzyxrq}" />
					</cps:tdContent>
					<cps:tdLabel width="10%">核发人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.hfr" value="${dwBean.tzhy.hfr}" id="hfr" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
					<cps:tdLabel>发证机关：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="dwBean.tzhy.xkzhfdw" value="${dwBean.tzhy.xkzhfdw}" id="xkzhfdw" maxlength="80"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					
					<cps:tdLabel>领证人：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="dwBean.tzhy.lzr" value="${dwBean.tzhy.lzr}" id="lzr" maxlength="15"/>
					</cps:tdContent>
					<cps:tdLabel>建档日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" name="dwBean.tzhy.thjdrq" value="${dwBean.tzhy.thjdrq}" />
					</cps:tdContent>
					<cps:tdLabel>备案时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" name="dwBean.tzhy.barq" value="${dwBean.tzhy.barq}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">经营负责人身份证：</cps:tdLabel>
					<cps:tdContent width="21%">
						<cps:textfield name="dwBean.tzhy.jyfzrsfzh"  onblur="queryRyBysfz(this.value,'jyfzr','jyfzrlxdh')" value="${dwBean.tzhy.jyfzrsfzh}" id="jyfzrsfzh" isSfzh="true" cssClass="validate[maxSize[18]]" />
					</cps:tdContent>
					<cps:tdLabel width="12%">姓名：</cps:tdLabel>
					<cps:tdContent width="21%">
						<cps:textfield name="dwBean.tzhy.jyfzr" value="${dwBean.tzhy.jyfzr}"
									id="jyfzr" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
					<cps:tdLabel width="12%">联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.jyfzrlxdh" maxlength="20" minlength="7" isPhone="true" value="${dwBean.tzhy.jyfzrlxdh}" id="jyfzrlxdh"/>
					</cps:tdContent>
				</cps:row>
				 
				<cps:row>
					<cps:tdLabel>安保负责人身份证：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.abfzrsfzh" id="abfzrsfzh" onblur="queryRyBysfz(this.value,'abfzrxm','abfzrlxdh')"
							isSfzh="true" cssClass="validate[maxSize[18]]"
							inputType="onlychar" value="${dwBean.tzhy.abfzrsfzh}" />
					</cps:tdContent>
	
					<cps:tdLabel>姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.abfzrxm" value="${dwBean.tzhy.abfzrxm}"
							id="abfzrxm" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
	
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.abfzrlxdh" id="abfzrlxdh" isPhone="true" minlength="7" maxlength="20" value="${dwBean.tzhy.abfzrlxdh}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>变更情况：</cps:tdLabel>
					<cps:tdContent  colspan="3">
						<cps:textfield id="bgqk" name="dwBean.tzhy.bgqk" maxlength="250" value="${dwBean.tzhy.bgqk}" cssStyle="width:95%"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bz" name="dwBean.tzhy.bz" maxlength="50" value="${dwBean.tzhy.bz}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>