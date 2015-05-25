<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/jws.js"></script>
	<c:if test="${operType!='detail'}">
	<creator:tbar id="jwsbar">
		<cps:button value="保&nbsp;存" onclick="updateJws();"></cps:button>
	</creator:tbar>
	</c:if>
	<creator:panel id="aaa" title="派出所警务室信息" tbarId="jwsbar">
			<form id="jwsForm" action="${contextPath }/gzgl/gzjwsgl/updateJws.action" method="post">
				<input type="hidden" id="id" name="jwsBean.id" value="${jwsBean.id }"/>
				<input type="hidden" id="orgcode" name="jwsBean.orgcode" value="${jwsBean.orgcode }"/>
				<input type="hidden" id="ispcs" name="jwsBean.ispcs" value="${jwsBean.ispcs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">机构名称：</cps:tdLabel>	
						<cps:tdContent width="25%"> 
							<cps:textfield id="orgname" name="jwsBean.orgname" value="${jwsBean.orgname}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">办公地点类型：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType!='detail'}">
									<cps:select id="bgddlx" name="jwsBean.bgddlx" value="${jwsBean.bgddlx}" zdlb="ZDY_BGDDLX" headerKey="" headerValue="--请选择--"></cps:select>
								</c:when>
								<c:otherwise>
									<cps:select id="bgddlx" name="jwsBean.bgddlx" value="${jwsBean.bgddlx}" zdlb="ZDY_BGDDLX" headerKey="" headerValue="--请选择--" disabled="true"></cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="13%">网络接入方式：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${operType!='detail'}">
									<cps:select id="wljrfs" name="jwsBean.wljrfs" value="${jwsBean.wljrfs}" zdlb="ZDY_WLJRFS" headerKey="" headerValue="--请选择--"></cps:select>
								</c:when>
								<c:otherwise>
									<cps:select id="wljrfs" name="jwsBean.wljrfs" value="${jwsBean.wljrfs}" zdlb="ZDY_WLJRFS" headerKey="" headerValue="--请选择--" disabled="true"></cps:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>所长姓名：</cps:tdLabel>	
						<cps:tdContent> 
								<c:choose>
								<c:when test="${operType!='detail'}">
										<cps:textfield id="pcsszxm" name="jwsBean.pcsszxm" value="${jwsBean.pcsszxm}" ondblclick="selectRyxx('${loginInfo.rootOrgCode}','pcsszxm','pcsszsfzh','pcsszjh')" readonly="true"></cps:textfield>
										<cps:button value="选择" onclick="selectRyxx('${loginInfo.rootOrgCode}','pcsszxm','pcsszsfzh','pcsszjh')"></cps:button>
								</c:when>
								<c:otherwise>
										<cps:textfield id="pcsszxm" name="jwsBean.pcsszxm" value="${jwsBean.pcsszxm}"  readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>所长身份证：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="pcsszsfzh" name="jwsBean.pcsszsfzh" value="${jwsBean.pcsszsfzh}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>所长警号：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="pcsszjh" name="jwsBean.pcsszjh" value="${jwsBean.pcsszjh}" readonly="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>副所长姓名：</cps:tdLabel>	
						<cps:tdContent> 
							<c:choose>
								<c:when test="${operType!='detail'}">
									<cps:textfield id="pcsfszxm" name="jwsBean.pcsfszxm" value="${jwsBean.pcsfszxm}" ondblclick="selectRyxx('${loginInfo.rootOrgCode}','pcsfszxm','pcsfszsfzh','pcsfszjh')" readonly="true"></cps:textfield>
									<cps:button value="选择" onclick="selectRyxx('${loginInfo.rootOrgCode}','pcsfszxm','pcsfszsfzh','pcsfszjh')"></cps:button>
								</c:when>
								<c:otherwise>
									<cps:textfield id="pcsfszxm" name="jwsBean.pcsfszxm" value="${jwsBean.pcsfszxm}"  readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
							
						</cps:tdContent>
						<cps:tdLabel>副所长身份证：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="pcsfszsfzh" name="jwsBean.pcsfszsfzh" value="${jwsBean.pcsfszsfzh}" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>副所长警号：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="pcsfszjh" name="jwsBean.pcsfszjh" value="${jwsBean.pcsfszjh}" readonly="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<c:if test="${jwsBean.ispcs =='1' }">
					<cps:row>
					<cps:tdLabel>派出所级别：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="jb" name="jwsBean.jb" value="${jwsBean.jb}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>派出所类别：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="lb" name="jwsBean.lb" value="${jwsBean.lb}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>派出所等级：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="dj" name="jwsBean.dj" value="${jwsBean.dj}" maxlength="15"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel>所长职级：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="szjb" name="jwsBean.szjb" value="${jwsBean.szjb}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>警力数：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="jls" name="jwsBean.jls" value="${jwsBean.jls}" inputType="integer"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>市州局下沉警力：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="szjxcjl" name="jwsBean.szjxcjl" value="${jwsBean.szjxcjl}" inputType="integer"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel>交警警力：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="jjjl" name="jwsBean.jjjl" value="${jwsBean.jjjl}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>监管警力：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="jgjl" name="jwsBean.jgjl" value="${jwsBean.jgjl}" inputType="integer"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>特警警力：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="tjjl" name="jwsBean.tjjl" value="${jwsBean.tjjl}" inputType="integer"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel>巡警警力：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="xjjl" name="jwsBean.xjjl" value="${jwsBean.xjjl}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>县级局下沉警力：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="xjjxcjl" name="jwsBean.xjjxcjl" value="${jwsBean.xjjxcjl}" inputType="integer"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>街道巡逻队员数：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="jdxldys" name="jwsBean.jdxldys" value="${jwsBean.jdxldys}" inputType="integer"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel>辅警数：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="fjs" name="jwsBean.fjs" value="${jwsBean.fjs}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>派出所辅警数：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="pcsfjs" name="jwsBean.pcsfjs" value="${jwsBean.pcsfjs}" inputType="integer"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>警务区配备辅警数：</cps:tdLabel>	
						<cps:tdContent> 
							<cps:textfield id="jwspbfjs" name="jwsBean.jwspbfjs" value="${jwsBean.jwspbfjs}" inputType="integer"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					</c:if>
					<cps:row>
						<cps:tdLabel>操作人姓名：</cps:tdLabel>	
						<cps:tdContent> 
							<c:choose>
								<c:when test="${empty jwsBean.czrxm}">
									<cps:textfield id="orgname" name="jwsBean.czrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="orgname" name="jwsBean.czrxm" value="${jwsBean.czrxm}" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>操作人单位：</cps:tdLabel>	
						<cps:tdContent> 
							<c:choose>
								<c:when test="${empty jwsBean.czrdwdm}">
									<input type="hidden" name="jwsBean.czrdwdm" value="${loginInfo.orgcode }"/>
									<cps:textfield id="orgname" name="jwsBean.czrdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="jwsBean.czrdwdm" value="${jwsBean.czrdwdm }"/>
									<cps:textfield id="orgname" name="jwsBean.czrdwmc" value="${jwsBean.czrdwmc}" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>操作时间：</cps:tdLabel>	
						<cps:tdContent> 
						<c:choose>
								<c:when test="${empty jwsBean.czsj}">
									<cps:date id="czsj" name="jwsBean.czsj" defaultSystemDate="true" readOnly="true"></cps:date>
								</c:when>
								<c:otherwise>
									<cps:date id="czsj" name="jwsBean.czsj" value="${jwsBean.czsj}" readOnly="true"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
</creator:view>