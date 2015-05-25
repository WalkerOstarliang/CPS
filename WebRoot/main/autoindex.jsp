<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view title="湖南省社区警务信息综合管理平台">
	<link href="<c:url value='/main/css/index.css'/>" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	var index = null;
	function redirectPage(aobj,modename,menuid)
	{
		if (modename == 'index')                                                                                                                                                                                                                                                                                                                                                                            
		{
			$("#menudiv").find("a").removeClass("ahover").css("color","white");
			$(aobj).addClass("ahover").css("color","black");
			$("#otherscontentdiv").hide();
			$("#contentdiv").show();
		}
		else if (modename == "khkp")
		{
			$("#otherscontentiframe").attr("src","<c:url value='/cs/toCsPage.action'/>?modename=" + modename)
			$("#otherscontentdiv").show();
		}
		else if (modename == "xxfb")
		{
			var url = contextPath + "/yjcj/toXxfbPage.action";
			window.open(url);
		}
		else if (modename != 'yjcj')
		{
			$("#menudiv").find("a").removeClass("ahover").css("color","white");
			$(aobj).addClass("ahover").css("color","black");
			$("#contentdiv").hide();
			$("#otherscontentiframe").attr("src","<c:url value='/cs/toCsPage.action'/>?modename=" + modename)
			$("#otherscontentdiv").show();
		}
		else if (modename == 'yjcj')
		{
			var url = contextPath + "/yjcj/toYjcjIndexPage.action";
			window.open(url);
		}
	}
	
	function openMenuPage(aobj,path,menuid,target)
	{
		if (target == "_blank")
		{
			if (path.indexOf("http") >= 0)
			{
				window.open(path);
			}
			else
			{
				window.open(contextPath + path);
			}
			
		}
		else if (target == "_self")
		{
			$("#menudiv").find("a").removeClass("ahover").css("color","white");
			$(aobj).addClass("ahover").css("color","black");
			$("#contentdiv").hide();
			$("#otherscontentiframe").attr("src",contextPath + path + "?menuid=" + menuid)
			$("#otherscontentdiv").show();
		}
	}
	
	function openAddSiteMenuWin()
	{
		var url = "<c:url value='/menu/toAddSitePage.action'/>";
		index = $.layer({
		    type : 2,
		    move : false,
		    title : "管理外部系统网站",
		    iframe : {src : url},
		    area : ['900px' , '650px'],
		    offset : ['5px','']
		});
	}
	
	
	function zipFieldDown(filePath, fileName)
	{
		window.location.href = "<c:url value='/download.action'/>?filePath=" + encodeURIComponent(filePath) + "&fileName=" + fileName;
	}
	
	function clickSpanXqgl(xqglid)
	{
		if ("xqqk" == xqglid)
		{
			$("#xqqkiframe").show();
			$("#xqzaiframe").hide();
			$("#xqza").find("a").removeClass("menu_a").addClass("menu_b");
			$("#xqqk").find("a").removeClass("menu_b").addClass("menu_a");
		}
		else
		{
			$("#xqzaiframe").show();
			$("#xqqkiframe").hide();
			$("#xqqk").find("a").removeClass("menu_a").addClass("menu_b");
			$("#xqza").find("a").removeClass("menu_b").addClass("menu_a");
		}
	}
	
	function changeCmsChnl1(linkobj,channelId, orgleve,panelid,frmCmsChn) 
	{
		$("#" + panelid).find("a").css("color", "#333");
		$(linkobj).css("color", "#F00");
		var url = "<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId="+channelId +"&orgLeve="+orgleve + "&t=" + new Date().getTime();
		$("#" + frmCmsChn).attr("src", url);
	}
	
	function changeCmschanelNew(linkobj,channelId, orgleve,panelid,frmCmsChn) 
	{ 
		$("#" + panelid).find("a").css("color", "#333");
		$(linkobj).css("color", "#F00");
		var url = "<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId="+channelId + "&t=" + new Date().getTime();
		$("#" + frmCmsChn).attr("src", url);
	}
	
	function openUpdatePasswordWin()
	{
		var url = contextPath + "/toUpdatePasswordPage.action";
		index = $.layer({
		    type : 2,
		    move : false,
		    title : "用户密码更新",
		    iframe : {src : url},
		    area : ['450px' , '250px'],
		    offset : ['5px','']
		});
	}
	
	function closeLayerWin()
	{
		layer.close(index);
	}
	
	function logout()
	{
		$.ajax({
			url : contextPath + "/logout.action",
			success : function(result)
			{
				document.location.href = "http://${cas.href}/logout?service=http://${CPS.href}/index.action";
			}
		})
		
	}
	
	function openMoreAjList()
	{
		$.openWindow({
			url : contextPath + "/schedule/toAjjbxxListPage.action",
			width:900,
			height:600
		})
	}
	
	$(function(){
		$.openWindow({
			url:contextPath + "/yjcj/toSmPage.action",
			width:"1000px",
			height:"600px"
		});
		/**
		var leve = "${loginInfo.leve}";
		var rootParentDm = "${loginInfo.pcsdm}";
		if (leve == "4" || leve=="5")
		{
			$.openWindow({
				url:contextPath + "/gzgl/gzjwsgl/toPcsPageInfo.action",
				width:"1000",
				height:"700",
				data : {
					"pcsBean.orgcode" : "${loginInfo.orgcode}",
					"ispcs" : leve == "4"?"1" : "0",
					"rootParentDm" : rootParentDm
				}
			});
		}
		*/
	});
	
	</script>
	<center>
		<div class="body_bg02" style="width:80%;">
			<div class="warp">
		    	<!--页头导航 开始-->
		        <div style="width:100%; height:68px;padding: 0px">
		        	<div class="top_menu03">
						<img src="<c:url value='/main/images/menu_bg03.jpg'/>" width="10" height="36" />
					</div>
		       		<div class="top_menu01">
		       			<img src="<c:url value='/main/images/menu_bg01.jpg'/>" width="10" height="36" />
		       		</div>
			        <div id="menudiv" class="top_menu02">
			         	<a id="index" href="javascript:void(0)" onclick="redirectPage(this,'index','')" class="menu_link ahover" style="color: black" target="_parent">首页</a>
			         	<c:forEach items="${menubeans}" var="bean">
			         		<a id="menu_${bean.functionid }" href="javascript:void(0)" onclick="openMenuPage(this,'${bean.path}','${bean.functionid }','${bean.target}')" class="menu_link">${bean.name}</a>
			         	</c:forEach>
			         	<%-- 
			         	<a id="pcsgl" href="javascript:void(0)" onclick="redirectPage(this,'tjfx','')" class="menu_link">统计分析</a>
			         	<a id="pcsgl" href="javascript:void(0)" onclick="redirectPage(this,'nbgl','')" class="menu_link">内保管理</a>
			         	--%>
			         </div>
			         <div class="t_box">
			         	<div style="width: 50%; float:left;">
			         	<span title="${loginInfo.orgname }">欢迎您，<font color="red">${fn:substring(loginInfo.orgname,0,16)}.</font>&nbsp;<span onclick="openUpdatePasswordWin()" class="cps_span_href">${loginInfo.realname}</span>&nbsp;警官！</span>
				        <span id="time"></span>  
			         	<script type="text/javascript">
				     		var oldDate = new Date(2011,4,23,0,0,0);
				     		var nowDate = new Date();var week = "日,一,二,三,四,五,六".split(',');
				     		var str = nowDate.getFullYear()+"年"+(nowDate.getMonth() + 1)+"月"+nowDate.getDate()+"日 星期"+week[nowDate.getDay()];
				     		document.getElementById('time').innerHTML=str;
			     		</script>
			     		</div>
			         	<div style="float:right;width: 50%; text-align: right;">
			         		<%-- 
			         		<a id="khkp" href="javascript:void(0)" onclick="redirectPage(this,'khkp','')"><font color="green">考核统计</font></a> |
			         		--%>
			         		<a href="http://10.142.56.157:8081/upload/forward.php?username=${loginInfo.username}" target="_blank"><font color="green">论坛</font></a> |
			         		<c:if test="${loginInfo.orgcode == '430000030000'}">
			         			<a href="javascript:void(0)" onclick="redirectPage(this,'xxfb','')"><font color="green">消息发布</font></a> |
			         		</c:if>
			         		<a href="http://${cms.href}/" target="_blank"><font color="green">内容发布</font></a> |
			         		<a href="javascript:void(0)" onclick="redirectPage(this,'yjcj','')"><font color="green">意见采集</font></a> |
			         		<a href="<c:url value='/download.action'/>?filePath=/down/sqjwczsc.doc&fileName=sqjwczsc.doc" target="_blacnk" style="right:0px;bottom:2px;color:red;cursor:pointer;" >社区警务操作手册下载</a> |
			         		<span onclick="logout()" style="color: red;cursor: pointer;"><font color="red">退出系统</font></span>
			         	</div>
			       	</div>
			      </div>
		      	<div id="otherscontentdiv" style="display:none;">
		      		<iframe id="otherscontentiframe" src="" height="900" frameborder="0" width="100%" scrolling="auto"></iframe>
		     	</div>
		     	<div id="contentdiv" >
			        <!--页头导航 结束-->
			      	<div style="padding:10px">
			        	<!--左边栏 开始-->
			        	<div style="width:79%; float:left;">
			                 <%--辖区情况 --%>
				            <div style="border: 1px solid #CCCCCC;margin-bottom:5px;">
				               <div class="title_box" style="border:1px solid #CCCCCC;border-bottom:0;width:94%;">
				               		<div style="width:24%;float: left">
					               		<div style="float: left">
					               			<span id="xqqk" style="cursor: pointer;" onmouseover="clickSpanXqgl('xqqk')"><a href="javascript:void(0)" class="menu_a">辖区情况</a></span>
					               		</div>
					               		<div  style="float: right;">
					               			<span id="xqza" style="cursor: pointer;" onmouseover="clickSpanXqgl('xqza')"><a href="javascript:void(0)" class="menu_b">辖区治安</a></span>
					               		</div>
				               		</div>
				               </div>
				                <iframe id="xqqkiframe" src="<c:url value='/outsite/toXxcjtjPage.action'/>" height="685" frameborder="0" width="100%" scrolling="auto"></iframe>
				                <iframe id="xqzaiframe" src="<c:url value='/outsite/toXqzatjPage.action'/>" height="685" frameborder="0" width="100%" scrolling="auto" style="display: none;"></iframe>
				            </div>
				         </div>
			            <!--右边栏 开始-->
			        	<div style="width:20%; float:right;">
			        		<%--工作提醒 --%>
			        		<div style="border:1px solid #CCC; margin-bottom:10px;">
			            		<div class="title_box" style="padding-right:0;text-align: left">
			            			工作提醒
			            		</div>
			                	<iframe id="kjrkiframe" src="<c:url value='/schedule/toMyGztxListPage.action'/>" height="200" frameborder="0" width="100%" scrolling="no"></iframe>
			                </div>
			              
			   		 		<div style="border:1px solid #CCC; margin-bottom:10px;">
			            		<div class="title_box" style="padding-right:0;text-align: left">
			            			<a href="javascript:void(0)" onclick="openMoreAjList()" class="more">
			   		  					<font color="red">&nbsp;更多&nbsp;</font>
			   		  				</a>
			            			辖区最近发案情况
			            		</div>
			                	<iframe id="kjrkiframe" src="<c:url value='/schedule/queryXq7tlfaList.action'/>" height="180" frameborder="0" width="100%" scrolling="no"></iframe>
			                </div>
			               
			   		 		<div style="border:1px solid #CCC; margin-bottom:10px;">
			   		  			<div class="title_box" style="padding-right:0;text-align: left">
			   		  				<a href="javascript:void(0)" onclick="openAddSiteMenuWin()" class="more">
			   		  					<font color="red">&nbsp;更多&nbsp;</font>
			   		  				</a>
			   		  				系统导航
			   		  			</div>
			                	<iframe src="<c:url value='/menu/toOutSiteListPage.action'/>" height="220" frameborder="0" width="100%" scrolling="no"></iframe>
			                </div>
			          	</div>
			         </div>
			          <!--左边栏 结束-->
		             <div class="m_b10">
		             	<table width="98%" cellpadding="0" cellspacing="0" border="0">
		             		<tr>
		             			<td width="49%">
		             				<div class="jyjl_box m_b10">
		             				 <div class="title_box" id="tztb">
		             				 	<div style="float:left;">通知通报</div>
							         	<div style="float:right; font-weight:normal;">
							         		<a id="channel_1" href="javascript:void(0)" style="color:#F00; text-decoration:none;font-size: 12px;font-weight: bold" onmouseover="changeCmsChnl1(this,'13','1','tztb','frmCmsChn1');" target="_blank">省级</a>&nbsp;&nbsp;
							         		<a id="channel_2" href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmsChnl1(this,'14','2','tztb','frmCmsChn1');" target="_blank">市级</a>&nbsp;&nbsp;
							         		<a id="channel_3" href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmsChnl1(this,'15','3','tztb','frmCmsChn1');" target="_blank">县级</a>&nbsp;&nbsp;
							         	</div>
							         </div>
				               		 <iframe id="frmCmsChn1" src="<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId=13&orgLeve=1" height="165" frameborder="0" width="100%" scrolling="no"></iframe>
				                   </div>
		             			</td>
		             			<td></td>
		             			<td width="49%">
		             			   <%--工作文件 --%>
				                   <div class="gzwj_box m_b10">
				                   	<div class="title_box" id="gzfw">
				                   		<div style="float:left;">工作文件</div>
							         	<div style="float:right; font-weight:normal;">
							         		<a href="javascript:void(0)" style="color:#F00;font-size: 12px;font-weight: bold; text-decoration:none;" onmouseover="changeCmsChnl1(this,'6','1','gzfw','frmCmsChn2');" target="_blank">省级</a>&nbsp;&nbsp;
							         		<a href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmsChnl1(this,'16','2','gzfw','frmCmsChn2');" target="_blank">市级</a>&nbsp;&nbsp;
							         		<a href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmsChnl1(this,'17','3','gzfw','frmCmsChn2');" target="_blank">县级</a>&nbsp;&nbsp;
							         	</div>
							         </div>
				                   	<iframe id="frmCmsChn2" src="<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId=6&orgLeve=1" height="165" frameborder="0" width="100%" scrolling="no"></iframe>	
				                   </div>
		             			</td>
		             		</tr>
		             		<tr>
		             			<td>
		             				 <div class="jyjl_box">
				                   	 <div class="title_box" id="cmsChnlBtns">
				                   	 	<div style="float:left;">他山之石</div>
							         	<div style="float:right; font-weight:normal;">
							         	</div>
							         </div>
				                   	<iframe src="<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId=9" height="165" frameborder="0" width="100%" scrolling="no"></iframe>	
				                   </div>
		             			</td>
		             			<td></td>
		             			<td>
		             				 <div class="gzwj_box">
					                   	 <div class="title_box" id="cmsChnlBtns">
					                   	 	<div style="float:left;">经验交流</div>
								         	<div style="float:right; font-weight:normal;"></div>
								         </div>
				                   		<iframe src="<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId=5" height="165" frameborder="0" width="100%" scrolling="no"></iframe>	
				                   </div>
		             			</td>
		             		</tr>
		             		
		             		<tr>
		             			<td width="49%">
		             				<div class="jyjl_box m_b10">
		             				 <div class="title_box" id="mjfc">
		             				 	<div style="float:left;">民警风采</div>
							         	<div style="float:right; font-weight:normal;">
							         		<a id="channel_1" href="javascript:void(0)" style="color:#F00; text-decoration:none;font-size: 12px;font-weight: bold" onmouseover="changeCmschanelNew(this,'19','1','mjfc','mjfcfrmCmsChn');" target="_blank">省级</a>&nbsp;&nbsp;
							         		<a id="channel_2" href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmschanelNew(this,'20','2','mjfc','mjfcfrmCmsChn');" target="_blank">市级</a>&nbsp;&nbsp;
							         		<a id="channel_3" href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmschanelNew(this,'21','3','mjfc','mjfcfrmCmsChn');" target="_blank">县级</a>&nbsp;&nbsp;
							         	</div>
							         </div>
				               		 <iframe id="mjfcfrmCmsChn" src="<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId=19" height="165" frameborder="0" width="100%" scrolling="no"></iframe>
				                   </div>
		             			</td>
		             			<td></td>
		             			<td width="49%">
		             			   <%--工作文件 --%>
				                   <div class="gzwj_box m_b10">
				                   	<div class="title_box" id="xxyd">
				                   		<div style="float:left;">学习园地</div>
				                   		<%-- 
							         	<div style="float:right; font-weight:normal;">
							         		<a href="javascript:void(0)" style="color:#F00;font-size: 12px;font-weight: bold; text-decoration:none;" onmouseover="changeCmschanelNew(this,'22','1','xxyd','xxydfrmCmsChn');" target="_blank">省级</a>&nbsp;&nbsp;
							         		<a href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmschanelNew(this,'23','2','xxyd','xxydfrmCmsChn');" target="_blank">市级</a>&nbsp;&nbsp;
							         		<a href="javascript:void(0)" style="color:#333;font-size: 12px;font-weight: bold" onmouseover="changeCmschanelNew(this,'24','3','xxyd','xxydfrmCmsChn');" target="_blank">县级</a>&nbsp;&nbsp;
							         	</div>
							         	--%>
							         </div>
				                   	<iframe id="xxydfrmCmsChn" src="<c:url value='/cms/toCmsDocmentListPage.action'/>?channelId=22" height="165" frameborder="0" width="100%" scrolling="no"></iframe>	
				                   </div>
		             			</td>
		             		</tr>
		             	</table>
			        </div>
			     </div>
			<div>
            <div class="footer">
		      	<div class="footer_a">
		      		<a href="#" class="l_hei">网站纠错</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		      		<a href="#" class="l_hei">网站地图</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		      		<a href="#" class="l_hei">法律顾问</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		      		<a href="#" class="l_hei">联系信箱</a></div>
		   	 	</div>
		   	 	<div class="p10" align="center">
		   	 		 <div>当前在线人数<font color="red">${inlineNum}</font>人</div>
                    <div>版权所有：湖南省公安厅    推荐使用1024*788分辨率浏览</div>
                    <div>技术支持：湖南科创   电话：0731-84597427</div>
                </div>
	       	</div>
		</div>
	</center>
	<DIV id="img1" style="Z-INDEX: 100; right: 0px; WIDTH: 200px;HEIGHT: 110px; POSITION: absolute; TOP: 300px;  visibility: visible;background-color: #CA2A21;">
		<div style="float: right;cursor: pointer;padding-top: 0px" onclick="$('#img1').hide()">&nbsp;关闭&nbsp;</div>
		<div>
			<span>
				<img src="<c:url value='/main/images/yjcj.jpg'/>" width="200px" height="67" onclick="redirectPage(this,'yjcj','')"/>
			 </span>
			<br/>
			<span style="color: white;font-weight: 800;text-align: center;">&nbsp;&nbsp;办公室：(0731-84597427)</span><br/>
		</div>
		<div style="color: red;font-weight: 500;font-size: 20px">
			<span onclick="zipFieldDown('/down/cjwtjjfs.doc', '常见问题解决方式.doc')" style="color: red;font-weight: 600;cursor: pointer;">常见问题解决方式下载</span>
		</div>
		
	</DIV>
	
<script type="text/javascript">
	var winwidth =  $(window).width() - 250;
	var winheight = $(window).height() - 110;
	var index = 0;
	var i = 0;
	var array = [
		{
			left:winwidth/2,
			top:0
		},
		{
			left:winwidth,
			top:winheight/2
		},
		{
			left:winwidth/2,
			top:winheight
		},
		{
			left:0,
			top:winheight/2
		}
	]
	function changePos()
	{
		var left = $("#img1").offset().left;
		var top = $("#img1").offset().top;
		
		$("#img1").animate(array[index],10000,null,function(){
			if (index == 3)
			{
				index = 0;
			}
			else
			{
				index += 1;
			}
			changePos();
		});
	 }
</script>
</creator:view>