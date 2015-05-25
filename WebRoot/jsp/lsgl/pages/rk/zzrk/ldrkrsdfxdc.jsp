<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:box>
	<script type="text/javascript">
		/*查询*/
		function queryList(){
			$("#queryForm").attr("action",contextPath + "/lsgl/jzzxx/toExportLdrkRsqfx.action");
			$("#queryForm").attr("method","post");
			$("#queryForm").attr("target","_self");
			
			$("#operType").val("query");
			
			layer.load(0);
			
			$("#queryForm").submit();
		}
		
		/*下钻*/
		function down(parentCode){
			$("#orgLeve").val(parseInt(eval($("#orgLeve").val()) + 1));
			$("#parentCode").val(parentCode);
			
			queryList();
		}
		
		/*返回*/
		function up(){
			var orgLeve = eval(parseInt($("#orgLeve").val()) - 1);
			$("#orgLeve").val(orgLeve);
			var parentCode = $("#parentCode").val();
			
			if(orgLeve == 4){
				parentCode = parentCode.substr(0,6) + '000000';
			}else if(orgLeve == 3){
				parentCode = parentCode.substr(0,4) + '00000000';
			}else if(orgLeve == 2){
				parentCode = parentCode.substr(0,2) + '0000000000';
			}
			
			$("#parentCode").val(parentCode);
			queryList();
		}
		
		/*
		 *	导出Excel
		 */
		function exportLdrkzhxls(){
			$("#queryForm").attr("action",contextPath + "/lsgl/jzzxx/toExportLdrkRsqTj.action");
			$("#queryForm").attr("method","post");
			$("#queryForm").attr("target","exportiframe");
			
			$("#queryForm").submit();
		}
		
		//表单重置
		function resetForm(){
			$("#parentCode").val("");
			$("#orgLeve").val("");
			$("#djsj_start").val("");
			$("#djsj_end").val("");
		}
	</script>
	<form id="queryForm" method="post">
		<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryList()"></cps:button>
			<cps:button value="重置" onclick="resetForm()"></cps:button>
			<cps:button value="导出" onclick="exportLdrkzhxls()"></cps:button>
		</cps:tbar>
		<cps:panel id="fwquerypanel" title="流口入室盗查询" >
				<input type="hidden" id="operType" name="operType" value="select" />
				<input type="hidden" id="orgLeve" name="queryBean.orgLeve" value="${queryBean.orgLeve}"/>
				<input type="hidden" name="queryBean.isPage" value="0" />
				<input type="hidden" id="parentCode" name="queryBean.parentCode" value="${queryBean.parentCode}" />
				<cps:table id="querytable">
					<cps:row>
						<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" name="queryBean.djsj_start" value="${queryBean.djsj_start}" dateFmt="yyyy-MM-dd" cssStyle="width:40%" maxDate="${currentSysdateDate}" maxDateDepend="djsj_end"></cps:date>
							至&nbsp;<cps:date id="djsj_end" name="queryBean.djsj_end" value="${queryBean.djsj_end}" minDateDepend="djsj_start"  dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
	<cps:table>
		<cps:row>
			<cps:tdLabel colspan="14" cssStyle="text-align:left">
				<span style="float:left"><h3>流口入室盗查询列表</h3></span>
					<c:if test="${queryBean.orgLeve > 2}">
						<span style="float:right"><a href="javascript:up();"><font color="red">返回&nbsp;</font></a></span>
					</c:if>
			</cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center">序号</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">单位</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">总数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">安徽枞阳</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">江西宜春</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">湖北监利</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">湖北石首</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">衡阳耒阳</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">张家界桑植</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">益阳安化</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">怀化麻阳</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">湘西保靖</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">湘西永顺</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">贵州沿河</cps:tdLabel>
		</cps:row>
		<c:forEach items="${rsdfxList}" var="rsdfx" varStatus="s">
			<cps:row>
				<cps:tdContent>${s.index + 1}</cps:tdContent>
				<cps:tdContent>
				<c:choose>
					<c:when test="${queryBean.orgLeve < 5}">
						<span class="cps_span_href" style="color:green;cursor:hand;" 
								onclick="down('${rsdfx.orgcode}')">
									${rsdfx.orgname}
						</span>
					</c:when>
					<c:otherwise>
						${rsdfx.orgname}
					</c:otherwise>
				</c:choose>
				</cps:tdContent>
				<cps:tdContent>${rsdfx.zs}</cps:tdContent>
				<cps:tdContent>${rsdfx.s340823}</cps:tdContent>
				<cps:tdContent>${rsdfx.s360900}</cps:tdContent>
				<cps:tdContent>${rsdfx.s421023}</cps:tdContent>
				<cps:tdContent>${rsdfx.s421081}</cps:tdContent>
				<cps:tdContent>${rsdfx.s430481}</cps:tdContent>
				<cps:tdContent>${rsdfx.s430822}</cps:tdContent>
				<cps:tdContent>${rsdfx.s430923}</cps:tdContent>
				<cps:tdContent>${rsdfx.s431226}</cps:tdContent>
				<cps:tdContent>${rsdfx.s433125}</cps:tdContent>
				<cps:tdContent>${rsdfx.s433127}</cps:tdContent>
				<cps:tdContent>${rsdfx.s522228}</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
	
	</creator:box>
	<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
</creator:view>