<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	pageContext.setAttribute("basePath", basePath);
%>
<creator:view>
	<creator:Style href="/jsp/PGIS/css/style.css"></creator:Style>
	<creator:Script src="/jsp/PGIS/js/giscommon.js"></creator:Script>
	<creator:box>
		<div style="background: url(${basePath}/jsp/PGIS/images/img_12.gif) repeat-x left top; height: 80px; border-bottom: 1px solid #b9bec9;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin: 0 auto;">
				<tr>
					<td width="480">
						<img src="${basePath}/jsp/PGIS/images/img.gif" width="480" height="80" />
					</td>
					<td valign="bottom">
						
						<cps:table width="100%">
							<cps:row>
								<cps:tdLabel width="7%">市局：</cps:tdLabel>
								<cps:tdContent width="17%">
									<c:choose>
										<c:when test="${empty loginInfo.citygajgdm}">
											<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
										</c:when>
										<c:otherwise>
											<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
											<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
										</c:otherwise>
									</c:choose>
								</cps:tdContent>
								<cps:tdLabel  width="7%">县区局：</cps:tdLabel>
								<cps:tdContent  width="17%">
								<c:choose>
									<c:when test="${empty loginInfo.countrygajgdm}">
										<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
										<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
									</c:otherwise>
									</c:choose>
								</cps:tdContent>
								<cps:tdLabel  width="7%">派出所：</cps:tdLabel>
								<cps:tdContent width="17%">
									<c:choose>
										<c:when test="${empty loginInfo.pcsdm}">
												<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
										</c:when>
										<c:otherwise>
												<s:hidden name="queryBean.pcsdm"></s:hidden>
												<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
										</c:otherwise>
									</c:choose>
								</cps:tdContent>
								<cps:tdLabel width="7%">警务区：</cps:tdLabel>
								<cps:tdContent width="17%">
									<c:choose>
										<c:when test="${empty loginInfo.jwsqdm}">
											<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="showMapService(this.value)"></s:select>
										</c:when>
										<c:otherwise>
											<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
											<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc"  cssClass="cps-select"  disabled="true"></s:select>
										</c:otherwise>
									</c:choose>
								</cps:tdContent>
								<cps:tdContent>
									<cps:button value="新增实体" onclick="bzjwdMap()" display="${displayAddBtn}"></cps:button>
								</cps:tdContent>
							</cps:row>
						</cps:table>
					</td>
				</tr>
			</table>
		</div>
		<div style="width: 100%; overflow-x: hidden;">
			<table id="paneltable" width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td id="listTd" width="280" valign="top" style="border-right: 1px solid #e1e4e9; display: ;">
						<div  class="div_box03">
							<div id="allleftpanel"
								style="margin: 0 5px; background: url(${basePath}/jsp/PGIS/images/img_04.gif) repeat-x left bottom;">
								<form id="queryForm" action="<c:url value='/pgis/queryStxx.action'/>" method="post">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="30" height="30" align="center">
												<img src="${basePath}/jsp/PGIS/images/img_03.gif" width="21" height="22" />
											</td>
											<td>
												<div class="div_box02">
													<input type="text" name="stxxQuery.stmc" id="txtStmc" class="div_input" value="请输入实体名称" style="color: #CCCCCC" onfocus="this.value='';$(this).css('color','');" onblur="if(this.value==null || this.value=='') {this.value='请输入实体名称';$(this).css('color','#CCCCCC')}"/>
												</div>
											</td>
											<td style="padding-top: 3px">
												<a href="#" id="btnQuery" onclick="queryStxx();">
													<img src="${basePath}/jsp/PGIS/images/img_06.gif" width="63" height="22" />
												</a>
											</td>
										</tr>
									</table>
									<input id="hidPage" type=hidden name="stxxQuery.page" value="1" />
								</form>
							</div>
							<div id="leftpanel" style="height: 470px; overflow: auto; overflow-x: hidden;border: 0px solid red;">
								<div id="stxxListDiv">
								</div>
								<div class="div_box07">
									<input type="submit" id="btnNextPage" value="加载更多"
										onclick="queryNextPage();" style="display: none;"
										class="div_an" />
								</div>
							</div>
						</div>
					</td>
					<td width="8" id="btnslide" style="border-right: 1px solid #e1e4e9; background-color: #ededed; cursor: pointer;">
						<span style="font-weight: bold;">&lt; </span>
					</td>
					<td>
						<div>
							<iframe id="centeriframe" name="centeriframe" height="470" src="${mapServicesUrl}?sqdm=${loginInfo.pgis_sqdm}&jzdm=${loginInfo.jzdm}" scrolling="auto" width="100%" frameborder="0"></iframe>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</creator:box>
