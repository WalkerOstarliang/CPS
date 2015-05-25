<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>main</title>
	<%@include file="/template/include.inc" %>
	<style type="text/css">
		
	</style>
	<script type="text/javascript">
		
		function aa()
		{
			alert("sdfasd")
		}
		function aaa(rowobj,rowdata)
		{
			alert(rowobj.attr("id") + "---" + rowdata["jg"]);
		}
		function getSelectedRowData()
		{
			var rowDatas = $("#aaaa").getSelected();
			//alert(rowDatas.length)
			alert(rowDatas[0]);
		}
		
		function queryData()
		{
			$("#aaaa").query("F","searchform");
		}
		function openQueryWin()
		{
			$.openDialogWindow({
				url : contextPath + "/test/pages/testwin.jsp?t=" + new Date().getTime(),
				callback : function(queryparams)
				{
					$("#aaaa").query("P",queryparams);
				}
			})
		}
		function bbb(tdobj,rowdata)
		{
			$.ajax({
				type : "post",
				url : contextPath + "/test/rowDataCallback.action",
				success : function(result)
				{
					tdobj.html(result);
				}
			});
			return "<img src=\"" + contextPath + themePath + "/images/loading.gif\">";
		}
		
		function load()
		{
			$.showLoading()
		}
		
		function aaaasubmit()
		{
			
		}
		
		$(function(){
			
			//$("#autohead_aa").css("left",$("#aa").offset().left).css("top",$("#aa").offset().top);
			//$.showLoading(200,400,0,0)
		})
	</script>
</head>
<body>
<%--
<a href="/CPS/test/main/test4.jsp" target="_blank">aaa</a>
<form id="aaaa" action="/CPS/test/mysubmit.action" method="post">
	用户名称：<input type="text" name="username"><br/>
	<cps:button value="提交" type="submit" ></cps:button>
</form>
 --%>

<cps:tabPanel id="bbb" width="100%" height="300">
	<cps:tabItem id="b1"  title="tableGrid表格测试" href="/test/main/test1.jsp"></cps:tabItem>
	<cps:tabItem id="b2" display="true" title="单位人员选择" href="/test/main/test2.jsp"></cps:tabItem>
	<cps:tabItem id="b3" title="tab3">
		<table>
			<tr>
				<td>
						sadfas;ldf<br>
						sadfas;ldf<br>
						sadfas;ldf<br>
						sadfas;ldf<br>
				</td>
			</tr>
		</table>
	</cps:tabItem>
</cps:tabPanel>

<%--
<cps:tabPanel id="aaaa">
	<cps:tabItem id="a1" display="true" title="TabItem1">
		sdfasd2222<br>1111
		sdfasd11111<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd<br>sdasdfasf
		sdfasd<br>
		sdfasd2<br>2222
		sdfasd2<br>
		sdfasd2<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd2<br>2222
		sdfasd2<br>
		sdfasd2<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd2<br>2222
		sdfasd2<br>
		sdfasd2<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd2<br>2222
		sdfasd2<br>
		sdfasd2<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd<br>
	</cps:tabItem>
	<cps:tabItem id="a2" title="TabItem2">
		sdfasd2<br>2222
		sdfasd2<br>
		sdfasd2<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd<br>
	</cps:tabItem>
	<cps:tabItem id="a2" title="TabItem3">
		sdfasd2<br>33333
		sdfasd2<br>
		sdfasd2<br>
		sdfasd<br>
		sdfasd<br>
		sdfasd<br>
	</cps:tabItem>
</cps:tabPanel>
 --%>
