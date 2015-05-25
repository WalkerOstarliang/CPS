<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/tjbb/js/pcshz.js"></creator:Script>
<creator:Style href="/jsp/tjbb/css/pcstjfx.css"></creator:Style>
<creator:box>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="queryPcshz()"></cps:button>
			<cps:button value="导出汇总表" onclick="dowloadPcshz()"></cps:button>
			<cps:button value="导出表格" onclick="dowloadPcshzList()"></cps:button>
		</cps:tbar>
		<cps:panel title="派出所基本情况年度汇总统计分析表">
			<form id="queryParam">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%"><font color='red'>*</font>统计单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="pcstjQueryBean.orgcode" id="dwdm" />
							<input type="hidden" name="pcstjQueryBean.orgLeve" id="dwleve" />
							<cps:textfield id="dwmc" appendPopuBtn="true" onclick="orgSelect()" required="true" />&nbsp;
							<cps:button value="清除" onclick="clearOrg()"></cps:button>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
				<cps:tableGrid id="pcstablegrid"  
						title="派出所基本汇总列表"
						url="/tjbb/queryPcsjbqkhzPageResult.action" 
						searchform="queryForm"
						autoload="false"
						pageSize="50"
						width="3500">
					<cps:column isNumber="true" title="序号"></cps:column>
					<cps:column field="orgname" title="使用单位名称" ></cps:column>
					<cps:column field="syrs" title="实有数(人)" maxlength="5"></cps:column>
					<cps:column field="xjgajgzjls" title="县级公安机关总警力数" maxlength="5"></cps:column>
					<cps:column field="syjlzxjlbl" title="所警力占县公安总警力比例小于40％的区县局数"></cps:column>
					<cps:column field="cjpxmjs" title="接受过培训的民警数" maxlength="7"></cps:column>
					<cps:column field="pcss" title="派出所数(个)"></cps:column>
					<cps:column field="cqhjs" title="城区户籍所数(个)"></cps:column>
					<cps:column field="cqs" title="20人及以上的城区派出所数(个)"></cps:column>
					<cps:column field="zpcs1" title="建制镇派出所数(个)" maxlength="7"></cps:column>
					<cps:column field="zpcs2" title="10人及以上的建制镇派出所数(个)"></cps:column>	
					<cps:column field="xpcs" title="建制乡派出所数(个)"></cps:column>	
					<cps:column field="xpcs2" title="5人及以上的建制乡派出所数(个)"></cps:column>	
					<cps:column field="zas" title="治安派出所数"></cps:column>	
					<cps:column field="sss" title="水上派出所数"></cps:column>	
					<cps:column field="yijs" title="一级派出所数(个)"></cps:column>	
					<cps:column field="erjs" title="二级派出所数(个)"></cps:column>	
					<cps:column field="sanjs" title="三级派出所数(个)"></cps:column>	
					<cps:column field="sijs" title="四级派出所数(个)"></cps:column>	
					<cps:column field="wujs" title="五级派出所数(个)"></cps:column>	
					<cps:column field="fkjyx" title="副科级以下"></cps:column>	
					<cps:column field="fkj" title="副科级"></cps:column>	
					<cps:column field="zkj" title="正科级"></cps:column>	
					<cps:column field="fcj" title="副处级"></cps:column>	
					<cps:column field="fcjys" title="副处级以上"></cps:column>	
					<cps:column field="qcs" title="汽车(辆)"></cps:column>	
					<cps:column field="wcpcs" title="无车派出所数"></cps:column>	
					<cps:column field="jsjs" title="计算机(台)"></cps:column>	
					<cps:column field="wjsjs" title="无电脑派出所数"></cps:column>	
					<cps:column field="szs" title="所长数"></cps:column>	
					<cps:column field="fdtks" title="防弹头盔(顶)"></cps:column>	
					<cps:column field="wfdtkpcss" title="未装备防弹头盔的派出所数"></cps:column>	
					<cps:column field="fdbxs" title="防弹背心(件)"></cps:column>	
					<cps:column field="wfdbxpcss" title="未装备防弹背心的派出所数"></cps:column>	
					<cps:column field="fcbxs" title="防刺背心(件)"></cps:column>	
					<cps:column field="wfcbxpcss" title="未装备防刺背心的派出所数"></cps:column>	
					<cps:column field="jljwqs" title="已建社区警务室数(个)"></cps:column>	
					<cps:column field="sqmjs" title="社区民警(人)"></cps:column>	
					<cps:column field="zzmjs" title="社区民警中专职社区民警数"></cps:column>	
					<cps:column field="sqs" title="社区数(个)"></cps:column>	
					<cps:column field="ncjwss" title="已建农村警务室数(个)"></cps:column>	
					<cps:column field="zcmjs" title="驻村民警"></cps:column>	
					<cps:column field="zczzmjs" title="驻村民警中专职驻村民警数"></cps:column>	
					<cps:column field="xzcs" title="行政村数(个)"></cps:column>	
					<cps:column field="jwqs" title="警务区数(个)"></cps:column>	
				</cps:tableGrid>
				<%-- 
				<div style="padding-left: 20px;text-align: center">
				<table width="830" border="0" cellpadding="0" cellspacing="0" style='width:1000.50pt;border-collapse:collapse;table-layout:fixed;'>
				   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
					    <td class="xl29" height="44" style='height:33.00pt;' >使用单位</td>
					    <td class="xl29" >使用单位名称</td>
					    <td class="xl29" >实有数(人)</td>
					    <td class="xl29" >县级公安机关总警力数</td>
					    <td class="xl29" >派出所实有警力占县级公安机关总警力的比例小于40％的县区局数</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="orgcode" class="xl30" height="33.27" style='height:24.95pt;' align="center">&nbsp;</td>
					    <td id="orgname" class="xl30" >&nbsp;</td>
					    <td id="syrs" class="xl30" >&nbsp;</td>
					    <td id="xjgajgzjls" class="xl30" >&nbsp;</td>
					    <td id="syjlzxjlbl" class="xl30" >&nbsp;</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td class="xl29" height="33.27" style='height:24.95pt;' >当年(统计期)接受过集中业务培训的民警数</td>
					    <td class="xl29" >派出所数(个)</td>
					    <td class="xl29" >城区户籍所数(个)</td>
					    <td class="xl29" >20人及以上的城区派出所数(个)</td>
					    <td class="xl29" >建制镇派出所数(个)</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="cjpxmjs" class="xl30" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="pcss" class="xl30" >&nbsp;</td>
					    <td id="cqhjs" class="xl30" >&nbsp;</td>
					    <td id="cqs" class="xl30" >&nbsp;</td>
					    <td id="zpcs1" class="xl30" >&nbsp;</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td class="xl29" height="33.27" style='height:24.95pt;' >10人及以上的建制镇派出所数(个)</td>
					    <td class="xl29" >建制乡派出所数(个)</td>
					    <td class="xl29" >5人及以上的建制乡派出所数(个)</td>
					    <td class="xl29" >治安派出所数</td>
					    <td class="xl29" >水上派出所数</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="zpcs2" class="xl30" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="xpcs" class="xl30" >&nbsp;</td>
					    <td id="xpcs2" class="xl30" >&nbsp;</td>
					    <td id="zas" class="xl30" >&nbsp;</td>
					    <td id="sss" class="xl30" >&nbsp;</td>
				   </tr>
				   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
					    <td class="xl32" height="44" style='height:33.00pt;' >一级派出所数(个)</td>
					    <td class="xl32" >二级派出所数(个)</td>
					    <td class="xl32" >三级派出所数(个)</td>
					    <td class="xl32" >四级派出所数(个)</td>
					    <td class="xl32" >五级派出所数(个)</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="yijs" class="xl33" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="erjs" class="xl33" >&nbsp;</td>
					    <td id="sanjs" class="xl33" >&nbsp;</td>
					    <td id="sijs" class="xl33" >&nbsp;</td>
					    <td id="wujs" class="xl33" >&nbsp;</td>
				   </tr>
				   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
					    <td class="xl29" height="44" style='height:33.00pt;' >副科级以下</td>
					    <td class="xl29" >副科级</td>
					    <td class="xl29" >正科级</td>
					    <td class="xl29" >副处级</td>
					    <td class="xl29" >副处级以上</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="fkjyx" class="xl30" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="fkj" class="xl30" >&nbsp;</td>
					    <td id="zkj" class="xl30" >&nbsp;</td>
					    <td id="fcj" class="xl30" >&nbsp;</td>
					    <td id="fcjys" class="xl30" >&nbsp;</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td class="xl29" height="33.27" style='height:24.95pt;' >汽车(辆)</td>
					    <td class="xl29" >无车派出所数</td>
					    <td class="xl29" >计算机(台)</td>
					    <td class="xl29" >无电脑派出所数</td>
					    <td class="xl29" >所长数</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="qcs" class="xl30" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="wcpcs" class="xl30" >&nbsp;</td>
					    <td id="jsjs" class="xl30" >&nbsp;</td>
					    <td id="wjsjs" class="xl30" >&nbsp;</td>
					    <td id="szs" class="xl34" >&nbsp;</td>
				   </tr>
				   
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td class="xl29" height="33.27" style='height:24.95pt;' >防弹头盔(顶)</td>
					    <td class="xl29" >未装备防弹头盔的派出所数</td>
					    <td class="xl29" >防弹背心(件)</td>
					    <td class="xl29" >未装备防弹背心的派出所数</td>
					    <td class="xl29" >防刺背心(件)</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="fdtks" class="xl30" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="wfdtkpcss" class="xl30" >&nbsp;</td>
					    <td id="fdbxs" class="xl30" >&nbsp;</td>
					    <td id="wfdbxpcss" class="xl30" >&nbsp;</td>
					    <td id="fcbxs" class="xl30" >&nbsp;</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td class="xl29" height="33.27" style='height:24.95pt;' >未装备防刺背心的派出所数</td>
					    <td class="xl29" >已建社区警务室数(个)</td>
					     <td class="xl29" height="33.27" style='height:24.95pt;' >社区民警(人)</td>
					    <td class="xl29" >社区民警中专职社区民警数</td>
					    <td class="xl29" >社区数(个)</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="wfcbxpcss" class="xl30" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="jljwqs" class="xl29" >&nbsp;</td>
					    <td id="sqmjs" class="xl29" >&nbsp;</td>
					    <td id="zzmjs" class="xl29" >&nbsp;</td>
					    <td id="sqs" class="xl30" >&nbsp;</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
				   		<td class="xl29" >已建农村警务室数(个)</td>
					    <td class="xl29" >驻村民警</td>
					    <td class="xl29" >驻村民警中专职驻村民警数</td>
					    <td class="xl29" >行政村数(个)</td>
					    <td class="xl29" >警务区数(个)</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td id="ncjwss" class="xl30" height="33.27" style='height:24.95pt;' >&nbsp;</td>
					    <td id="zcmjs" class="xl29" >&nbsp;</td>
					    <td id="zczzmjs" class="xl29" >&nbsp;</td>
					    <td id="xzcs" class="xl29" >&nbsp;</td>
					    <td id="jwqs" class="xl29" >&nbsp;</td>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td class="xl29" height="33.27" style='height:24.95pt;' >填报单位</td>
					    <td class="xl29" >填报人</td>
					    <td class="xl29" >填报日期</td>
					    <td class="xl36" colspan="2" style='mso-ignore:colspan;'/>
				   </tr>
				   <tr height="33.27" style='height:24.95pt;mso-height-source:userset;mso-height-alt:499;'>
					    <td class="xl29" height="33.27" style='height:24.95pt;' >${loginInfo.orgname }</td>
					    <td class="xl29" >${loginInfo.realname }</td>
					    <td class="xl29" >${currentSystemDate }</td>
					    <td class="xl36" colspan="2" style='mso-ignore:colspan;'/>
				   </tr>
  				</table>
  				</div>
  				--%>
			</form>	
		</cps:panel>
	</cps:PanelView>
	<iframe name="exportFame" id="exportFame"  height="0" style="display:none;"></iframe>
</creator:box>
</creator:view>