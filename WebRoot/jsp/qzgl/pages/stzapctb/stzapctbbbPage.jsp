<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表">
<creator:box>
<style>
	.inputclassone{
		overflow-x:visible;
		overflow-y:visible; 
		text-align:center;
		size:18%;
		height:20px;
		width:100%;
	}
</style>
<script type="text/javascript">
	//var strtitle;
	var tablehtml
	$(function(){
		tablehtml = document.getElementById("table_cxjgList").innerHTML;
	});
	
	
</script>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/sjzapctb.js">
	
</script>
<div id="shuoming" name="shuoming">
</div>

<input type="hidden" id="tbrxm" name="loginInfo.realname" value="${loginInfo.realname}"/>
<creator:panel id="addZapctb"  tbarId="zapctbInfotbar">
<div id="tabledivid">
	<cps:table>
		<cps:row>
			<cps:tdLabel width="12%">统计单位：</cps:tdLabel>
			<cps:tdContent width="22%">
				<input type="hidden" id="jzdpcsdm" />
				<cps:textfield id="jzdpcsmc"  readonly="true" appendPopuBtn="true" onclick="orgSelect('${loginInfo.orgcode}','jzdpcsdm','jzdpcsmc')" required="true" cssStyle="width:200px;"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="12%">统计月份：</cps:tdLabel>
			<cps:tdContent width="23%">
				<cps:date id="tjyf" dateFmt="yyyyMM" value="" maxDate="$" onblur="dateChangeTwo()"></cps:date>
			</cps:tdContent>
			<cps:tdContent>
				<cps:button id="queryTJ" value="查询" onclick="tjbbStZapctb()"></cps:button>
				<cps:button id="downloadTJExcel" value="导出" onclick="downloadTJExcel()"></cps:button>
			</cps:tdContent>
		</cps:row>
	</cps:table>
	 	<table style="table-layout:fixed;" width="99.8%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0">
			<tr>
				<th colspan="28">
					<Strong> 全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表 </Strong>
				</th>
			</tr>
			<tr>
				<th colspan="28" id="title" >
				</th>
			</tr>
			<tr>
				<td colspan="28" id="title" >
					&nbsp;
				</td>
			</tr>
			<tr>
				<th rowspan="4" style="width:100px" colspan="2">
					
				</th>
				<th colspan="11">
					<Strong> 排查发现可能引发个人极端暴力犯罪的线索数 </Strong>
				</th>
				<th colspan="14">
					<Strong> 治安系统化解处置个人极端暴力犯罪案事件数 </Strong>
				</th>
				<th rowspan="3">
					<Strong> 
					移交<br/>
					其他<br/>
					警钟<br/>
					部门</Strong>
				</th>
			</tr>
			<tr>
				<th rowspan="2">
					合
					<br/>
					计
				</th>
				<th colspan="6">
					原因分析
				</th>
				<th colspan="4">
					线索来源渠道分析
				</th>
				
				<th rowspan="2">
					合
					<br/>
					计
				</th>
				<th colspan="7">
					预谋实施的场所部位分析
				</th>
				<th colspan="6">
					使用工具情况分析
				</th>
			</tr>
			<tr>
				<th>
					邻里纠纷
				</th>
				<th>
					征地拆迁
				</th>
				<th>
					拖欠工资
				</th>
				<th>
					非正常死亡
				</th>
				<th>
					涉法涉诉
				</th>
				<th>
					其他
				</th>
				<th>
					民警排查发现
				</th>
				<th>
					互联网截获
				</th>
				<th>
					110接报
				</th>
				<th>
					群众举报
				</th>
				
				<th>
					企事<br/>业单<br/>位
				</th>
				<th>
					党政<br/>机关
				</th>
				<th>
					学校
				</th>
				<th>
					机场<br/>车站<br/>码头<br/>地铁
				</th>
				<th>
					人员密集<br/>公共场所
				</th>
				<th>
					进京
				</th>
				<th>
					其他
				</th>
				<th>
					爆炸<br/>物品
				</th>
				<th>
					枪支
				</th>
				<th>
					汽油等<br/>易燃<br/>物品
				</th>
				<th>
					剧毒化<br/>学品
				</th>
				<th>
					刀具
				</th>
				<th>
					其他
				</th>
			</tr>
			<tr>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(条)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
				<th style="avlign:middle;">
					(起)
				</th>
			</tr>
			<tr>
				<td id="dw1"  colspan="2"><a  href="javascript:queryStZapcMingXiA()" style="text-decoration: none"><font color="green">治安各部门总和</font></a></td>
				<td id="hja1"></td>
				<td id="lljf1"></td>
				<td id="zdcq1"></td>
				<td id="tqgz1"></td>
				<td id="fzcsw1"></td>
				<td id="sfss1"></td>
				<td id="qtyy1"></td>
				<td id="mjpcfx1"></td>
				<td id="hlwjh1"></td>
				<td id="dhjb1"></td>
				<td id="qzjb1"></td>
				<td id="hjb1"></td>
				<td id="qsydw1"></td>
				<td id="dzjg1"></td>
				<td id="xx1"></td>
				<td id="jccz1"></td>
				<td id="gc1"></td>
				<td id="jj1"></td>
				<td id="qtbw1"></td>
				<td id="bzwp1"></td>
				<td id="qz1"></td>
				<td id="qy1"></td>
				<td id="jd1"></td>
				<td id="dj1"></td>
				<td id="qtgj1"></td>
				<td id="yjqtjz1"></td>
			</tr>
			<tr>
				<td id="dw2"  colspan="2"><a  href="javascript:queryStZapcMingXiB()" >其中派出所总和</td>
				<td id="hja2"></td>
				<td id="lljf2"></td>
				<td id="zdcq2"></td>
				<td id="tqgz2"></td>
				<td id="fzcsw2"></td>
				<td id="sfss2"></td>
				<td id="qtyy2"></td>
				<td id="mjpcfx2"></td>
				<td id="hlwjh2"></td>
				<td id="dhjb2"></td>
				<td id="qzjb2"></td>
				<td id="hjb2"></td>
				<td id="qsydw2"></td>
				<td id="dzjg2"></td>
				<td id="xx2"></td>
				<td id="jccz2"></td>
				<td id="gc2"></td>
				<td id="jj2"></td>
				<td id="qtbw2"></td>
				<td id="bzwp2"></td>
				<td id="qz2"></td>
				<td id="qy2"></td>
				<td id="jd2"></td>
				<td id="dj2"></td>
				<td id="qtgj2"></td>
				<td id="yjqtjz2"></td>
			</tr>
		</table>
