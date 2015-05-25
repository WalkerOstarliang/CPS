<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 文化部门检查表 --%>
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
						<font color="red">*</font>制定和落实内部治安保卫制度及工作责任制：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whzd01" value="aqjc.whzd01" id="whzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whzd01')" id="zpsc_whzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>制定突发事件处置紧急预案并组织开展演练：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whzd02" value="aqjc.whzd02" id="whzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whzd02')" id="zpsc_whzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>落实员工安全防范培训教育：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whzd03" value="aqjc.whzd03" id="whzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whzd03')" id="zpsc_whzd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>门卫实行人员物品出入查验登记手续：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whzd04" value="aqjc.whzd04" id="whzd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whzd04')" id="zpsc_whzd04" cssStyle="display:none"></cps:button>
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
						<font color="red">*</font>单位主要出入口及通道安装视频监控：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whjf01" value="aqjc.whjf01" id="whjf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whjf01')" id="zpsc_whjf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>车库（地下车库）安装视频监控装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whjf02" value="aqjc.whjf02" id="whjf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whjf02')" id="zpsc_whjf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>单位重点要害部位安装视频监控和入侵报警：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whjf03" value="aqjc.whjf03" id="whjf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whjf03')" id="zpsc_whjf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>设置周界报警装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whjf04" value="aqjc.whjf04" id="whjf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whjf04')" id="zpsc_whjf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>设置监控中心，对重要防护部位24小时实时报警：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whjf05" value="aqjc.whjf05" id="whjf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whjf05')" id="zpsc_whjf05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>视频监控和回放图像质量、图像存储时间、监控录制时间达标情况 ：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whjf06" value="aqjc.whjf06" id="whjf06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whjf06')" id="zpsc_whjf06" cssStyle="display:none"></cps:button>
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
						<font color="red">*</font>单位出入口安装门禁门：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whwf01" value="aqjc.whwf01" id="whwf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whwf01')" id="zpsc_whwf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>重点要害部位出入口安装防盗门、防盗窗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whwf02" value="aqjc.whwf02" id="whwf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whwf02')" id="zpsc_whwf02" cssStyle="display:none"></cps:button>
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
						<font color="red">*</font>设置与治安保卫任务相适应的治安保卫机构：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whrf01" value="aqjc.whrf01" id="whrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whrf01')" id="zpsc_whrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>配备专职保卫人员：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whrf02" value="aqjc.whrf02" id="whrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whrf02')" id="zpsc_whrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>单位出入口设值班室、配专职门卫：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whrf03" value="aqjc.whrf03" id="whrf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whrf03')" id="zpsc_whrf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>配备使用防卫器械和报警装备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whrf04" value="aqjc.whrf04" id="whrf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whrf04')" id="zpsc_whrf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>设置保卫力量巡逻巡更设备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.whrf05" value="aqjc.whrf05" id="whrf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('whrf05')" id="zpsc_whrf05" cssStyle="display:none"></cps:button>
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
							name="aqjc.wh_jzba01" value="aqjc.wh_jzba01" id="wh_jzba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wh_jzba01')" id="zpsc_wh_jzba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.wh_jzba02" value="aqjc.wh_jzba02" id="wh_jzba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wh_jzba02')" id="zpsc_wh_jzba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.wh_jzba03" value="aqjc.wh_jzba03" id="wh_jzba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wh_jzba03')" id="zpsc_wh_jzba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否认真履职，是较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.wh_jzba04" value="aqjc.wh_jzba04" id="wh_jzba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wh_jzba04')" id="zpsc_wh_jzba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
	</cps:row>
</cps:table>
