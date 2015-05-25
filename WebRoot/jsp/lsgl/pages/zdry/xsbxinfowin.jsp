<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="${modename}核实登记">
	<creator:Script src="/jsp/lsgl/js/zdryinfo.js"></creator:Script>
	<div id="detailinfo">
		<input type="hidden" id="hideSfzh" value="${queryBean.hideSfzh}">
		<input type="hidden" id="showtype" value="${showtype }"/>
		<script type="text/javascript">
			$(function(){
				var i = $.layer({
					type: 1,
					title: "请输入身份证号码",
					closeBtn : false,
					border : [5, 0.5, '#666', true],
					area: ['368px','auto'],
					page: {
						dom : "#pleasesfzhwin"
					}
				});
				
				$("#submitbtn").on('click', function(){
					var sfzh = $("#sfzh").val();
					if (isSfzh(sfzh)){
						$.ajax({
						type:"post",
						url:contextPath+"/lsgl/zdry/isExists.action",
						data:"sfzh="+sfzh,
						success:function(zdryGzdxBean){
						   if(zdryGzdxBean=="null"||zdryGzdxBean==null){
						   alert("重点人员中不存在此对象.")
								}else{
									loadRkInfoMainPage(sfzh,function(){
										initAjaxLoadPage();
										layer.close(i);
									});
						        }
						  }
						});
						}else
								{
									alert("身份证号码不能为空，或者身份证号码格式不正确.");
								}
				});
				$("#closebtn").on("click",function(){
					layer.close(i);
					$.closeWindow();
				});
			})
		</script>
	</div>
	 <div id="pleasesfzhwin" style="display: none">
	 	<cps:table>
	 		<cps:row>
	 			<cps:tdLabel width="20%">身份证号码：</cps:tdLabel>
	 			<cps:tdContent>
	 				<cps:textfield id="sfzh" name="sfzh" isSfzh="true"></cps:textfield>
	 			</cps:tdContent>
	 		</cps:row>
	 		<cps:row>
	 			<cps:tdContent colspan="2" align="center">
		 			<cps:button id="submitbtn" value="确定"></cps:button>
		 			<cps:button id="closebtn" value="取消"></cps:button>
	 			</cps:tdContent>
	 		</cps:row>
	 	</cps:table>
	 </div>
</creator:view>
