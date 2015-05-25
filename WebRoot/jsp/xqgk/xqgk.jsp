<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<%@include file="/template/xqgkInclude.inc" %>

<script type="text/javascript">
	function dealQueryInfo(code){
		var url = contextPath + "/xqgk/getDataOfQueryInfo.action";
		var param = "code=" + code;
		ajaxSubmit(url, param, dealShowInfo);
	}
	
	function dealShowInfo(resData){
	    $.each(resData.numInfoList, function(i, v){
	    	$("#numInfo_" + v.id).html(v.numStr);
	    });
	}
	
	function showDetailInfo(code, icon, name, deptCode, link){
		showLoading();
		
		var iconPath = contextPath + themePath + "/images/" + icon;
		$("#codeIconId").attr("src", iconPath);
		$("#codeNameId").html(name);
		
		$.each($(".dataUl"), function(i, v){
			var id = $(v).attr("id");
			if(id == ("ul_" + code)){
				$(v).attr("style", "border:1px solid #FF9900;");
			}else{
				$(v).attr("style", "");
			}
		});
		
		var linkUrl = contextPath + "/xqgk/" + link + "?deptCode=";
		changeFrame(linkUrl, deptCode, '${userDeptName}', '${userDeptLevel}', true, true);
	}
	
	function changeFrame(linkUrl, deptCode, deptName, level, isTop, isFromParent){
		var html = "<a href=\"javascript:void(0);\" onclick=\"changeFrame('" + linkUrl + "', '" + deptCode + "', '" + deptName + "', " + level + ", " + isTop + ", true)\">" + deptName + "</a>";
		var idHtml = "id='level_" + level + "'";
		
		if(isTop){//是能查看的最高级别单位，初始化导航
			$("#dhArea").html("");
			$("#dhArea").append("<span " + idHtml + " class='dhClass'>" + html + "</span>");
		}else{//不是能查看的最高级别单位
			if(isFromParent){//不是子页面钻取，根据查看级别重置导航
				$.each($(".dhClass"), function(i, v){
					var dhLevel = $(v).attr("id").split("_")[1];
					if(dhLevel > level ){
						$(v).remove();
					}
				});
			}else{//子页面钻取，添加导航
				$("#dhArea").append("<span " + idHtml + " class='dhClass'> - " + html + "</span>");
			}		
		}
			
		var url = linkUrl + deptCode;
		$("#detailFrame").attr("src", url);
	}
	
	function showLoading(){
		$("#loadingDiv").show();
	}
	
	function hiddenLoading(){
		$("#loadingDiv").hide();
	}	
</script>

</head>

<body>

<!--主内容 开始-->
<div class="main" style="width:1020px;">

