<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/dwdj/js/wbdwshlist.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${(loginInfo.leve <=3) and (sh.shzt eq '0')}">
				<cps:button value="审核通过" onclick="wbdwSh('1')" id="shButon1"></cps:button>
				<cps:button value="审核不通过" onclick="wbdwSh('2')" id="shButon2"></cps:button>
			</c:if>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</cps:tbar>
		
		<cps:panel title="审核信息">
			<form id="wbdwShForm">
				<input type="hidden" name="sh.id" value="${sh.id}" />
				<input type="hidden" name="sh.jgbh" value="${sh.jgbh}" />
				<input type="hidden" name="sh.shzt" id="shzt" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="35%">标题：</cps:tdLabel>
						<cps:tdContent>
							${sh.tjrxm}[${sh.tjrjh}]请求${(sh.czlx eq '1')?'新增':(sh.czlx eq '4')?'注销':'恢复'}[${sh.dwmc}]&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>单位名称：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="sh.dwmc" value="${sh.dwmc}" />
							<span class="cps_span_href" onclick="openDwDetail('${sh.jgbh}')" style="color:green">
								${sh.dwmc}
							</span>&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>操作类型：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="sh.czlx" value="${sh.czlx}" />
							${(sh.czlx eq '1')?'新增':(sh.czlx eq '4')?'注销':'恢复'}&nbsp;
						</cps:tdContent>
					</cps:row>
					<c:if test="${sh.czlx eq '4'}">
						<cps:row>
							<cps:tdLabel>注销时间：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" name="sh.zxsj" value="${sh.zxsj}" />
								${sh.zxsj}&nbsp;
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>注销原因：</cps:tdLabel>
							<cps:tdContent>
								<input type="hidden" name="sh.zxyy" value="${sh.zxyy}" />
								${sh.zxyy}&nbsp;
							</cps:tdContent>
						</cps:row>
					</c:if>
					<cps:row>
						<cps:tdLabel>提交人：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="sh.tjrxm" value="${sh.tjrxm}" />
							<input type="hidden" name="sh.tjrjh" value="${sh.tjrjh}" />
							${sh.tjrxm}[${sh.tjrjh}]&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>提交时间：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="sh.tjsj" value="${sh.tjsj}" />
							${sh.tjsj}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>提交单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="sh.tjdwmc" value="${sh.tjdwmc}" />
							<input type="hidden" name="sh.tjdwdm" value="${sh.tjdwdm}" />
							${sh.tjdwmc}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>审核状态：</cps:tdLabel>
						<cps:tdContent>
							${(sh.shzt eq "0")?"<font color='red'>未审核</font>":(sh.shzt eq "1")?"审核通过":"审核未通过"}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>审核人：</cps:tdLabel>
						<cps:tdContent>
							<c:if test="${!(sh.shzt eq '0')}">
								${sh.shrxm}[${sh.shrjh}]
							</c:if>
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>审核时间：</cps:tdLabel>
						<cps:tdContent>
							${sh.shsj}&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>审核单位：</cps:tdLabel>
						<cps:tdContent>
							${sh.shdwmc}&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>