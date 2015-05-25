<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="公共场所信息">
	<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#ggcsform").find(":input").attr("disabled","true")
			}
		});
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveGgcsBean()" display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="公共场所信息">
		<form id="ggcsform" action="<c:url value='/sydw/dwgl/saveGgcsBean.action'/>" method="post">
			<input type="hidden" name="dwBean.ggcs.jlbh" value="${dwBean.ggcs.jlbh}" id="ggcsjlbh">
			<input type="hidden" name="dwBean.ggcs.jgbh" value="${dwBean.dwjbxx.jgbh}" id="ggcsjgbh">
			<input type="hidden" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}" id="jgbh">
			<s:hidden id="operType" name="operType"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">场所编号：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield name="dwBean.ggcs.ggcsbh" value="${dwBean.ggcs.ggcsbh}" id="badjh" inputType="onlychar" maxlength="20" />
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>场所类别：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="csxl" zdlb="GGCSLB" name="dwBean.ggcs.csxl" value="${dwBean.ggcs.csxl}" optgroup="true" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%">场所等级：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select name="dwBean.ggcs.csdj" value="${dwBean.ggcs.csdj}" id="csdj"
							zdlb="ZDY_GGCSDJ" headerKey="" headerValue=" " />
					</cps:tdContent>
				</cps:row>
	
				<cps:row>
					<cps:tdLabel>备案登记号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.badjhm" value="${dwBean.ggcs.badjhm}"
							id="badjh" inputType="onlychar" cssClass="validate[maxSzie[20]]" />
					</cps:tdContent>
					<cps:tdLabel width="10%">领照时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="lqzzsj" name="dwBean.ggcs.lqzzsj" maxDate="sysdate" value="${dwBean.ggcs.lqzzsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>	
					<cps:tdLabel>核定人数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="hdrs" name="dwBean.ggcs.hdrs" value="${dwBean.ggcs.hdrs}" inputType="integer" maxlength="3"></cps:textfield>
					</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel>负责人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.csfzr" value="${dwBean.ggcs.csfzr}" id="fzr" maxlength="15" />
					</cps:tdContent>
					<cps:tdLabel>负责人电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.cslxfs" value="${dwBean.ggcs.cslxfs}" id="lxfs" maxlength="30" minlength="7" isPhone="true"/>
					</cps:tdContent>
					<cps:tdLabel>其他情况：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="dwBean.ggcs.csqtqk" value="${dwBean.ggcs.csqtqk}" id="qtqk" cssClass="validate[maxSize[25]]" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>通道口：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.cstdk" value="${dwBean.ggcs.cstdk}" id="cstdk" cssClass="validate[maxSize[25]]" />
					</cps:tdContent>
					<cps:tdLabel>内部结构：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.csnbjg" value="${dwBean.ggcs.csnbjg}" id="nbjg" maxlength="50"/>
					</cps:tdContent>
					<cps:tdLabel width="12%">建筑物结构：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.jzwjg" value="${dwBean.ggcs.jzwjg}" id="jzwjg" maxlength="50"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>有无小件寄存：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="dwBean.ggcs.ywxjjcc" value="${dwBean.ggcs.ywxjjcc}" id="ywxjjcc" zdlb="ZAGL_YWXJJCC" headerKey="" headerValue="--请选择--" />
					</cps:tdContent>
					<cps:tdLabel>KTV包间数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.ktvbjs" inputType="integer" value="${dwBean.ggcs.ktvbjs}" id="ktvbjs"  maxlength="3"/>
					</cps:tdContent>
					<cps:tdLabel>周围环境：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.zwhj" value="${dwBean.ggcs.zwhj}" id="zwhj" maxlength="25" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>总面积(m²)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.cszmj" value="${dwBean.ggcs.cszmj}" inputType="number" id="cszmj"  />
					</cps:tdContent>
				
					<cps:tdLabel>营业面积(m²)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.yymj" value="${dwBean.ggcs.yymj}" inputType="number" id="yymj"/>
					</cps:tdContent>
					
					<cps:tdLabel>公共场所面积(m²)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.ggcs.ggcsmj" value="${dwBean.ggcs.yymj}" inputType="number" id="yymj"/>
					</cps:tdContent>
				</cps:row>
			 
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="dwBean.ggcs.bz"  value="${dwBean.ggcs.bz}" id="qtqk" maxlength="200" cssStyle="width:97%"/>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>