<%--
<div id="abs" class="cps-tabpanel" width="500" height="200">
	<div class="cps-tab-head">
		<button id="a1" type="button" class="cps-tab-head-none"  href="/CPS/test/main/test1.jsp">TabItem1</button>
		<button id="a2" type="button" class="cps-tab-head-inline" display="true" href="/CPS/test/main/test2.jsp">TabItem2</button>
		<button id="a2" type="button" class="cps-tab-head-none"  href="/CPS/test/main/test3.jsp">TabItem3</button>
	</div>
	
	<div class="cps-tab-content" style="width: 498;height: 190;overflow: hidden;">
		<div>
			<iframe src="#" frameborder="0" scrolling="auto"></iframe>
		</div>
	</div>
	
	<%--
	<div class="cps-tab-content" style="width: 498;height: 190;overflow: hidden;">
		<div>
			撒地方撒地方asdfsa1
		</div>
		<div>asdfsadf2</div>
		<div>asdfsadf3</div>
		<div>asdfsadf4</div>
		<div>asdfsadf5</div>
		<div>asdfsadf6</div>
	</div>
	
</div>
 --%>
<%--
<script type="text/javascript">
$(function(){
	var width = $("#abs").attr("width");
	var height = $("#abs").attr("height");
	$("#abs").find(".cps-tab-content").css("width",width -2).css("height",height - 10)
	$("#abs").css("width",width).css("height",height);
	$("#abs").find("iframe").attr("width",width -2).attr("height",height - 10);
	$("#abs").find(".cps-tab-head button").each(function(i){
		var display = $(this).attr("display");
		if (display == "true")
		{
			$("#abs").find("iframe").attr("src", $(this).attr("href"))
		}
		
		$(this).bind("click", function(){
			$("#abs").find(".cps-tab-head button").addClass("cps-tab-head-none");
			$("#abs").find(".cps-tab-head button").eq(i).removeClass("cps-tab-head-none").addClass("cps-tab-head-inline");
			$("#abs").find("iframe").attr("src", $(this).attr("href"))
		});
	});
})


	$(function(){
		$("#abs").find(".cps-tab-content div").hide();
		$("#abs").find(".cps-tab-head button").each(function(i){
			var display = $(this).attr("display");
			if (display == "true")
			{
				$("#abs").find(".cps-tab-content div").eq(i).show();
			}
			$(this).bind("click", function(){
				$("#abs").find(".cps-tab-head button").addClass("cps-tab-head-none");
				$("#abs").find(".cps-tab-head button").eq(i).removeClass("cps-tab-head-none").addClass("cps-tab-head-inline");
				$("#abs").find(".cps-tab-content div").hide();
				$("#abs").find(".cps-tab-content div").eq(i).show();
			});
		});
	});

</script>
 --%>
 <script type="text/javascript">
 	function querytable()
 	{
 		$("#mysss").query("F","searchform");
 	}
 	
 	function aabbb(tdobj,rowdata)
 	{
 		if (rowdata["sex"] == "1")
 		{
 			return "<a href='#'>男</a>";
 		}
 	}
 	
 	function openGjSelect()
 	{
 		$.openDialogWindow({
 			url : contextPath + "/test/pages/testwin.jsp",
 			width : 500,
 			height : 400,
 			scroll : false,
 			callback : function(queryParams)
 			{
 				alert(queryParams)
 				$("#mysss").query("P",queryParams);
 			}
 		})
 	}
 </script>
<form id="searchform">
	<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>姓名:</th>
			<td><input id="aa" name="username" class="validate[required, custom[onlyChinese]]"></td>
		</tr>
		<tr>
			<th>身份证号:</th>
			<td>
				<input id="aa" name="aa" class="validate[required, custom[onlyChinese]]">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<cps:button value="查询" onclick="querytable()"></cps:button>
				<cps:button value="高级查询" onclick="openGjSelect()"></cps:button>
			</td>
		</tr>
	</table>
</form>
<cps:tableGrid id="mysss" 
			title="治安类别" 
			pageSize="10"
			usepager="true"
			width="800"
			height="40%"
			searchform="searchform"
			autothead="true"
			url="/test/queryTestData.action" 
			mutilSelect="false"
			autoload="true"
			click="aaa"
			>
	<cps:column isNumber="true" title="序号"></cps:column>
	<cps:column isCheckbox="true"></cps:column>
	<cps:column title="操作" field="cz" expand="false"></cps:column>
	<cps:column title="姓名" field="sss" rowcallback="bbb"></cps:column>
	<cps:column title="用户名" field="username"></cps:column>
	<cps:column title="回调函数测试" field="aaa" rowcallback="bbb" ></cps:column>
	<cps:column title="籍贯" field="jg"></cps:column>
