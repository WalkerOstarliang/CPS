<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<input type="hidden" name="modename" value="从业人员" />
<input type="hidden" name="dw.cyry.cyrybh" id="cyrybh" value="${ dw.cyry.cyrybh}" />
<input type="hidden" name="dw.cyry.jgbh" value="${ dw.cyry.jgbh}" id="cyry_jgbh" />
<input type="hidden" name="dw.cyry.sfjwry" value="${dw.cyry.sfjwry}" id="sfcyry" />
<cps:table>
	<cps:row>
		<c:choose>
			<c:when test="${dw.cyry.pfsj != null || isxttxpage == true }">
					<cps:tdLabel><font color='red'>*</font>居住地派出所：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="jzdpcsdm" name="dw.cyry.jzdpcsdm" value="${dw.cyry.jzdpcsdm}" />
						<cps:textfield id="jzdpcsmc" name="dw.cyry.jzdpcsmc" value="${dw.cyry.jzdpcsmc}"  readonly="true"  required="true"></cps:textfield>
					</cps:tdContent>
				
					<cps:tdLabel><c:if test="${isCyrypf==true}"><font color="red">*</font></c:if>居住地社区：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="xzdjwq" name="dw.cyry.xzdjwq" value="${dw.cyry.xzdjwq}">
						<input type="hidden" id="xzdjwqmc" name="dw.cyry.xzdjwqmc" value="${dw.cyry.xzdjwqmc}" />
						<input type="hidden" id="jzdsqdm" name="dw.cyry.jzdsqdm" value="${dw.cyry.jzdsqdm}">
						<cps:textfield id="jzdsqmc" name="dw.cyry.jzdsqmc" value="${dw.cyry.jzdsqmc}" readonly="true" required="${isCyrypf==true ? true : false}"></cps:textfield>
					</cps:tdContent>
			</c:when>
			<c:otherwise>
					<cps:tdLabel><font color='red'>*</font>居住地派出所：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="jzdpcsdm" name="dw.cyry.jzdpcsdm" value="${dw.cyry.jzdpcsdm}" />
						<cps:textfield id="jzdpcsmc" name="dw.cyry.jzdpcsmc" value="${dw.cyry.jzdpcsmc}" readonly="true" appendPopuBtn="true" onclick="orgSelect('${loginInfo.orgcode}','jzdpcsdm','jzdpcsmc')" required="true"></cps:textfield>
						<%--  
						<span class="cps_span_href" onclick="clearJzdPcs()">清空</span>
						--%>
					</cps:tdContent>
				
					<cps:tdLabel>
						
						<c:if test="${isCyrypf==true}"><font color="red">*</font></c:if>居住地社区：
					</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="xzdjwq" name="dw.cyry.xzdjwq" value="${dw.cyry.xzdjwq}">
						<input type="hidden" id="xzdjwqmc" name="dw.cyry.xzdjwqmc" value="${dw.cyry.xzdjwqmc}" />
						<input type="hidden" id="jzdsqdm" name="dw.cyry.jzdsqdm" value="${dw.cyry.jzdsqdm}">
						<cps:textfield id="jzdsqmc" name="dw.cyry.jzdsqmc" value="${dw.cyry.jzdsqmc}" readonly="true" required="${isCyrypf==true ? true : false}" cssStyle="width:70%" appendPopuBtn="true" onclick="openSqxxSelectWin('xzdjwq','jzdsqdm','jzdsqmc','xzdjwqmc')"></cps:textfield>
						<span class="cps_span_href" onclick="clearJzdsq()">清空</span>
					</cps:tdContent>
			</c:otherwise>
		</c:choose>
		
		<cps:tdLabel>居住地址：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield id="xzdz" name="dw.cyry.xzdz"  value="${dw.cyry.xzdz}"  maxlength="100"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	<cps:row>
		<cps:tdLabel width="11%">
			<font color="red">*</font>职务类别：
		</cps:tdLabel>
		<cps:tdContent width="23%">
				<c:choose>
				<c:when test="${dw.cyry.sfabry eq '1' && dw.opertype == 'add'}">
					<cps:select zdlb="ZAGL_RY_ZW" parentDm='abry' headerKey=""
					headerValue=" " name="dw.cyry.zwlb" id="zw"
					value="${dw.cyry.zwlb}" required="true" />
				</c:when>
				<c:otherwise>
					<cps:select zdlb="ZAGL_RY_ZW" headerKey=""
					headerValue=" " name="dw.cyry.zwlb" id="zw"
					value="${dw.cyry.zwlb}" required="true" />
				</c:otherwise>
			</c:choose>
		</cps:tdContent>
		<cps:tdLabel><font color="red" id="sjhm_tag">*</font>手机号码：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.sjhm" id="sjhm" required="true" isPhone="true" minlength="7" value="${dw.cyry.sjhm}" maxlength="15" />
		</cps:tdContent>
		<cps:tdLabel width="11%">
		 	所在部门：
		 </cps:tdLabel>
		 <cps:tdContent width="22%">
			<cps:textfield name="dw.cyry.bmmc" id="bmmc" maxlength="30" value="${dw.cyry.bmmc}"  />
			<input type="hidden" name="dw.cyry.rybh" value="${dw.cyry.rybh }" id="cyry_rybh" />
			<input type="hidden" name="dw.cyry.xm" id="cyry_xm" value="${dw.cyry.xm}" />
			<input type="hidden" name="dw.cyry.xb" id="cyry_xb" value="${dw.cyry.xb}" />
			<input type="hidden" name="dw.cyry.sfzh" id="cyry_sfzh" value="${ dw.cyry.sfzh}" />
			<input type="hidden" name="dw.cyry.csrq" id="cyry_csrq" value="${dw.cyry.csrq}" />
			<input type="hidden" name="dw.cyry.mz" id="cyry_mz" value="${dw.cyry.mz}" />
			<input type="hidden" name="dw.cyry.bmch" id="cyry_bmch" value="${dw.cyry.bmch}" />
			
			<input type="hidden" name="dw.cyry.dwmc" id="cyry_dwmc" value="${dw.cyry.dwmc}" />
		 </cps:tdContent>
	</cps:row>

	<cps:row>
		<cps:tdLabel>聘用期限(年)：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.pynx" id="pynx"
				value="${dw.cyry.pynx}" maxlength="2" inputType="integer" />
		</cps:tdContent>
		<cps:tdLabel>其他联系方式：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.qtlxdh" id="qtlxdh"
				value="${dw.cyry.qtlxdh}" maxlength="20" />
		</cps:tdContent>
		<cps:tdLabel>奖惩情况：</cps:tdLabel>
		<cps:tdContent >
			<cps:textfield name="dw.cyry.jcqk" id="jcqk" value="${dw.cyry.jcqk}" maxlength="150"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>政审情况：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.zsqk" id="zsqk"
				value="${dw.cyry.zsqk}" maxlength="25" />
		</cps:tdContent>
	
		<cps:tdLabel>员工号：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.cyryygh" id="cyryygh"
				value="${dw.cyry.cyryygh}" inputType="onlychar" maxlength="20" />
		</cps:tdContent>
				
		<cps:tdLabel>入职时间：</cps:tdLabel>
		<cps:tdContent>
			<cps:date id="rzsj" name="dw.cyry.rzsj" value="${dw.cyry.rzsj}" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		 <cps:tdLabel>离职时间：</cps:tdLabel>
		 <cps:tdContent>
		 	<cps:date id="lzsj" name="dw.cyry.lzsj" value="${dw.cyry.lzsj}" dateFmt="yyyy-MM-dd"></cps:date>
		 </cps:tdContent>
		<cps:tdLabel>工资来源：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.gzly" id="gzly"
				value="${dw.cyry.gzly}"  
				cssClass="validate[maxSize[25]]" />
		</cps:tdContent>

		<cps:tdLabel>保卫措施：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.bwcs" value="${dw.cyry.bwcs}"
				id="bwcs" maxlength="15"></cps:textfield>
		</cps:tdContent>
	</cps:row>
	
	<cps:row>
		<cps:tdLabel>培训证书：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.pxzs" id="pxzs"
				inputType="onlychar" value="${dw.cyry.pxzs}" maxlength="25" />
		</cps:tdContent>

		<cps:tdLabel>培训证号：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.pxzh" id="pxzh"
				value="${dw.cyry.pxzh}" inputType="onlychar" maxlength="20" />
		</cps:tdContent>

		<cps:tdLabel>服务对象：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.zdfwdxlb" value="${dw.cyry.pxzh}"
				id="fwdx" maxlength="25"></cps:textfield>
		</cps:tdContent>
	</cps:row>


	<cps:row>
		<cps:tdLabel>控制措施：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.kzcs" value="${dw.cyry.kzcs}"
				id="kzcs" maxlength="15"></cps:textfield>
		</cps:tdContent>

		<cps:tdLabel>主要贡献：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.zygx" value="${dw.cyry.zygx}"
				id="zygx" maxlength="15"></cps:textfield>
		</cps:tdContent>

		<cps:tdLabel>主要问题：</cps:tdLabel>
		<cps:tdContent colspan="5">
			<cps:textfield name="dw.cyry.zywt" value="${dw.cyry.zywt}"
				id="zywt" maxlength="15"></cps:textfield>
		</cps:tdContent>
	</cps:row>
 

	<cps:row>
		<cps:tdLabel>备注：</cps:tdLabel>
		<cps:tdContent colspan="5" width="15%">
			<cps:textfield name="dw.cyry.bz" id="bz" maxlength="250" cssStyle="width:96%;" value="${dw.cyry.bz}"></cps:textfield>
		</cps:tdContent>
	</cps:row>
