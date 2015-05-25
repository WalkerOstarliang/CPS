<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 单位基本信息 --%>
<creator:view>
	<creator:Script src="/jsp/dwdj/js/dwop.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${(log.czzt eq '1') and !(operType eq 'detail') }" >
				<cps:button id="pfbutton" onclick="dwpf('${loginInfo.orgcode}')" value="派发"></cps:button>
			</c:if>
			
			<c:if test="${(log.czzt eq '2') and !(operType eq 'detail')}" >
				<cps:button id="qsbutton" onclick="dwqs()" value="签收"></cps:button>
			</c:if>
			
			<c:if test="${(log.czzt eq '3') and !(operType eq 'detail')}" >
				<cps:button id="thbutton" onclick="dwth()" value="退回"></cps:button>
			</c:if>
			<cps:button onclick="window.close()" value="关闭"></cps:button>
		</cps:tbar>
		<cps:panel title="单位基本信息">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">单位名称：</cps:tdLabel>
					<cps:tdContent width="18%">${dwxx.dwmc}&nbsp;</cps:tdContent>
					<cps:tdLabel width="15%">行业类别：</cps:tdLabel>
					<cps:tdContent width="18%">${dwxx.hylbmc}&nbsp;</cps:tdContent>
					<cps:tdLabel width="15%">单位电话：</cps:tdLabel>
					<cps:tdContent>${dwxx.dwdh}&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>组织机构代码：</cps:tdLabel>
					<cps:tdContent>${dwxx.zzjgdm}&nbsp;</cps:tdContent>
					<cps:tdLabel>营业执照：</cps:tdLabel>
					<cps:tdContent>${dwxx.yyzzhm}&nbsp;</cps:tdContent>
					<cps:tdLabel>开业日期：</cps:tdLabel>
					<cps:tdContent>${dwxx.kyrq}&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>法人姓名：</cps:tdLabel>
					<cps:tdContent>${dwxx.frdbxm}&nbsp;</cps:tdContent>
					<cps:tdLabel>法人身份证：</cps:tdLabel>
					<cps:tdContent>${dwxx.frdbsfzh}&nbsp;</cps:tdContent>
					<cps:tdLabel>法人电话：</cps:tdLabel>
					<cps:tdContent>${dwxx.frdblxdh}&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>单位地址：</cps:tdLabel>
					<cps:tdContent colspan="5">${dwxx.dwdz}&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>所属责任单位：</cps:tdLabel>
					<cps:tdContent colspan="5">${dwxx.sszrdwmc}&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
		<c:if test="${log.czzt eq '1'}" >
			<%@include file="dwpf.jsp" %>
		</c:if>
		<c:if test="${log.czzt eq '2'}" >
			<%@include file="dwqs.jsp" %>
		</c:if>
		<c:if test="${log.czzt eq '3'}" >
			<%@include file="dwth.jsp" %>
		</c:if>
</creator:view>