</cps:tableGrid>

 <%--
	<div id="a1" style="width:100%;margin: 0;padding: 0;display: none;">
		<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>姓名:</th>
			<td>{username}</td>
			<th>姓名:</th>
			<td>{username}</td>
			<th>姓名:</th>
			<td align="left">{username}</td>
		</tr>
		<tr>
			<th>身份证号:</th>
			<td><input></td>
			<th style="background-color: ">身份证号:</th>
			<td><input></td>
			<th>身份证号:</th>
			<td><input></td>
		</tr>
	</table>
	</div>
	<form id="searchform">
		<input type="text" name="user.username">
		<input type="text" name="username">
		<cps:button value="查询" onclick="queryData()"></cps:button>
		<cps:button value="load" onclick="load()"></cps:button>
		<cps:button value="打开查询窗口" onclick="openQueryWin()"></cps:button>
	</form>
	<div id="aaaa"></div>
	<script type="text/javascript">
		$(function(){
			$("#aaaa").tableGrid({
				id : "aaaa",
				title : "查询列表",
				url : "/CPS/test/queryTestData.action",
				autoload : true,
				autothead : true,
				mutilSelect : false,
				//contenturl : "/CPS/test/getContent.action?username={username}",
				contentTemplateId : "a1",
				dblclick : aaa,
				//click : aaa,
				searchform : "searchform",
				width : "1400",
				colModel : [
					{isNumber : true, title : "序号"},
					{isCheckbox:true},
					{title : "操作", field : "cz",display:true},
					{title : "用户名", field : "username", expand:true,display:true},
					{title : "回调函数测试", field : "xxx",expand : true, rowcallback : bbb},
					{title : "真实姓名", field : "realname",expand : true,display:true},
					{title : "年龄" , field : "age",expand : true,display:true},
					{title : "性别", field : "sex",expand:true,display:true},
					{title : "籍贯", field : "jg",expand:true,display:true}
				]
			});
		})
	</script>
