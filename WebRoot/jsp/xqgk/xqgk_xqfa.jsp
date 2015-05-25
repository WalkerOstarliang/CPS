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

	<body style="background: none; overflow: hidden;">
		<br />
		<h3 style="color: #c30; text-align: center;font-size:18px;">
			7日内辖区发案情况
		</h3>
		<table cellpadding="0" cellspacing="0" class="table_list09" width="100%">
			<tr>
				<td>
					<div class="newlist" style="overflow-y: auto; overflow-x: hidden;">
 						<ul>
	                 	  <c:forEach var="ajInfo" items="${ajInfoList}" varStatus="_i">
	                 		<li style="border-bottom: 1px solid #E3E3E3;">
	                 			${ajInfo.JJSJ}，${ajInfo.FADXZ}发生一起${ajInfo.AJLBMC}。
	                 	 		<a href="javascript:void(0);" onclick="showDetailOfAj('${ajInfo.AJBH}');" style="color:#F00; text-decoration:underline;">详情>></a>
	                 	 		<a href="javascript:void(0);" onclick="showMapOfAj('${ajInfo.AJBH}');" style="color:#F00; text-decoration:underline;">地图>></a>
	                 	 	</li>
	                 	   </c:forEach>    	
                        </ul>                         	
                	</div>				
				</td>
			</tr>
		</table>
	</body>

<script type="text/javascript">
	function showMapOfAj(){
		var url = "http://10.143.1.202:8080/WLZFBA/pgisFX.jsp?jgcode=${userDeptCode}"
		//var url = "http://10.143.5.48/ajjxh/app/outer/tjfxMap.jsp?unitCode=${userDeptCode}";
		window.open(url);
	}
		
	function showDetailOfAj(ajbh){
		var url = "http://10.143.1.200/csjz/jsp/gzpt/asjDetail.jsp?ajbh=" + ajbh;
		//var url = "http://10.143.5.48/ajjxh/app/outer/ajxq.jsp?ajbh=" + ajbh;
		window.open(url);
	}
</script>

</body>
</html>
