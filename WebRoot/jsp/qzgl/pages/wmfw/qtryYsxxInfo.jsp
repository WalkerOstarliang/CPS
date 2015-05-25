<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="流浪乞讨人员移送信息登记表">

<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js">
	
</script>

<style>
	body{margin:0;height:100%}
	html{height:100%}
	#left{width:800px;height:100%;float:left}
	#main{width:100%;height:100%;}
</style>
		<creator:tbar id="qtryYsxxInfotbar">
			<c:choose>
				<c:when test="${operType=='update'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveQtryYsxx('true')" display="${displayAddBtn}"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</creator:tbar>
		<!--startprint1-->
		<form id="qtryYsxxform" name="qtryYsxxform"  action="/qzgl/wmfwgl/saveQtryYsxxBean.action" method="post">
		<creator:panel id="addQtry" title="流浪乞讨人员移送信息登记表" tbarId="qtryYsxxInfotbar">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="id" name="qtrybean.id"></s:hidden>
			<div id="main"  style="height: 100%;width:100%">
				<div id ="left" >
				  <cps:table id="qtryTable">	
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>人员类别：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrylbms}"></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtryxm}"></cps:dicText>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">曾用名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrycym}"></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:dicText value="${qtrybean.qtryxbms}"></cps:dicText>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">年龄：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrynl}"></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">籍贯：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtryjgms}"></cps:dicText>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">民族：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrymzms}"></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">文化程度：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrywhcdms}"></cps:dicText>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">健康状况：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtryjkzkms}"></cps:dicText>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">发现时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrybfxsj}"></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">发现地点：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrybfxdd}"></cps:dicText>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">户口地址：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtryhjxz}"></cps:dicText>
						</cps:tdContent>
						<cps:tdLabel width="10%">携带物品财物：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:dicText value="${qtrybean.qtrycw}"></cps:dicText>
						</cps:tdContent>
					</cps:row>
				</cps:table>	
			</div>
				<c:choose>
					<c:when test="${operType=='update'}">
						<img id="qtryzp" height="185px;" src="<c:url value='/qzgl/wmfwgl/showQtryPh.action'/>?id=${qtrybean.id}"/>
					</c:when>
				</c:choose>
			</div>
			<cps:tabPanel id="">
				家庭成员和亲友信息
			</cps:tabPanel>
			<input type="hidden" id="qtryid" name ="qtryqyquery.qtryid" value="${qtryqyquery.qtryid}"/>
			<cps:tableGrid id="qtryqueryqylist" 
				mutilSelect="true"
				pageSize="3"
				url="/qzgl/wmfwgl/queryQtryqphyListAction.action?id=${qtrybean.id}" autoload="true" >
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="jtpyxm" title="姓名" maxlength="10"></cps:column>
				<cps:column field="jtpygxms" title="关系" maxlength="10"></cps:column>
				<cps:column field="jtpylxdh" title="联系电话" maxlength="10"></cps:column>
			</cps:tableGrid>
			<cps:table id="qtrytable2">
				<cps:row>
					<cps:tdLabel width="12%">送院单位意见：</cps:tdLabel>
					<cps:tdContent width="100%" colspan="5">
						<s:textarea id="sydwyj" name="qtrybean.sydwyj" rows="4" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">送院时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date id="sysj" name="qtrybean.sysj"  value ="${qtrybean.sysj}"  maxDate="${qtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="12%">收治医院：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="szyy" name="qtrybean.szyy" cssClass="validate[maxSize[120]]"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">住院号：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="zyh" name="qtrybean.zyh" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">入院情况：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<s:textarea id="ryqk" name="qtrybean.ryqk" rows="4" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">送院人员：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="syryxm" name="qtrybean.syryxm" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">接收医生：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jsysxm" name="qtrybean.jsysxm" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">入院时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="rysj" name="qtrybean.rysj"  value ="${qtrybean.rysj}"  maxDate="${qtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">救助站审核意见：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<s:textarea id="jzzshyj" name="qtrybean.jzzshyj" rows="4" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">审核人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jzzshrxm" name="qtrybean.jzzshrxm" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">审核时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="jzzshsj" name="qtrybean.jzzshsj"  value ="${qtrybean.jzzshsj}"  maxDate="${qtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">出院情况处理意见：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<s:textarea id="cyqkclyj" name="qtrybean.cyqkclyj" rows="4" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
						</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">医疗费用（大写）：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="ylfy" name="qtrybean.ylfy" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">主治医生：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="zzysxm" name="qtrybean.zzysxm" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">移送时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date id="yssj" name="qtrybean.yssj"  value ="${qtrybean.yssj}"  maxDate="${qtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="12%">移送承办人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="yscbrxm" name="qtrybean.yscbrxm" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>	
					<cps:tdLabel width="12%">接收人：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jsrxm" name="qtrybean.jsrxm" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>		
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">接收时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date id="jssj" name="qtrybean.jssj"  value ="${qtrybean.jssj}"  maxDate="${qtrybean.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>	
					<cps:tdLabel width="12%">接收单位：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jsdwmc" name="qtrybean.jsdwmc" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>	
					<cps:tdLabel width="12%">接收单位领导：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="jsdwld" name="qtrybean.jsdwld" cssClass="validate[maxSize[30]]"></cps:textfield>
					</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">备注：</cps:tdLabel>
					<cps:tdContent width="100%" colspan="5">
						<s:textarea id="ysxxbz" name="qtrybean.ysxxbz" rows="4" cssStyle="width:100%" cssClass="validate[maxSize[200]]"></s:textarea>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<s:hidden id="ysdjrxm" name="qtrybean.ysdjrxm"></s:hidden>
					<s:hidden id="ysdjdwdm" name="qtrybean.ysdjdwdm"></s:hidden>
					<s:hidden id="ysdjdwmc" name="qtrybean.ysdjdwmc"></s:hidden>
					<s:hidden id="ysdjdwmc" name="qtrybean.ysdjsj"></s:hidden>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>	
	<!--endprint1-->
</creator:view>