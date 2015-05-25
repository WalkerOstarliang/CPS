<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 金融单位（内保民警） --%>
<cps:table>
	<cps:row>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">			
						制度防范
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>制定和落实内部治安保卫制度：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrzd01" value="aqjc.jrzd01" id="jrzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrzd01')" id="zpsc_jrzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>制定单位内部治安突发事件处置紧急预案：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrzd02" value="aqjc.jrzd02" id="jrzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrzd02')" id="zpsc_jrzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>组织开展紧急预案演练：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrzd03" value="aqjc.jrzd03" id="jrzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrzd03')" id="zpsc_jrzd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>设置治安保卫机构：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrzd04" value="aqjc.jrzd04" id="jrzd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrzd04')" id="zpsc_jrzd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>配备专职保卫人员或兼职保卫人员：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrzd05" value="aqjc.jrzd05" id="jrzd05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrzd05')" id="zpsc_jrzd05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>落实内部治安保卫工作责任制：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrzd06" value="aqjc.jrzd06" id="jrzd06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrzd06')" id="zpsc_jrzd06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>对员工安全防范培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrzd07" value="aqjc.jrzd07" id="jrzd07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrzd07')" id="zpsc_jrzd07" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">			
						技防
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>营业网点大厅、库包交接视频监控全覆盖：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf01" value="aqjc.jrjf01" id="jrjf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf01')" id="zpsc_jrjf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>营业网点出入口现金和非现金区域安装视频监控（含隐蔽探头）：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf02" value="aqjc.jrjf02" id="jrjf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf02')" id="zpsc_jrjf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>营业网点大厅、出入口、现金区域、沿街门窗安装入侵报警 ：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf03" value="aqjc.jrjf03" id="jrjf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf03')" id="zpsc_jrjf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>现金和非现金柜台安装紧急按钮：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf04" value="aqjc.jrjf04" id="jrjf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf04')" id="zpsc_jrjf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助银行应安装环境、门外、现金装填区域视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf05" value="aqjc.jrjf05" id="jrjf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf05')" id="zpsc_jrjf05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助银行能实现报警图像、声音、对讲广播等信息的远程传输和监控功能 ：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf06" value="aqjc.jrjf06" id="jrjf06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf06')" id="zpsc_jrjf06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助银行安装紧急求助按钮或求助电话及防电信诈骗语音提示：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf07" value="aqjc.jrjf07" id="jrjf07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf07')" id="zpsc_jrjf07" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助银行现金装填区安装有、无线入侵报警：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf08" value="aqjc.jrjf08" id="jrjf08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf08')" id="zpsc_jrjf08" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>视频监控回放图像清晰，保存时间不少于30天，实现远程监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf09" value="aqjc.jrjf09" id="jrjf09"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf09')" id="zpsc_jrjf09" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助设备视频监控系统具有自检功能，死机时能自动重启：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf10" value="aqjc.jrjf10" id="jrjf10"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf10')" id="zpsc_jrjf10" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助设备电子屏幕显示必要的安全提示：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf11" value="aqjc.jrjf11" id="jrjf11"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf11')" id="zpsc_jrjf11" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>离行式自助设备安装环境视频监控及防电信诈骗语音提示：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf12" value="aqjc.jrjf12" id="jrjf12"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf12')" id="zpsc_jrjf12" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>离行式自助设备安装防撬和入侵报警装置 ：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf13" value="aqjc.jrjf13" id="jrjf13"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf13')" id="zpsc_jrjf13" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>其他技防符合GA38-2004、GA745-2008规定：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrjf14" value="aqjc.jrjf14" id="jrjf14"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrjf14')" id="zpsc_jrjf14" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>	
		</cps:tdContent>
	</cps:row>
</cps:table>
<cps:table>
	<cps:row>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">物防</cps:tdContent>	
				</cps:row>	
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>营业网点出入口防盗门：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrwf01" value="aqjc.jrwf01" id="jrwf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrwf01')" id="zpsc_jrwf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>营业网点二层（含二层）以下防盗窗或防弹玻璃：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrwf02" value="aqjc.jrwf02" id="jrwf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrwf02')" id="zpsc_jrwf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助设备与安装地面牢固连接：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrwf03" value="aqjc.jrwf03" id="jrwf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrwf03')" id="zpsc_jrwf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助设备各种外接线缆有防护措施，接插件应置于封闭的刚性防护体内：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrwf04" value="aqjc.jrwf04" id="jrwf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrwf04')" id="zpsc_jrwf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>离行式自助设备加钞区应在砖墙或钢质封闭区内：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrwf05" value="aqjc.jrwf05" id="jrwf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrwf05')" id="zpsc_jrwf05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>其他物防符合GA38-2004、GA745-2008规定：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrwf06" value="aqjc.jrwf06" id="jrwf06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrwf06')" id="zpsc_jrwf06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3"> 人防 </cps:tdContent>	
				</cps:row>	
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>配备专职保卫人员：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrrf01" value="aqjc.jrrf01" id="jrrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrrf01')" id="zpsc_jrrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrrf02" value="aqjc.jrrf02" id="jrrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrrf02')" id="zpsc_jrrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>配备使用防卫器械和报警装备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrrf03" value="aqjc.jrrf03" id="jrrf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrrf03')" id="zpsc_jrrf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保卫力量巡逻巡更设备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jrrf04" value="aqjc.jrrf04" id="jrrf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jrrf04')" id="zpsc_jrrf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row> 	
			</cps:table>	
		</cps:tdContent>
	</cps:row>
</cps:table>
<cps:table>
	<cps:row>
		<cps:tdContent valign="top">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">保安监管</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>保安员全部持《保安员证》上岗：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jr_jzba01" value="aqjc.jr_jzba01" id="jr_jzba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jr_jzba01')" id="zpsc_jr_jzba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jr_jzba02" value="aqjc.jr_jzba02" id="jr_jzba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jr_jzba02')" id="zpsc_jr_jzba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jr_jzba03" value="aqjc.jr_jzba03" id="jr_jzba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jr_jzba03')" id="zpsc_jr_jzba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否认真履职，是较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jr_jzba04" value="aqjc.jr_jzba04" id="jr_jzba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jr_jzba04')" id="zpsc_jr_jzba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
	</cps:row>
</cps:table> 