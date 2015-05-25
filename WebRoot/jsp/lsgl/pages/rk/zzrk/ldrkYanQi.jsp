<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
<creator:tbar id="jzzxxTbar">
	<cps:button value="保存" onclick="saveLdrkYanQiInfo();"></cps:button>
	<cps:button value="关闭" onclick="window.close();"></cps:button>
</creator:tbar>
<creator:panel id="jzzxxPanel"  title="流动人口延期登记" tbarId="jzzxxTbar">
	<cps:table>
		<cps:row >
			<cps:tdContent width="85%" valign="top">	
				<div>
					<fieldset>
						<legend>人口基本信息</legend>
						<cps:table>
							<cps:row>
								<cps:tdLabel width="10%">姓名：</cps:tdLabel>
								<cps:tdContent width="20%">
									&nbsp;${rkBean.jbxxBean.xm}
								</cps:tdContent >
								<cps:tdLabel  width="10%">公民身份证号：</cps:tdLabel>
								<cps:tdContent  width="20%">
									&nbsp;
									<span onclick="openSyrkInfoPage('rydaxx','${rkBean.jbxxBean.rybh}','${rkBean.jbxxBean.rylb}')" class="cps_span_href" style="color:red">
										${rkBean.jbxxBean.sfzh}
									</span>
								</cps:tdContent>
							</cps:row>
							
							<cps:row>
								<cps:tdLabel>性别：</cps:tdLabel>
								<cps:tdContent>
									&nbsp;${rkBean.jbxxBean.xbms}
								</cps:tdContent>
								<cps:tdLabel>人员类别：</cps:tdLabel>
								<cps:tdContent>
									&nbsp;${rkBean.jbxxBean.rylbms}
								</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>出生日期：</cps:tdLabel>
								<cps:tdContent>
									&nbsp;${rkBean.jbxxBean.csrq}					
								</cps:tdContent>
								<cps:tdLabel>户籍地详址：</cps:tdLabel>
								<cps:tdContent >
									&nbsp;${rkBean.jbxxBean.hjdxz}
								</cps:tdContent>
							</cps:row>
							<cps:row>
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
								<cps:tdLabel>现住地址：</cps:tdLabel>
								<cps:tdContent  colspan="3">
									&nbsp;${rkBean.jbxxBean.xzzxz}
								</cps:tdContent>
							</cps:row>
					    </cps:table>
					</fieldset>
				</div>
		    </cps:tdContent>
		    <cps:tdContent align="center" valign="top">
				<div>
					<div style="text-align: center;">
						 <img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${rkBean.jbxxBean.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
					</div>
					<%--
					<div style="margin-top:10px">
						<span class="cps_span_href" onclick="openSyrkInfoPage('rydaxx','${rkBean.jbxxBean.rybh }','${rkBean.jbxxBean.rylb}')">人员详细信息</span>
					</div>
					--%>
				</div> 
			</cps:tdContent>
		</cps:row>
	</cps:table>
	 <div>
		<fieldset>
			<legend>流动人口延期登记</legend>
			<form id="ldrkYanQiForm">
				<s:hidden id="zzbh" name="rkBean.ldrkBean.zzbh"></s:hidden>
				<cps:table>
					<cps:row>
						<%--
						<cps:tdLabel width="10%">签发日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="zzzqfrq" readonly="true" name="rkBean.ldrkBean.zzzqfrq"   value="${rkBean.ldrkBean.zzzqfrq}"></cps:textfield>
						</cps:tdContent>
						--%>
						<cps:tdLabel width="10%"><font color="red">*</font>拟居期限：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="njzqx" zdlb="ZDY_NJZQX" required="true" name="rkBean.ldrkBean.njzqx"  headerKey="" headerValue=" " onchange="getYxDate(this.value)" value="${rkBean.ldrkBean.njzqx}"  ></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">居住有效期限：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="zzzyxqjzrq" name="rkBean.ldrkBean.zzzyxqjzrq" value="${rkBean.ldrkBean.zzzyxqjzrq}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">&nbsp;</cps:tdLabel>
						<cps:tdContent>
								&nbsp;					
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>注销标识：</cps:tdLabel>
						<cps:tdContent >
							<s:select id="zxbs" list="#{'0':'正常','1' : '注销'}" name="rkBean.ldrkBean.zxbs" cssClass="cps-select" onchange="changeZxbs(this.value)"/>
						</cps:tdContent>
						<cps:tdLabel id="zxsjLabel">注销时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="zxsj" name="rkBean.ldrkBean.zxsj" value="${rkBean.ldrkBean.zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss" disabled="true" maxDate="${currentSystemDate}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel id="zxyyLabel">注销原因：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_ZXYY" id="zxyy" name="rkBean.ldrkBean.zxyy" value="${rkBean.ldrkBean.zxyy}" headerKey="" headerValue=" " disabled="true"></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</fieldset>	    
    </div>
</creator:panel>
</creator:view>
