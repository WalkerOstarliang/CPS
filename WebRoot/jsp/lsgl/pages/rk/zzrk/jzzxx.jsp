<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/jzzxx.js"></creator:Script>
<cps:PanelView>
<cps:tbar id="jzzxxTbar">
	<c:if test="${operType != 'detail'}">
		<cps:button id="jzzSaveButton" value="保存" onclick="saveJzzxxBean();"></cps:button>
		<!-- 
		<cps:button value="首次打印" onclick="preJzzxxDy('1');"></cps:button>
		<cps:button value="遗失补打" onclick="preJzzxxDy('2');"></cps:button>
		<cps:button value="错证重打" onclick="preJzzxxDy('3');"></cps:button>
		 -->
	</c:if>
	<cps:button value="预览" onclick="openPreviewPage1();"></cps:button>
</cps:tbar>
<cps:panel id="jzzxxPanel"  title="人员基本信息">
	<cps:table>
		<cps:row>
			<cps:tdContent width="85%" valign="top">	
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							&nbsp;${jbxxBean.xm}
						</cps:tdContent >
						<cps:tdLabel  width="10%">公民身份证号：</cps:tdLabel>
						<cps:tdContent  width="20%">
							&nbsp;${jbxxBean.sfzh}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>性别：</cps:tdLabel>
						<cps:tdContent>
							&nbsp;${jbxxBean.xbms}
						</cps:tdContent>
						<cps:tdLabel>人员类别：</cps:tdLabel>
						<cps:tdContent>
							&nbsp;${jbxxBean.rylbms}
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>出生日期：</cps:tdLabel>
						<cps:tdContent>
							&nbsp;${jbxxBean.csrq}					
						</cps:tdContent>
						<cps:tdLabel>户籍地详址：</cps:tdLabel>
						<cps:tdContent>
							&nbsp;${jbxxBean.hjdxz}
						</cps:tdContent>
					</cps:row>
					<cps:row >
						<cps:tdLabel>现住地详址：</cps:tdLabel>
						<cps:tdContent>
							&nbsp;${bean.xzzxz}					
						</cps:tdContent>
						<cps:tdLabel>流动人口登记时间：</cps:tdLabel>
						<cps:tdContent>
							&nbsp;${bean.ldrkdjsj}					
						</cps:tdContent>
					</cps:row>
			    </cps:table>
		    </cps:tdContent>
		    
		    <cps:tdContent align="center" valign="top">
				<div>
					<div style="text-align: center;">
						 <img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${jbxxBean.sfzh}" width="100px" height="120px" title="全国人口库照片" alt="全国人口库照片"/>
					</div>
				</div> 
			</cps:tdContent>
		</cps:row>
	</cps:table>
	<creator:panel id="jzzdjxx" title="居住证信息登记">
		<form id="jzzxxForm">
			<input type="hidden" id="jzzdyzt"  value="${bean.jzzdyzt}" >
			<input type="hidden" id="jzzxxbh" name="bean.jzzxxbh" value="${bean.jzzxxbh}" >
			<input type="hidden" id="jzzrybh" name="bean.jzzrybh" value="${jbxxBean.rybh}">
			<input type="hidden" id="zzbh" name="bean.zzbh" value = "${bean.zzbh}"/>
			<input type="hidden" id="sfzh" name="bean.sfzh" value="${jbxxBean.sfzh}">
			<input type="hidden" id="xb" name="bean.xb" value="${jbxxBean.xb}">
			<input type="hidden" id="hjdqh" name="bean.hjdqh" value="${jbxxBean.hjdqh}">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>居住证发证日期：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:date id="fzrq" name="bean.fzrq" value="${bean.fzrq}"  dateFmt="yyyy-MM-dd" required="true" maxDate="${bean.fzrqmaxdate}" minDate="${bean.fzrqmindate}"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>居住证有效期限：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select zdlb="ZDY_ZZYXQX" id="yxqx" required="true" name="bean.yxqx" headerKey="" headerValue=" " value="${bean.yxqx}"></cps:select>
						年
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
   </creator:panel>
   <creator:tbar id="refreshtbar">
   		<cps:button value="刷新" onclick="refreshDayinPage4List()"></cps:button>
   </creator:tbar>
   <cps:tableGrid id="jzzxxList" title="居住证制证历史记录信息"
  		 				usepager="true"
  		 				tbarId="refreshtbar"
  		 				autoload="true"
  		 				mutilSelect="false"
  		 				click="clickJzzxxRow"
  		 				url="/lsgl/jzzxx/queryJzzxxPageByRybh.action"
  		 				searchform="jzzxxForm">
		<cps:column title="序号" isNumber="true"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<c:if test="${operType != 'detail'}">
			<cps:column title="操作" rowcallback="JzzxxListCz"></cps:column>
		</c:if>
	 	<cps:column field="xm" title="姓名"></cps:column>
	 	<cps:column field="xbms" title="性别"></cps:column>
	 	<cps:column field="sfzh" title="身份号码"></cps:column>
	 	<cps:column field="fzrq" title="发证日期"></cps:column>
	 	<cps:column field="yxqxms" title="有效期(年)"></cps:column>
	 	<cps:column field="xzzxz" title="现住地址" maxlength="10"></cps:column>
	 	<cps:column field="hjdxz" title="户籍地址" maxlength="8"></cps:column>
	 	<cps:column field="djdwmc" title="登记单位"></cps:column>
	 	<cps:column field="djsj" title="登记时间"></cps:column>
	 	<cps:column field="dyztms" title="打印状态"></cps:column>
	 	<cps:column field="jzzdyztms" title="打印标志"></cps:column>
	 	<cps:column field="zzsj" title="制证时间"></cps:column>
	 	<cps:column field="djrxm" title="制证人"></cps:column>
	 	<cps:column field="dyrxm" title="打印人"></cps:column>
	 	<cps:column field="jzzzxbsms" title="居住证标识"></cps:column>
	 	<cps:column field="ldrkzxbsms" title="流口标示"></cps:column>
   </cps:tableGrid>
   <div>
   		<font color="red">注意：制证完成后请点击刷新按钮，更新居住证打印状态.</font>
   </div>
   <iframe id="displayview" scrolling="no" height="0" width="0"></iframe>
</cps:panel>
</cps:PanelView>
</creator:view>
