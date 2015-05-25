<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 
<creator:panel id="thlgpanel" title="特行旅馆信息">
--%>
	<input type="hidden" id="thlgjgbh" name="dw.thlgy.jgbh" value="${dw.thlgy.jgbh}"/>
	<input type="hidden" id="lgbh" name="dw.thlgy.lgbh" value="${dw.thlgy.lgbh}"/>
	<cps:table>
		<cps:row>
			<cps:tdLabel width="12%"><font color="red">*</font>旅馆名称：</cps:tdLabel>
			<cps:tdContent width="22%">
				<cps:textfield name="dw.thlgy.lgmc" 
					id="lgmc" readonly="true"
					required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>经营项目：</cps:tdLabel>
			<cps:tdContent >
				<cps:select zdlb="ZDY_THJYXM" name="dw.thlgy.jyxm" value="${dw.thlgy.jyxm}"
					id="jyxm" headerKey="" headerValue="--请选择--"></cps:select>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>技防设备：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="jfsb" zdlb="ZDY_JGSB" name="dw.thlgy.lgjfsb" value="${dw.thlgy.lgjfsb}" required="true"></cps:select>
			</cps:tdContent>
			
		</cps:row>

		<cps:row>
			<cps:tdLabel width="10%">旅馆类型：</cps:tdLabel>
			<cps:tdContent width="25%">
				<cps:select zdlb="ZDY_YGLX" headerKey="" headerValue="--请选择--"
					name="dw.thlgy.lglx" value="${dw.thlgy.lglx}" id="lglx"></cps:select>
			</cps:tdContent>
			
			<cps:tdLabel width="10%">旅馆星级：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="ZDY_YGXJ" headerKey="" headerValue="--请选择--"
					name="dw.thlgy.lgxj" value="${dw.thlgy.lgxj}" id="lgxj"></cps:select>
			</cps:tdContent>
			<cps:tdLabel>旅馆等级：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="ZDY_YGDJ" headerKey="" headerValue="--请选择--"
					name="dw.thlgy.lgdj" value="${dw.thlgy.lgdj}" id="lggj"></cps:select>
			</cps:tdContent>
			
		</cps:row>

		<cps:row>
			<cps:tdLabel>旅馆是否联网：</cps:tdLabel>
			<cps:tdContent>
				<s:select list="#{'0':'否','1':'是'}" headerKey="" id="lgsflw"
					headerValue="--请选择--" name="dw.thlgy.lgsflw"
					value="dw.thlgy.lgsflw" cssClass="cps-select">
				</s:select>
			</cps:tdContent>

			<cps:tdLabel>旅馆客房数：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="integer" name="dw.thlgy.lgkfs" id="lgkfs"
					value="${dw.thlgy.lgkfs}" maxlength="4" />
			</cps:tdContent>

			<cps:tdLabel>旅馆床位数：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="integer" name="dw.thlgy.lgcws" id="lgcws"
					value="${dw.thlgy.lgcws}" maxlength="4"  />
			</cps:tdContent>
		</cps:row>

		<cps:row>
				
			<cps:tdLabel>旅馆状态：</cps:tdLabel>
			<cps:tdContent>
				<cps:select headerKey="" headerValue="--请选择--" zdlb="ZDY_YGZT"
					name="dw.thlgy.lgzt" value="${dw.thlgy.lgzt}" id="lgzt"></cps:select>
			</cps:tdContent>
			<cps:tdLabel>旅馆车位数：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="integer" name="dw.thlgy.lgtcws" id="lgtcws"
					value="${dw.thlgy.lgtcws}" maxlength="4" ></cps:textfield>
			</cps:tdContent>
			
			<cps:tdLabel>旅馆楼层数：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="integer" name="dw.thlgy.lglcs" maxlength="4"
					value="${dw.thlgy.lglcs}"  id="lglcs" />
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>是否军队旅馆：</cps:tdLabel>
			<cps:tdContent>
				<s:select list="#{'0':'否','1':'是'}" headerKey="" id="sfjdlg"
					headerValue="--请选择--" name="dw.thlgy.sfjdlg"
					cssClass="cps-select" value="dw.thlgy.sfjdlg"></s:select>
			</cps:tdContent>
			
		
			<cps:tdLabel>装机状态：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.thlgy.zjzt" value="${dw.thlgy.zjzt}"
					id="zjzt" cssClass="validate[maxSize[25]]"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>装机方式：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.thlgy.zjfs" value="${dw.thlgy.zjfs}"  
					id="zjfs" cssClass="validate[maxSize[50]]"></cps:textfield>
			</cps:tdContent>
			
		</cps:row>
		<cps:row>
			<cps:tdLabel>建筑面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.thlgy.jzmj" maxlength="6" id="jzmj"
					value="${dw.thlgy.jzmj}" ></cps:textfield>
				<font color="black">(㎡)</font>
			</cps:tdContent>
			<cps:tdLabel>门庭面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.thlgy.mtmj" maxlength="6" id="mtmj"
					value="${dw.thlgy.mtmj}" ></cps:textfield>
				<font color="black">(㎡)</font>
			</cps:tdContent>
			<cps:tdLabel>会客室面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.thlgy.hksmj" maxlength="6" id="hksmj"
					value="${dw.thlgy.hksmj}" ></cps:textfield>
				<font color="black">(㎡)</font>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>寄存室面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.thlgy.jcsmj" maxlength="6" id="jcsmj"
					value="${dw.thlgy.jcsmj}" ></cps:textfield>
				<font color="black">(㎡)</font>
			</cps:tdContent>
			<cps:tdLabel>停车场面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.thlgy.tcsmj" maxlength="6" id="tcsmj"
					value="${dw.thlgy.tcsmj}" ></cps:textfield>
				<font color="black">(㎡)</font>
			</cps:tdContent>
			<cps:tdLabel>库房面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.thlgy.kfmj" maxlength="6" id="kfmj"
					value="${dw.thlgy.kfmj}" ></cps:textfield>
				<font color="black">(㎡)</font>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>娱乐场所面积：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" id="ylcsmj" maxlength="6" name="dw.thlgy.ylcsmj" value="${dw.thlgy.ylcsmj}" ></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>通道宽度：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.thlgy.tdkd" id="tdkd" maxlength="4"
					value="${dw.thlgy.tdkd}" ></cps:textfield>
				<font color="black">(m)</font>
			</cps:tdContent>
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>
				&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
<%-- 	
</creator:panel>
--%>