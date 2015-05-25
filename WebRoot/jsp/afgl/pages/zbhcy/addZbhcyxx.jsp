<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="治保会成员信息">
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/zbhcyxx.js"></script>
	<creator:tbar id="tbar">
		<cps:button value="保存" onclick="addZbhcyxx();"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel id="head_djzbhcyxx" tbarId="tbar" title="治保会成员信息">
		<form id="add_zbhcyxx_form" action="${contextPath}/zbhcyxx/addZbhcyxx.action" method="post">
			<input type="hidden" id="czbs" name="zbhcyxxBean.czbs" value="${zbhcyxxBean.czbs }"/>
			<input type="hidden" id="zbhcybh" name="zbhcyxxBean.zbhcybh" value="${zbhcyxxBean.zbhcybh}"/>
			<cps:table id="zbhcyxxtable">
				<cps:row id="clear_row1">
					<cps:tdLabel><font color="red">*</font>所在社区：</cps:tdLabel>
					<cps:tdContent colspan="6">
						<input type="hidden" id="sssqdm" name="zbhcyxxBean.sssqdm" value="${zbhcyxxBean.sssqdm}">
						<cps:textfield id="sssqmc"  name="zbhcyxxBean.sssqmc" value="${zbhcyxxBean.sssqmc}" cssClass="validate[required] cps-input" appendPopuBtn="true" cssStyle="width:95%" readonly="true" onclick="openSqxxSelectWin(fullSqxx)"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row2">
					<cps:tdLabel width="12%"><font color="red">*</font>身份证号：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="sfzh" name="zbhcyxxBean.sfzh"  maxlength="18" isSfzh="true" required="true"  onblur="isExistSfzhInZbh(this.value)" value="${zbhcyxxBean.sfzh }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>姓名：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="xm" name="zbhcyxxBean.xm" value="${zbhcyxxBean.xm }" cssClass="validate[required]" required="true" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">性别：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="xb" name="zbhcyxxBean.xb"  value="${zbhcyxxBean.xb}" zdlb="GB_XB" headerValue=" " headerKey="" cssClass="cps-input"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row3">
					<cps:tdLabel>出生日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="csrq" readonly="true" name="zbhcyxxBean.csrq"   value="${zbhcyxxBean.csrq }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdh" name="zbhcyxxBean.lxdh" minlength="7" maxlength="20"  isPhone="true" value="${zbhcyxxBean.lxdh }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >文化程度：</cps:tdLabel>
					<cps:tdContent >
						<cps:select id="whcd" name="zbhcyxxBean.whcd"  value="${zbhcyxxBean.whcd }" zdlb="GB_WHCD"  headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row4">
					<cps:tdLabel >婚姻状况：</cps:tdLabel>
					<cps:tdContent >
						<cps:select id="hyzk" name="zbhcyxxBean.hyzk"  value="${zbhcyxxBean.hyzk }" zdlb="AF_HYZK"  headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel >工作单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="gzdw" name="zbhcyxxBean.gzdw"  value="${zbhcyxxBean.gzdw }" maxlength="60"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >工作表现：</cps:tdLabel>
					<cps:tdContent >
						<cps:select id="gzbx" name="zbhcyxxBean.gzbx"  value="${zbhcyxxBean.gzbx }" zdlb="AF_GZBX" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row5">
					<cps:tdLabel>户籍地：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="hjdqh" name="zbhcyxxBean.hjdqh"  value="${zbhcyxxBean.hjdqh}"/>
						<cps:textfield id="hjdxz" name="zbhcyxxBean.hjdxz" appendPopuBtn="true" readonly="true" onclick="selectXzqh('hjdqh','hjdxz')"  value="${zbhcyxxBean.hjdxz }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>现住地：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="xzdxz"  name="zbhcyxxBean.xzdxz"  value="${zbhcyxxBean.xzdxz }" maxlength="60" cssStyle="width:95%"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				 
				<cps:row id="clear_row5">
					<cps:tdLabel><font color="red">*</font>参加日期：</cps:tdLabel>
					<cps:tdContent >
						<cps:date id="cjrq" name="zbhcyxxBean.cjrq" dateFmt="yyyy-MM-dd"  value="${zbhcyxxBean.cjrq }" maxDate="sysdate" cssClass="validate[required] cps-input" onblur="dateMaxorMin()"  ></cps:date>
					</cps:tdContent>
					<cps:tdLabel >会中职务：</cps:tdLabel>
					<cps:tdContent >
						<cps:select id="zbhzw" name="zbhcyxxBean.zbhzw"  value="${zbhcyxxBean.zbhzw }" zdlb="ZDY_ZBHCYZW"  headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel>奖惩次数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="jccs" name="zbhcyxxBean.jccs"  value="${zbhcyxxBean.jccs }" inputType="true" maxlength="2"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<%-- 
				<cps:row id="clear_row6">
					<cps:tdLabel >报酬情况：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="bcqk" name="zbhcyxxBean.bcqk"  value="${zbhcyxxBean.bcqk }" maxlength="60"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row7">
					<cps:tdLabel >人员简历：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="ryjl" name="zbhcyxxBean.ryjl"  value="${zbhcyxxBean.ryjl }" cssStyle="width:92%;height:80px;" type="textarea" maxlength="150"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row8">
					<cps:tdLabel >社会关系：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="shgx" name="zbhcyxxBean.shgx"  value="${zbhcyxxBean.shgx }" cssStyle="width:92%;height:80px;" type="textarea" maxlength="150"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				--%>
				<%-- 
				<cps:row>
					<cps:tdLabel >登记人：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="djrxm" name="zbhcyxxBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						<input type="hidden" id="djrjh" name="zbhcyxxBean.djrjh" value="${loginInfo.username }" />
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent >
						<cps:date id="djsj" name="zbhcyxxBean.djsj" value="${sysdate}" readOnly="true"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djdwmc" name="zbhcyxxBean.djdwmc" value="${loginInfo.orgname }" readonly="true"></cps:textfield>
						<input id="djdwdm" name="zbhcyxxBean.djdwdm" type="hidden" value="${loginInfo.orgcode }" />
					</cps:tdContent>
				</cps:row>
				--%>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>