<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<%@include file="/template/include.inc" %>
<script type="text/javascript">

</script>
</head>
<body>
<%@include file="/jsp/common/mysebar.jsp" %>
<div class="box">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_title">
    <tr>
      <td width="23"><img src="<c:url value='/template/cps/images/img_title.jpg'/>" width="23" height="28" /></td>
      <td>安防管理 > 卡口信息登记</td>
      <td width="28"><a href="javascript:void(0)"><img src="<c:url value='/template/cps/images/cx_zk.jpg'/>" width="28" height="28" /></a></td>
    </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="list_a">
	  <tr>
	  	
	    <th width="14%">卡口名称：</th>
	    <td width="20%"><input name="textfield" type="text" class="input_text" id="textfield" /></td>
	    <th width="14%">建立日期：</th>
	    <td width="20%"><input name="textfield3" type="text" class="input_text" id="textfield3" /></td>
	    <th width="14%">撤销日期：</th>
	    <td><input name="textfield5" type="text" class="input_text" id="textfield5" /></td>
	  </tr>
  	  <tr>
        <th>登记人：</th>
        <td>
        	<input name="textfield2" type="text" onfocus="" class="input_text" id="textfield2" readonly="readonly"/>
        </td>
        <th>登记时间：</th>
        <td><input name="textfield4" type="text" class="input_text" id="textfield4" /></td>
        <th>类型：</th>
        <td>
        	<select id="" class="input_text">
        		<option>1asdfasdf</option>
        		<option>1asdfasdf</option>
        	</select>
        </td>
      </tr>
       <tr>
        <th>登记人：</th>
        <td>
        	<cps:dicText zdlb="GB_XZQH" dm="620525"></cps:dicText>
        </td>
        <th>登记时间：</th>
        <td>
        	<cps:date id="1aa" name="aa" dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="input_text"></cps:date>
        </td>
        <th>类型：</th>
        <td>
        	<cps:select id="11" name="bb" zdlb="GB_XZQH" cssClass="input_text" value="620525"></cps:select>
        </td>
      </tr>
</table>
<div class="cx_btnbox">
     <a href="#" class="btn_cx">查询</a>
     <a href="#" class="btn_gjcx">高级查询</a>
</div>
</div>

<div class="box">
  <div class=box_tbar>
  	<a href="#" class="btn_add"></a>
  	<a href="#" class="btn_del"></a>
  </div>
  
  <cps:tableGrid id="mysss" 
			pageSize="15"
			usepager="true"
			searchform="searchform"
			autothead="true"
			url="/test/queryTestData.action" 
			mutilSelect="false"
			autoload="false"
			>
	<cps:column isNumber="true" title="序号"></cps:column>
	<cps:column isCheckbox="true"></cps:column>
	<cps:column title="姓名" field="sss"></cps:column>
	<cps:column title="用户名" field="username"></cps:column>
	<cps:column title="回调函数测试" field="aaa" ></cps:column>
	<cps:column title="籍贯" field="jg"></cps:column>
	<cps:column title="操作" field="cz" expand="false"></cps:column>
</cps:tableGrid>
</div>
</body>
</html>