</div>
<div>
	<table style="table-layout:fixed;" width="99.8%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0">
			<tr>
				<th rowspan="4"  >
					
				</th>
				<th colspan="13">
					<Strong> 稳控打击有个人极端暴力犯罪倾向的重点人数 </Strong>
				</th>
			</tr>
			<tr>
				
				<th rowspan="2" >
					合
					<br/>
					计
				</th>
				<th colspan="4">
					年龄阶段分析
				</th>
				<th colspan="5">
					重点人群分析
				</th>
				<th colspan="3">
					采取处置措施情况
				</th>
			</tr>
			<tr>
				<th>
					20岁以<br/>下
				</th>
				<th>
					20-40<br/>岁
				</th>
				<th>
					41-50<br/>岁
				</th>
				<th>
					51岁以<br/>上
				</th>
				<th>
					无业<br/>人员
				</th>
				<th>
					外来务<br/>工人员
				</th>
				<th>
					上访人<br/>员
				</th>
				<th>
					精神病<br/>人
				</th>
				<th>
					其他
				</th>
				<th>
					治安处<br/>罚
				</th>
				<th>
					刑事处<br/>罚
				</th>
				<th>
					日常稳<br/>控
				</th>
			</tr>
			<tr>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
					<th style="avlign:middle;">
						(人)
					</th>
				</tr>
			<tr>
				<td id="dw11" ><a  href="javascript:queryStZapcMingXiA()" style="text-decoration:none;"><font color="green">治安各部门总和</font></a></td>
				<td id="hjc1"></td>
				<td id="esyx1"></td>
				<td id="eszss1"></td>
				<td id="syzws1"></td>
				<td id="ssyys1"></td>
				<td id="wyry1"></td>
				<td id="wlwgry1"></td>
				<td id="sfry1"></td>
				<td id="jsbr1"></td>
				<td id="qtrq1"></td>
				<td id="zacf1"></td>
				<td id="xscf1"></td>
				<td id="rcwk1"></td>
			</tr>
			<tr>
				<td id="dw22"  ><a  href="javascript:queryStZapcMingXiB()" style="text-decoration:none;"><font>其中派出所总和</font></a></td>
				<td id="hjc2"></td>
				<td id="esyx2"></td>
				<td id="eszss2"></td>
				<td id="syzws2"></td>
				<td id="ssyys2"></td>
				<td id="wyry2"></td>
				<td id="wlwgry2"></td>
				<td id="sfry2"></td>
				<td id="jsbr2"></td>
				<td id="qtrq2"></td>
				<td id="zacf2"></td>
				<td id="xscf2"></td>
				<td id="rcwk2"></td>
			</tr>
		</table>
	</div>
	<div id="tableNr"></div>
	<br/>
	<div id="bzshuoming">
		注：&nbsp;1、填报“化解处置个人极端暴力犯罪案事件数”后，务必逐案填报《排查化解处置个人极端暴力犯罪案事件案例信息报送表》；<br/>
    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、在开展此项工作中收缴物品工具情况：
    					收缴炸药<input type="text" id="sjzy1" style="text-align:center;width:4%" readonly="readonly">公斤，
    					雷管<input type="text" id="lg1" style="text-align:center;width:4%"  readonly="readonly">枚，
    					剧毒化学品<input type="text" id="jdhxp1" style="text-align:center;width:4%"  readonly="readonly">克，
    					枪支<input type="text" id="qzb1" style="text-align:center;width:4%"  readonly="readonly">把，
    					子弹<input type="text" id="zdb1" style="text-align:center;width:4%"  readonly="readonly">发，
    					汽油等易燃物品<input type="text" id="qyb1" style="text-align:center;width:4%"  readonly="readonly">升；<br/>
    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、该表由各省区市公安厅、局治安总队牵头汇总填报。
		
	</div>
</creator:panel>
</creator:box>
</creator:view>