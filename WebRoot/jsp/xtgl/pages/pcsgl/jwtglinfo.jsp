<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<script type="text/javascript">
		function saveJwtBean()
		{
			if ($.validateform("saveform"))
			{
				$("#saveform").ajaxSubmit({
					type : "post",
					url : contextPath + "/xtgl/pcs/saveJwtBean.action",
					dataType : "json",
					success : function(jwtBean)
					{
						if (jwtBean != null && !$.isPlainObject(jwtBean))
						{
							var strarr = jwtBean.split(",");
							alert($("#xm").val() + "民警警务通已经配置到单位：" + strarr[1] + "下，\n不允许重复配置，一个民警只能在一个单位下配置，\n如果还需要继续操作，必须先注销民警原来的警务通配置。");
						}
						else if (jwtBean != null)
						{
							$("#jwtBeanid").val(jwtBean["id"]);
							alert("保存警务通配置成功.");
							window.close();
						}
						else
						{
							alert("保存警务通配置失败,请稍后再试.");
						}
					}
				})				
			}
		}
		
		function openSelectJwqxz(orgcode)
		{
			openDwSelect2({
				rootOrgCode : orgcode,
		  		mutilSelect : false,
		   		nodeSelectedType : "ps",
		   		nodeNotSelectedType : "ps"
			},function(orgbeans){
				if(orgbeans)
				{
					$("#kc_jwqdm").val(orgbeans.id);
					$("#kc_jwqmc").val(orgbeans.name);
				}
			});
		}
		function openSelectJwxx(orgcode)
		{
			openDwRySelect({
				rootOrgCode : orgcode,
				mutilSelect : false
			},
			function(userbean)
			{
				if (userbean)
				{
					var username = userbean["username"];
					var realname = userbean["realname"];
					var orgcode = userbean["orgcode"];
					var orgname = userbean["orgname"];
					$("#jh").val(username);
					$("#xm").val(realname);
					$("#cjrdwdm").val(orgcode);
					$("#cjrdwmc").val(orgname);
				}
				
			});
		}
	</script>
	<form id="saveform" method="post">
		<input type="hidden" name="operType" value="${operType}"/>
		<input type="hidden" id="jwtBeanid" name="jwtBean.id" value="${jwtBean.id}"/>
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="保存" id="saveybtn" onclick="saveJwtBean()"></cps:button>
				<cps:button value="关闭" id="closebtn" onclick="$.closeWindow()"></cps:button>
			</cps:tbar>
			<cps:panel title="警务管理">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="15%"><font color="red">*</font>警务区：</cps:tdLabel>
						<cps:tdContent width="35%">
							<input type="hidden" id="kc_jwqdm" name="jwtBean.kc_jwqdm" value="${jwtBean.kc_jwqdm }">
							<c:choose>
								<c:when test="${operType == 'update'}">
									<cps:textfield id="kc_jwqmc" name="jwtBean.kc_jwqmc" readonly="true" required="true" value="${jwtBean.kc_jwqmc}" ></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="kc_jwqmc" name="jwtBean.kc_jwqmc" appendPopuBtn="true" required="true" value="${jwtBean.kc_jwqmc}" onclick="openSelectJwqxz('${loginInfo.rootOrgCode}')"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel>警务通号码：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="jwthm" name="jwtBean.jwthm" value="${jwtBean.jwthm}" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%"><font color="red">*</font>警务通民警：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<cps:textfield id="jh" name="jwtBean.jh" value="${jwtBean.jh}" cssStyle="width:40%"  required="true" readonly="true"></cps:textfield>
							<cps:textfield id="xm" name="jwtBean.xm" required="true" cssStyle="width:40%" readonly="true" appendPopuBtn="true" onclick="openSelectJwxx('${currentXzqh}00000000')"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="15%"><font color="red">*</font>警务通民警单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							<input type="hidden" id="cjrdwdm" name="jwtBean.cjrdwdm" value="${jwtBean.cjrdwdm }">
							<cps:textfield id="cjrdwmc" name="jwtBean.cjrdwmc" readonly="true" required="true" value="${jwtBean.cjrdwmc}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>操作人：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="czrxm" name="jwtBean.czrxm" required="true" value="${jwtBean.czrxm != null ? jwtBean.czrxm : loginInfo.realname}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>操作单位：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="czdwmc" name="jwtBean.czdwmc" required="true" value="${jwtBean.czdwmc != null ? jwtBean.czdwmc : loginInfo.orgname}"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>操作时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="jwtBean.czsj" value="${jwtBean.czsj != null ? jwtBean.czsj : currentSystemDate}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>
							&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>