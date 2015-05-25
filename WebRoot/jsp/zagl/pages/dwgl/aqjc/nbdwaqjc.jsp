<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.6%">
<script type="text/javascript">
	$(function(){
		window.moveTo(0,0) ;
		window.resizeTo(screen.availWidth,screen.availHeight); 
	})
</script>
<creator:Script src="/jsp/zagl/js/aqjc/aqjc.js"></creator:Script>
<cps:PanelView>
		<cps:tableGrid id="aqjcList" title="安全检查单列表"
				url ="/zagl/dw/aqjc/queryNbDwAqjcList.action"
				autoload="true" 
				searchform="nbaqjcform" 
				dblclick="rowcallbackAqjc"
				pageSize="5" 
				width="99.5%" 
			    mutilSelect="false" >
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="单位名称" field="jcdwmc"></cps:column>
				<cps:column title="所属派出所" field="sspcsmc"></cps:column>
				<cps:column title="检查日期" field="jcrq"></cps:column>
				<cps:column title="检查民警" field="jcmjxm"></cps:column>
				<cps:column title="检查情况描述" field="jcqkms"></cps:column>
				<cps:column title="所领导审批时间" field="sldspsj"></cps:column>
				<cps:column title="登记时间" field="djsj"></cps:column>
		</cps:tableGrid>
</cps:PanelView>
<form id="nbaqjcform">
<cps:PanelView>
<cps:tbar>
	<cps:button value="保存" onclick="saveAqjcBean()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</cps:tbar>
