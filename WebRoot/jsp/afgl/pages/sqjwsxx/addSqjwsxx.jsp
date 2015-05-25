<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="新增/修改社区警务室信息">
		<creator:panel id="updatesqjwsxx" title="新增/修改社区警务室信息">
			
			<form id="add_sqjwsxx_form" action="${contextPath}/sqjwsxx/addSqjwsxx.action" method="post">
				<input type="hidden" id="operType" name="operType" value="${operType}">
				<input type="hidden" id="orgid" name="sqjwsxxBean.orgid" value="${sqjwsxxBean.orgid }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">警务室名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType == 'add'}">
									<cps:textfield id="orgname" name="sqjwsxxBean.orgname" value="${sqjwsxxBean.orgname }"
										cssStyle="width:80%" maxlength="60"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="orgname" name="sqjwsxxBean.orgname" value="${sqjwsxxBean.orgname }"
										disabled="true" cssStyle="width:80%"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">警务室类别：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="jwslb" name="sqjwsxxBean.jwslb" cssStyle="width:80%" 
								headerKey="" headerValue="--选择--" zdlb="AF_JWSLB" value="${sqjwsxxBean.jwslb }"></cps:select>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">警务室类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="jwslx" name="sqjwsxxBean.jwslx" cssStyle="width:80%" 
								headerKey="" headerValue="--选择--" zdlb="AF_JWSLX" value="${sqjwsxxBean.jwslx }"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">管辖社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input id="sqbh" type="hidden"/>
							<cps:textfield id="gxqy" name="sqjwsxxBean.gxqy" value="${sqjwsxxBean.gxqy }" 
									cssStyle="width:50%"></cps:textfield>
							<cps:button value="选择" onclick="openSqxxSelectWin('sqbh','gxqy')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">警务区/室地址：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="jwsdz" name="sqjwsxxBean.jwsdz" value="${sqjwsxxBean.jwsdz}" 
										cssStyle="width:80%" maxlength="100"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">办公场所类型：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="bgcslx" name="sqjwsxxBean.bgcslx" cssStyle="width:80%" 
								headerKey="" headerValue="--选择--" zdlb="AF_BGCSLX" value="${sqjwsxxBean.bgcslx }"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">责任民警：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType == 'add'}">
									<cps:textfield id="zrmj" name="sqjwsxxBean.zrmj" value="${sqjwsxxBean.zrmj }" 
											cssStyle="width:80%" maxlength="15"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="zrmj" name="sqjwsxxBean.zrmj" value="${sqjwsxxBean.zrmj }" 
											cssStyle="width:80%" disabled="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">民警联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType == 'add'}">
									<cps:textfield id="mjlxdh" name="sqjwsxxBean.mjlxdh" value="${sqjwsxxBean.mjlxdh}" 
											cssStyle="width:80%" cssClass="validate[custom[phone]]" maxlength="11" minlength="7"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="mjlxdh" name="sqjwsxxBean.mjlxdh" value="${sqjwsxxBean.mjlxdh}" 
											cssStyle="width:80%" disabled="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所属派出所：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType == 'add'}">
									<cps:textfield id="sspcsmc" name="sqjwsxxBean.sspcsmc" value="${sqjwsxxBean.sspcsmc}" 
										cssStyle="width:80%" maxlength="60"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="sspcsmc" name="sqjwsxxBean.sspcsmc" value="${sqjwsxxBean.sspcsmc}" 
										cssStyle="width:80%" disabled="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">所属行政区划：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<c:choose>
								<c:when test="${operType == 'add'}">
									<cps:textfield id="ssxzqhmc" name="sqjwsxxBean.ssxzqhmc" value="${sqjwsxxBean.ssxzqhmc }" 
										cssStyle="width:80%"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="ssxzqhmc" name="sqjwsxxBean.ssxzqhmc" value="${sqjwsxxBean.ssxzqhmc }" 
										cssStyle="width:80%" disabled="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">分管所领导：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="fgdwldxm" name="sqjwsxxBean.fgdwldxm" value="${sqjwsxxBean.fgdwldxm}" 
										cssStyle="width:50%" ondblclick="selectDwld('${sqjwsxxBean.sspcsdm }','fgdwldxm','fgdwldlxdh')"></cps:textfield>
							<cps:button value="选择" onclick="selectDwld('${sqjwsxxBean.sspcsdm }','fgdwldxm','fgdwldlxdh')"></cps:button>			
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所领导联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="fgdwldlxdh" name="sqjwsxxBean.fgdwldlxdh" value="${sqjwsxxBean.fgdwldlxdh}" 
										cssStyle="width:80%" cssClass="validate[custom[phone]]" maxlength="11"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">注销标识：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="zxbsmc" name="sqjwsxxBean.zxbsmc" value="${sqjwsxxBean.zxbsmc }" 
									cssStyle="width:80%" disabled="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">注销日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="zxrq" name="sqjwsxxBean.zxrq" value="${sqjwsxxBean.zxrq}" 
										cssStyle="width:80%" disabled="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">注销单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="zxdwmc" name="sqjwsxxBean.zxdwmc" value="${sqjwsxxBean.zxdwmc}" 
										cssStyle="width:80%" disabled="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="sqjwsxxBean.djrxm"
								 value="${loginInfo.realname}" disabled="true" cssStyle="width:80%"></cps:textfield>
							<input type="hidden" id="djrjh" name="sqjwsxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="sqjwsxxBean.djsj"  cssStyle="width:80%"
								 value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>" disabled="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djdwmc" name="sqjwsxxBean.djdwmc" cssStyle="width:80%"
								value="${loginInfo.orgname }" disabled="true"></cps:textfield>
							<input id="djdwdm" name="sqjwsxxBean.djdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="保存" onclick="addsqjwsxx();"></cps:button>
							<cps:button value="关闭" onclick="closeTest(window);"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/sqjwsxx.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
</creator:view>