<div style="margin-bottom:10px; margin-top:0; background-color:#FFFFFF;">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td>
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="10"><img src="${contextPath}${themePath}/images/title_a.jpg" width="10" height="41" /></td>
                        <td class="main_box01_t">辖区概况</td>
                        <td width="10" align="right"><img src="${contextPath}${themePath}/images/title_c.jpg" width="10" height="41" /></td>
                      </tr>
                  </table>
            </td>
          </tr>
          <tr>
            <td valign="top">
            	<div style="padding:10px;">
               	  	<div style=" padding-bottom:10px; margin-bottom:10px; background-image:url(${contextPath}${themePath}/images/line.jpg); background-repeat:repeat-x; background-position:bottom;">
               	  		<strong>基本信息：</strong>${userDeptName}辖区内共有警务区<span style="color:#F00;">${jwqNum}</span>个，
               	  		民警<span style="color:#F00;">${mjNum}</span>名，
               	  		社区民警<span style="color:#F00;">${sqmjNum}</span>名，
               	  		配备辅警<span style="color:#F00;">${fjNum}</span>名，
               	  		管辖的社区<span style="color:#F00;">${sqNum}</span>个。
               	  		<br/>
               	  		&nbsp;&nbsp;&nbsp;&nbsp;截止至<span style="color:#F00;">${tjDate[0]}</span>年<span style="color:#F00;">${tjDate[1]}</span>月<span style="color:#F00;">${tjDate[2]}</span>日，
               	  		辖区内共有
               	  		<c:if test="${userDeptCode == '430100000000'}">
               	  		实有人口<span style="color:#F00;">${syrk.showNum}</span>人，其中：
               	  		常住人口<span style="color:#F00;">${czrk.showNum}</span>人、
               	  		流动人口<span style="color:#F00;">${ldrk.showNum}</span>人、
               	  		重点人员<span style="color:#F00;">${zdry.showNum}</span>人、
               	  		出租房屋<span style="color:#F00;">${czfw.showNum}</span>间、
               	  		旅店<span style="color:#F00;">${lgcs.showNum}</span>家、
               	  		网吧<span style="color:#F00;">${swfwcs.showNum}</span>家。
               	  		</c:if>
               	  		<c:if test="${userDeptCode != '430100000000'}">
               	  		实有人口<span style="color:#F00;">${syrk.showNum}</span>人（全市排名 <span style="color:#F00;">${syrk.rankNum}/${syrk.rankTotal}</span>），其中：
               	  		常住人口<span style="color:#F00;">${czrk.showNum}</span>人（全市排名 <span style="color:#F00;">${czrk.rankNum}/${czrk.rankTotal}</span>）、
               	  		流动人口<span style="color:#F00;">${ldrk.showNum}</span>人（全市排名 <span style="color:#F00;">${ldrk.rankNum}/${ldrk.rankTotal}</span>）、
               	  		重点人员<span style="color:#F00;">${zdry.showNum}</span>人（全市排名 <span style="color:#F00;">${zdry.rankNum}/${zdry.rankTotal}</span>），
               	  		出租房屋<span style="color:#F00;">${czfw.showNum}</span>间（全市排名 <span style="color:#F00;">${czfw.rankNum}/${czfw.rankTotal}</span>）、
               	  		旅店<span style="color:#F00;">${lgcs.showNum}</span>家（全市排名 <span style="color:#F00;">${lgcs.rankNum}/${lgcs.rankTotal}</span>）、
               	  		网吧<span style="color:#F00;">${swfwcs.showNum}</span>家（全市排名 <span style="color:#F00;">${swfwcs.rankNum}/${swfwcs.rankTotal}</span>）。
               	  		</c:if>
               	 	</div>
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td valign="top">
						   	<div class="xqgk_gnxz" id="showInfoId">
							<!-- 辖区基本信息 -->
								<c:forEach var="dataInfo" items="${dataInfoList}" varStatus="_i">
									<ul class='dataUl' id='ul_${dataInfo.code}' onclick="showDetailInfo('${dataInfo.code}', '${dataInfo.iconName}', '${dataInfo.name}', '${userDeptCode}', '${dataInfo.linkUrl}');">
										<li style='width:80px; text-align:center; float:left;'>
											<a href='javascript:void(0);'>
												<img src='${contextPath}${themePath}/images/${dataInfo.iconName}' width='60' height='60'/>
											</a>	
										</li>
										<li>
											<a href='javascript:void(0);'>
												<strong>${dataInfo.name}</strong>
											</a>
										</li>
										<li>
											<c:forEach var="numInfo" items="${dataInfo.list}" varStatus="_x">
											  <c:if test="${numInfo.inLine == 1}">
											  	<br/>
											  </c:if>											
												${numInfo.typeName}：
												<span style='color:#FF0000; font-weight:bold;' id="numInfo_${numInfo.id}">
													<img src='${contextPath}${themePath}/images/panel_loading.gif'/>
												</span>&nbsp;${numInfo.unit}&nbsp;
											</c:forEach>
												<script type="text/javascript">
													dealQueryInfo('${dataInfo.code}');
												</script>											
										</li>
									</ul>
								</c:forEach>
                           	</div>
                           	<div class='clear'></div>             
                          <div style="padding:0 10px 10px 10px; background-image:url(${contextPath}${themePath}/images/gzpt_01.jpg); background-repeat:repeat-x; background-position:top;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="100" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td height="20" align="center" valign="top"><img src="${contextPath}${themePath}/images/gzpt_02.jpg" width="20" height="15" /></td>
                                    </tr>
                                    <tr>
                                      <td align="center"><img id="codeIconId" src="" width="60" height="60" /></td>
                                    </tr>
                                    <tr>
                                      <td height="30" align="center" class="f_hui" id="codeNameId"></td>
                                    </tr>
                                </table>
                               </td>
                               <td valign="top">
                               	  <div style=" background-image:url(${contextPath}${themePath}/images/gzpt_01.jpg); background-repeat:repeat-x; background-position:top; height: 20px;"></div>
                               	  <div id="loadingDiv" style="display: none; position:absolute; left:40%; top:70%;"><img src='${contextPath}${themePath}/images/loading_32.gif'/></div>
                               	  <!-- 机构导航 -->
                               	  <div id="dhArea"></div>
                                  <iframe id="detailFrame" src="" style="vertical-align: top;" width="100%" frameborder="0" scrolling="no" onload="this.height=this.contentWindow.document.documentElement.scrollHeight;"></iframe>
                               </td>
                              </tr>
                            </table>
                           </div>
                          </td>
                          <c:forEach var="dataInfo" items="${dataInfoList}" varStatus="_i">
							  <c:if test="${_i.index == 0}">
				  				<script type="text/javascript">
									showDetailInfo('${dataInfo.code}', '${dataInfo.iconName}', '${dataInfo.name}', '${userDeptCode}', '${dataInfo.linkUrl}');
								</script>
							  </c:if>                          
                          </c:forEach>
                         
                        <td width="10" style="border-left:1px solid #e4e4e4;">&nbsp;</td>
                        <td width="30%" valign="top">
                          <div class="t_box02">本月待处理</div>
                          <div class="newlist">
                          	<ul>
                          		<li>取保候审人员 <span style="color:#FF0000">${qbhsNum}</span> 人</li>
                                <li>监视居住人员 <span style="color:#FF0000">${jsjzNum}</span> 人</li>
								<li>社区戒毒人员 <span style="color:#FF0000">${sqjdNum}</span> 人</li>
                                <li>社区康复人员 <span style="color:#FF0000">${sqkfNum}</span> 人</li>
                            </ul>
                          </div>
                       	  <div class="t_box02">
                       	  	<div style="float:right;">
                       	  		<a class="l_red" href="javascript:void(0);" onclick="showMap();" style="font-weight:normal;text-decoration:underline;">地图展示</a>
                       	  	  <c:if test="${ajNum > 5}">
                          		<a class="l_red" href="javascript:void(0);" onclick="showMore();" style="font-weight:normal;text-decoration:underline;">更多>></a>
                          	  </c:if>
                       	  	</div>
                       	  	7日内辖区发案情况
                       	  </div>
                          <div class="newlist">
                          	<c:if test="${empty ajInfoList}">
                          		<table><tr><td>暂无发案情况</td></tr></table>
                          	</c:if>
                          	<c:if test="${not empty ajInfoList}">
 							<ul>
	                 	 		<c:forEach var="ajInfo" items="${ajInfoList}" varStatus="_i">
	                 	 			<li style="border-bottom: 1px solid #E3E3E3;">
	                 	 				${ajInfo.JJSJ}，${ajInfo.FADXZ}发生一起${ajInfo.AJLBMC}。
	                 	 		  		<a class="l_red" href="javascript:void(0);" onclick="showDetailOfAj('${ajInfo.AJBH}');" style="text-decoration:underline;">详情>></a>
	                 	 		  		<a class="l_red" href="javascript:void(0);" onclick="showMapOfAj('${ajInfo.AJBH}');" style="text-decoration:underline;">地图>></a>
	                 	 		  	</li>
	                 	 		</c:forEach>    	
                            </ul>                         	
                          	</c:if>
                          </div>
						  <div class="t_box02">
                       	  	<div style="float:right;">
                       	  	<!-- 
                       	  		 <c:if test="${ajNum > 5}">
                          			 <a class="l_red" href="javascript:void(0);" onclick="showMoreGj();" style="font-weight:normal;text-decoration:underline;">更多>></a>
                          	  	 </c:if>
                       	  	 -->
                          	  <a class="l_red" href="javascript:void(0);" onclick="showMoreGj();" style="font-weight:normal;text-decoration:underline;">更多>></a>
                       	  	</div>
                       	  	当月重点人员轨迹
                       	  </div>
                          <div class="newlist">
                          	<c:if test="${empty gjInfoList}">
                          		<table width="98%"><tr><td style="text-align: center;">暂无重点人员轨迹</td></tr></table>
                          	</c:if>
                          	<c:if test="${not empty gjInfoList}">
 							<ul>
	                 	 		<c:forEach var="gjInfo" items="${gjInfoList}" varStatus="_i">
	                 	 			<li style="border-bottom: 1px solid #E3E3E3;">
	                 	 				${gjInfo.REMARK}
	                 	 				<a class="l_red" href="javascript:void(0);" onclick="openGjDetail('${gjInfo.RYCODE}');" style="text-decoration:underline;">人员详情</a>
	                 	 		  	</li>
	                 	 		</c:forEach>    	
                            </ul>                         	
                          	</c:if>
                          </div>                          
                        </td>
                      </tr>
                    </table>
                </div>
            </td>
          </tr>
          <tr>
            <td height="10">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            	  <tr>
            	    <td width="10"><img src="${contextPath}${themePath}/images/box_b01.jpg" width="10" height="10" /></td>
            	    <td width="1000" class="box_b02"></td>
            	    <td width="10" align="right"><img src="${contextPath}${themePath}/images/box_b03.jpg" width="10" height="10" /></td>
          	    </tr>
       	    </table>
            </td>
          </tr>
        </table>
    </div>	
