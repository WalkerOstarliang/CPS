<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/template/xqgkInclude.inc" %>
<title>监视居住人员</title>
	<body style="background: none;background-color:white; overflow-x: hidden;overflow-y: auto; padding: 5px;">	
	<br/>
		<h3 style="color: #c30; text-align: center;font-size:18px;">
			监视居住人员列表
		</h3>
		<!-- 
		<div style="float: right; margin-bottom:5px;margin-right:20px;">
			<input class="gzrz_btn" type="button" value="打印"/>&nbsp;&nbsp;	
			<input class="gzrz_btn" type="button" value="导出"/>&nbsp;&nbsp;
		</div>
		 -->
		<table width="98%" border="0" cellSpacing="0" cellPadding="0" style="margin-bottom: 5px;">
			<tr>
				<td style="text-align: right;">
					<select id="" onchange="searchData(this.value);">
						<c:if test="${searchType == -1}">
							<option value="-1" selected="selected">全部</option>
						</c:if>
						<c:if test="${searchType != -1}">
							<option value="-1">全部</option>
						</c:if>
						
						<c:if test="${searchType == 1}">
							<option value="1" selected="selected">未接收</option>
						</c:if>
						<c:if test="${searchType != 1}">
							<option value="1">未接收</option>
						</c:if>
						
						<c:if test="${searchType == 2}">
							<option value="2" selected="selected">已接收</option>
						</c:if>
						<c:if test="${searchType != 2}">
							<option value="2">已接收</option>
						</c:if>
						
						<c:if test="${searchType == 4}">
							<option value="4" selected="selected">申请离开</option>
						</c:if>
						<c:if test="${searchType != 4}">
							<option value="4">申请离开</option>
						</c:if>
						
						<c:if test="${searchType == 5}">
							<option value="5" selected="selected">已解除</option>
						</c:if>
						<c:if test="${searchType != 5}">
							<option value="5">已解除</option>
						</c:if>
						
						<c:if test="${searchType == -2}">
							<option value="-2" selected="selected">待处理</option>
						</c:if>
						<c:if test="${searchType != -2}">
							<option value="-2">待处理</option>
						</c:if>
					</select>				
				</td>
			</tr>
		</table>		 
		<table width="98%"  class="table_list09" border="0" cellSpacing="0"
			cellPadding="0" id="resultTable">
				<tr>
					<th width="5%" style="text-align: center;">
						状态
					</th>
					<th width="10%" style="text-align: center;">
						姓名
					</th>
					<th width="15%" style="text-align: center;">
						涉嫌罪名
					</th>
					<th width="25%" style="text-align: center;">
						监视地址
					</th>
					<th width="30%" style="text-align: center;">
						监视原因
					</th>
					<th width="5%" style="text-align: center;">
						开始时间
					</th>
					<th width="5%">&nbsp;</th>
				</tr>
				
				<c:if test="${empty list}">
					<tr>
						<td colspan="7" style="text-align: center;">暂无相应人员</td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
				<c:forEach var="jsjz" items="${list}" varStatus="_i">
				<tr>
					<td style="text-align: center;">${jsjz.showJfFlag}</td>
					<td>${jsjz.xm}</td>
					<td>${jsjz.zm}</td>
					<td>${jsjz.dz}</td>
					<td>${jsjz.yy}</td>
					<td>${jsjz.rq}</td>
					<td style="text-align: center;"><a href="javascript:void(0);" onclick="optRyInfo('${jsjz.ajbh}','${jsjz.rybh}');">操作</a></td>
				</tr>
				</c:forEach>
				</c:if>					
	</table>

<script type="text/javascript">
	function optRyInfo(ajbh, rybh){
		var ryjs = '${ryjs}';
		var sfzh = '${rysfzh}';
		var ryjh = '${ryjh}';
		var zfbaUrl = "http://10.143.1.202:8080/WLZFBA/system/toZFBA";
		var param = "?cardID=" + sfzh + "&jiaose=" + ryjs + "&jinghao=" + ryjh + "&ajbh=" + ajbh + "&rybh=" + rybh + "&rylx=2&jzcl=1"
		var url = zfbaUrl + param;
		window.open(url);
	}
	function searchData(val){
		var url = contextPath + "/xqgk/showJsjzDetail.action?searchType=" + val;
		window.location = url;
	}	
</script>
	
</body>