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
				  	<th style="text-align: center;">特种行业</th>
				  	<th style="text-align: center;">公共场所</th>
				  	<th style="text-align: center;">企事业单位</th>
				  	<th style="text-align: center;">涉外单位</th>
				  	<th style="text-align: center;">上网服务场所</th>
				  	<th style="text-align: center;">危险化学品单位</th>
				  	<th style="text-align: center;">开锁业</th>
				  	<th style="text-align: center;">技防单位</th>
				  	<th style="text-align: center;">旅馆业</th>
				  	<th style="text-align: center;">其他</th>
				  	<th style="text-align: center;">总数</th>
				  </tr>
				  
				  <c:if test="${userDeptLevel == 5}"><!-- 当前机构为警务区，显示社区数据 -->
				  	  <c:forEach var="sydw" items="${sydwList}" varStatus="_i">
				  	  <!-- 机构不再钻取，除合计、总计外数据可点击查看详细 -->
					  <tr>
					  	<td style="text-align: left;">${sydw.deptName}</td>
					   <c:if test="${_i.index != (fn:length(sydwList) - 1)}"><!-- 不是合计 -->
					  	<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'tzhy');">${sydw.showTzhy}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'ggcs');">${sydw.showGgcs}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'qsydw');">${sydw.showQsydw}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'swdw');">${sydw.showSwdw}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'swfwdw');">${sydw.showSwfwdw}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'wxpdw');">${sydw.showWxpdw}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'ksy');">${sydw.showKsy}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'jfdw');">${sydw.showJfdw}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'lgy');">${sydw.showLgy}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${sydw.deptCode}', 'qtdw');">${sydw.showQtdw}</a></td>	
					   </c:if>
					   <c:if test="${_i.index == (fn:length(sydwList) - 1)}"><!-- 是合计 -->
					  	<td style="text-align: right;">${sydw.showTzhy}</td>
						<td style="text-align: right;">${sydw.showGgcs}</td>
						<td style="text-align: right;">${sydw.showQsydw}</td>
						<td style="text-align: right;">${sydw.showSwdw}</td>
						<td style="text-align: right;">${sydw.showSwfwdw}</td>
						<td style="text-align: right;">${sydw.showWxpdw}</td>
						<td style="text-align: right;">${sydw.showKsy}</td>
						<td style="text-align: right;">${sydw.showJfdw}</td>
						<td style="text-align: right;">${sydw.showLgy}</td>
						<td style="text-align: right;">${sydw.showQtdw}</td>
					   </c:if>
						<td style="text-align: right;">${sydw.showDwSum}</td>
					  </tr>	
					  </c:forEach>
				  </c:if>
				  <c:if test="${userDeptLevel != 5}"><!-- 当前机构不是警务区，显示下级机构数据 -->
					  <c:forEach var="sydw" items="${sydwList}" varStatus="_i">
					  <!-- 除合计外，点击机构名可钻取 -->
					  <tr>
					   <c:if test="${_i.index != (fn:length(sydwList) - 1)}"><!-- 不是合计 -->
					  	<td style="text-align: left;"><a class="xqgk" href="###" onclick="showChildDept('${sydw.deptCode}', '${sydw.deptName}');">${sydw.deptName}</a></td>	
					   </c:if>
					   <c:if test="${_i.index == (fn:length(sydwList) - 1)}"><!-- 是合计 -->
					  	<td style="text-align: left;">${sydw.deptName}</td>	
					   </c:if>
						<td style="text-align: right;">${sydw.showTzhy}</td>
						<td style="text-align: right;">${sydw.showGgcs}</td>
						<td style="text-align: right;">${sydw.showQsydw}</td>
						<td style="text-align: right;">${sydw.showSwdw}</td>
						<td style="text-align: right;">${sydw.showSwfwdw}</td>
						<td style="text-align: right;">${sydw.showWxpdw}</td>
						<td style="text-align: right;">${sydw.showKsy}</td>
						<td style="text-align: right;">${sydw.showJfdw}</td>
						<td style="text-align: right;">${sydw.showLgy}</td>
						<td style="text-align: right;">${sydw.showQtdw}</td>
						<td style="text-align: right;">${sydw.showDwSum}</td>
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
		var linkUrl = contextPath + "/xqgk/getDeptInfoOfSydw.action?deptCode=";
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
		if(parent.hiddenLoading()){
			parent.hiddenLoading();
		}
	}	
</script>
</body>
</html>
