<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div id="dwjbxx_div">
	<input id="jgbh" type="hidden" name="dw.dwjbxx.jgbh" value="${dw.dwjbxx.jgbh}" />
	
	<input type="hidden" id="dwmchidden" value="${dw.dwjbxx.dwmc}" />
	
	<!-- 机构编号 -->
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>单位名称：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.dwmc" value="${dw.dwjbxx.dwmc}" maxlength="100" required="true" id="dwjbxx_dwmc"></cps:textfield>
			</cps:tdContent>
			
			<cps:tdLabel width="12%">组织机构代码：</cps:tdLabel>
			<cps:tdContent width="21%">
				<cps:textfield name="dw.dwjbxx.dwdm" value="${dw.dwjbxx.dwdm}"  maxlength="20" id="dwdm"></cps:textfield>
			</cps:tdContent>
			
			<cps:tdLabel width="13%">外文名称：</cps:tdLabel>
			<cps:tdContent width="21%">
				<cps:textfield name="dw.dwjbxx.wwm" value="${dw.dwjbxx.wwm}" maxlength="30" id="dwjbxx_dwmc"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>法人身份证：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.frsfzhm" cssStyle="width:60%" id="frsfzhm" required="true" isSfzh="true" onblur="queryRyBysfz(this.value,'frdb','frlxdh','frzz')" value="${dw.dwjbxx.frsfzhm}"></cps:textfield>
				<input type="checkbox" id="sfzjy" checked="checked" onclick="changeFrsfrz(this)"/>
				<label for="sfzjy">校验</label>
			</cps:tdContent>

			<cps:tdLabel width="12%"><font color="red">*</font>法人姓名：</cps:tdLabel>
			<cps:tdContent width="21%">
				<cps:textfield name="dw.dwjbxx.frdb" value="${dw.dwjbxx.frdb}" required="true" id="frdb" maxlength="15"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="13%">法人联系电话：</cps:tdLabel>
			<cps:tdContent width="21%">
				<cps:textfield name="dw.dwjbxx.frlxdh" value="${dw.dwjbxx.frlxdh}" id="frlxdh" isPhone="true" minlength="7" maxlength="15"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>单位类别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select id="dwlbxl" zdlb="JG_DWLB" name="dw.dwjbxx.dwlb" value="${dw.dwjbxx.dwlb}" optgroup="true" headerKey="" headerValue=" " required="true"></cps:select>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>管理部门：</cps:tdLabel>
			<cps:tdContent>
				<cps:select name="dw.dwjbxx.glbm" value="${dw.dwjbxx.glbm}" id="glbm" headerValue=" " headerKey="" zdlb="ZAGL_GLBM" required="true"/>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>单位电话：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.dwdh" value="${dw.dwjbxx.dwdh}" id="dwdh" minlength="7" isPhone="true" maxlength="20" required="true"></cps:textfield>
			</cps:tdContent>
			
		</cps:row>
		<cps:row>
			<cps:tdLabel>管理级别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select name="dw.dwjbxx.gljb" value="${dw.dwjbxx.gljb}" id="gljb" headerValue=" " headerKey="" zdlb="ZAGL_GLJB" />
			</cps:tdContent>
			<cps:tdLabel>重点单位标识：</cps:tdLabel>
			<cps:tdContent>
				<cps:select zdlb="ZAGL_ZDDJ" name="dw.dwjbxx.zddwbs" value="${dw.dwjbxx.zddwbs}" id="zddwbs" headerValue=" " headerKey="" />
			</cps:tdContent>
			<cps:tdLabel width="13%">消防等级：</cps:tdLabel>
			<cps:tdContent width="21%">
				<cps:select name="dw.dwjbxx.fhdj" value="${dw.dwjbxx.fhdj}" id="fhdj" headerValue=" " headerKey="" zdlb="ZAGL_XFDJ"></cps:select>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>主管部门：</cps:tdLabel>
			<cps:tdContent >
				<cps:textfield name="dw.dwjbxx.zgbm" id="zgbm" value="${dw.dwjbxx.zgbm}" maxlength="20"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>单位传真：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.dwcz" value="${dw.dwjbxx.dwcz}" id="dwcz" isPhone="true"  maxlength="30"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>单位电子邮箱：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.dwdzyx" id="dwdzyx" maxlength="120" isEmail="true" value="${dw.dwjbxx.dwdzyx}"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>税务登记号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.swdjh" value="${dw.dwjbxx.swdjh}" id="swdjh"  maxlength="21"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>开业日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date name="dw.dwjbxx.kyrq" value="${dw.dwjbxx.kyrq}" id="dwjbxx_kyrq" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>从业人数(人)：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="integer" name="dw.dwjbxx.cyrs" id="cyrs" value="${dw.dwjbxx.cyrs}" maxlength="5"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>注册日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date name="dw.dwjbxx.zcrq" value="${dw.dwjbxx.zcrq}" maxDate="sysdate"
					id="zcrq" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>注册资本(万元)：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield inputType="number" name="dw.dwjbxx.zczb"
					value="${dw.dwjbxx.zczb}"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>注册地址：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.zcdz" value="${dw.dwjbxx.zcdz}"
					id="zcdz" maxlength="50"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>营业执照号：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.yyzzbh" id="yyzzbh" maxlength="25" value="${dw.dwjbxx.yyzzbh}"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel>执照发照日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date name="dw.dwjbxx.fzrq" value="${dw.dwjbxx.fzrq}" id="fzrq" dateFmt="yyyy-MM-dd" maxDate="sysdate"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>执照有效期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date name="dw.dwjbxx.yxqx" value="${dw.dwjbxx.yxqx}" id="yxqx" dateFmt="yyyy-MM-dd"></cps:date>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>保密级别：</cps:tdLabel>
			<cps:tdContent>
				<cps:select name="dw.dwjbxx.bmjb" value="${dw.dwjbxx.bmjb}"
					id="bmjb" headerValue=" " headerKey="" zdlb="ZAGL_BMJB" />
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>单位地址：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<cps:textfield id="dzmc" value="${dw.dwjbxx.dwdz}" name="dw.dwjbxx.dwdz"  required="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>单位属性：</cps:tdLabel>
			<cps:tdContent colspan="5" id="dwsx_td">
				<input type="hidden" name="dw.dwjbxx.hylb" id="dwjbxx_hylb" value="09" />
				技防单位
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>经营范围：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.jyfw" type="textarea" value="${dw.dwjbxx.jyfw}" id="jyfw" maxlength="100" cssStyle="height:40px"></cps:textfield>
			</cps:tdContent>
			
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<cps:textfield name="dw.dwjbxx.bz" type="textarea" value="${dw.dwjbxx.bz}" id="jyfw" maxlength="100" cssStyle="width:88%;height:40px"></cps:textfield>
			</cps:tdContent>
		</cps:row>
	</cps:table>

	
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%">责任民警：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${not empty dw.dwjbxx.zrmjxm}">
						<input type="hidden" name="dw.dwjbxx.zrmjjh" id="zrmjjh" value="${dw.dwjbxx.zrmjjh}"  />
						<cps:textfield name="dw.dwjbxx.zrmjxm" id="zrmjxm" readonly="true" value="${dw.dwjbxx.zrmjxm}"  appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','zrmjjh','zrmjxm')" />
					</c:when>
					<c:otherwise>
						<input type="hidden" name="dw.dwjbxx.zrmjjh" id="zrmjjh" value="${loginInfo.username}" />
						<cps:textfield name="dw.dwjbxx.zrmjxm" id="zrmjxm" readonly="true" value="${loginInfo.realname}" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','zrmjjh','zrmjxm')" />
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		
			<cps:tdLabel width="12%"><font color="red">*</font>责任单位：</cps:tdLabel>
			<cps:tdContent width="21%">
				<c:choose>
					<c:when test="${not empty dw.dwjbxx.zrdwpcsdm}">
						<input type="hidden" name="dw.dwjbxx.zrdwpcsdm" id="zrdwpcsdm" value="${dw.dwjbxx.zrdwpcsdm}" />
						<cps:textfield name="dw.dwjbxx.zrdwpcsmc" id="zrdwpcsmc" value="${dw.dwjbxx.zrdwpcsmc}" readonly="true" required="true" onclick="selectOrg('${loginInfo.rootOrgCode}','zrdwpcsdm','zrdwpcsmc')" appendPopuBtn="true"/>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="dw.dwjbxx.zrdwpcsdm" id="zrdwpcsdm" value="${loginInfo.orgcode}" />
						<cps:textfield name="dw.dwjbxx.zrdwpcsmc" id="zrdwpcsmc" value="${loginInfo.orgname}" required="true" readonly="true" onclick="selectOrg('${loginInfo.rootOrgCode}','zrdwpcsdm','zrdwpcsmc')" appendPopuBtn="true" />
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
			<cps:tdLabel width="13%">责任民警电话：</cps:tdLabel>
			<cps:tdContent width="21%">
				<cps:textfield name="dw.dwjbxx.zrmjdh" id="zrmjdh" isPhone="true" minlength="7" maxlength="20" value="${dw.dwjbxx.zrmjdh}" />
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>登记人：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.djrxm" value="${dw.dwjbxx.djrxm}" id="djrxm" readonly="true" />
			</cps:tdContent>
			
			<cps:tdLabel>登记时间：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.djsj" value="${dw.dwjbxx.djsj}" id="djsj" readonly="true"/>
			</cps:tdContent>
			
			<cps:tdLabel>登记单位：</cps:tdLabel>
			<cps:tdContent>
				<input type="hidden" name="dw.dwjbxx.djdwdm" value="${dw.dwjbxx.djdwdm}" />
				<cps:textfield name="dw.dwjbxx.djdwmc" value="${dw.dwjbxx.djdwmc}" id="djdwmc" readonly="true" />
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>注销标识：</cps:tdLabel>
			<cps:tdContent>
				<s:select list="#{'0':'正常','1':'注销'}" cssClass="cps-select" id="zxbs"  name="dw.dwjbxx.zxbs" value="dw.dwjbxx.zxbs" onchange="zxChange(this.value)"></s:select>
			</cps:tdContent>

			<cps:tdLabel>注销日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date dateFmt="yyyy-MM-dd" name="dw.dwjbxx.zxrq" id="zxrq" value="${dw.dwjbxx.zxrq}" disabled="true"></cps:date>
			</cps:tdContent>
			<cps:tdLabel>注销原因：</cps:tdLabel>
			<cps:tdContent>
				<cps:textfield name="dw.dwjbxx.zxyy" value="${dw.dwjbxx.zxyy}" id="zxyy" maxlength="50" disabled="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
	</cps:table>
</div>
