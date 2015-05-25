<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="治安排查填报信息">
<creator:box>
<style>
	.inputclassone{
		overflow-x:visible;
		overflow-y:visible; 
		text-align:center;
		size:18%;
		height:15px;
		width:100%;
	}
</style>
<script type="text/javascript">
	var strtitle;
	var reStrHtml ;
	$(function(){
		strtitle = "${strtitle}";
		//alert("${strtitle}");
		var htmls = $("#title").html();
		reStrHtml = $("#title").html();
		//alert(htmls);
		//htmls = htmls.replace('strtitle',strtitle);
		htmls = htmls + strtitle;
		$("#title").html(htmls);
	});
	
	
</script>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/sjzapctb.js">
</script>
<div id="shuoming" name="shuoming">
</div>
<creator:tbar id="zapctbInfotbar">
	<cps:button id="save" value="保&nbsp;存" onclick="submitSaveStZapctb()"></cps:button>
	<cps:button  value="说&nbsp;明" onclick="showShuoMing()"></cps:button>
</creator:tbar>
<form id="zapctbform" name="zapctbform"  action="/qzgl/wmfwgl/saveZapctbBean.action" method="post">
<creator:panel id="addZapctb" title="治安排查填报信息" tbarId="zapctbInfotbar">
	<s:hidden id="operType" name="operType" ></s:hidden>
	<s:hidden id="isOk" value="false"></s:hidden>
	<s:hidden id="id" name="stzapcbean.id"></s:hidden>
	 	<table style="table-layout:fixed;" width="99.8%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0">
			<tr>
				<th colspan="11">
					全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况
					<cps:date id="tjyf" name="stzapcbean.tjyf" value="${stzapcbean.tjyf}" maxDate="$" onblur="dateChange()" dateFmt="yyyyMM" cssStyle="width:55px;height:15px;"></cps:date>
					月报表
				</th>
			</tr>
			<tr>
				<th colspan="11">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left" width="30%">填表单位：${loginInfo.orgname}</td>
							<td id="title"></td>
							<td align="right">填报单位：${loginInfo.realname}</td>
						</tr>
					</table>
				</th>
			</tr>
			<tr>
				<td colspan="11" align="left">
					<font color="red">说明：填报信息填写数据为从上个月4日到下月3日时间段里面发生的的个人极端暴力工作情况的汇总月报表,一个月只需要填写一次就可以了。</font>
				</td>
			</tr>
			<tr>
				<th colspan="11">
					<Strong> 排查发现可能引发个人极端暴力犯罪的线索数 </Strong>
				</th>
			</tr>
			<tr>
				<th rowspan="2">
					合
					<br/>
					计
					<br/>
					(条)
				</th>
				<th colspan="6">
					原因分析
				</th>
				<th colspan="4">
					线索来源渠道分析
				</th>
			</tr>
			<tr>
				<th>
					邻里纠纷
					<br/>(条)
				</th>
				<th>
					征地拆迁
					<br/>(条)
				</th>
				<th>
					拖欠工资
					<br/>(条)
				</th>
				<th>
					非正常死亡
					<br/>(条)
				</th>
				<th>
					涉法涉诉
					<br/>(条)
				</th>
				<th>
					其他
					<br/>(条)
				</th>
				<th>
					民警排查发现
					<br/>(条)
				</th>
				<th>
					互联网截获
					<br/>(条)
				</th>
				<th>
					110接报
					<br/>(条)
				</th>
				<th>
					群众举报
					<br/>(条)
				</th>
			</tr>
			
			<tr>
				<th>
					1
				</th>
				<th>
					2
				</th>
				<th>
					3
				</th>
				<th>
					4
				</th>
				<th>
					5
				</th>
				<th>
					6
				</th>
				<th>
					7
				</th>
				<th>
					8
				</th>
				<th>
					9
				</th>
				<th>
					10
				</th>
				<th>
					11
				</th>
			</tr>
			
			<tr>
				<td width="20%">
					<input id="hja" type="text" class="inputclassone" name="stzapcbean.hja" value="${stzapcbean.hja}" readonly="readonly">
				</td>
				
				<td width="20%">
					<input id="lljf" type="text" class="inputclassone" name="stzapcbean.lljf"  value="${stzapcbean.lljf}"  onblur="isNumber('lljf');countTwoToSive()" >
				</td>
				
				<td width="20%">
					<input id="zdcq" type="text" class="inputclassone" name="stzapcbean.zdcq"  value="${stzapcbean.zdcq}"   onblur="isNumber('zdcq');countTwoToSive()" >
				</td>
				
				<td width="20%">
					<input id="tqgz" type="text" class="inputclassone" name="stzapcbean.tqgz"  value="${stzapcbean.tqgz}"   onblur="isNumber('tqgz');countTwoToSive()" >
				</td>
				
				<td width="20%">
					<input id="fzcsw" type="text" class="inputclassone" name="stzapcbean.fzcsw"  value="${stzapcbean.fzcsw}"   onblur="isNumber('fzcsw');countTwoToSive()" >
				</td>
				
				<td width="20%">
					<input id="sfss" type="text" class="inputclassone" name="stzapcbean.sfss"  value="${stzapcbean.sfss}"   onblur="isNumber('sfss');countTwoToSive()" >
				</td>
				
				<td width="20%">
					<input id="qtyy" type="text" class="inputclassone" name="stzapcbean.qtyy"  value="${stzapcbean.qtyy}"  onblur="isNumber('qtyy');countTwoToSive()" >
				</td>
				
				<td width="20%">
					<input id="mjpcfx" type="text" class="inputclassone" name="stzapcbean.mjpcfx"  value="${stzapcbean.mjpcfx}"  onblur="isNumber('mjpcfx')"  >
				</td>
				
				<td width="20%">
					<input id="hlwjh" type="text" class="inputclassone" name="stzapcbean.hlwjh"  value="${stzapcbean.hlwjh}"   onblur="isNumber('hlwjh')" >
				</td>
				
				<td width="20%">
					<input id="dhjb" type="text" class="inputclassone" name="stzapcbean.dhjb"  value="${stzapcbean.dhjb}"  onblur="isNumber('dhjb')"  >
				</td>
				<td width="20%">
					<input id="qzjb" type="text" class="inputclassone" name="stzapcbean.qzjb"  value="${stzapcbean.qzjb}"  onblur="isNumber('qzjb')" >
				</td>
			</tr>
		</table>
		<table style="table-layout:fixed;" width="100%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0">
			<tr>
				<th colspan="15">
					<Strong> 治安系统化解处置个人极端暴力犯罪案事件数 </Strong>
				</th>
			</tr>
			<tr>
				<th rowspan="2">
					合
					<br/>
					计
					<br/>(起)
				</th>
				<th colspan="7">
					预谋实施的场所部位分析
				</th>
				<th colspan="6">
					使用工具情况分析
				</th>
				<th rowspan="2">
					移交其<br/>
					他警种<br/>
					和政府<br/>
					有关部<br/>
					门
					<br/>(起)
				</th>
			</tr>
			<tr>
				<th>
					企事<br/>业单<br/>位
					<br/>(起)
				</th>
				<th>
					党政<br/>机关
					<br/>(起)
				</th>
				<th>
					学校
					<br/>(起)
				</th>
				<th>
					机场<br/>车站<br/>码头<br/>地铁
					<br/>(起)
				</th>
				<th>
					广场、商<br/>业网点等<br/>人员密集<br/>公共场所
					<br/>(起)
				</th>
				<th>
					进京
					<br/>(起)
				</th>
				<th>
					其他
					<br/>(起)
				</th>
				<th>
					爆炸<br/>物品
					<br/>(起)
				</th>
				<th>
					枪支
					<br/>(起)
				</th>
				<th>
					汽油等<br/>易燃<br/>物品
					<br/>(起)
				</th>
				<th>
					剧毒化<br/>学品
					<br/>(起)
				</th>
				<th>
					刀具
					<br/>(起)
				</th>
				<th>
					其他
					<br/>(起)
				</th>
			</tr>
			<tr>
				<th>
					12
				</th>
				<th>
					13
				</th>
				<th>
					14
				</th>
				<th>
					15
				</th>
				<th>
					16
				</th>
				<th>
					17
				</th>
				<th>
					18
				</th>
				<th>
					19
				</th>
				<th>
					20
				</th>
				<th>
					21
				</th>
				<th>
					22
				</th>
				<th>
					23
				</th>
				<th>
					24
				</th>
				<th>
					25
				</th>
				<th>
					26
				</th>
			</tr>
			<tr>
				<td width="20%">
					<input id="hjb" type="text" class="inputclassone" name="stzapcbean.hjb"   value="${stzapcbean.hjb}" readonly="readonly">
				</td>
				<td width="20%">
					<input id="qsydw" type="text" class="inputclassone" name="stzapcbean.qsydw"  value="${stzapcbean.qsydw}"  onblur="isNumber('qsydw');count13To19()" >
				</td>
				<td width="20%">
					<input id="dzjg" type="text" class="inputclassone" name="stzapcbean.dzjg"  value="${stzapcbean.dzjg}"  onblur="isNumber('dzjg');count13To19()" >
				</td>
				<td width="20%">
					<input id="xx" type="text" class="inputclassone" name="stzapcbean.xx"  value="${stzapcbean.xx}"  onblur="isNumber('xx');count13To19()" >
				</td>
				<td width="20%">
					<input id="jccz" type="text" class="inputclassone" name="stzapcbean.jccz"  value="${stzapcbean.jccz}"  onblur="isNumber('jccz');count13To19()" >
				</td>
				<td width="20%">
					<input id="gc" type="text" class="inputclassone" name="stzapcbean.gc"  value="${stzapcbean.gc}"  onblur="isNumber('gc');count13To19()" >
				</td>
				<td width="20%">
					<input id="jj" type="text" class="inputclassone" name="stzapcbean.jj"  value="${stzapcbean.jj}"  onblur="isNumber('jj');count13To19()" >
				</td>
				<td width="20%">
					<input id="qtbw" type="text" class="inputclassone" name="stzapcbean.qtbw"  value="${stzapcbean.qtbw}"  onblur="isNumber('qtbw');count13To19()" >
				</td>
				<td width="20%">
					<input id="bzwp" type="text" class="inputclassone" name="stzapcbean.bzwp"  value="${stzapcbean.bzwp}"  onblur="isNumber('bzwp')" >
				</td>
				<td width="20%">
					<input id="qz" type="text" class="inputclassone" name="stzapcbean.qz"  value="${stzapcbean.qz}"  onblur="isNumber('qz')" >
				</td>
				<td width="20%">
					<input id="qy" type="text" class="inputclassone" name="stzapcbean.qy"  value="${stzapcbean.qy}"  onblur="isNumber('qy')" >
				</td>
				<td width="20%">
					<input id="jd" type="text" class="inputclassone" name="stzapcbean.jd"  value="${stzapcbean.jd}"  onblur="isNumber('jd')" >
				</td>
				<td width="20%">
					<input id="dj" type="text" class="inputclassone" name="stzapcbean.dj"  value="${stzapcbean.dj}"  onblur="isNumber('dj')" >
				</td>
				<td width="20%">
					<input id="qtgj" type="text" class="inputclassone" name="stzapcbean.qtgj"  value="${stzapcbean.qtgj}"  onblur="isNumber('qtgj')" >
				</td>
				<td width="20%">
					<input id="yjqtjz" type="text" class="inputclassone" name="stzapcbean.yjqtjz"  value="${stzapcbean.yjqtjz}"  onblur="isNumber('yjqtjz')" >
				</td>
			</tr>
		</table>
		<table style="table-layout:fixed;" width="100%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0">
			<tr>
				<th colspan="13">
					<Strong> 稳控打击有个人极端暴力犯罪倾向的重点人数 </Strong>
				</th>
			</tr>
			<tr>
				<th rowspan="2">
					合
					<br/>
					计
					<br/>(人)
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
					<br/>(人)
				</th>
				<th>
					20-40<br/>岁
					<br/>(人)
				</th>
				<th>
					41-50<br/>岁
					<br/>(人)
				</th>
				<th>
					51岁以<br/>上
					<br/>(人)
				</th>
				<th>
					无业<br/>人员
					<br/>(人)
				</th>
				<th>
					外来务<br/>工人员
					<br/>(人)
				</th>
				<th>
					上访人<br/>员
					<br/>(人)
				</th>
				<th>
					精神病<br/>人
					<br/>(人)
				</th>
				<th>
					其他
					<br/>(人)
				</th>
				<th>
					治安处<br/>罚
					<br/>(人)
				</th>
				<th>
					刑事处<br/>罚
					<br/>(人)
				</th>
				<th>
					日常稳<br/>控
					<br/>(人)
				</th>
			</tr>
			<tr>
				<th>
					27
				</th>
				<th>
					28
				</th>
				<th>
					29
				</th>
				<th>
					30
				</th>
				<th>
					31
				</th>
				<th>
					32
				</th>
				<th>
					33
				</th>
				<th>
					34
				</th>
				<th>
					35
				</th>
				<th>
					36
				</th>
				<th>
					37
				</th>
				<th>
					38
				</th>
				<th>
					39
				</th>
			</tr>
			<tr>
				<td width="20%">
					<input id="hjc" type="text" class="inputclassone" name="stzapcbean.hjc"  value="${stzapcbean.hjc}"   onblur="isNumber('hjc')" >
				</td>
				<td width="20%">
					<input id="esyx" type="text" class="inputclassone" name="stzapcbean.esyx"  value="${stzapcbean.esyx}"  onblur="isNumber('esyx')" >
				</td>
				<td width="20%">
					<input id="eszss" type="text" class="inputclassone" name="stzapcbean.eszss"  value="${stzapcbean.eszss}"  onblur="isNumber('eszss')" >
				</td>
				<td width="20%">
					<input id="syzws" type="text" class="inputclassone" name="stzapcbean.syzws"  value="${stzapcbean.syzws}"  onblur="isNumber('syzws')" >
				</td>
				<td width="20%">
					<input id="ssyys" type="text" class="inputclassone" name="stzapcbean.ssyys"  value="${stzapcbean.ssyys}"  onblur="isNumber('ssyys')" >
				</td>
				<td width="20%">
					<input id="wyry" type="text" class="inputclassone" name="stzapcbean.wyry"  value="${stzapcbean.wyry}"  onblur="isNumber('wyry')" >
				</td>
				<td width="20%">
					<input id="wlwgry" type="text" class="inputclassone" name="stzapcbean.wlwgry"  value="${stzapcbean.wlwgry}"  onblur="isNumber('wlwgry')"  >
				</td>
				<td width="20%">
					<input id="sfry" type="text" class="inputclassone" name="stzapcbean.sfry"  value="${stzapcbean.sfry}"   onblur="isNumber('sfry')" >
				</td>
				<td width="20%">
					<input id="jsbr" type="text" class="inputclassone" name="stzapcbean.jsbr"  value="${stzapcbean.jsbr}"  onblur="isNumber('jsbr')" >
				</td>
				<td width="20%">
					<input id="qtrq" type="text" class="inputclassone" name="stzapcbean.qtrq"  value="${stzapcbean.qtrq}"  onblur="isNumber('qtrq')" >
				</td>
				<td width="20%">
					<input id="zacf" type="text" class="inputclassone" name="stzapcbean.zacf"  value="${stzapcbean.zacf}"  onblur="isNumber('zacf')" >
				</td>
				<td width="20%">
					<input id="xscf" type="text" class="inputclassone" name="stzapcbean.xscf"  value="${stzapcbean.xscf}"  onblur="isNumber('xscf')" >
				</td>
				<td width="20%">
					<input id="rcwk" type="text" class="inputclassone" name="stzapcbean.rcwk"  value="${stzapcbean.rcwk}"  onblur="isNumber('rcwk')" >
				</td>
			</tr>	
		</table>
		<div>
			<table>
				<tr>
					<td>收缴炸药</td>
					<td>
						<input id="sjzy"  type="text" name="stzapcbean.sjzy" style="height:12px;text-align:center;"  value="${stzapcbean.sjzy}"  onblur="isNumber('sjzy')" >公斤，
					</td>
					<td>雷管</td>
					<td>
						<input id="lg" type="text"  name="stzapcbean.lg"  style="height:12px;text-align:center;"  value="${stzapcbean.lg}"  onblur="isNumber('lg')" >枚，
					</td>
					<td>剧毒化学品</td>
					<td>
						<input id="jdhxp" type="text"  name="stzapcbean.jdhxp"  style="height:12px;text-align:center;"  value="${stzapcbean.jdhxp}"  onblur="isNumber('jdhxp')" >克，
					</td>
				</tr>
				<tr>
					<td>枪支</td>
					<td>
						<input id="qzb" type="text"  name="stzapcbean.qzb"  style="height:12px;text-align:center;"  value="${stzapcbean.qzb}"  onblur="isNumber('qzb')" >把，
					</td>
					<td>子弹</td>
					<td>
						<input id="zdb" type="text"  name="stzapcbean.zdb"  style="height:12px;text-align:center;"  value="${stzapcbean.zdb}"  onblur="isNumber('zdb')" >发，
					</td>
					<td>汽油等易燃物品</td>
					<td>
						<input id="qyb" type="text"  name="stzapcbean.qyb"  style="height:12px;text-align:center;"  value="${stzapcbean.qyb}"  onblur="isNumber('qyb')" >升。
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<font color="red">合计规则：1=2+3+4+5+6+7 ，1=12+26，12=13+14+15+16+17+18+19</font>
					</td>
				</tr>
			</table>
			<%-- 
			<Strong>收缴炸药<input id="sjzy"  type="text" name="stzapcbean.sjzy" style="height:12px;text-align:center;"  value="${stzapcbean.sjzy}"  onblur="isNumber('sjzy')" >公斤，
			雷管<input id="lg" type="text"  name="stzapcbean.lg"  style="height:12px;text-align:center;"  value="${stzapcbean.lg}"  onblur="isNumber('lg')" >枚，
			剧毒化学品<input id="jdhxp" type="text"  name="stzapcbean.jdhxp"  style="height:12px;text-align:center;"  value="${stzapcbean.jdhxp}"  onblur="isNumber('jdhxp')" >克，
			<br/>枪支<input id="qzb" type="text"  name="stzapcbean.qzb"  style="height:12px;text-align:center;"  value="${stzapcbean.qzb}"  onblur="isNumber('qzb')" >把，
			子弹<input id="zdb" type="text"  name="stzapcbean.zdb"  style="height:12px;text-align:center;"  value="${stzapcbean.zdb}"  onblur="isNumber('zdb')" >发，
			汽油等易燃物品<input id="qyb" type="text"  name="stzapcbean.qyb"  style="height:12px;text-align:center;"  value="${stzapcbean.qyb}"  onblur="isNumber('qyb')" >升。
			</Strong>
			--%>
		</div>
		<s:hidden id="djrxm" name="stzapcbean.djrxm"  ></s:hidden>
		<s:hidden id="djdwdm" name="stzapcbean.djdwdm"  ></s:hidden>
		<s:hidden id="parentcode" name="stzapcbean.parentcode" ></s:hidden>
		<s:hidden id="leve" name="stzapcbean.leve" ></s:hidden>
		<s:hidden id="djdwmc" name="stzapcbean.djdwmc"></s:hidden>
		<s:hidden id="tjqsrq" name="stzapcbean.tjqsrq"></s:hidden>
		<s:hidden id="tjjzrq" name="stzapcbean.tjjzrq"  ></s:hidden>
		<s:hidden id="tbsj" name="stzapcbean.tbsj"  ></s:hidden>
		<s:hidden id="djrjh" name="stzapcbean.djrjh"   ></s:hidden>
		<s:hidden id="djrsfzh" name="stzapcbean.djrsfzh"  ></s:hidden>
		<s:hidden id="ip" name="stzapcbean.ip"  ></s:hidden>
	</creator:panel>
</form>
</creator:box>
</creator:view>