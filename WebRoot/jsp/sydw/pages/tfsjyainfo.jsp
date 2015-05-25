<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="突发事件预案信息">
	<creator:Script src="/jsp/zagl/js/tfsjya.js"></creator:Script>
	<div id="tfsjya_div">
		<creator:tbar id="op">
			<cps:button value="保存" onclick="saveTfsjya()" display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="window.close()"></cps:button>
		</creator:tbar>
		<creator:panel id="bwjg" title="突发事件预案" tbarId="op">
			<form id="tfsjya_form">
				<input type="hidden" name="dw.tfsjya.yabh" value="${dw.tfsjya.yabh}" id="yabh" />
				<input type="hidden" id="jgbh" name="dw.tfsjya.jgbh" value="${jgbh}" />
				<input type="hidden" value="${operType}" id="opertype"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>预案类型：</cps:tdLabel>
						<cps:tdContent>
							<cps:select name="dw.tfsjya.yalx" value="${dw.tfsjya.yalx}" headerKey="" headerValue=" " id="yalx"  required="true" zdlb="ZDY_YALX" />
						</cps:tdContent>
						
						<cps:tdLabel>修订时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="dw.tfsjya.xdsj" value="${dw.tfsjya.xdsj}" maxDate="sysdate" id="xdsj" dateFmt="yyyy-MM-dd" defaultSystemDate="true"/>
						</cps:tdContent>
						
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>
							&nbsp;
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>要求人员情况：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield name="dw.tfsjya.yqryqk" value="${dw.tfsjya.yqryqk}" id="yqryqk" maxlength="200" cssStyle="width:93%" />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>要求装备情况：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield name="dw.tfsjya.yqzbqk" value="${dw.tfsjya.yqzbqk}" id="yqzbqk" maxlength="200" cssStyle="width:93%" />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color="red">*</font>预案内容：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" name="dw.tfsjya.yanr" value="${dw.tfsjya.yanr}" id="yanr" cssStyle="width:93%;height:80px;" />
						</cps:tdContent>
					</cps:row>
					
				<cps:row>
					<cps:tdLabel width="15%">登记人：</cps:tdLabel>
					<cps:tdContent width="18%">
						<c:choose>
							<c:when test="${dw.tfsjya.djrxm != null}">
								<cps:textfield name="dw.tfsjya.djrxm" value="${dw.tfsjya.djrxm}" readonly="true" id="djrxm" />
							</c:when>
							<c:otherwise>
								<cps:textfield name="dw.tfsjya.djrxm" value="${loginInfo.realname}" readonly="true" id="djrxm" />
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="15%">登记时间：</cps:tdLabel>
					<cps:tdContent width="18%">
						<c:choose>
							<c:when test="${dw.tfsjya.djsj != null}">
								<cps:textfield name="dw.tfsjya.djsj" value="${dw.tfsjya.djsj}" readonly="true" id="djsj" />
							</c:when>
							<c:otherwise>
								<cps:textfield name="dw.tfsjya.djsj" value="${currentSystemDate}" readonly="true" id="djsj" />
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
	
					<cps:tdLabel width="15%">登记单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${dw.tfsjya.djdwdm != null}">
								<cps:textfield name="dw.tfsjya.djdwmc" value="${dw.tfsjya.djdwmc}" readonly="true" id="djdwmc" />
								<input type="hidden" name="dw.tfsjya.djdwdm" id="djdwdm" value="${dw.tfsjya.djdwdm}"/>
							</c:when>
							<c:otherwise>
								<cps:textfield name="dw.tfsjya.djdwmc" value="${loginInfo.orgname}" readonly="true" id="djdwmc" />
								<input type="hidden" name="dw.tfsjya.djdwdm" id="djdwdm" value="${loginInfo.orgcode }"/>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<div style="height:10px;"></div>
			
		<creator:tbar id="yayl_op">
			<cps:button value="保存预案演练" onclick="saveYayl()"></cps:button>
		</creator:tbar>
		
		<form id="yaylcx">
			<input type="hidden" name="dw.tfsjya.yabh" value="${dw.tfsjya.yabh}" id="ylcx_yabh" />
		</form>
		
		<creator:panel id="yayl" title="预案演练" tbarId="yayl_op">
			<cps:tableGrid url="${contextPath}/zagl/dw/queryYaylByYabh.action" searchform="yaylcx"
					id="yaylList" autoload="true" width="99.5%" height="150" 
					pageSize="10" usepager="false" mutilSelect="false" click="loadYl">
				<cps:column isNumber="true" title="序号"></cps:column>
				<c:if test="${operType != 'detail'}">
					<cps:column title="操作" field="cz"></cps:column>
				</c:if>
				<cps:column title="演练名称" field="ylmc"></cps:column>
				<cps:column title="演练时间" field="ylsj"></cps:column>
				<cps:column title="参演人数(人)" field="cyrs"></cps:column>
				<cps:column title="演练描述" field="ms"></cps:column>
			</cps:tableGrid>
			
			<form id="yayl_form">
				<input type="hidden" name="dw.tfsjya.yayl.bh" id="bh" />
				<input type="hidden" name="dw.tfsjya.yayl.yabh" value="${dw.tfsjya.yabh}" id="yl_yabh" />
				
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%"><font color="red">*</font>演练名称：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield name="dw.tfsjya.yayl.ylmc" id="ylmc" maxlength="50" required="true"/>
						</cps:tdContent>
						
						<cps:tdLabel width="15%"><font color="red">*</font>演练时间：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:date name="dw.tfsjya.yayl.ylsj" maxDate="sysdate" id="ylsj" required="true" defaultSystemDate="true" dateFmt="yyyy-MM-dd HH:mm:ss"/>
						</cps:tdContent>
						
						<cps:tdLabel width="15%"><font color='red'></font>参演人数(人)：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dw.tfsjya.yayl.cyrs" id="cyrs"  maxlength="3" required="true" inputType="integer"/>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color="red">*</font>描述：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield type="textarea" name="dw.tfsjya.yayl.ms" id="ms" required="true" maxlength="250" cssStyle="width:93%;height:60px;" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
	</div>	
</creator:view>
