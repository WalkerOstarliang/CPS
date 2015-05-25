<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/template/xqgkInclude.inc" %>
<title>取保候审人员（待处理）</title>
		<body style="background: none; background-color:white; overflow-x: hidden;overflow-y: auto; padding: 5px;">
		<br />
		<h3 style="color: #c30; text-align: center;font-size:18px;">
			取保候审人员列表（待处理）
		</h3>
		<!-- 
		<div style="float: right; margin-bottom:5px;margin-right:20px;">
			<input class="gzrz_btn" type="button" value="打印"/>&nbsp;&nbsp;	
			<input class="gzrz_btn" type="button" value="导出"/>&nbsp;&nbsp;
		</div>
		 -->		
		<table width="98%" class="table_list09" border="0" cellSpacing="0"
			cellPadding="0" id="resultTable">
				<tr>
					<th width="10%" style="text-align: center;">
						姓名
					</th>
					<th width="15%" style="text-align: center;">
						涉嫌罪名
					</th>
					<th width="45%" style="text-align: center;">
						取保原因
					</th>
					<th width="25%" style="text-align: center;">
						文书文号
					</th>					
					<th width="5%" style="text-align: center;">
						批准日期
					</th>				
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5" style="text-align: center;">暂无待接收取保候审人员</td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
				<c:forEach var="qbhs" items="${list}" varStatus="_i">
				<tr>
					<td>${qbhs.xm}</td>
					<td>${qbhs.zm}</td>
					<td>${qbhs.yy}</td>
					<td>${qbhs.wsh}</td>
					<td>${qbhs.rq}</td>
				</tr>
				</c:forEach>
				</c:if>				

		</table>
</body>