</cps:table>
</fieldset>

<fieldset>
	<legend>
		操作信息
	</legend>
	<cps:table>
	<cps:row>
		<cps:tdLabel width="11%">注销标识：</cps:tdLabel>
		<cps:tdContent width="22%">
			<s:select list="#{'0':'正常','1':'注销'}" name="dw.cyry.zxbs"
				id="zxbs" value="dw.cyry.zxbs" cssClass="cps-select" onchange="zxChange(this.value)"/>
		</cps:tdContent>

		<cps:tdLabel width="11%">注销日期：</cps:tdLabel>
		<cps:tdContent width="22%">
			<cps:date dateFmt="yyyy-MM-dd" name="dw.cyry.zxrq" id="zxrq"
				value="${dw.cyry.zxrq}"  disabled="true"/>
		</cps:tdContent>

		<cps:tdLabel width="11%">注销原因</cps:tdLabel>
		<cps:tdContent>
			<s:select list="#{'离职':'离职','解雇':'解雇','请辞':'请辞'}" disabled="true" id="zxyy" name="dw.cyry.zxyy" headerKey="" headerValue="--请选择--" cssClass="cps-select"></s:select>
		</cps:tdContent>
	</cps:row>

	<cps:row>
		<cps:tdLabel width="10%">登记人姓名：</cps:tdLabel>
		<cps:tdContent width="20%">
			<cps:textfield name="dw.cyry.djrxm" value="${dw.cyry.djrxm}"
				readonly="true"></cps:textfield>
		</cps:tdContent>

		<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
		<cps:tdContent width="20%">
			<cps:textfield name="dw.cyry.djsj" value="${dw.cyry.djsj}"
				readonly="true"></cps:textfield>
		</cps:tdContent>

		<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
		<cps:tdContent>
			<cps:textfield name="dw.cyry.djdwmc" value="${dw.cyry.djdwmc}"></cps:textfield>

			<input type="hidden" name="dw.cyry.djdwdm" value="${dw.cyry.djdwdm}" />
		</cps:tdContent>
	</cps:row>
</cps:table>