</creator:view>

<script type="text/javascript">
function showMapService(jwqdm)
{
	$.ajax({
		type : "post",
		url : contextPath + "/pgis/queryPgisSqdm.action?queryBean.jwsqdm=" + jwqdm,
		dataType : "json",
		success : function(result)
		{
			document.getElementById("centeriframe").contentWindow.reloadSqObject(result)
		}
	})
	
}

$(function() {
	$.maxWindow();
	$("#txtStmc").keypress(function(event) {
		if (event.keyCode == 13) {
			queryStxx();
			return false;
		}
	});
	$("#txtStmc").focus();
	
	$("#btnslide").toggle(function(){
		$("#listTd").hide(100);
		$(this).find("span").html("&gt;");		
	},function(){
		$("#listTd").show(100);	
		$(this).find("span").html("&lt;");	
		
	});
	var docheight = $(document).height();

	$("#paneltable").height(docheight - 95);
	$("#centeriframe").height(docheight - 95);
	$("#leftpanel").height(docheight - 140);
});

 

function queryStxx() {

	if ($.trim($("#txtStmc").val()) == "") {
		alert("请输入名称关键字");
		$("#txtStmc").focus();
		return;
	}
	$("#hidPage").val(1);
	$("#btnNextPage").hide();
	showMsg("正在查询，请稍候...")
	$(document.body).focus();
	$("#queryForm").ajaxSubmit({
		success : function(ret) {
			if (ret == "" || ret == "[]") 
			{
				showMsg("未查询到结果");
			} 
			else 
			{
				$("#stxxListDiv").empty();
				eval("var arr = " + ret);
				appendStxx(arr);
			}
		},
		error : function(ret) {
			showMsg("提交失败")
		}
	});
	return false;
}


function showMsg(msg){
	var span = "<div style='margin-top:10px;font-size:14px;text-align:center;color:#5d5d5d;'>" + msg + "</div>" 
	$("#stxxListDiv").html(span);
}
 
function queryNextPage() {

	var page = $("#hidPage").val();
	$("#hidPage").val(parseInt(page) + 1);

	$("#queryForm").ajaxSubmit( {
		success : function(ret) {
			if (ret == "" || ret == "[]") {
			} else {
				eval("var arr = " + ret);
				appendStxx(arr);
			}
		}
	});
}

function openFwInfoJgWin(stid,operType)
{
	$.openWindow({
		url : "<%=basePath%>/dzgl/dzxx/toStxxFwJgDetailPage.action",
		height:820,
		width : 1000,
		data : {
			operType : $.isBlank(operType) ? 'detail' : operType,
			"stxxBean.id" : stid
		}
	});
}


