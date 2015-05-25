<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="${modename}核实登记">
	<script type="text/javascript">
		var i = null; 
		function readIdcard()
		{
			var cardsn;
			try
			{
				var ax = new ActiveXObject("IDRCONTROL.IdrControlCtrl.1");  
			}
			catch(e)
			{
				 alert("控件未安装");  
			}
			result=IdrControl1.ReadCard("1001","");
			if (result == 1)
			{
				cardsn=IdrControl1.GetCode();
				$("#tipwinsfzh").val(cardsn);	
				submitFormPage();
			}
			else
			{
				if (result==-1)
				{
					alert("端口初始化失败！");
				} 
				else if (result==-2)
				{
					alert("请重新将卡片放到读卡器上！");
				}
				else if (result==-3)
				{
					alert("读取数据失败！");
				}
				else if (result==-4)
				{
					alert("生成照片文件失败，请检查设定路径和磁盘空间！");
				}
			}
		}
	
		function submitFormPage()
		{
			if($.validateform("sfzhtipform"))
			{
				$.ajax({
					url : contextPath + "/lsgl/rk/checkRKisExists.action",
					type : "post",
					data : "queryBean.sfzh="+$("#tipwinsfzh").val(),
					dataType : "json",
					success:function(dzmc)
					{
						if (dzmc == null || dzmc == "")
						{
							layer.load(0);
							$("#sfzhtipform").submit();
						}
						else
						{
							var hint = "当前实有人口已经在辖区内登记，住址为【" +dzmc + "】.确定要继续登记？"
							if (confirm(hint))
							{
								layer.load(0);
								$("#sfzhtipform").submit();
							}
							else
							{
								$.closeWindow();
							}
						}
					}
				});
				
			}
		}
		function changeSfzhTo18W(value)
		{
			if (value != null &&　value != "")
			{
				$("#tipwinsfzh").val(IDNum15To18(value));
			}
		}
		$(function(){
			var sfzh = $("#tipwinsfzh").val();
			if (sfzh != null && sfzh != "")
			{
				layer.load(0);
				$("#sfzhtipform").submit();
			}
			else
			{
				$.layer({
					type: 1,
					title: "请输入身份证号码",
					closeBtn : false,
					border : [5, 0.5, '#666', true],
					area: ['368px','auto'],
					page: {
						dom : "#pleasesfzhwin"
					}
				});
			}	
				
			$("#closebtn").on("click",function(){
				layer.close(i);
				$.closeWindow();
			});
			
			$(document).bind("keydown",function(event){
				if (event.keyCode == 13)
				{
					layer.load(0);
					submitFormPage();
				}
			});
		})
	</script>
	<div id="detailinfo">
	 	<object classid="clsid:5EB842AE-5C49-4FD8-8CE9-77D4AF9FD4FF" id="IdrControl1" width="0" height="0"></object>
		<div id="pleasesfzhwin" style="display: none">
		 	<form id="sfzhtipform" action="<c:url value='/lsgl/rk/toRyInfoPage.action'/>" method="post">
			 	<input type="hidden" id="rylb" name="queryBean.rylb" value="${queryBean.rylb}">
				<input type="hidden" id="hideSfzh" name="hideSfzh" value="${queryBean.hideSfzh}">
				<input type="hidden" id="fwid" name="queryBean.fwid" value="${queryBean.fwid}">
				<input type="hidden" id="operType" name="operType" value="${operType}">
				<input type="hidden" id="cyrybh" name="queryBean.cyrybh" value="${queryBean.cyrybh}">
			 	<cps:table>
			 		<cps:row>
			 			<cps:tdLabel width="20%">身份证号码：</cps:tdLabel>
			 			<cps:tdContent>
			 				<cps:textfield id="tipwinsfzh" name="queryBean.sfzh" isSfzh="true" value="${queryBean.sfzh}" onkeyup="this.value=this.value.replace('x','X');" required="true" onblur="changeSfzhTo18W(this.value)"></cps:textfield>
			 			</cps:tdContent>
			 		</cps:row>
			 		<cps:row>
			 			<cps:tdContent colspan="2">
			 				<font color="red">说明：15位身份证号码将自动转换为18位</font>
			 			</cps:tdContent>
			 		</cps:row>
			 		<cps:row>
			 			<cps:tdContent colspan="2" align="center">
				 			<cps:button id="submitbtn" value="确定" onclick="submitFormPage()"></cps:button>
				 			<cps:button id="sfzdk" value="身份证读卡" onclick="readIdcard()"></cps:button>
				 			<cps:button id="closebtn" value="取消"></cps:button>
			 			</cps:tdContent>
			 		</cps:row>
			 	</cps:table>
		 	</form>
		 </div>
	 </div>
</creator:view>
