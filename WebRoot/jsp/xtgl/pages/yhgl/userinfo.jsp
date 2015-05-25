<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<script type="text/javascript">
		function updateUserPassword()
		{
			var password = $("#password").val();
			var newPassword = $("#newPassword").val();
			var renewPassword = $("#renewPassword").val();
			var reg = /[@#\$%\^&\*.\'\\]+/g;
			if ($.validateform("saveform"))
			{
				if (newPassword != renewPassword)
				{
					alert("新密码两次输入不一样.");
					return false;
				}
				$.ajax({
					type : "post",
					url : contextPath + "/updateUserPassword.action",
					data : "password=" + $("#password").val() + "&newPassword=" + $("#newPassword").val(),
					dataType : "json",
					success : function(resultCode)
					{
						if (resultCode == "0")
						{
							alert("密码更新成功,请牢记新密码,以后登录请使用新密码。");
							parent.closeLayerWin();
						}
						else if (resultCode=="1")
						{
							alert("原始密码不正确.");
						}
						else if (resultCode== "2")
						{
							alert("用户密码更新失败，请稍后再试.");
						}
					}
				});
			}
		}
	</script>
	<form id="saveform" method="post">
		<creator:panel id="updatepassword" title="用户密码更新">
			<cps:table>
				<cps:row>
					<cps:tdLabel>用户名：</cps:tdLabel>
					<cps:tdContent>
						<font color="red">${sessionScope.loginInfo.username}/${sessionScope.loginInfo.realname}</font>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>原始密码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="password" name="password" minlength="6" maxlength="12" required="true" inputType="onlychar"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>新密码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="newPassword" name="newPassword" minlength="6" maxlength="12" required="true" inputType="onlychar"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>重复新密码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="renewPassword" name="renewPassword" minlength="6" maxlength="12" required="true" inputType="onlychar"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="2" align="center">
						<cps:button value="确定" onclick="updateUserPassword()"></cps:button>
						<cps:button value="重置" type="reset"></cps:button>
						<cps:button value="关闭" onclick="parent.closeLayerWin()"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</creator:panel>
	</form>
</creator:view>