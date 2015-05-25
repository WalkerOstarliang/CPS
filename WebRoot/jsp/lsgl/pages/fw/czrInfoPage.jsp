<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<script type="text/javascript" >
	
	/*保存*/
	function saveCzrInfo(){
		if($.validateform("czrform")){
			$("#savebtn").attr("disabled","disabled");
			$("#czrform").ajaxSubmit({
				url:contextPath+"/lsgl/czfwczxx/saveCzrInfo.action",
				type:"post",
				dataType:"json",
				success:function(msg){
					if(msg == true){
						alert("保存成功.");
						clearForm();
						$("#czrxxList").query("F","czrform");
					}else if(msg =='Exist'){
						alert("同一房屋下，不能重复登记。");
					}else{
						alert("操作失败，请重试.");
					}
					$("#savebtn").removeAttr("disabled");
				}		
			});
		}
	}
	/**加载人口信息*/
	function loadRkjbxx(value){
		queryRkBean(value,function(rkJbxxBean){
			$("#xb").val(rkJbxxBean["xb"]);
			var inputxb =$("#xb").attr("inputid");
			if(inputxb != undefined && inputxb!= null && inputxb!=''){
				var text = $("#xb").find("option:selected").text();
			    $("#"+inputxb).val(text);
			}
			$("#xm").val(rkJbxxBean["xm"]);
			$("#csrq").val(rkJbxxBean["csrq"]);
			$("#lxfs").val(rkJbxxBean["lxdh"]);
		});
	}
	
	function  addCzrxxInfo(operType,id){
		var selects = $("#fwtablegrid").getSelected();
		if(selects.length >0){
			$.openWindow({
				url:contextPath+"/lsgl/czfwczxx/toAddCzrInfoPage.action",
				data:{
					"operType":operType,
					"czrxxBean.id":id,
					"czrxxBean.fwid":selects[0]["fwid"]
				},
				width:900,
				height:600
			});
		}else{
			alert("请选择一条数据.");
			
		}
	}
	
	/**注销*/
	function logout(id){
		$.ajax({
			url:contextPath+"/lsgl/czfwczxx/logouCzrxx.action",
			dataType:"json",
			data:{
				"czrxxBean.id":id
			},
			success:function(msg){
				if(msg == true){
					alert("注销成功");
					$("#czrxxList").query("F","czrform");
				}else{
					alert("操作失败，请重试.");					
				}
			}
		});	
	}
	
	/**列表双击事件*/
	function callbackCzrxx(trObj, rowdata)
	{
		$("#czrxxdiv").eachObjectSetValue(rowdata);
	}
	
	/**保存后清空表单*/
	function clearForm()
	{
		$("#czrtable").find("tr[id^=clear_row]").each(function(i){
			$(this).find(":input").val("");
		});
	}
	
	$(function(){
		var operType = $("#operType").val();
		if("detail"==operType){
			$("#czrxxdiv").displayInputForText();
		}
	})
</script>
<form  id="czrform">
<creator:tbar  id="czxxtbar">
	<c:if test="${operType != 'detail'}">
		<cps:button value="保存"  onclick="saveCzrInfo()" id="savebtn"></cps:button>
		<cps:button value="重置" type="reset"></cps:button>
	</c:if>
	<cps:button value="关闭"  onclick="$.closeWindow()" ></cps:button>
</creator:tbar>
<creator:panel id="czrInfoPanel"   title="承租人信息" tbarId="czxxtbar" >
	<div id="czrxxdiv">
		<s:hidden id="operType" name="operType"></s:hidden>
		<s:hidden id="sssqdm" name="czrxxBean.sssqdm"></s:hidden>
		<input type="hidden" id="fwid" name="czrxxBean.fwid" value="${czrxxBean.fwid}">
		<input id="czfwbh" type="hidden" name="czrxxBean.czfwbh" value="${czrxxBean.czfwbh}">
		<cps:table id="czrtable">
			<cps:row id="clear_row0">
				<input type="hidden" id="id" name="czrxxBean.id" value="${czrxxBean.id}">
				<cps:tdLabel width="12%">承租人证件类型：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:select id="czrzjzl" name="czrxxBean.czrzjzl" value="${czrxxBean.czrzjzl}" zdlb="GB_ZJZL"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="12%" ><font color="red">*</font>承租人身份证号：</cps:tdLabel>
				<cps:tdContent width="22%" >
					<cps:textfield maxlength="18" id="czrzjhm" name="czrxxBean.czrzjhm" value="${czrxxBean.czrzjhm}" onblur="loadRkjbxx(this.value)" required="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">承租人姓名：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="xm" name="czrxxBean.xm" value="${czrxxBean.xm}" maxlength="30"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row1">
				<cps:tdLabel>承租人性别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="xb" name="czrxxBean.xb" value="${czrxxBean.xb}" zdlb="GB_XB" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent> 
				<cps:tdLabel>联系电话：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="lxfs" name="czrxxBean.lxfs" value="${czrxxBean.lxfs}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>出生日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="csrq" name="czrxxBean.csrq" value="${czrxxBean.csrq}" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row2">
				<cps:tdLabel>承租人状态：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="czrzt" name="czrxxBean.czrzt" value="${czrxxBean.czrzt}" zdlb="ZDY_CZRZT" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent> 
				<cps:tdLabel>承租用途：</cps:tdLabel>
				<cps:tdContent >
					<cps:select id="czyt" name="czrxxBean.czyt" value="${czrxxBean.czyt}" zdlb="ZDY_CZYT" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel><font color="red">*</font>承租日期：</cps:tdLabel>
				<cps:tdContent>
					 <cps:date required="true" id="czrq" name="czrxxBean.czrq" value="${czrxxBean.czrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row3">
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield id="bz" name="czrxxBean.bz" value="${czrxxBean.bz}" type="textarea" cssStyle="width:96%;height:40px" maxlength="240" ></cps:textfield>
				</cps:tdContent>			
			</cps:row>
			<cps:row>
				<cps:tdLabel>登记人姓名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djrxm" name="czrxxBean.djrxm" value="${czrxxBean.djrxm}"  readonly="true"></cps:textfield>
				</cps:tdContent> 
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent >
					<input id="djdwdm" name="czrxxBean.djdwdm" value="${czrxxBean.djdwdm }" type="hidden"/>
					<cps:textfield id="djdwmc" name="czrxxBean.djdwmc" value="${czrxxBean.djdwmc}" readonly="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djsj" name="czrxxBean.djsj" value="${czrxxBean.djsj}" readonly="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
		</cps:table>
 	</div>
 	</creator:panel>
</form>
<cps:tableGrid id="czrxxList"
			   url="/lsgl/czfwczxx/queryCzrPageByCzfwbh.action"
			   searchform="czrform"
			   autoload="true"
			   title="承租人列表"
			   width="99.6%"
			   click="callbackCzrxx">
	<cps:column isNumber="true" title="序号"></cps:column>
	<cps:column field="cz" title="操作"></cps:column>
	<cps:column field="czrzjzlms" title="证件种类"></cps:column>
	<cps:column field="czrzjhm" title="承租人身份证号"></cps:column>
	<cps:column field="xm" title="姓名"></cps:column>
	<cps:column field="xbms" title="性别"></cps:column>
	<cps:column field="lxfs" title="联系方式"></cps:column>
	<cps:column field="czytms" title="承租用途"></cps:column>
	<cps:column field="czrq" title="承租日期"></cps:column>
	<cps:column field="zxbsms" title="注销状态"></cps:column>
</cps:tableGrid>
</creator:view>