<cps:panel id="aqjcPanel" title="内保(重点)企事业检查单">
	<cps:table id="nbaqjctable">
		<s:hidden id="id" name="nbAqjcBean.id"></s:hidden>
		<cps:row>
			<cps:tdLabel width="20%"><font color="red">*</font>单位名称：</cps:tdLabel>
			<cps:tdContent width="30%">
				<input id="jcdwdm" name="nbAqjcBean.jcdwdm" value="${nbAqjcBean.jcdwdm}" type="hidden"/>
				<cps:textfield id="jcdwmc" name="nbAqjcBean.jcdwmc" value="${nbAqjcBean.jcdwmc}"  readonly="true" required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel width="20%">所属派出所：</cps:tdLabel>
			<cps:tdContent width="30%">
				<input id="sspcsdm" name="nbAqjcBean.sspcsdm" value="${nbAqjcBean.sspcsdm}" type="hidden"/>
				<cps:textfield id="sspcsmc" name="nbAqjcBean.sspcsmc" value="${nbAqjcBean.sspcsmc}"  readonly="true"  appendPopuBtn="true" onclick="selectOrg('${loginInfo.orgcode}', 'sspcsdm', 'sspcsmc')"></cps:textfield>
			</cps:tdContent>
		</cps:row >
		<cps:row id="clear_row1">
			<cps:tdLabel width="10%"><font color="red">*</font>检查民警：</cps:tdLabel>
			<cps:tdContent>
				<s:hidden id="jcmjjh" name="nbAqjcBean.jcmjjh"></s:hidden>
				<cps:textfield id="jcmjxm" name="nbAqjcBean.jcmjxm" value="${nbAqjcBean.jcmjxm}" readonly="true" appendPopuBtn="true" onclick="openZrmjSelect('${loginInfo.orgcode}','jcmjjh','jcmjxm')" required="true"></cps:textfield>
			</cps:tdContent>
			<cps:tdLabel><font color="red">*</font>检查日期：</cps:tdLabel>
			<cps:tdContent>
				<cps:date id="jcrq" name="nbAqjcBean.jcrq" value="${nbAqjcBean.jcrq}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row2">
			<cps:tdLabel><font color="red">*</font>检查情况描述：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<cps:textfield id="jcqkms" name="nbAqjcBean.jcqkms" value="${nbAqjcBean.jcqkms}" type="textarea" cssStyle="height:50px;width:94%" maxlength="240" required="true"></cps:textfield>
			</cps:tdContent>
		</cps:row>
		<cps:row id="clear_row3">
			<cps:tdLabel>现场照片：</cps:tdLabel>
			<cps:tdContent colspan="5">
				&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>	
	<div >
		<fieldset>
			<legend>制度防范</legend>
			<cps:table>
				<cps:row id="clear_row4">
					<cps:tdLabel width="20%"><font color="red">*</font>制定和落实内部治安保卫制度：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_YW" id="jzzd01" name="nbAqjcBean.jzzd01" value="${nbAqjcBean.jzzd01}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel  width="20%"><font color="red">*</font>制定单位内部治安突发事件处置紧急预案：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_YW" id="jzzd02" name="nbAqjcBean.jzzd02" value="${nbAqjcBean.jzzd02}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row5">
					<cps:tdLabel ><font color="red">*</font>组织开展紧急预案演练 ：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzzd03" name="nbAqjcBean.jzzd03" value="${nbAqjcBean.jzzd03}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel  ><font color="red">*</font>设置治安保卫机构 ：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzzd04" name="nbAqjcBean.jzzd04" value="${nbAqjcBean.jzzd04}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row6">
					<cps:tdLabel ><font color="red">*</font>配备专职保卫人员：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzzd05" name="nbAqjcBean.jzzd05" value="${nbAqjcBean.jzzd05}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel  ><font color="red">*</font>落实内部治安保卫工作责任制 ：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzzd06" name="nbAqjcBean.jzzd06" value="${nbAqjcBean.jzzd06}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row7">
					<cps:tdLabel ><font color="red">*</font>对员工安全防范培训：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzzd07" name="nbAqjcBean.jzzd07" value="${nbAqjcBean.jzzd07}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel  ><font color="red">*</font>人员、物品、车辆出入登记手续：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzzd08" name="nbAqjcBean.jzzd08" value="${nbAqjcBean.jzzd08}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>				
			</cps:table>
		</fieldset>
	</div>
	
	<div>
		<fieldset>
			<legend>技防</legend>
			<cps:table>
				<cps:row id="clear_row8">
					<cps:tdLabel width="20%"><font color="red">*</font>重点要害部位安装入侵报警系统：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_YW" id="jzsp01" name="nbAqjcBean.jzsp01" value="${nbAqjcBean.jzsp01}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel  width="20%"><font color="red">*</font>重点要害部位安装的入侵报警系统与市局110联网：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_YW" id="jzsp02" name="nbAqjcBean.jzsp02" value="${nbAqjcBean.jzsp02}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row9">
					<cps:tdLabel ><font color="red">*</font>重点要害部位安装视频监控：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzsp03" name="nbAqjcBean.jzsp03" value="${nbAqjcBean.jzsp03}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel ><font color="red">*</font>视频监控图像：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_SFQX" id="jzsp04" name="nbAqjcBean.jzsp04" value="${nbAqjcBean.jzsp04}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row10">
					<cps:tdLabel ><font color="red">*</font>回放图像质量：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_SFQX" id="jzsp05" name="nbAqjcBean.jzsp05" value="${nbAqjcBean.jzsp05}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel ><font color="red">*</font>图像存储时间满足规定的30天期限要求：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_YW" id="jzsp06" name="nbAqjcBean.jzsp06" value="${nbAqjcBean.jzsp06}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row11">
					<cps:tdLabel ><font color="red">*</font>监控录制时间24小时 ：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzsp07" name="nbAqjcBean.jzsp07" value="${nbAqjcBean.jzsp07}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel ><font color="red">*</font>重点区域安装周界报警：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_YW" id="jzbj02" name="nbAqjcBean.jzbj02" value="${nbAqjcBean.jzbj02}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row12">
					<cps:tdLabel ><font color="red">*</font>主要出入口门禁系统 ：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzbj08" name="nbAqjcBean.jzbj08" value="${nbAqjcBean.jzbj08}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel >&nbsp;</cps:tdLabel>
					<cps:tdContent>
							&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
	</div>
	
	<div >
		<fieldset>
		<legend>物防</legend>
		<cps:table>
			<cps:row id="clear_row13">
				<cps:tdLabel width="20%"><font color="red">*</font>重点要害部位出入口防盗门：</cps:tdLabel>
				<cps:tdContent width="30%">
					<cps:select zdlb="ZDY_YW" id="jzwf01" name="nbAqjcBean.jzwf01" value="${nbAqjcBean.jzwf01}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel  width="20%"><font color="red">*</font>重点要害部位防盗窗：</cps:tdLabel>
				<cps:tdContent width="30%">
					<cps:select zdlb="ZDY_YW" id="jzwf02" name="nbAqjcBean.jzwf02" value="${nbAqjcBean.jzwf02}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row14">
				<cps:tdLabel ><font color="red">*</font>财务室防盗门 ：</cps:tdLabel>
				<cps:tdContent >
					<cps:select zdlb="ZDY_YW" id="jzwf03" name="nbAqjcBean.jzwf03" value="${nbAqjcBean.jzwf03}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel ><font color="red">*</font>财务室防盗窗：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="ZDY_YW" id="jzwf04" name="nbAqjcBean.jzwf04" value="${nbAqjcBean.jzwf04}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row15">
				<cps:tdLabel ><font color="red">*</font>财务室保险箱是否与墙面或地面固定：</cps:tdLabel>
				<cps:tdContent >
					<cps:select zdlb="ZDY_YW" id="jzwf05" name="nbAqjcBean.jzwf05" value="${nbAqjcBean.jzwf05}" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel >&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row> 
		</cps:table>
		</fieldset>
	</div>
	<div >
		<fieldset>
			<legend>人防</legend>
			<cps:table>
				<cps:row id="clear_row16">
					<cps:tdLabel width="20%"><font color="red">*</font>配备足够数量的安保人员：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_ZDSF" id="jzrf01" name="nbAqjcBean.jzrf01" value="${nbAqjcBean.jzrf01}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel  width="20%"><font color="red">*</font>进行上岗前培训和定期开展培训：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_YW" id="jzrf02" name="nbAqjcBean.jzrf02" value="${nbAqjcBean.jzrf02}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row17">
					<cps:tdLabel ><font color="red">*</font>配备使用防卫器械和报警装备：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_YW" id="jzrf03" name="nbAqjcBean.jzrf03" value="${nbAqjcBean.jzrf03}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel ><font color="red">*</font>重点要害部位值守力量是否到位：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZDSF" id="jzrf04" name="nbAqjcBean.jzrf04" value="${nbAqjcBean.jzrf04}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
			</cps:table>		
		</fieldset>
	</div>
	<div >
		<fieldset>
			<legend>保安监管</legend>
			<cps:table>
				<cps:row id="clear_row18">
					<cps:tdLabel width="20%"><font color="red">*</font>保安员全部持《保安员证》上岗：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_ZDSF" id="jzba01" name="nbAqjcBean.jzba01" value="${nbAqjcBean.jzba01}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel  width="20%"><font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent width="30%">
						<cps:select zdlb="ZDY_ZDSF" id="jzba02" name="nbAqjcBean.jzba02" value="${nbAqjcBean.jzba02}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row19">
					<cps:tdLabel ><font color="red">*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_ZDSF" id="jzba03" name="nbAqjcBean.jzba03" value="${nbAqjcBean.jzba03}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel ><font color="red">*</font>保安员是否认真履职，有较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZDSF" id="jzba04" name="nbAqjcBean.jzba04" value="${nbAqjcBean.jzba04}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
				</cps:row>
			</cps:table>		
		</fieldset>
	</div>
	<div >
		<fieldset>
		<legend>处理结果：</legend>
		<cps:table>
			<cps:row id="clear_row20">
				<cps:tdLabel width="20%">隐患照片：</cps:tdLabel>
				<cps:tdContent width="30%">
					<cps:textfield cssStyle="height:50px;width:86%" type="textarea" readonly="true">&nbsp;</cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="20%">隐患描述：</cps:tdLabel>
				<cps:tdContent width="30%">
					<cps:textfield cssStyle="height:50px;width:86%" type="textarea" id="xhms" name="nbAqjcBean.xhms" value="${nbAqjcBean.xhms}" maxlength="295">&nbsp;</cps:textfield>
				</cps:tdContent>			
			</cps:row>
			<cps:row id="clear_row21">
				<cps:tdLabel>民警处理意见：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield cssStyle="height:50px;width:86%" type="textarea" id="mjclyj" name="nbAqjcBean.mjclyj" value="${nbAqjcBean.mjclyj}" maxlength="245">&nbsp;</cps:textfield>
				</cps:tdContent>	
				<cps:tdLabel>处理：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield cssStyle="height:50px;width:86%" type="textarea" id="cl" name="nbAqjcBean.cl" value="${nbAqjcBean.cl}" maxlength="245">&nbsp;</cps:textfield>
				</cps:tdContent>		
			</cps:row>
			<cps:row id="clear_row22">
				<cps:tdLabel>提交所领导：</cps:tdLabel>
				<cps:tdContent>
					<s:hidden id="tjsldjh" name="nbAqjcBean.tjsldjh"></s:hidden>
					<cps:textfield id="tjsldxm" name="nbAqjcBean.tjsldxm" onclick="openZrmjSelect('${loginInfo.rootOrgCode}','tjsldjh','tjsldxm')" value="${nbAqjcBean.tjsldxm}" appendPopuBtn="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>隐患提交民警：</cps:tdLabel>
				<cps:tdContent>
					<s:hidden id="yhtjmjjh" name="nbAqjcBean.yhtjmjjh"></s:hidden>
					<cps:textfield id="yhtjmjxm" name="nbAqjcBean.yhtjmjxm" onclick="openZrmjSelect('${loginInfo.orgcode}','yhtjmjjh','yhtjmjxm')" value="${nbAqjcBean.yhtjmjxm}" appendPopuBtn="true"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row23">
				<cps:tdLabel>整改期限：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="zgqx" name="nbAqjcBean.zgqx" value="${nbAqjcBean.zgqx}" inputType="number"></cps:textfield>
				天
				</cps:tdContent>
				<cps:tdLabel>民警处理时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="mjclsj" name="nbAqjcBean.mjclsj" value="${nbAqjcBean.mjclsj}" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row24">
				<cps:tdLabel>所领导审批意见：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield cssStyle="height:50px;width:86%" type="textarea" id="sldspyj" name="nbAqjcBean.sldspyj" value="${nbAqjcBean.sldspyj}" maxlength="495">&nbsp;</cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>所领导处理：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield cssStyle="height:50px;width:86%" type="textarea" id="sldcl" name="nbAqjcBean.sldcl" value="${nbAqjcBean.sldcl}" maxlength="245">&nbsp;</cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row25">
				<cps:tdLabel>所领导：</cps:tdLabel>
				<cps:tdContent>
					<s:hidden id="sldjh" name="nbAqjcBean.sldjh"></s:hidden>
					<cps:textfield id="sldxm" name="nbAqjcBean.sldxm" onclick="openZrmjSelect('${loginInfo.rootOrgCode}','sldjh','sldxm')" value="${nbAqjcBean.sldxm}" appendPopuBtn="true"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>整改期限：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="sldzgqx" name="nbAqjcBean.sldzgqx" value="${nbAqjcBean.sldzgqx}" inputType="number"></cps:textfield>
					天
				</cps:tdContent>
			</cps:row>
			<cps:row id="clear_row26">
				<cps:tdLabel>所领导审批时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:date id="sldspsj" name="nbAqjcBean.sldspsj" value="${nbAqjcBean.sldspsj}" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>		
		</fieldset>
	</div>
	<div>
		<fieldset>
		<legend>操作/登记</legend>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="12%">操作人：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="czrxm" readonly="true" name="nbAqjcBean.czrxm" value="${nbAqjcBean.czrxm}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">操作单位：</cps:tdLabel>
				<cps:tdContent width="22%">
					<input id="czdwdm" name="nbAqjcBean.czdwdm" value="${nbAqjcBean.czdwdm }" type="hidden"/>
					<cps:textfield id="czdwmc" readonly="true" name="nbAqjcBean.czdwmc" value="${nbAqjcBean.czdwmc}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">操作时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="czsj" name="nbAqjcBean.czsj" value="${nbAqjcBean.czsj}" ></cps:textfield>
				</cps:tdContent>
			</cps:row> 
			<cps:row>
				<cps:tdLabel>登记人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djrxm" readonly="true" name="nbAqjcBean.djrxm" value="${nbAqjcBean.djrxm}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>登记单位：</cps:tdLabel>
				<cps:tdContent>
					<input id="djdwdm" name="nbAqjcBean.djdwdm" value="${nbAqjcBean.djdwdm }" type="hidden">
					<cps:textfield id="djdwmc" readonly="true" name="nbAqjcBean.djdwmc" value="${nbAqjcBean.djdwmc}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>登记时间：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="djsj" name="nbAqjcBean.djsj" value="${nbAqjcBean.djsj}" ></cps:textfield>
				</cps:tdContent>
			</cps:row>  
		</cps:table>    
		</fieldset>                                                           
	</div>
</cps:panel>
</cps:PanelView>
</form>
</creator:view>
 