<cps:button value="获取被选中的行数据" onclick="getSelectedRowData()"></cps:button>
<br/>
<div class="cps-tablegrid-tbar">
	<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th align="center">姓名:</th>
			<td><input></td>
			<th>姓名:</th>
			<td><input></td>
			<th>姓名:</th>
			<td><input></td>
		</tr>
		<tr>
			<th>身份证号:</th>
			<td><input></td>
			<th style="background-color: ">身份证号:</th>
			<td><input></td>
			<th>身份证号:</th>
			<td><input></td>
		</tr>
		<tr>
			<td colspan="6" align="center">
				<cps:button type="reset" value="查询" ondblclick="aa()"></cps:button>
				&nbsp;
				<cps:button type="reset" value="重置" ondblclick="aa()"></cps:button>
			</td>
		</tr>
	</table>
	
	<div id="div_aa" class="cps-panel-content" style="overflow-x: auto;width:850px;padding-bottom: 20px;">
        <table width="1200" border="0" cellspacing="0" cellpadding="0" class="cps-tablegrid">
          <tr>
            <th width="20%">标题A</th>
            <th width="20%">标题B</th>
            <th width="20%">标题C</th>
            <th width="15%">标题D</th>
            <th>标题E</th>
            <th width="8%">操作</th>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr>
          	<td colspan="6" style="margin: 0px;padding: 0px">
          		<div>
					<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th>姓名:</th>
						<td>{username}</td>
						<th>姓名:</th>
						<td>{username}</td>
						<th>姓名:</th>
						<td align="left">{username}</td>
					</tr>
					<tr>
						<th>身份证号:</th>
						<td><input></td>
						<th style="background-color: ">身份证号:</th>
						<td><input></td>
						<th>身份证号:</th>
						<td><input></td>
					</tr>
				</table>
			</div>
          	</td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
        </table>
      </div>
      <div id="pagination_aa" class="cps-pagination">
        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		  	<td>
		  		<select>
		  			<option value="10">10</option>
		  		</select>
		  	</td>
		    <td align="right">
		    	<div class="nextpage">
				    共<font color="red">15</font>条记录&nbsp;
				    第<font color="red">1</font>页&nbsp;
				    共<font color="red">1</font>页&nbsp;
				 <a href="#">首 页</a>&nbsp;
				 <span class="disabled">上一页</span> 
				 <a href="#?page=2">下一页</a>&nbsp;
				 <a href="#">尾页</a> 跳转到<input type="text" size="1" />
				    页&nbsp;&nbsp;</div>
			</td>
		  </tr>
		</table>
      </div>
	
 	<div id="panel_aa" class="cps-panel">
   	  <div class="cps-panel-title">结果列表</div>
   	  <div id="aa" class="cps-panel-content" style="overflow-x: auto;width:850px;">
        <table id="table_aa" width="1200" border="0" cellspacing="0" cellpadding="0" class="cps-tablegrid">
          <tr>
          	<th width="25">序号</th>
          	<th width="25"><input type="checkbox"/></th>
            <th width="20%">标题A</th>
            <th width="20%">标题B</th>
            <th width="20%">标题C</th>
            <th width="15%">标题D</th>
            <th>标题E</th>
            <th width="8%">操作</th>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>1</td>
            <td><input type="checkbox"/></td>
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td >阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>1</td>
            <td><input type="checkbox"/></td>
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>1</td>
            <td><input type="checkbox"/></td>
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>1</td>
            <td><input type="checkbox"/></td>
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>1</td>
            <td><input type="checkbox"/></td>
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
          <tr onmouseover="style.backgroundColor='#DCEEFC'"onmouseout="style.backgroundColor='#FFFFFF'">
            <td>1</td>
            <td><input type="checkbox"/></td>
            <td>按时打算打</td>
            <td>自行车vxcv</td>
            <td> 按时打算</td>
            <td>阿斯顿</td>
            <td>阿斯顿</td>
            <td><a href="#"><img src="images/btn_add.gif" width="16" height="16" alt="新增" /></a><a href="#"><img src="images/btn_bj.gif" width="16" height="16" alt="修改"/></a><a href="#"><img src="images/btn_sc.gif" width="16" height="16" alt="删除"/></a></td>
          </tr>
        </table>
      </div>
      <div id="pagination_aa" class="cps-pagination">
        <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		  	<td>
		  		<select>
		  			<option value="10">10</option>
		  		</select>
		  	</td>
		    <td align="right">
		    	<div class="nextpage">
				    共<font color="red">15</font>条记录&nbsp;
				    第<font color="red">1</font>页&nbsp;
				    共<font color="red">1</font>页&nbsp;
				 <a href="#">首 页</a>&nbsp;
				 <span class="disabled">上一页</span> 
				 <a href="#?page=2">下一页</a>&nbsp;
				 <a href="#">尾页</a> 
				 跳转到<input type="text" size="1" />页&nbsp;&nbsp;
			  </div>
			</td>
		  </tr>
		</table>
      </div>
      
      
      <div id="autohead_aa" style="position: absolute;" class="cps-tablegrid-autohead">
      	<table width="300" border="0" cellspacing="0" cellpadding="0">
      		<tr>
      			<th width="25">序号</th>
      			<th width="25"><input type="checkbox" value=""></th>
      			<th>列名</th>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td>1</td>
      			<td><input type="checkbox" value="xm"></td>
      			<td>姓名</td>
      		</tr>
      		<tr>
      			<td colspan="3">
      				<button>关闭</button>
      			</td>
      		</tr>
      	</table>
      </div>
  </div>
    <div class=" clear"></div>
	<cps:panel title="群体类别" width="845px" >
		 
	</cps:panel>
	 --%>
</body>
</html>