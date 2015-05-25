<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="tzhy_div">
	<%-- 
	<creator:tbar id="dw_op">
		<cps:button value="保存" onclick="saveTzhyBean()"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="tzhy_panel" title="特种行业信息" tbarId="dw_op">
	--%>
		<input type="hidden" id="tzhyjgbh" name="dw.tzhy.jgbh" value="${dw.dwjbxx.jgbh}"/>
		<input type="hidden" id="tzhythmc" name="dw.tzhy.thmc" value="${dw.tzhy.thmc}"/>
		<input type="hidden" id="thbh" name="dw.tzhy.thbh" value="${dw.tzhy.thbh}"/>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%"><font color="red">*</font>特行类别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="thlb" zdlb="ZAGL_THLB" name="dw.tzhy.thxl" value="${dw.tzhy.thxl}" required="true" optgroup="true" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>许可证号：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield name="dw.tzhy.tzhyxkz" value="${dw.tzhy.tzhyxkz}" inputType="onlychar" id="tzhyxkz" required="true" cssClass="validate[maxSize[20]]" />
				</cps:tdContent>
				<cps:tdLabel >经营类别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.tzhy.jylb" value="${dw.tzhy.jylb}" zdlb="ZDY_JYLB" headerKey="" headerValue="--请选择--" />
				</cps:tdContent>
				
			</cps:row>

			<cps:row>
				<cps:tdLabel width="10%">有效日期：</cps:tdLabel>
				<cps:tdContent width="25%">
					<cps:date dateFmt="yyyy-MM-dd" name="dw.tzhy.xkzyxrq" id="xkzyxrq" value="${dw.tzhy.xkzyxrq}" />
				</cps:tdContent>
				<cps:tdLabel width="10%">核发人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.hfr" value="${dw.tzhy.hfr}" id="hfr" cssClass="validate[maxSize[15]]" />
				</cps:tdContent>
				<cps:tdLabel>发证机关：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield name="dw.tzhy.xkzhfdw" value="${dw.tzhy.xkzhfdw}" id="xkzhfdw" maxlength="80"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				
				<cps:tdLabel>领证人：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield name="dw.tzhy.lzr" value="${dw.tzhy.lzr}" id="lzr" maxlength="15"/>
				</cps:tdContent>
				<cps:tdLabel>建档日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" name="dw.tzhy.thjdrq" value="${dw.tzhy.thjdrq}" />
				</cps:tdContent>
				<cps:tdLabel>备案时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" name="dw.tzhy.barq" value="${dw.tzhy.barq}" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6" align="left" cssStyle="background-color: #FFF0B2;font-weight: 600;">经营负责人信息：</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">身份证号：</cps:tdLabel>
				<cps:tdContent width="21%">
					<cps:textfield name="dw.tzhy.jyfzrsfzh" 
						onblur="queryRyBysfz(this.value,'jyfzr','jyfzrlxdh')"
						value="${dw.tzhy.jyfzrsfzh}" id="jyfzrsfzh" isSfzh="true"
						cssClass="validate[maxSize[18]]" />
				</cps:tdContent>
				<cps:tdLabel width="12%">姓名：</cps:tdLabel>
				<cps:tdContent width="21%">
					<cps:textfield name="dw.tzhy.jyfzr" value="${dw.tzhy.jyfzr}"
								id="jyfzr" cssClass="validate[maxSize[15]]" />
				</cps:tdContent>
				<cps:tdLabel width="12%">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.jyfzrlxdh" maxlength="20" minlength="7" isPhone="true"
						value="${dw.tzhy.jyfzrlxdh}" id="jyfzrlxdh"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6" align="left" cssStyle="background-color: #FFF0B2;font-weight: 600;">安保负责人信息：</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>身份证号：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.abfzrsfzh" id="abfzrsfzh" onblur="queryRyBysfz(this.value,'abfzrxm','abfzrlxdh')"
						isSfzh="true" cssClass="validate[maxSize[18]]"
						inputType="onlychar" value="${dw.tzhy.abfzrsfzh}" />
				</cps:tdContent>

				<cps:tdLabel>姓名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.abfzrxm" value="${dw.tzhy.abfzrxm}"
						id="abfzrxm" cssClass="validate[maxSize[15]]" />
				</cps:tdContent>

				<cps:tdLabel>联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.abfzrlxdh" id="abfzrlxdh" isPhone="true" minlength="7" maxlength="20" value="${dw.tzhy.abfzrlxdh}" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>责任民警：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.zrmj" id="zrmj"
						cssClass="validate[maxSize[15]]"
						value="${dw.tzhy.zrmj}" onclick="orgUserSelect('${loginInfo.rootOrgCode}','','',mjxx)" appendPopuBtn="true"/>
				</cps:tdContent>
				
				<cps:tdLabel>民警电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.mjdh" id="mjdh" minlength="7" maxlength="20" isPhone="true"
						value="${dw.tzhy.mjdh}" />
				</cps:tdContent>
				
				<cps:tdLabel>派出所电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.tzhy.pcsdh" id="pcsdh" isPhone="true" maxlength="20" minlength="7"
						value="${dw.tzhy.pcsdh}" />
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>治安责任单位：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield name="dw.tzhy.zazrdwmc" id="zazrdwmc" cssStyle="width:93.5%"
						cssClass="validate[maxSize[60]]" onclick="selectOrg('${loginInfo.rootOrgCode}','zazrdwdm','zazrdwmc')"
						value="${dw.tzhy.zazrdwmc}" readonly="true" appendPopuBtn="true"/>
					<input type="hidden" name="dw.tzhy.zazrdwdm" value="${dw.tzhy.zazrdwdm}" id="zazrdwdm" />	
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>变更情况：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<textarea name="dw.tzhy.bgqk" style="width: 94%; height: 40px;"
						id="bgqk" class="validate[maxSize[250]]">${dw.tzhy.bgqk}</textarea>
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<textarea name="dw.tzhy.bz" style="width: 94%; height: 40px;"
						id="bz" class="validate[maxSize[50]]" >${dw.tzhy.bz}</textarea>
				</cps:tdContent>
			</cps:row>
		</cps:table>
</div>
 