function appendStxx(arr) {
	$(arr).each(function() {
		var json = this;
		var html = "<div class='div_box04'>";
		html += "<table><tr valign='top' style='padding-top:5px'>";
		html += "<td ><img src='${contextPath}/jsp/PGIS/images/gispoint.png' width='30' height='30'></td>";
		html += "<td>";
		html += "<div class='div_box05'>";
		html += "<a href='#' onclick=\"showStxxDetail('" + json.id +"','" + json.x +"','" +json.y + "');\">" + json.stmc + "</a>";
		html += "--<a href=\"#\" onclick=\"openFwInfoJgWin('" + json.id +"','detail')\">详情</a>";
		html += "&nbsp;<a href='#' onclick=\"openFwInfoJgWin('" + json.id + "','update');\">修改</a>";
		html += "</div>";
		html += "<div class='div_box06'>" + getAddressText(json) + "</div>";
		html += "</td>";
		html += "</tr>";
		html += "<tr>";
		html +="<td colspan=\"2\" align=\"left\">";
		//html += "<span class=\"pgisbtn\" onclick=\"openStxxclInfoWin('" + json.id +"')\">详情</span>&nbsp;";
		//html += "<span class=\"pgisbtn\">人口登记</span>&nbsp;";
		//html += "<span class=\"pgisbtn\">境外人口</span>&nbsp;";
		//html += "<span class=\"pgisbtn\">单位登记</span>&nbsp;";
		html +="</td>";
		html +="</tr>";
		html +="</table>";
		$("#stxxListDiv").append(html);
	});

	if (arr.length >= 10) {
		$("#btnNextPage").show();

	} else
		$("#btnNextPage").hide();
}

function showStxxDetail(stid,x,y) {
	document.getElementById("centeriframe").contentWindow.localAtCent(stid,x,y,18);
}

function getAddressText(stxx) {
	var text = "";
	if (stxx.xzqhmc)
		text += stxx.xzqhmc.replace("湖南省长沙市", "");
	if (stxx.sqmc)
		text += stxx.sqmc;
	if (stxx.jlxmc)
		text += stxx.jlxmc;
	if (stxx.xqz)
		text += stxx.xqz;
	if (stxx.mph)
		text += stxx.mph;
	if (stxx.ldxz)
		text += stxx.ldxz;
	return text;

}

function openStxxclInfoWin(operType,stid)
{
	$.openWindow({
		name : "updatestxxwin",
		url : contextPath + "/dzgl/dzxx/toStxxDetailPageInfo.action",
		height:680,
		width : 1000,
		data : {
			operType : operType,
			"stxxBean.id" : stid
		}
	});
}

function openAddStxxWin(point)
{
	$.openWindow({
		url : "<%=basePath%>/dzgl/dzxx/toStxxFwJgDetailPage.action",
		height:765,
		width : 1000,
		data : {
			operType : "add",
			"offsetX" : point.x,
			"offsetY" : point.y
		}
	});
	//window.open("<%=basePath%>/dzgl/dzxx/toStxxDetailNoMapPageInfo.action?operType=add&offsetX="+point.x+"&offsetY="+point.y,"新增实体","height=600,width=800,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
}

function openInfoCjWin(stid)
{
	$.openWindow({
		url : "<%=basePath%>/dzgl/dzxx/toStxxFwJgDetailPage.action",
		height:765,
		width : 1000,
		data : {
			operType : "update",
			"stxxBean.id" : stid
		}
	});
	//openInfoCjWinByBasePath("<%=basePath%>",stid)
}

function openUpdateStxxInfoWin(stid)
{
	$.openWindow({
		url : "<%=basePath%>/dzgl/dzxx/toStxxFwJgDetailPage.action",
		height:765,
		width : 1000,
		data : {
			operType : "update",
			"stxxBean.id" : stid
		}
	});
}

function bzjwdMap()
{
	document.getElementById("centeriframe").contentWindow.mapEditMarkPoint();
}
var layerObj;
function finishUpdatePoint(point)
{
	if (point && point != null)
	{
		layerObj=$.layer({
			title : "新增实体信息",
		    type : 2,
		    move : false,
		    iframe : {
		    	src : "<%=basePath%>/dzgl/dzxx/toStxxFwJgDetailPage.action?operType=add&stxxBean.x="+point.x+"&stxxBean.y=" + point.y
		    },
		    area : ['1000px' , '765px'],
			offset : ['2px','']
		});
	}
}
</script>
