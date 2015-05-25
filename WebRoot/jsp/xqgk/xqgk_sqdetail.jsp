<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/template/xqgkInclude.inc" %>
<head>
	<title>${typeName}</title>
<script type="text/javascript">
function gotoPages(pageNo,pageCount,o){
	if(pageNo == "0"){
		pageNo = $(o).parent().find("input[name=pagesNumber]").val();
	}
	if(pageNo == "" || pageNo<1){
		pageNo = 1;
	}
	if(pageNo > pageCount){
		pageNo = pageCount;
	}
	$(o).parent().find("input[name='pageNo']").val(pageNo);
	
	var url = contextPath + "/xqgk/getSqDetailList.action?code=${code}&deptCode=${deptCode}&currentPage=" + pageNo;
	window.location = url;
	//eval(ajaxMod+"('"+pageNo+"')");
}
</script>	
</head>
	<body style="background: none;background-color:white; overflow-x: hidden;overflow-y: auto; padding: 5px;">	
	<br/>
		<h3 style="color: #c30; text-align: center;font-size:18px;">
			${typeName}列表
		</h3>
		<div style="width: 98%;">
			<div style="text-align: right;">
				<input type='hidden' name='pageNo' value='${detail.currentPage}'/>
				共${detail.totalCount}条记录&nbsp;&nbsp;第${detail.currentPage}页/共${detail.totalPage}页&nbsp;&nbsp;
			  <c:if test="${currentPage > 1}">
				<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick="gotoPages(1,${detail.totalPage},this);">首  页</a>&nbsp;&nbsp;
				<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick="gotoPages(${detail.currentPage - 1},${detail.totalPage},this);">上一页</a>&nbsp;&nbsp;			
			  </c:if>
			  <c:if test="${detail.currentPage == 1}">
				首  页&nbsp;&nbsp;上一页&nbsp;&nbsp;			
			  </c:if>
			  
			  <c:if test="${detail.currentPage < detail.totalPage}">
				<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick="gotoPages(${detail.currentPage + 1},${detail.totalPage},this);">下一页</a>&nbsp;&nbsp;
				<a style='cursor:pointer;color:#1E90FF;' mce_style='cursor: pointer' onclick="gotoPages(${detail.totalPage},${detail.totalPage},this);">尾  页</a>&nbsp;&nbsp;			
			  </c:if>
			  <c:if test="${detail.currentPage == detail.totalPage}">
				下一页&nbsp;&nbsp;尾  页&nbsp;&nbsp;			
			  </c:if>
				跳转到 <input type='text' style='width:30px;' onkeyup="value=value.replace(/\\D+/g,'')" name='pagesNumber' value='' /> 页&nbsp;
				<a href='javascript:void(-1);' onclick="gotoPages(0,${detail.totalPage},this);">GO</a>&nbsp;&nbsp;&nbsp;		  
			</div>
		</div>		
		<table width="98%"  class="table_list09" border="0" cellSpacing="0" cellPadding="0" id="resultTable">
				<tr>
					<th style="text-align: center;" width="5%">序号</th>
				  <c:forEach var="thCol" items="${thList}" varStatus="_i">
					<th style="text-align: center;" width="${thCol.width}">${thCol.thName}</td>
				  </c:forEach>
				</tr>
				
				<c:if test="${empty detail.datas}">
					<tr>
						<td colspan="${fn:length(thList) + 1}" style="text-align: center;">暂无${typeName}</td>
					</tr>
				</c:if>
				<c:if test="${not empty detail.datas}">
				<c:forEach var="line" items="${detail.datas}" varStatus="_i">
				<tr>
					<td style="text-align: center;">${_i.index + 1}</td>
				  <c:forEach var="tdCol" items="${line}">
				  	<c:if test="${not empty tdCol.actUrl}">
				  	  <td style="text-align: ${tdCol.align};"><a href="${tdCol.actUrl}" target="_blank">${tdCol.val}</a></td>
				  	</c:if>
				  	<c:if test="${empty tdCol.actUrl}">
				  	  <td style="text-align: ${tdCol.align};">${tdCol.val}</td>
				  	</c:if>
					
				  </c:forEach>
				</tr>
				</c:forEach>
				</c:if>					
		</table>
	</body>