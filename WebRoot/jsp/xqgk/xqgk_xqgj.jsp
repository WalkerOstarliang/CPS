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
			辖区最近7日内重点人员轨迹
		</h3>
		<table cellpadding="0" cellspacing="0" class="table_list09" width="100%">
			<tr>
				<td>
					<div class="newlist" style="overflow-y: auto; overflow-x: hidden;">
                          	<c:if test="${empty gjInfoList}">
								<ul>
	                 	 			<li style="border-bottom: 1px solid #E3E3E3; text-align: center;">
	                 	 				暂无重点人员轨迹
	                 	 		  	</li>
                            </ul>                          		
                          	</c:if>
                          	<c:if test="${not empty gjInfoList}">
 							<ul>
	                 	 		<c:forEach var="gjInfo" items="${gjInfoList}" varStatus="_i">
	                 	 			<li style="border-bottom: 1px solid #E3E3E3;">
	                 	 				<a href="javascript:void(0);" onclick="openGjDetail('${gjInfo.RYCODE}');">${gjInfo.REMARK}</a>
	                 	 		  	</li>
	                 	 		</c:forEach>    	
                            </ul>                         	
                          	</c:if>
                	</div>				
				</td>
			</tr>
		</table>
	</body>

<script type="text/javascript">
	function openGjDetail(sfzh){
		var code = '${userCode}';
		//var url = "http://10.142.56.122:9988/newDzda/login/check_externalSystemLogin.action?user_name=" + code + "&sfzh=" + sfzh;
		var url = "https://10.143.1.134:9443/eledoc/pki.faces?method=getBussinessInfo&id=" + sfzh;
		window.open(url);
	}
</script>

</body>
</html>
