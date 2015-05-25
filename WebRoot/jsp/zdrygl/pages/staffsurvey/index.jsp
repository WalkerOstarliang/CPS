<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="社区警务-重点人员管理">
	<script type="text/javascript">
	var demoIframe;
	$(function(){
		$("#left_menu").accordion();
		loadKcryTree();
	});
	
	function loadKcryTree(){
		var zNodes =[
			{id:1, pId:0, name:"基础信息", open:true},
			{id:101, pId:1, name:"基本信息", file:"toStaffsurveyJbxxPage"},
			{id:102, pId:1, name:"照片信息", file:"toStaffsurveyZpxxPage"},
			{id:2, pId:0, name:"动态信息", open:true},
			{id:201, pId:2, name:"工作信息", file:"toStaffsurveyGzxxPage"},
			{id:202, pId:2, name:"违法经历", file:"toStaffsurveyWfjlPage"},
			{id:203, pId:2, name:"现实表现", file:"toStaffsurveyXsbxPage"},
			{id:204, pId:2, name:"体貌特征", file:"toStaffsurveyTmtzPage"},
			{id:205, pId:2, name:"社会关系", file:"toStaffsurveyShgxPage"},
			{id:206, pId:2, name:"经济情况", file:"toStaffsurveyJjqkPage"},
			{id:207, pId:2, name:"联络方式", file:"toStaffsurveyLlfsPage"}
		];
		var kcryTree = $("#kcryTree");
		kcryTree = $.fn.zTree.init(kcryTree, setting, zNodes);
		demoIframe = $("#rykcIframe");
		demoIframe.bind("load", loadReady);
		var zTree = $.fn.zTree.getZTreeObj("kcryTree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));
	}
	
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					demoIframe.attr("src",contextPath+"/zdry/staffsurvey_toStaffsurveyPage.action?modth=" + treeNode.file + "&sfzh=${personnel.sfzh }&t=" + (new Date()));
					return true;
				}
			}
		}
	};
	
	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
		htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
		maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
		h = demoIframe.height() >= maxH ? minH:maxH ;
		if (h < 530) h = 530;
		demoIframe.height(h);
	}
	
</script>
	<TABLE border=1 height=600px align=left>
		<tr>
			<TD width=131px align=left valign=top
				style="BORDER-RIGHT: #999999 1px dashed">
				<img src="${contextPath}/jsp/zdrygl/images/sqjw_04.gif"
									width="101" height="141" />			
				<!-- 
					<img
					src="<c:url value='/cps/common/showPoto.action?sfzh=433101199310186521'/> "
					width="101" height="141" />
							
				 -->
				<ul id="kcryTree" class="ztree"
					style="width: 130px; overflow: auto;"></ul>
			</TD>
			<TD rowspan="2" width=900px align=left valign=top>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="box_title">
					<tr>
						<td width="23">
							<img src="${contextPath}/template/cps/images/img_title.jpg"
								width="23" height="28" />
						</td>
						<td>
							人员基本信息
						</td>
					</tr>
				</table>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">${personnel.xm }</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">性别：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">${personnel.xbmc }</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">人员类别：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">${personnel.rylxmc }</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">身份证号：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%"  colspan="5">${personnel.sfzh }</cps:tdContent>
					</cps:row>
				</cps:table>
				<div class="clearDiv"></div>
				<IFRAME ID="rykcIframe" Name="rykcIframe" FRAMEBORDER=0
					SCROLLING=AUTO width=100% height=600px
					SRC="${contextPath}/zdry/staffsurvey_toStaffsurveyPage.action?modth=toStaffsurveyJbxxPage&sfzh=${personnel.sfzh }"></IFRAME>
			</TD>
		</tr>
	</TABLE>
</creator:view>