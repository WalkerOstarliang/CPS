<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/jwrkinfo.js"></creator:Script>
	<form id="rkxxform" method="post">
		<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${jwrkBean.rybh }">
		<cps:PanelView>
			<cps:tbar>
				<c:if test="${operType != 'detail'}">
					<cps:button value="添加联系方式" onclick="addLxfs()"></cps:button>
					<cps:button value="保存" onclick="saveLxfsxxBean()"></cps:button>
					<cps:button value="关闭" onclick="parent.close();"></cps:button>
				</c:if>
			</cps:tbar>
			<cps:panel id="lxfsxxpanel" title="人员联系方式">
				<cps:table id="lxfsTable">
					<c:if test="${not empty lxfsBeans}">
						<c:forEach items="${lxfsBeans}" var="lxfsInfo" varStatus="s" step="1">
							<cps:row id="row${s.index}">
								<cps:tdLabel width="12%"><font color="red">*</font>联系方式类型：</cps:tdLabel>
								<cps:tdContent width="14%">
									<cps:select id="lxfslx${s.index}" name="rkBean.lxfsBean[${s.index}].lxfslx" value="${lxfsInfo.lxfslx}" zdlb="ZDY_LXFSLX"  required="true" headerKey="" headerValue=" " onchange="chageStyle(this)"></cps:select>
								</cps:tdContent>
								
								<cps:tdLabel width="12%"><font color="red">*</font>联系方式：</cps:tdLabel>
								<cps:tdContent width="20%">
									<cps:textfield id="lxfs${s.index}" name="rkBean.lxfsBean[${s.index}].lxfs" value="${lxfsInfo.lxfs}" required="true"></cps:textfield>
									<input type="hidden" id="lxfsid${s.index}" name="rkBean.lxfsBean[${s.index}].id" value="${lxfsInfo.id}"/>
								</cps:tdContent>
								
								<cps:tdLabel width="12%">备注：</cps:tdLabel>
								<cps:tdContent width="20%">
									<cps:textfield id="lxfsbz${s.index}" name="rkBean.lxfsBean[${s.index}].lxfsbz" value="${lxfsInfo.lxfsbz}"></cps:textfield>
								</cps:tdContent>
								<c:if test="${operType != 'detail'}">
									<cps:tdLabel width="10%">
										<cps:button value="删除" onclick="delLxfs(this)"></cps:button>
									</cps:tdLabel>
								</c:if>
							</cps:row>
						</c:forEach>
					</c:if>
					<c:if test="${empty lxfsBeans}">
						<cps:row id="row0">
							<cps:tdLabel width="12%"><font color="red">*</font>联系方式类型：</cps:tdLabel>
							<cps:tdContent width="14%">
								<cps:select id="lxfslx0" name="rkBean.lxfsBean[0].lxfslx" value="" zdlb="ZDY_LXFSLX" headerKey="" headerValue=" "  required="true" onchange="chageStyle(this)"></cps:select>
							</cps:tdContent>
							
							<cps:tdLabel width="12%"><font color="red">*</font>联系方式：</cps:tdLabel>
							<cps:tdContent width="20%">
								<cps:textfield id="lxfs0" name="rkBean.lxfsBean[0].lxfs" value="" required="true"></cps:textfield>
								<input type="hidden"  id="lxfsid0" name="rkBean.lxfsBean[0].id" value="" />
							</cps:tdContent>
							
							<cps:tdLabel width="12%">备注：</cps:tdLabel>
							<cps:tdContent width="20%">
								<cps:textfield id="lxfsbz0" name="rkBean.lxfsBean[0].lxfsbz" value="" ></cps:textfield>
							</cps:tdContent>
							<c:if test="${operType != 'detail'}">
								<cps:tdLabel>
									<cps:button value="删除" onclick="delLxfs(this)"></cps:button>
								</cps:tdLabel>
							</c:if>
						</cps:row>
					</c:if>
				</cps:table>	
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>