<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<creator:importScript></creator:importScript>
	</head>

	<body>
		<DIV style="WIDTH: 100%" id=panel_fwtablegrid class=cps-panel>
			<DIV class=cps-panel-title>
				<DIV style="FLOAT: left; PADDING-TOP: 3px">
					房屋列表信息
				</DIV>
			</DIV>
			<DIV style="WIDTH: 100%" id=fwtablegrid class=cps-panel-content>
				<TABLE id=table_fwtablegrid class=cps-tablegrid border=0 cellSpacing=0 cellPadding=0 width="100%">
					<TBODY>
						<TR id=thead_fwtablegrid>
							<TH width=30 align=middle>
								序号
							</TH>
							<TH class=isCheckbox width=30 align=middle>
								<INPUT id=thead_chk_fwtablegrid value=on type=checkbox>
							</TH>
							<TH id=fwmc_fwtablegrid_head>
								房屋名称
							</TH>
							<TH id=fwhx_fwtablegrid_head>
								户型
							</TH>
							<TH id=fwyt_fwtablegrid_head>
								用途
							</TH>
							<TH id=fwmj_fwtablegrid_head>
								面积
							</TH>
							<TH id=hzxm_fwtablegrid_head>
								户主姓名
							</TH>
							<TH id=hzsfzh_fwtablegrid_head>
								户主身份证号
							</TH>
							<TH id=cqrxm_fwtablegrid_head>
								户主姓名
							</TH>
							<TH id=cqrsfzh_fwtablegrid_head>
								户主身份证号
							</TH>
							<TH id=djrxm_fwtablegrid_head>
								登记人姓名
							</TH>
							<TH id=djdwmc_fwtablegrid_head>
								登记单位
							</TH>
							<TH id=djsj_fwtablegrid_head>
								登记时间
							</TH>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
			<DIV style="WIDTH: 100%" id=pagination_fwtablegrid
				class=cps-pagination>
				<TABLE id=pagination_table_fwtablegrid border=0 cellSpacing=0
					cellPadding=0 width="100%" height="100%">
					<TBODY>
						<TR>
							<TD>
								<SELECT id=pagemodel_select_fwtablegrid>
									<OPTION value=5>
										5
									</OPTION>
									<OPTION selected value=10>
										10
									</OPTION>
									<OPTION value=15>
										15
									</OPTION>
									<OPTION value=20>
										20
									</OPTION>
									<OPTION value=25>
										25
									</OPTION>
									<OPTION value=30>
										30
									</OPTION>
									<OPTION value=40>
										40
									</OPTION>
									<OPTION value=50>
										50
									</OPTION>
									<OPTION value=60>
										60
									</OPTION>
									<OPTION value=70>
										70
									</OPTION>
									<OPTION value=80>
										80
									</OPTION>
									<OPTION value=90>
										90
									</OPTION>
									<OPTION value=100>
										100
									</OPTION>
								</SELECT>
							</TD>
							<TD align=right>
								<DIV id=pageinfo_fwtablegrid>
									共
									<FONT color=red>0</FONT>条记录&nbsp;第
									<FONT color=red>1</FONT>页&nbsp;共
									<FONT color=red>1</FONT>页&nbsp;
									<SPAN class=disabled>首页</SPAN>&nbsp;&nbsp;
									<SPAN class=disabled>上一页</SPAN>&nbsp;&nbsp;
									<SPAN class=disabled>下一页</SPAN>&nbsp;&nbsp;
									<SPAN class=disabled>末页</SPAN>&nbsp;&nbsp;跳转到
									<INPUT style="HEIGHT: 18px" id=gopage_fwtablegrid value=1
										size=3>
									页&nbsp;&nbsp;
								</DIV>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
		</DIV>



		<%-- 
    <cps:tableGrid id="fwtablegrid" title="房屋列表信息"  
				url="/lsgl/fw/queryFwPageResult.action" 
				searchform="queryForm"	
				autoload="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="fwmc" title="房屋名称"></cps:column>
			<cps:column field="fwhx" title="户型"></cps:column>
			<cps:column field="fwyt" title="用途"></cps:column>
			<cps:column field="fwmj" title="面积"></cps:column>
			<cps:column field="hzxm" title="户主姓名"></cps:column>
			<cps:column field="hzsfzh" title="户主身份证号"></cps:column>
			<cps:column field="cqrxm" title="户主姓名"></cps:column>
			<cps:column field="cqrsfzh" title="户主身份证号"></cps:column>
			<cps:column field="djrxm" title="登记人姓名"></cps:column>
			<cps:column field="djdwmc" title="登记单位"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
		</cps:tableGrid>
  
  	<script type="text/javascript">
  		$(function(){
  				$("#aa").text($("body").html() )
  		})
  	</script>
  	<textarea id="aa" rows="50" cols="45" style="width:100%;height: 300px"></textarea>
  	--%>
	</body>
</html>