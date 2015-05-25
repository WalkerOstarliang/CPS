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
			<td>
				<div style=" padding-bottom:10px; margin-bottom:10px; background-image:url(${contextPath}${themePath}/images/line.jpg); background-repeat:repeat-x; background-position:bottom;">
             	  	&nbsp;&nbsp;&nbsp;&nbsp;从<span style="color:#F00;">${tjStartDate[0]}</span>年<span style="color:#F00;">${tjStartDate[1]}</span>月<span style="color:#F00;">${tjStartDate[2]}</span>日<span style="color:#F00;">0</span>点至<span style="color:#F00;">${tjDate[0]}</span>年<span style="color:#F00;">${tjDate[1]}</span>月<span style="color:#F00;">${tjDate[2]}</span>日<span style="color:#F00;">0</span>点，
             	  	${userDeptName}辖区内30天累计发案<span style="color:#F00;">${xqzaInfo.AJZS}</span>起，
             	  	日均发案<span style="color:#F00;">${xqzaInfo.RJ}</span>起；
             	  	其中多发性侵财案件<span style="color:#F00;">${xqzaInfo.QCAJS}</span>起，
             	  	占发案总数的<span style="color:#F00;">${xqzaInfo.ZB}%</span>。
				</div>
			</td>
		</tr>
	  	<tr>
	    	<td valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list07">
				  <tr>
				  	<th width="20%" style="text-align: center;">单 位</th>
				  	<th width="13%" style="text-align: center;">抢劫案</th>
				  	<th width="13%" style="text-align: center;">抢夺案</th>
				  	<th width="13%" style="text-align: center;">盗窃案</th>
				  	<th width="13%" style="text-align: center;">入室盗</th>
				  	<th width="13%" style="text-align: center;">诈骗案</th>
				  	<th width="13%" style="text-align: center;">其他案件</th>
				  	<th width="13%" style="text-align: center;">总数</th>
				  </tr>
				  
				  <c:if test="${userDeptLevel == 5}"><!-- 当前机构为警务区，显示社区数据 -->
					  <c:forEach var="xqza" items="${xqzaList}" varStatus="_i">
					  <!-- 机构不再钻取，除合计、总计外数据可点击查看详细 -->
					  <tr>
					  	<td style="text-align: left;">${xqza.deptName}</td>
					   <c:if test="${_i.index != (fn:length(xqzaList) - 1)}"><!-- 不是合计 -->
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${xqza.deptCode}', 'qjaj');">${xqza.showQjsl}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${xqza.deptCode}', 'qdaj');">${xqza.showQdsl}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${xqza.deptCode}', 'dqaj');">${xqza.showDqsl}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${xqza.deptCode}', 'rsdq');">${xqza.showRsdqsl}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${xqza.deptCode}', 'zpaj');">${xqza.showZpsl}</a></td>
						<td style="text-align: right;"><a class="xqgk" href="javascript:void(0);" onclick="showDetail('${xqza.deptCode}', 'qtaj');">${xqza.showQtsl}</a></td>
					   </c:if>
					   <c:if test="${_i.index == (fn:length(xqzaList) - 1)}"><!-- 是合计 -->
						<td style="text-align: right;">${xqza.showQjsl}</td>
						<td style="text-align: right;">${xqza.showQdsl}</td>
						<td style="text-align: right;">${xqza.showDqsl}</td>
						<td style="text-align: right;">${xqza.showRsdqsl}</td>
						<td style="text-align: right;">${xqza.showZpsl}</td>
						<td style="text-align: right;">${xqza.showQtsl}</td>
					   </c:if>
					   <td style="text-align: right;">${xqza.showZs}</td>
					  </tr>	
					  </c:forEach>				  
				  </c:if>
				  <c:if test="${userDeptLevel != 5}"><!-- 当前机构不是警务区，显示下级机构数据 -->
					  <c:forEach var="xqza" items="${xqzaList}" varStatus="_i">
					  <!-- 除合计外，点击机构名可钻取 -->
					  <tr>
					   <c:if test="${_i.index != (fn:length(xqzaList) - 1)}"><!-- 不是合计 -->
					  	<td style="text-align: left;"><a class="xqgk" href="###" onclick="showChildDept('${xqza.deptCode}', '${xqza.deptName}');">${xqza.deptName}</a></td>	
					   </c:if>
					   <c:if test="${_i.index == (fn:length(xqzaList) - 1)}"><!-- 是合计 -->
					  	<td style="text-align: left;">${xqza.deptName}</td>		
					   </c:if>
						<td style="text-align: right;">${xqza.showQjsl}</td>
						<td style="text-align: right;">${xqza.showQdsl}</td>
						<td style="text-align: right;">${xqza.showDqsl}</td>
						<td style="text-align: right;">${xqza.showRsdqsl}</td>
						<td style="text-align: right;">${xqza.showZpsl}</td>
						<td style="text-align: right;">${xqza.showQtsl}</td>
						<td style="text-align: right;">${xqza.showZs}</td>
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
		var linkUrl = contextPath + "/xqgk/getDeptInfoOfXqza.action?deptCode=";
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
