<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<%@include file="/template/fusion.inc" %>
	<div style="overflow-x:auto">
		&nbsp;&nbsp;&nbsp;&nbsp;
		截止<font color="red">${xqfaqktjBean.tjjzrqms}</font>，
		本辖区(<font color="red">${xqfaqktjBean.dwmc }</font>)本年度累计侵犯财产类发案数<font color="red">${xqfaqktjBean.ljfasl_n }</font>起(当天<font color="red">${xqfaqktjBean.ljfasl }</font>起，本月<font color="red">${xqfaqktjBean.ljfasl_y}</font>起)。
		其中抢劫案<font color="red">${xqfaqktjBean.ljqjasl }</font>起，
		抢夺案<font color="red">${xqfaqktjBean.ljqdasl }</font>起，
		盗窃案<font color="red">${xqfaqktjBean.ljdqasl}</font>起，
		诈骗案<font color="red">${xqfaqktjBean.ljzpasl }</font>起，
		其他案<font color="red">${xqfaqktjBean.ljqtasl }</font>起。
	</div>
	<div>
		<span style="float:left;">发案情况：</span>
		<span style="float:right;">
			<a href='javascript:xqfatjUp()' style="font-size:12px;color:red;">返回</a>
		</span>
	</div>
	
	<%-- 单位级别 --%>
	<input type="hidden" id="orgLeve" value="${loginInfo.leve}" />
	
	<%-- 用户级别 --%>
	<input type="hidden" id="userLeve" value="${loginInfo.leve}" />
	
	<%-- 统计单位代码 --%>
	<input type="hidden" id="queryDwdm" value="${xqfaqktjBean.dwdm}" />
	
	<input type="hidden" id="queryParentCode" />
	
	<div id="dataArea">	
	     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_box">
	       <tr>
	         <th rowspan="2">辖区</th>
	         <th colspan="3">总数</th>
	         <th colspan="3">抢劫案</th>
	         <th colspan="3">抢夺案</th>
	         <th colspan="3">盗窃案</th>
	         <th colspan="3">诈骗案</th>
	         <th colspan="3">其他案件</th>
	       </tr>
	       <tr>
	       	<th>当天</th>
	       	<th>本月</th>
	       	<th>本年</th>
	       	<th>当天</th>
	       	<th>本月</th>
	       	<th>本年</th>
	       	<th>当天</th>
	       	<th>本月</th>
	       	<th>本年</th>
	       	<th>当天</th>
	       	<th>本月</th>
	       	<th>本年</th>
	       	<th>当天</th>
	       	<th>本月</th>
	       	<th>本年</th>
	       	<th>当天</th>
	       	<th>本月</th>
	       	<th>本年</th>
	       </tr>
	       <c:forEach items="${xqfaqktjBean.byfatjList}" var="xqajtjBean">
		       <tr>
		       	  <td width="130px" style="text-align: left;">
	       	 	 	${xqajtjBean.dwmc}
		       	 </td>
		       	 
		       	 <td>${xqajtjBean.ajzsl}</td>
		       	 <td>${xqajtjBean.ajzsl_y}</td>
		       	 <td>${xqajtjBean.ajzsl_n}</td>
		       	 
		         <td>${xqajtjBean.qjasl}</td>
		         <td>${xqajtjBean.qjasl_y}</td>
		         <td>${xqajtjBean.qjasl_n}</td>
		         
		         <td>${xqajtjBean.qdasl}</td>
		         <td>${xqajtjBean.qdasl_y}</td>
		       	 <td>${xqajtjBean.qdasl_n}</td>
		       	 
		         <td>${xqajtjBean.dqasl}</td>
		         <td>${xqajtjBean.dqasl_y}</td>
		       	 <td>${xqajtjBean.dqasl_n}</td>
		       	 
		         <td>${xqajtjBean.zpasl}</td>
		         <td>${xqajtjBean.zpasl_y}</td>
		       	 <td>${xqajtjBean.zpasl_n}</td>
		       	 
		         <td>${xqajtjBean.qtasl}</td>
		         <td>${xqajtjBean.qtasl_y}</td>
		       	 <td>${xqajtjBean.qtasl_n}</td>
		       </tr>
	       </c:forEach>
	     </table>
     </div>
     
    <script>
    //辖区发案统计下钻
	function xqfatjDown(orgcode,parentcode){
		var url = contextPath + "/outsite/queryXqFatj.action?queryBean.parent_dm=" 
		          + orgcode;
		$("#dataArea").empty();
		$.post(url,function(htmldata){
			$("#orgLeve").val(parseInt($("#orgLeve").val()) + 1);	
			$("#queryDwdm").val(orgcode);
			$("#queryParentCode").val(parentcode);
			
			$("#dataArea").html(htmldata);
			
		});
    }
    
    //辖区发案统计返回
    function xqfatjUp(){
    	var queryDwdm = $("#queryDwdm").val();
    	var userLeve = parseInt($("#userLeve").val());
    	var orgLeve = parseInt($("#orgLeve").val()) - 1;
    	
    	var url ;
    	if(orgLeve >= userLeve){
    		
    		if(orgLeve != userLeve){
	    		if(orgLeve == 2){
	    			queryDwdm = queryDwdm.substring(0,2) + "0000000000";
	    		}else if(orgLeve == 3){
	    			queryDwdm = queryDwdm.substring(0,4) + "00000000";
	    		}else if(orgLeve == 4){
	    			queryDwdm = queryDwdm.substring(0,6) + "000000";
	    		}else if(orgLeve == 5){
	    			queryDwdm = queryDwdm.substring(0,8) + "0000";
	    		}else if(orgLeve == 6){
	    			queryDwdm = $("#queryParentCode").val();
	    		}
	    		
	    		url = contextPath + "/outsite/queryXqFatj.action?queryBean.parent_dm="  + queryDwdm;
    		}else{
    			if(orgLeve == 2){
	    			queryDwdm = queryDwdm.substring(0,2) + "0000000000";
	    		}else if(orgLeve == 3){
	    			queryDwdm = queryDwdm.substring(0,4) + "00000000";
	    		}else if(orgLeve == 4){
	    			queryDwdm = queryDwdm.substring(0,6) + "000000";
	    		}else if(orgLeve == 5){
	    			queryDwdm = queryDwdm.substring(0,8) + "0000";
	    		}else if(orgLeve == 6){
	    			queryDwdm = $("#queryParentCode").val();
	    		}
    			url = contextPath + "/outsite/queryXqFatj.action?queryBean.parent_dm="  + queryDwdm;
    		}
    		
	    	
			$.post(url,function(htmldata){
				$("#dataArea").empty();
				$("#orgLeve").val(orgLeve);
				
				if(orgLeve == 2){
	    			queryDwdm = queryDwdm.substring(0,2) + "0000000000";
	    		}else if(orgLeve == 3){
	    			queryDwdm = queryDwdm.substring(0,4) + "00000000";
	    		}else if(orgLeve == 4){
	    			queryDwdm = queryDwdm.substring(0,6) + "000000";
	    		}else if(orgLeve == 5){
	    			queryDwdm = queryDwdm.substring(0,8) + "0000";
	    		}else if(orgLeve == 6){
	    			queryDwdm = $("#queryParentCode").val();
	    		}
	    		$("#queryDwdm").val(queryDwdm);
	    		
				$("#dataArea").html(htmldata);	
			});
    	}
    }
    
    
     </script>
</creator:view>