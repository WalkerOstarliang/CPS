<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="出租屋巡查登记">
<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
<creator:Script src="/jsp/lsgl/js/fwxcinfo.js"></creator:Script>
<c:if test="${operType != 'detail'}">
	<creator:tbar id="fwtbarpanel">
		<cps:button value="保存" onclick="callcall();"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
</c:if>
	<creator:panel id="fwinfopanel"  title="房屋基本信息"  width="99.5%"  tbarId="fwtbarpanel">
		<input type="hidden" id="fwmc" name="fwBean.fwmc" value="${fwBean.fwmc}"/>
		<%-- 房屋基本信息 --%>
		<div>
			<cps:table>
			<!--私有-->
				<c:if test="${fwBean.cqlx=='2'}">
					<cps:row >
						<cps:tdLabel width="10%">房主证件号码：</cps:tdLabel>
						<cps:tdContent width="25%">&nbsp;
							<cps:dicText   value="${fwBean.hzsfzh}" ></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">房主姓名：</cps:tdLabel>
						<cps:tdContent width="25%">&nbsp;
							<cps:dicText value="${fwBean.hzxm}" ></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent>&nbsp;
							<cps:dicText value="${fwBean.hzlxdh}" ></cps:dicText>
						</cps:tdContent>
					</cps:row>
				</c:if>
			<!--公有-->
				<c:if test="${fwBean.cqlx=='1'}">
					<cps:row >
						<cps:tdLabel width="10%">法人证件号码：</cps:tdLabel>
						<cps:tdContent width="25%">&nbsp;
							<cps:dicText   value="${fwBean.frdbsfzh}" ></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">法人代表姓名：</cps:tdLabel>
						<cps:tdContent width="25%">&nbsp;
							<cps:dicText value="${fwBean.frdbxm}" ></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent>&nbsp;
							<cps:dicText value="${fwBean.frdblxdh}" ></cps:dicText>
						</cps:tdContent>
					</cps:row>
				</c:if>
				<cps:row>
					<cps:tdLabel width="10%">房屋地址：</cps:tdLabel>
					<cps:tdContent colspan="5">&nbsp;
						<cps:dicText value="${fwBean.dzmc}"></cps:dicText>
					</cps:tdContent>
					 
				</cps:row>
			</cps:table>
		</div>
	</creator:panel>

<creator:panel id="xcdjpanel" title="巡查情况登记信息"   >
<div id="xcdjxx">
<form id="fwxxform"  method="post" >	
	<s:hidden id="operType" name="operType" ></s:hidden>
	<input type="hidden" id="fwid" name="fwBean.fwid" value="${fwBean.fwid}">
	<input type="hidden" id="xcdjbh" name="fwBean.xcdjBean.xcdjbh" value="${fwBean.xcdjBean.xcdjbh}">
	<c:if test="${operType != 'detail'}">
		<cps:table>
			<cps:row  id="clear_row2">
				<cps:tdLabel><font color="red">*</font>巡查民警：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="xcmjxm" name="fwBean.xcdjBean.xcmjxm" required="true" onclick="openXcmjSelect('${loginInfo.rootOrgCode}')" appendPopuBtn="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>巡查单位：</cps:tdLabel>
				<cps:tdContent>
					<input type="hidden" id="xcmjdwdm" name="fwBean.xcdjBean.xcmjdwdm" value="${fwBean.xcdjBean.xcmjdwdm }"/>
					<cps:textfield id="xcmjdwmc" name="fwBean.xcdjBean.xcmjdwmc" value="${fwBean.xcdjBean.xcmjdwmc}" readonly="true" required="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>巡查时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="xcsj" name="fwBean.xcdjBean.xcsj" value="${fwBean.xcdjBean.xcsj}" dateFmt="yyyy-MM-dd" required="true" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row  id="clear_row">
				<cps:tdLabel><font color="red">*</font>巡查情况：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="xcqknr" name="fwBean.xcdjBean.xcqknr" value="${fwBean.xcdjBean.xcqknr}" cssStyle="width:93%;height:50px;" type="textarea" maxlength="500" required="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row  id="clear_row1">
				<cps:tdLabel>处理结果：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="xccljg" name="fwBean.xcdjBean.xccljg"  value="${fwBean.xcdjBean.xccljg}" cssStyle="width:93%;height:50px;" type="textarea" maxlength="500"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="10%">登记民警：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty fwBean.xcdjBean.djrxm}">
							<cps:textfield id="djrxm" name="fwBean.xcdjBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<cps:textfield id="djrxm" name="fwBean.xcdjBean.djrxm" value="${fwBean.xcdjBean.djrxm}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
				<cps:tdContent width="25%">
					<c:choose>
						<c:when test="${empty fwBean.xcdjBean.djdwdm}">
							<input type="hidden" id="djdwdm" name="fwBean.xcdjBean.djdwdm" value="${loginInfo.orgcode}"/>
							<cps:textfield id="djdwmc" name="fwBean.xcdjBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="djdwdm" name="fwBean.xcdjBean.djdwdm" value="${fwBean.djdwdm}"/>
							<cps:textfield id="djdwmc" name="fwBean.xcdjBean.djdwmc" value="${fwBean.xcdjBean.djdwmc}" readonly="true"></cps:textfield>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${empty fwBean.xcdjBean.djsj}">
							<cps:date id="djsj" name="fwBean.xcdjBean.djsj" defaultSystemDate="true" maxDate="${currentSystemDate}"></cps:date>
						</c:when>
						<c:otherwise>
							<cps:date id="djsj" name="fwBean.xcdjBean.djsj" value="${fwBean.xcdjBean.djsj}" maxDate="${currentSystemDate}"></cps:date>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</c:if>
</form>
</div>
	<cps:tableGrid id="xcdjtablgrid" title="出租房巡查历史"
				click="rowcallbackCzfxcdj"
				url="/lsgl/fw/queryFwJbxxBeansByFwid.action"
				autoload="true"
				searchform="fwxxform" pageSize="5"
				width="99.6%">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="xcmjxm" title="巡查民警姓名"></cps:column>
		<cps:column field="xcmjdwmc" title="巡查单位"></cps:column>
		<cps:column field="xcsj" title="巡查时间"></cps:column>
		<cps:column field="xcqknr" title="巡查内容" maxlength="20"></cps:column>
	</cps:tableGrid>
</creator:panel>
</creator:view>
 
