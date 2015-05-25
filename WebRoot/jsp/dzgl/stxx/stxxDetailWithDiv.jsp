<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>实体详细信息</title>
</head>
<%@include file="/template/xqgkInclude.inc" %>
<%@taglib prefix="cps" uri="/tags/cps"%>
<script type="text/javascript" src="${contextPath}/jsp/lsgl/js/lsglcollect.js"></script>
<script type="text/javascript" src="${contextPath}/template/default/js/jqplugins.js"></script>
<body style="background: none;">
   <div class="main">
	<table border="0" cellpadding="1" cellspacing="1" width="100%" style="margin-top:5px; margin-bottom: 20px; border: 1px solid #FFCC00;">
		<tr>
			<td width="8%">实体名称：</td>
			<td width="17%">${stxxBean.stmc}</td>
			<td width="8%">实体分类：</td>
			<td width="17%"><cps:select id="stfl" name="stxxBean.stfl" zdlb="ZDY_STFL" disabled="true" value="${stxxBean.stfl}" required="true" headerKey="" headerValue=" "></cps:select></td>
			<td width="8%">建筑结构：</td>
			<td width="17%"><cps:select zdlb="ZDY_JZJG" id="jzjg" name="stxxBean.jzjg" disabled="true" value="${stxxBean.jzjg}" headerKey="" headerValue=" "></cps:select></td>
			<td width="8%">消防等级：</td>
			<td width="17%"><cps:select zdlb="ZAGL_XFDJ" id="xfdj" name="stxxBean.xfdj" disabled="true" value="${stxxBean.xfdj}" headerKey="" headerValue=" "></cps:select></td>
		</tr>
		<tr>
			<td>地上层数：</td>
			<td>${stxxBean.dmcs}</td>
			<td>地下层数：</td>
			<td>${stxxBean.dxcs}</td>
			<td>物业单位：</td>
			<td>${stxxBean.wygldw}</td>
			<td>治保单位：</td>
			<td>${stxxBean.zbdw}</td>
		</tr>
		<tr>
			<td>合并地址：</td>
			<td colspan="7">${stxxBean.dzmc}</td>
		</tr>
	</table>
    <div style="height:32px;">
       	<a id="qwgl_schedId" href="javascript:void(0);" onclick="qwgl_showSched();" class="gzrz_tab_a">房屋</a>
    </div>
    <div class="sqjw_nrbox" style="overflow-y : auto; overflow-x: hidden;width:100%">
		<div style="margin-bottom:10px; margin-top:0;">
	    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	    	  <tr>
	    	  	<td>
	    	  		<form id="searchForm">
	    	  		<table width="100%">
						<tr>
				    	  	<td width="25%" align="center">房间号：<input type="text" name="searchFjh" value=""/></td>
				    	  	<td width="30%" align="center">
				    	  		时间：从 <input name="ssDate" type="text" id="sDateId" size="10" style=" width:105px;"
			                    		 onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm', maxDate:'%y-%M-%d %H:%m'});"/>
			                	到 <input name="seDate" type="text" id="eDateId" size="10" style=" width:105px;"
			                    		 onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm', maxDate:'%y-%M-%d %H:%m'});"/><!-- ,minDate:'#F{$dp.$D(\'sDateId')}', maxDate:'%y-%M-%d %H:%m' -->
				    	  	</td>
				    	  	<td width="25%" align="center">
				    	  		是否有照片： 
				    	  		<input name="hasPic" type="radio" value="-1" checked="checked"/>全部
				    	  		<input name="hasPic" type="radio" value="1"/>有照片
				    	  		<input name="hasPic" type="radio" value="0"/>无照片
				    	  	</td>
				    	  	<td width="10%" align="center">
				    	  		<input class="gzrz_btn" type="button" value="查询" onclick="searchFw();">
				    	  	</td>
				   		</tr>	    	  		
	    	  		</table>
	    	  		</form>
	    	  	</td>
	    	  </tr>	
	          <tr>
	            <td valign="top">
	            <div style="padding:10px 10px 10px 10px;" class="sqjw_fwdetail" id="fwDataList">
				<!-- 房屋信息 -->	 
	            </div>
	            <div id="moreBtn" style="text-align: center; display: none;">
	            	<input type="button" value="更    多" class="btn_w120" style="color:#333;" onclick="showMore();">
	            </div>	            
	            </td>
	          </tr>
	        </table>
		</div>    
    </div>
</div>

<div id="picDiv" style="display: none; width: 500px; position: absolute; left: 20%; top: 5%; z-index: 3;">
	<table width="472" height="511" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="472">
	      <div style="float: right;">
	      	<a href="javascript:void(0);" onclick="closePicDiv();">
	      		<img src="${contextPath}${themePath}/images/win_close.jpg" width="16" height="16" style="float: right;" /> 
	      	</a>
	      </div>
	      <div class=box style="MARGIN-BOTTOM: 8px">
			<div class="boxpadding>
		        <div id=Slide> 
		        	<a id=foclnk href="/" target=_blank>
						<img id="focpic" style="FILTER: RevealTrans(duration=1;ransition=12); VISIBILITY: visible; POSITION: absolute; left:484; top:94" 
							src="${contextPath}/jsp/dzgl/stxx/icon_01.png" width="450" height="335" />
					</a>
		          	<div id="Slide_Thumb">
		          		<!-- 缩略图列表 -->
		            </div>
		        </div>
		    </div>
		  </div>	      
	    </td>
	  </tr>
	</table>
</div>

