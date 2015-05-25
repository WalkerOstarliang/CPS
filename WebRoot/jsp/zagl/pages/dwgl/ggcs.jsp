<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="ggcs_div">
	<%-- 
	<creator:tbar id="dw_op">
		<cps:button value="保存" onclick="saveGGCSBean()"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="ggcs_panel" title="公共场所信息" tbarId="dw_op" height="window">
	--%>	
		<input type="hidden" name="dw.ggcs.jlbh" value="${dw.ggcs.jlbh}" id="ggcs_jlbh">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">场所编号：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:textfield name="dw.ggcs.ggcsbh" value="${dw.ggcs.ggcsbh}" id="badjh" inputType="onlychar" maxlength="20"/>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>场所类别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="csxl" zdlb="GGCSLB" name="dw.ggcs.csxl" value="${dw.ggcs.csxl}" optgroup="true" headerKey="" headerValue=" "></cps:select>
					<%--
					<cps:doubleSelect name="dw.ggcs.cslb" value="${dw.ggcs.cslb}"
						required="true" parentdm="0" doubleSelectId="csxl" id="cslb"
						zdlb="GGCSLB" headerKey="" headerValue="--请选择--"
						cssStyle="width:30%" />
					<cps:doubleSelect name="dw.ggcs.csxl" value="${dw.ggcs.csxl}"
						id="csxl" dependSelectId="cslb" zdlb="GGCSLB" headerKey=""
						headerValue="--请选择--" cssStyle="width:30%" />
						 --%>
				</cps:tdContent>
				
				<cps:tdLabel>场所等级：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.ggcs.csdj" value="${dw.ggcs.csdj}" id="csdj"
						zdlb="ZDY_GGCSDJ" headerKey="" headerValue="--请选择--" />
				</cps:tdContent>
			</cps:row>

			<cps:row>
				
				<cps:tdLabel width="10%">备案登记号：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:textfield name="dw.ggcs.badjhm" value="${dw.ggcs.badjhm}"
						id="badjh" inputType="onlychar" cssClass="validate[maxSzie[20]]" />
				</cps:tdContent>
				<cps:tdLabel width="10%">领照时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="lqzzsj" name="dw.ggcs.lqzzsj" maxDate="sysdate" value="${dw.ggcs.lqzzsj}" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>	
				<cps:tdLabel>核定人数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="hdrs" name="dw.ggcs.hdrs" value="${dw.ggcs.hdrs}" inputType="integer" maxlength="3"></cps:textfield>
				</cps:tdContent>	
			</cps:row>

			<cps:row>
			
				<cps:tdLabel>负责人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.csfzr" value="${dw.ggcs.csfzr}" id="fzr" maxlength="15" />
				</cps:tdContent>
				<cps:tdLabel>负责人电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.cslxfs" value="${dw.ggcs.cslxfs}" id="lxfs" maxlength="30" minlength="7" isPhone="true"/>
				</cps:tdContent>
				<cps:tdLabel>其他情况：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield name="dw.ggcs.csqtqk" value="${dw.ggcs.csqtqk}" id="qtqk" cssClass="validate[maxSize[25]]" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>通道口：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.cstdk" value="${dw.ggcs.cstdk}" id="cstdk" cssClass="validate[maxSize[25]]" />
				</cps:tdContent>
				<cps:tdLabel>内部结构：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.csnbjg" value="${dw.ggcs.csnbjg}" id="nbjg" maxlength="50"/>
				</cps:tdContent>
				<cps:tdLabel width="12%">建筑物结构：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.jzwjg" value="${dw.ggcs.jzwjg}" id="jzwjg" maxlength="50"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>有无小件寄存：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.ggcs.ywxjjcc" value="${dw.ggcs.ywxjjcc}" id="ywxjjcc" zdlb="ZAGL_YWXJJCC" headerKey="" headerValue="--请选择--" />
				</cps:tdContent>
				<cps:tdLabel>KTV包间数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.ktvbjs" inputType="integer" value="${dw.ggcs.ktvbjs}" id="ktvbjs"  maxlength="3"/>
				</cps:tdContent>
				<cps:tdLabel width="10%">周围环境：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.zwhj" value="${dw.ggcs.zwhj}" id="zwhj" maxlength="25" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>总面积：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.cszmj" value="${dw.ggcs.cszmj}" inputType="number" id="cszmj"  />
					<font color="green">(m²)</font>
				</cps:tdContent>
			
				<cps:tdLabel>营业面积：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.yymj" value="${dw.ggcs.yymj}" inputType="number" id="yymj"/>
					<font color="green">(m²)</font>
				</cps:tdContent>
				
				<cps:tdLabel>公共场所面积：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.ggcs.ggcsmj" value="${dw.ggcs.yymj}" inputType="number" id="yymj"/>
					<font color="green">(m²)</font>
				</cps:tdContent>
			</cps:row>
		 
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" name="dw.ggcs.bz"  value="${dw.ggcs.bz}" cssStyle="width:93%;height:50px" id="qtqk" maxlength="200"/>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	<%-- 
	</creator:panel>
	--%>
</div>