</div>
<!--主内容 结束-->

<script type="text/javascript">
	function showMore(){
		var url = contextPath + "/xqgk/getLatestAJInfo.action";
		//openModalDialog(url, 600, 400, null, "no");
		window.open(url, "blank");
	}
	
	function showMap(){
		var url = "http://10.143.1.202:8080/WLZFBA/pgisFX.jsp?jgcode=${userDeptCode}"
		//var url = "http://10.143.5.48/ajjxh/app/outer/tjfxMap.jsp?unitCode=${userDeptCode}";
		window.open(url);
	}
		
	function showDetailOfAj(ajbh){
		var url = "http://10.143.1.200/csjz/jsp/gzpt/asjDetail.jsp?ajbh=" + ajbh;
		//var url = "http://10.143.5.48/ajjxh/app/outer/ajxq.jsp?ajbh=" + ajbh;
		window.open(url);
	}
	
	function showMapOfAj(ajbh){
		var url = "http://10.143.1.202:8080/WLZFBA/pgisFX.jsp?ajbh=" + ajbh;
		//var url = "http://10.143.5.48/ajjxh/app/outer/ajxqMap.jsp?ajbh=" + ajbh;
		window.open(url);
	}
	
	function showRyDetail(sfzh){
		var code = '${userCode}';
		//var url = "http://10.142.56.122:9988/newDzda/login/check_externalSystemLogin.action?user_name=" + code + "&sfzh=" + sfzh;
		//var url = "https://10.143.1.134:9443/eledoc/pki.faces?method=getBussinessInfo&id=" + sfzh;
		var url = "http://10.143.1.134/dtgk/opeval/opevalMain.faces?idCard=" + sfzh + "&userid=${loginInfo.sfzh}";
		window.open(url, "blank");
	}
	
	function showMoreGj(){
		var url = "http://10.143.1.200/csjz/gzxx/queryGzgj.action";
		//var url = contextPath + "/xqgk/getLatestGJInfo.action";
		//openModalDialog(url, 800, 600, null, "no");
		window.open(url, "blank");
	}	
	
	function openGjDetail(sfzh){
		var code = '${userCode}';
		//var url = "http://10.142.56.122:9988/newDzda/login/check_externalSystemLogin.action?user_name=" + code + "&sfzh=" + sfzh;
		//var url = "https://10.143.1.134:9443/eledoc/pki.faces?method=getBussinessInfo&id=" + sfzh;
		var url = "http://10.143.1.134/dtgk/opeval/opevalMain.faces?idCard=" + sfzh + "&userid=${loginInfo.sfzh}";
		window.open(url);
	}	
</script>
</body>
</html>
