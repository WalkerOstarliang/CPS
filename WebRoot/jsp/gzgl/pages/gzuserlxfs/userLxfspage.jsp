<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/userlxfs.js"></script>
	<c:if test="${operType!='detail'}">
		<creator:tbar id="lxfsbar">
			<cps:button value="保&nbsp;存" onclick="updateLxfs();"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</creator:tbar>
	</c:if>
	<creator:panel id="aaa" title="警员基本信息" tbarId="lxfsbar">
			<form id="lxfsForm" action="${contextPath }/gzgl/userlxsfgl/saveJylxfs.action" method="post">
				<input type="hidden" type="leve" value="${userLxfsBean.leve} }">
				<input type="hidden" id="id" name="userLxfsBean.id" value="${userLxfsBean.id }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%"><font color="red">*</font>警号：</cps:tdLabel>	
						<cps:tdContent width="20%"> 
							<cps:textfield id="username" name="userLxfsBean.username" value="${userLxfsBean.username}" readonly="true" required="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="14%"><font color="red">*</font>姓名：</cps:tdLabel>
						<cps:tdContent width="23%">
							<cps:textfield id="xm" name="userLxfsBean.xm" value="${userLxfsBean.xm}" readonly="true"></cps:textfield>
							<input id="userid" name="userLxfsBean.userid" value="${userLxfsBean.userid}" type="hidden"/>
						</cps:tdContent>
							<cps:tdLabel  width="14%"><font color="red">*</font>手机号码：</cps:tdLabel>	
						<cps:tdContent  > 
								<c:choose>
								<c:when test="${operType!='detail'}">
									<cps:textfield id="mobile" name="userLxfsBean.mobile" required="true" value="${userLxfsBean.mobile}" cssClass="validate[custom[mobile],maxSize[11]]"></cps:textfield>	
								</c:when>
								<c:otherwise>
									<cps:textfield id="mobile" name="userLxfsBean.mobile" required="true" value="${userLxfsBean.mobile}" readonly="true" ></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>所属单位：</cps:tdLabel>	
						<cps:tdContent> 
							<input id="orgdwdm" name="userLxfsBean.orgdwdm" value="${userLxfsBean.orgdwdm}" type="hidden"/>
							<cps:textfield id="orgdwmc" name="userLxfsBean.orgdwmc" required="true" value="${userLxfsBean.orgdwmc}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel ><font color="red">*</font>用户身份证：</cps:tdLabel>
						<cps:tdContent >
							<cps:textfield id="sfzh" name="userLxfsBean.sfzh" required="true" value="${userLxfsBean.sfzh}" readonly="true"></cps:textfield>
						</cps:tdContent>
					
						<cps:tdLabel><font color="red">*</font>电话号码：</cps:tdLabel>
						<cps:tdContent> 
							<c:choose>
								<c:when test="${operType!='detail'}">
									<cps:textfield id="telephone" name="userLxfsBean.telephone" required="true" value="${userLxfsBean.telephone}" isPhone="true" minlength="7" maxlength="20"></cps:textfield>	
								</c:when>
								<c:otherwise>
									<cps:textfield id="telephone" name="userLxfsBean.telephone" required="true" value="${userLxfsBean.telephone}" readonly="true" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>民族：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="mz" name="userLxfsBean.mz" value="${userLxfsBean.mz}" required="true"  headerKey="" headerValue=" " zdlb="GB_MZ"></cps:select>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>文化程度：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="whcd" name="userLxfsBean.whcd" value="${userLxfsBean.whcd}" required="true" headerKey="" headerValue=" " zdlb="GB_WHCD"></cps:select>
						</cps:tdContent>
						<cps:tdLabel>获奖时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="hjsj" name="userLxfsBean.hjsj" value="${userLxfsBean.hjsj}" dateFmt="yyyy" ></cps:date>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>行政级别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="xzjb" name="userLxfsBean.xzjb" value="${userLxfsBean.xzjb}" required="true" headerKey="" headerValue=" " zdlb="ZDY_XZJB"></cps:select>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>职务：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zw" zdlb="ZDY_ZW" name="userLxfsBean.zw" value="${userLxfsBean.zw}" required="true" headerKey="" headerValue=" " ></cps:select>
						</cps:tdContent>
						<cps:tdLabel>当年集中业务培训次数：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield  id="dnjzywpxcs" name="userLxfsBean.dnjzywpxcs" value="${userLxfsBean.dnjzywpxcs}" inputType="number"></cps:textfield>
						</cps:tdContent>
						
					</cps:row>
					<cps:row>
						<cps:tdLabel>专(兼)职：</cps:tdLabel>
						<cps:tdContent>
							<s:select list="#{'1':'专职','0':'兼职'}" id="sfzzsqmj" name="userLxfsBean.sfzzsqmj" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>是否村（居）委会兼职：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="sqmjsfcwhjz" name="userLxfsBean.sqmjsfcwhjz" value="${userLxfsBean.sqmjsfcwhjz}" headerKey="" headerValue=" " zdlb="ZDY_ZDSF"></cps:select>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>工作岗位：</cps:tdLabel>
						<cps:tdContent>
							<cps:select  id="gzgw" name="userLxfsBean.gzgw" value="${userLxfsBean.gzgw}" zdlb="ZDY_GZGW" required="true" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>开始工作日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="gzsj"  name="userLxfsBean.gzsj" value="${userLxfsBean.gzsj}" dateFmt="yyyy-MM-dd" ></cps:date>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>开始从警日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="cjsj"  name="userLxfsBean.cjsj" value="${userLxfsBean.cjsj}" required="true" dateFmt="yyyy-MM-dd" ></cps:date>
						</cps:tdContent>
						<cps:tdLabel>从事派出所工作日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="pcsgzsj"  name="userLxfsBean.pcsgzsj" value="${userLxfsBean.pcsgzsj}" dateFmt="yyyy-MM-dd" ></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						
						<cps:tdLabel>获奖情况：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="hjqk" name="userLxfsBean.hjqk" value="${userLxfsBean.hjqk}" zdlb="ZDY_MJHJQK" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel><font color="red">*</font>是否驻村民警：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="userLxfsBean.sfzcmj" value="${userLxfsBean.sfzcmj}"> 
							<cps:select zdlb="ZDY_ZDSF"  value="${userLxfsBean.sfzcmj}"  headerKey=" " headerValue=" " disabled="true"></cps:select>
						</cps:tdContent>

						<cps:tdLabel title="任现警务区社区民警起始时间">从事现社区民警时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="lbqxcjsj" name="userLxfsBean.lbqxcjsj" value="${userLxfsBean.lbqxcjsj}" dateFmt="yyyy-MM-dd" ></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" id="bz" name="userLxfsBean.bz" value="${userLxfsBean.bz}" cssStyle="width:98%;height:50px" maxlength="240"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
</creator:view>