<script type="text/javascript">
	var contextPath = '${contextPath}';
	var themePath = '${themePath}';
	
	var stid = "${stxxBean.id}";
	$(function(){
		queryFwInfo(stid);
	});
	
	function queryFwInfo(stid){
		var url = contextPath + "/lsgl/fw/queryFwPageResultByStidWithPicNum.action";
		var param = "stxxBean.id=" + stid;
		ajaxSubmit(url, param, showFwInfo);
	}
	
	var curPage = 1;
	function showFwInfo(resData){
		curPage = resData.currentPage;
		var tbList = $("#fwDataList");
		if(!resData.datas){
			return;
		}
		$.each(resData.datas, function(i, v){
			var fwHtml = getFwInfoHtml(v);
	    	tbList.append(fwHtml);
	    });
	    if(curPage < resData.totalPage){
	    	$("#moreBtn").show();
	    }else{
	    	$("#moreBtn").hide();
	    }
	}
	
	function getFwInfoHtml(fw){
		var html = "";
		html += "<ul class='dataUl' style='border:1px solid #FF9900;'>";
		html += "<li class='imageLi' style='text-align:center; float:left;'>";
		if(fw.zps > 0){
			var picUrl = contextPath + "/lsgl/fw/showFwzpImage.action?queryBean.zpid=" + fw.zpid;
			html += "<img class='liImage' src='" + picUrl + "' onclick='showPic(\"" + fw.fwid + "\");'><br/>";
		}else{
			html += "<img class='liImage' src='/CPS/template/default/images/nophoto.jpg'><br/>";
		}
		//图片数量
		if(fw.zps == 0){
			html += "<span>照片：" + fw.zps + "</span>";
		}else{
			html += "<span>照片：<a class='sqjw_link' href='javascript:showPic(\"" + fw.fwid + "\");'>" + fw.zps + "</a></span>";
		}
		
		html += "</li>";
		
		html += "<li>";
		html += "房间：" + fw.dyhmc + fw.fjhmc;
		html += "(<a class='sqjw_link' href='javascript:openFwInfo(\"detail\", \"" + fw.fwid + "\", \"" + fw.sfczw + "\")'>详情</a>)";
		html += "</li>";
		
		var fs = "";
		if(fw.fsdz && fw.fsdz != 'null'){
			fs = fw.fsdz;
		}
		html += "<li>附属地址：" + fs + "</li>";
		var sfcz = "否";
		if(fw.sfczw && fw.sfczw == 1){
			sfcz = "是";
		}
		html += "<li>是否出租房：" + sfcz + "</li>";
		html += "<li>更新时间：" + fw.czsj + "</li>";
		html += "</ul>";
		return html;
	}
	
	function searchFw(){
		var url = contextPath + "/lsgl/fw/queryFwPageResultByStidWithPicNum.action";
		var searchParam = $("#searchForm").serialize();
		var param = "stxxBean.id=" + stid + "&" + searchParam;
		ajaxSubmit(url, param, showSearchRes);
	}
	
	function showSearchRes(resData){
		$("#fwDataList").html("");
		showFwInfo(resData);
	}
	
	function showMore(){
		var url = contextPath + "/lsgl/fw/queryFwPageResultByStidWithPicNum.action";
		var searchParam = $("#searchForm").serialize();
		var param = "stxxBean.id=" + stid + "&pageNum=" + (curPage + 1) + "&" + searchParam;
		ajaxSubmit(url, param, showFwInfo);
	}
	
	function showPic(fwid){
		var url = contextPath + "/lsgl/fw/queryFwzpInfoByFwid.action";
		var param = "fwid=" + fwid;
		ajaxSubmit(url, param, showPicDiv);
	}
	
	var picarry = {};
	var lnkarry = {};
	function showPicDiv(resData){
		var picList = $("#Slide_Thumb");
		picList.html("");
		$.each(resData, function(i, v){
			var picUrl = contextPath + "/lsgl/fw/showFwzpImage.action?queryBean.zpid=" + v.id;
			picarry[i] = picUrl;
			lnkarry[i] = "/";
			if(i == 0){
				$("#focpic").attr("src", picUrl);
			}

			var picHtml = getPicHtml(v, i);
			picList.append(picHtml);
		});
		
		$("#picDiv").show();
	}
	
	function getPicHtml(data, i){
		var html = "";
		html += "<div class='thumb_on' id='tmb" + i + "' onmouseover='setfoc(" + i + ");'>";
		html += "<a href='/' target=_blank>";
		html += "<img src='" + contextPath + "/lsgl/fw/showFwzpImage.action?queryBean.zpid=" + data.id + "' />";
		html += "</a>";
		html += "</div>";
		return html;
	}
	
	function setfoc(id){
		document.getElementById("focpic").src = picarry[id];
		document.getElementById("foclnk").href = lnkarry[id];
		currslid = id;
		
		var tmp = $(".thumb_on");
		$.each(tmp, function(i, v){
			$(v).removeClass("thumb_on").addClass("thumb_off");
		});
		$("#tmb"+id).removeClass("thumb_off").addClass("thumb_on");
		focpic.style.visibility = "hidden";
		focpic.filters[0].Apply();
		if (focpic.style.visibility == "visible") {
			focpic.style.visibility = "hidden";
			focpic.filters.revealTrans.transition=23;
		}
		else {
			focpic.style.visibility = "visible";
			focpic.filters[0].transition=23;
		}
		focpic.filters[0].Play();
	}
	
	function closePicDiv(){
		$("#picDiv").hide();
	}
</script>

</body>
</html>
