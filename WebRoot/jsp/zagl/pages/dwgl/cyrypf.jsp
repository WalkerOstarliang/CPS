<%@page contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员派发">
	<creator:Script src="/jsp/zagl/js/cyry.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="派发" onclick="cyrypf()"></cps:button>
			<cps:button value="反馈" onclick="openCyryTxfkWin('${dw.cyry.cyrybh}')"></cps:button>
			<cps:button value="关闭" onclick="window.close();"></cps:button>
		</cps:tbar>
		<cps:panel id="crry_panel" title="人员基本信息">
			<c:choose>
				<c:when test="${dw.cyry.sfjwry != '1'}">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="15%">身份证号：</cps:tdLabel>
							<cps:tdContent width="22%">
								&nbsp;${rkBean.jbxxBean.sfzh}
							</cps:tdContent>
							<cps:tdLabel width="11%">姓名：</cps:tdLabel>
							<cps:tdContent width="22%">
								&nbsp;${rkBean.jbxxBean.xm}
							</cps:tdContent>
							<cps:tdLabel width="11%">别名/绰号：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.bmch}
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>性别：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.xbms}
							</cps:tdContent>
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.csrq}
							</cps:tdContent>
							<cps:tdLabel>民族：</cps:tdLabel>
							<cps:tdContent>
							&nbsp;${rkBean.jbxxBean.mzms}
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>政治面貌：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.zzmmms}
							</cps:tdContent>
							<cps:tdLabel>文化程度：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.whcdms}
							</cps:tdContent>
							<cps:tdLabel>婚姻状况：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.hyzkms}
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>兵役状况：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.byzkms}
							</cps:tdContent>
							<cps:tdLabel>宗教信仰：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.zzxyms}
							</cps:tdContent>
							<cps:tdLabel>血型：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.xxms}
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>身高(㎝)：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.sg} 
							</cps:tdContent>
							<cps:tdLabel>联系电话：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.lxdh}
							</cps:tdContent>
							<cps:tdLabel>电话备注：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.lxdhbz}
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel>服务处所：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.fwcs}
							</cps:tdContent>
							<cps:tdLabel>职务：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.zw}
							</cps:tdContent>
							<cps:tdLabel>专长：</cps:tdLabel>
							<cps:tdContent>
							<!-- rkBean.jbxxBean.zc -->
								&nbsp;${rkBean.jbxxBean.zc}
							</cps:tdContent>
						</cps:row>
						<cps:row >
							<cps:tdLabel>户籍地区划：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${rkBean.jbxxBean.hjdqhmc}
							</cps:tdContent>
							<cps:tdLabel>户籍地详址：</cps:tdLabel>
							<cps:tdContent colspan="3">
								&nbsp;${rkBean.jbxxBean.hjdxz}
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</c:when>
				<c:otherwise>
					<cps:table>
						<cps:row>
							<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
							<cps:tdContent width="25%">
								&nbsp;${dw.cyry.gjms}
							</cps:tdContent>
							<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
							<cps:tdContent width="25%">
								&nbsp;${dw.cyry.zjzlms}
							</cps:tdContent>
							<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${dw.cyry.zjhm}
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel><font color="red">*</font>英文姓：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${dw.cyry.ywx}
							</cps:tdContent>
							<cps:tdLabel><font color="red">*</font>英文名：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${dw.cyry.ywm}
							</cps:tdContent>
							<cps:tdLabel>中文姓名：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${dw.cyry.xm}
							</cps:tdContent>
						</cps:row>
						<cps:row>
							<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${dw.cyry.xbms}
							</cps:tdContent>
							<cps:tdLabel>出生日期：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${dw.cyry.csrq}
							</cps:tdContent>
							<cps:tdLabel>联系电话：</cps:tdLabel>
							<cps:tdContent>
								&nbsp;${dw.cyry.lxdh}
							</cps:tdContent>
						</cps:row>
					</cps:table>
				</c:otherwise>
			</c:choose>
		</cps:panel>
	</cps:PanelView>
	<creator:panel title="人员派发" id="pfpanel">
		<form id="cyry_form">
			<input type="hidden" name="cyrypf.cyrybh" id="cyrybh" value="${ dw.cyry.cyrybh}" />
			<input type="hidden" name="cyrypf.rybh" value="${dw.cyry.rybh }" />
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">从业单位：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield value="${dw.cyry.dwmc}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">居住地派出所：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield  value="${dw.cyry.jzdpcsmc}" readonly="true"></cps:textfield>
					</cps:tdContent >
					<cps:tdLabel width="10%">居住地址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield  value="${dw.cyry.xzdz}" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><font color='red'>*</font>居住地社区：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<input type="hidden" id="xzdjwq" name="cyrypf.xzdjwq" />
						<input type="hidden" id="xzdjwqmc" name="cyrypf.xzdjwqmc"  />
						<input type="hidden" id="jzdsqdm" name="cyrypf.jzdsqdm" />
						<cps:textfield id="jzdsqmc" name="cyrypf.jzdsqmc" readonly="true" appendPopuBtn="true" required="true" onclick="openSqxxSelectWin('xzdjwq','jzdsqdm','jzdsqmc','xzdjwqmc')"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<font color="red">
							说明：从业人员派发是指非本辖区社区民警登记从业人员时不清楚从业人员实际居住社区，填写从业人员的居住地派出所后，需要通过居住地派出所核实后，把从业人员派发至
								实际居住地社区由社区民警进行管辖.<br/>
							注意：这里的居住地址为从业登记时候填写的居住地址，如果该从业人员并不在辖区内居住则可以进行反馈。
						</font>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>	