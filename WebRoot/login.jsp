<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<style type="text/css">
body 
{ 
	  margin:0; 
	  padding:0; 
	  font-size:12px; 
	  color:#333; 
	  background-color:#006cd0; 
	  font-family: Arial, Helvetica, sans-serif;
}
</style>
<creator:Script src="/template/cps/js/login.js"></creator:Script>
<div style="width:1000px; margin:0 auto;">
<form id="loginform" method="post">
	<input type="hidden" name="modename" value="login"/>
	<div style="width:100%; height:180px; background-image:url(<c:url value='/template/cps/login/login_bg01.jpg'/>); background-repeat:no-repeat;"></div>
	<div style="width:100%; height:300px; background-image:url(<c:url value='/template/cps/login/login_bg02.jpg'/>); background-repeat:no-repeat;">
    	 <div style="width:280px; position:relative; top:70px; left:430px;">
         	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="60" height="45"><span style="font-size:14px; color:#666; font-weight:bold;">用户名：</span></td>
                <td><input type="text" name="username" id="username" style="width:200px; height:20px; line-height:20px; border:1px solid #CCC; padding:5px;" /></td>
              </tr>
              <tr>
                <td height="45"><span style="font-size:14px; color:#666; font-weight:bold;">密&nbsp;&nbsp;&nbsp;码：</span></td>
                <td><input type="password" name="password" id="password" style="width:200px; height:20px; line-height:20px; border:1px solid #CCC; padding:5px;" /></td>
              </tr>
              <tr>
                <td height="45">&nbsp;</td>
                <td><input type="button" id="loginbtn" value="" style=" width:90px; height:34px; border:0; padding:0; cursor:pointer; background-image:url(<c:url value='/template/cps/login/login_btn01.jpg'/>); background-repeat:no-repeat;" />
                <input type="submit" id="button2" value="" style=" width:100px; height:34px; border:0; padding:0; cursor:pointer; background-image:url(<c:url value='/template/cps/login/login_btn02.jpg'/>); background-repeat:no-repeat;" /></td>
              </tr>
            </table>
         </div>	
	  </div>
  	<div style="width:100%; height:100px; background-image:url(<c:url value='/template/cps/login/login_bg03.jpg'/>); background-repeat:no-repeat; text-align:center; line-height:24px;">
   	  <div>湖南省公安厅&copy;版权所有&nbsp;&nbsp;推荐使用1024*768分辨率</div>
        <div>技术支持：湖南科创&nbsp;&nbsp;电话：0731-94597427</div>
  	</div>
  </form>
</div>
</creator:view>