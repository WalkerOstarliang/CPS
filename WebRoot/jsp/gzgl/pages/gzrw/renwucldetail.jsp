<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/gongzuogl.js"></script>
	<creator:tbar  id="addnewrwtbar">
	
		<c:if test="${renwuBean.sfqs=='0'||empty(renwuBean.sfqs)}">
		<cps:button value="签收" onclick="qsRenwu('${renwuBean.bh}')"></cps:button>
		</c:if>
		<cps:button value="关&nbsp;闭" onclick="$.closeWindow();"></cps:button>
	</creator:tbar>
	<creator:panel title="任务登记" id="rwdj"  tbarId="addnewrwtbar">
		<form action="${contextPath}/gzgl/rwgl/submitRenwuBean.action" method="post" id="beanform">
			<cps:table>
				<cps:row>
					<cps:tdLabel>
						<font color="red" >*&nbsp;</font>任务标题：
					</cps:tdLabel>
					<cps:tdContent colspan="3">
						<input type="hidden" name="renwuBean.op" value="${renwuBean.op}"/>
						<input type="hidden" name="renwuBean.rwfkzt" value="${renwuBean.rwfkzt}"/>
						<input type="hidden" name="renwuBean.rwwcqk" value="${renwuBean.rwwcqk}"/>
						<input type="hidden" name="renwuBean.bh" value="${renwuBean.bh}"/>	
						<cps:textfield  readonly="true" name="renwuBean.rwbt" value="${renwuBean.rwbt}" id="rwbt" cssClass="validate[required] cps-input" cssStyle="width:90%"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="13%">
						<font color="red">*&nbsp;</font>要求完成时间：
					</cps:tdLabel>
					<cps:tdContent width="25%">
					<cps:textfield name="renwuBean.yqclwcrq" value="${renwuBean.yqclwcrq}"  id="yqclwcrq" cssClass="validate[required] cps-input" readonly="true" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">
						<font color="red">*&nbsp;</font>任务说明：
					</cps:tdLabel>
					<cps:tdContent colspan="5" width="25%" >
							<s:textarea name="renwuBean.rwms" id="rwms" readonly="true" cssClass="validate[required,maxSize[1500]] textarea" cssStyle="width:94%;height:80px;" ></s:textarea>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>任务附件：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<span onclick="dbFileDown('t_gzgl_rwfjxx','id','fj','${fjBean.id}','${fjBean.title}')" style="cursor: pointer;" class="cps_span_href">${fjBean.title}</span>
					</cps:tdContent>
				</cps:row>
				</cps:table>
				
				 
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_title">
				   <tr>
		           <td width="23"><img src="/CPS/template/cps/images/img_title.jpg" width="23" height="28" /></td>
		           <td align="left">添加执行民警</td>
		       </tr>
		       </table>
		       
		       <cps:table>
				<cps:row>
					<cps:tdContent colspan="6" >
						<div style="overflow:auto; height:100px; width:99.8%;border: 0px;">
							<table class="cps-tablegrid" id="zxmjs" width="99.8%" cellpadding="0" cellspacing="0" >
								<thead>
									<tr>
										<th width="40%" style="text-align:center">执行民警姓名</th>
										<th width="40%" style="text-align:center">所属单位</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="renwuBean.mjins" id="zxmj" status="s">
										<tr>
											<input type="hidden" name='renwuBean.mjins[${s.index}].id' value="${zxmj.id}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].rwbh' value="${zxmj.rwbh}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjxm' value="${zxmj.clmjxm}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjjh' value="${zxmj.clmjjh}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjsfzh' value="${zxmj.clmjsfzh}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjdwdm' value="${zxmj.clmjdwdm}" />
											<input type="hidden" name='renwuBean.mjins[${s.index}].clmjdwmc' value="${zxmj.clmjdwmc}" />
											<td><s:property value="#zxmj.clmjxm" /></td>
											<td><s:property value="#zxmj.clmjdwmc" /></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</cps:tdContent>
				</cps:row>
				</cps:table>
				
				
				<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*&nbsp;</font>登记人：</cps:tdLabel>
					<cps:tdContent width="25%">
							<cps:textfield id="djrxm" readonly="true" value="${renwuBean.djrxm}" cssClass="validate[required] cps-input" name="renwuBean.djrxm"></cps:textfield>
						
					</cps:tdContent>
					
					<cps:tdLabel width="12%"><font color="red">*&nbsp;</font>登记单位：</cps:tdLabel>
					<cps:tdContent  width="25%">
							<cps:textfield id="djdwmc" value="${renwuBean.djdwmc}" readonly="true"  cssClass="validate[required] cps-input" name="renwuBean.djdwmc"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel width="12%"><font color="red">*&nbsp;</font>登记日期：</cps:tdLabel>
					<cps:tdContent width="25%">
							<cps:textfield id="djsj" name="renwuBean.djsj" readonly="true" value="${renwuBean.djsj}" cssClass="validate[required] cps-input"/>
					</cps:tdContent>
				</cps:row>	
			</cps:table>
		
				<creator:panel title="任务反馈" id="rwfk">
					<c:forEach items="${renwuBean.rwCljg}" var="cljg" varStatus="cljgAttr">
						<c:set var="cljgIndex" value="${cljgAttr.index}" scope="page" />
						<cps:table>
							<cps:row>
								<cps:tdLabel width="10%">完成情况：</cps:tdLabel>
								<cps:tdContent width="25%">
									<input type="hidden" name="renwuBean.rwCljg[${cljgAttr.index}].id" value="${cljg.id}" />
									<cps:select name="renwuBean.rwCljg[${cljgAttr.index}].cljg"  value="${cljg.cljg}" zdlb="GZGL_RWWCQK" disabled="true" />
								</cps:tdContent>
								
								<cps:tdLabel width="12%">实际完成时间：</cps:tdLabel>
								<cps:tdContent  width="25%">
									<cps:textfield name="renwuBean.rwCljg[${cljgAttr.index}].wcsj"  value="${cljg.wcsj}" readonly="true" />
								</cps:tdContent>
									
								<cps:tdLabel width="10%">处理民警：</cps:tdLabel>
								<cps:tdContent width="25%">
									<cps:textfield name="renwuBean.rwCljg[${cljgAttr.index}].djrxm" value="${cljg.djrxm}" readonly="true"/>
								</cps:tdContent>
							</cps:row>
								
							<cps:row >
								<cps:tdLabel width="12%">完成情况描述：</cps:tdLabel>
								<cps:tdContent colspan="5" width="25%">
									<textarea name="renwuBean.rwCljg[${cljgAttr.index}].wcqkms" style="width: 94%;height:150px;" readonly="readonly">${cljg.wcqkms}</textarea>
	 							</cps:tdContent>
							</cps:row>
							<cps:row>
								<cps:tdLabel>反馈任务附件：</cps:tdLabel>
								<cps:tdContent colspan="5">
								${cljg.fjtitle }
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</c:forEach>
				</creator:panel>
				
		</form>
		</creator:panel>
		
</creator:view>