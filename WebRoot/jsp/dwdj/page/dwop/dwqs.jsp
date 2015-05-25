<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript">
		$(function(){
			$("#dzmc").val("");
		});
	</script>
	<cps:panel title="单位签收">
		<s:if test="!(operType eq 'detail')">
			<form id="dwqsForm">
				<input type="hidden" name="dwqs.log.ywxtzj" value="${dwqs.dwxx.ywzjid}"/>
				<input type="hidden" name="dwqs.log.ywxtlx" value="${dwqs.dwxx.ywxtdwlx}"/>
				<input type="hidden" name="dwqs.dwxx.ywzjid" value="${dwqs.dwxx.ywzjid}"/>
				<input type="hidden" name="dwqs.dwxx.glbm" value="${dwqs.dwxx.glbm}"/>
				<input type="hidden" name="dwqs.dwxx.ywxtlx" value="${dwqs.dwxx.ywxtdwlx}"/>
				<input type="hidden" name="dwqs.dwxx.dwmc" value="${dwqs.dwxx.dwmc}"/>
				<input type="hidden" name="dwqs.dwxx.hylb" value="${dwqs.dwxx.hylb}"/>
				<input type="hidden" name="dwqs.dwxx.dwdh" value="${dwqs.dwxx.dwdh}"/>
				<input type="hidden" name="dwqs.dwxx.zzjgdm" value="${dwqs.dwxx.zzjgdm}"/>
				<input type="hidden" name="dwqs.dwxx.yyzzhm" value="${dwqs.dwxx.yyzzhm}"/>
				<input type="hidden" name="dwqs.dwxx.kyrq" value="${dwqs.dwxx.kyrq}"/>
				<input type="hidden" name="dwqs.dwxx.frdbxm" value="${dwqs.dwxx.frdbxm}"/>
				<input type="hidden" name="dwqs.dwxx.frdbsfzh" value="${dwqs.dwxx.frdbsfzh}"/>
				<input type="hidden" name="dwqs.dwxx.frdblxdh" value="${dwqs.dwxx.frdblxdh}"/>
				<input type="hidden" name="dwqs.dwxx.dwlb" value="${dwqs.dwxx.dwlb}"/>
				<input type="hidden" name="dwqs.dwxx.zxbs" value="${dwqs.dwxx.zxbs}"/>
			
				<cps:table>
					<cps:row>
						<cps:tdLabel width="20%">选择单位地址：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="dwqs.dwfwgl.fwid" id="fwid" />
							<input type="hidden" name="dwqs.dwfwgl.dzid" id="dzid" />
							<input type="hidden" name="dwqs.dwxx.sssqdm" id="sssqdm" />
							<cps:textfield name="dwqs.log.qsdz" id="dzmc" readonly="true" value=""
								appendPopuBtn="true" onclick="openDwSelectFwInfoPage()"></cps:textfield>
							<cps:button value="清空" onclick="clearDz()"></cps:button>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>选择现有单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="dwqs.dwxx.jgbh" id="jgbh" />
							<cps:textfield id="dwmc" readonly="true" name="dwqs.log.qsdw" appendPopuBtn="true"
									value="" onclick="openDwSelectPage()"></cps:textfield>
							<cps:button value="清空" onclick="clearDw()"></cps:button>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="2">
							<span style="color:red">
								选择现有单位签收时请仔细核对信息，否则会造成原有单位信息的丢失。
							</span>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</s:if>
		<s:else>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">签收人：</cps:tdLabel>
					<cps:tdContent width="18%">${log.czrxm}&nbsp;</cps:tdContent>
					<cps:tdLabel width="15%">签收时间：</cps:tdLabel>
					<cps:tdContent width="18%">${log.czsj}&nbsp;</cps:tdContent>
					<cps:tdLabel width="15%">签收单位：</cps:tdLabel>
					<cps:tdContent>${log.czdwmc}&nbsp;</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>签收后单位地址：</cps:tdLabel>
					<cps:tdContent colspan="5">${log.qsdz}&nbsp;</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>签收后单位名称：</cps:tdLabel>
					<cps:tdContent colspan="5">${log.qsdw}&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</s:else>
	</cps:panel>
</creator:view>