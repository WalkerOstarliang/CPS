<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="jwrkjbxx">
	<cps:table>
		<cps:row>
			<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
			<cps:tdContent width="25%">
				${dw.cyry.jwrk.gjms}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
			<cps:tdContent width="25%">
				${dw.cyry.jwrk.zjzlms}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.zjhm}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel><font color="red">*</font>外文姓：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.ywx}&nbsp;
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>外文名：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.ywm}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>中文姓名：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.xm}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.xbms}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>出生日期：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.csrq}&nbsp;
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.lxdh}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>服务处所：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.fwcs}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>职务：</cps:tdLabel>
			<cps:tdContent>
				${rkBean.jbxxBean.zw}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>电话备注：</cps:tdLabel>
			<cps:tdContent>
				${rkBean.jbxxBean.lxdhbz}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>签证类型：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.qzzlms}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>签证机关：</cps:tdLabel>
			<cps:tdContent >
				${dw.cyry.jwrk.qzjg}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>签发日期：</cps:tdLabel>
			<cps:tdContent >
				${dw.cyry.jwrk.qfrq}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>停留有效期：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.tlyxq}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>停留事由：</cps:tdLabel>
			<cps:tdContent>
				${dw.cyry.jwrk.tlsyms}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>居住类型：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.cyry.jwrk.jwrylx eq '0'}">
						常住
					</c:when>
					<c:when test="${dw.cyry.jwrk.jwrylx eq '1'}">
						临住
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.cyry.jwrk.bz}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<!-- 
		<cps:row>
			<cps:tdLabel><font color="red">*</font>居住地址：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${rkBean.fwxxBean.dzmc}&nbsp;
			</cps:tdContent>
		</cps:row>
		 -->	
	</cps:table>
</div>