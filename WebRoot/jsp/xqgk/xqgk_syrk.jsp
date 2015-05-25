<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<%@include file="/template/xqgkInclude.inc" %>

</head>

<body style="background: none;" onload="closeParentLoading();">

<!--主内容 开始-->
<div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  	<tr>
	    	<td valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list07">
				  <tr>
				  	<th width="20%" style="text-align: center;">单 位</th>
				  	<th width="13%" style="text-align: center;">常住人口</th>
				  	<th width="13%" style="text-align: center;">流动人口</th>
				  	<th width="13%" style="text-align: center;">寄住人口</th>
				  	<th width="13%" style="text-align: center;">未落户人口</th>
				  	<th width="13%" style="text-align: center;">境外人员</th>
				  	<th width="13%" style="text-align: center;">总数</th>
				  </tr>
				  <c:if test="${userDeptLevel == 5}"><!-- 当前机构为警务区，显示社区数据 -->
					  <c:forEach var="syrk" items="${syrkList}" varStatus="_i">
					  <!-- 机构不再钻取，除合计、总计外数据可点击查看详细 -->
					  <tr>
					  	<td style="text-align: left;">${syrk.deptName}</td>
					   <c:if test="${_i.index != (fn:length(syrkList) - 1)}"><!-- 不是合计 -->
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${syrk.deptCode}', 'czrk');">${syrk.showCzrk}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${syrk.deptCode}', 'ldrk');">${syrk.showLdrk}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${syrk.deptCode}', 'jzrk');">${syrk.showJzrk}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${syrk.deptCode}', 'wlhrk');">${syrk.showWlhrk}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${syrk.deptCode}', 'jwry');">${syrk.showJwry}</a></td>
					   </c:if>
					   <c:if test="${_i.index == (fn:length(syrkList) - 1)}"><!-- 是合计 -->
						<td style="text-align: right;">${syrk.showCzrk}</td>
						<td style="text-align: right;">${syrk.showLdrk}</td>
						<td style="text-align: right;">${syrk.showJzrk}</td>
						<td style="text-align: right;">${syrk.showWlhrk}</td>
						<td style="text-align: right;">${syrk.showJwry}</td>
					   </c:if>
					   <td style="text-align: right;">${syrk.showRkSum}</td>
					  </tr>	
					  </c:forEach>				  
				  </c:if>
				  <c:if test="${userDeptLevel != 5}"><!-- 当前机构不是警务区，显示下级机构数据 -->
					  <c:forEach var="syrk" items="${syrkList}" varStatus="_i">
					  <!-- 除合计外，点击机构名可钻取 -->
					  <tr>
					   <c:if test="${_i.index != (fn:length(syrkList) - 1)}"><!-- 不是合计 -->
					  	<td style="text-align: left;"><a class="xqgk" href="###" onclick="showChildDept('${syrk.deptCode}', '${syrk.deptName}');">${syrk.deptName}</a></td>	
					   </c:if>
					   <c:if test="${_i.index == (fn:length(syrkList) - 1)}"><!-- 是合计 -->
					  	<td style="text-align: left;">${syrk.deptName}</td>	
					   </c:if>
						<td style="text-align: right;">${syrk.showCzrk}</td>
						<td style="text-align: right;">${syrk.showLdrk}</td>
						<td style="text-align: right;">${syrk.showJzrk}</td>
						<td style="text-align: right;">${syrk.showWlhrk}</td>
						<td style="text-align: right;">${syrk.showJwry}</td>
						<td style="text-align: right;">${syrk.showRkSum}</td>
					  </tr>	
					  </c:forEach>				  
				  </c:if>
				</table>				
        	</td>
    	</tr>
  	</table>
</div>
<!--主内容 结束-->


<script type="text/javascript">
	function showChildDept(deptCode, deptName){
		var linkUrl = contextPath + "/xqgk/getDeptInfoOfSyrk.action?deptCode=";
		if(window.parent.changeFrame){
			window.parent.changeFrame(linkUrl, deptCode, deptName, "${userDeptLevel}", false, false);
		}else{
			var url = linkUrl + deptCode;
			window.location = url;
		}
	}
	
	function showDetail(deptCode, dataType){
		var linkUrl = contextPath + "/xqgk/getSqDetailList.action?code=" + dataType + "&deptCode=" + deptCode;
		window.open(linkUrl);
	}

	function closeParentLoading(){
		if(window.parent.hiddenLoading){
			window.parent.hiddenLoading();
		}
	}
</script>
</body>
</html>
