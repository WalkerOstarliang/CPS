<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--  内保党政机关安全检查 --%>
<cps:table>
	<cps:row>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">制度防范</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>制定和落实内部治安保卫制度及工作责任制：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzzd01" name="aqjc.dzzd01" value="aqjc.dzzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzzd01')" id="zpsc_dzzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>制定突发事件处置紧急预案并组织开展演练：</cps:tdLabel>
					<cps:tdContent> 
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzzd02" name="aqjc.dzzd02" value="aqjc.dzzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzzd02')" id="zpsc_dzzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>落实员工安全防范培训教育：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzzd03" name="aqjc.dzzd03" value="aqjc.dzzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzzd03')" id="zpsc_dzzd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>门卫实行人员物品出入查验登记手续：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzzd04" name="aqjc.dzzd04" value="aqjc.dzzd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzzd04')" id="zpsc_dzzd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">技防</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>机关大院主要出入口安装视频监控：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf01" name="aqjc.dzjf01" value="aqjc.dzjf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf01')" id="zpsc_dzjf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>重点要害部位安装视频监控和入侵报警：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf02" name="aqjc.dzjf02" value="aqjc.dzjf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf02')" id="zpsc_dzjf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>公共部门主要通道安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf03" name="aqjc.dzjf03" value="aqjc.dzjf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf03')" id="zpsc_dzjf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>车库（地下车库）安装视频监控装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf04" name="aqjc.dzjf04" value="aqjc.dzjf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf04')" id="zpsc_dzjf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>设置周界报警装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf05" name="aqjc.dzjf05" value="aqjc.dzjf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf05')" id="zpsc_dzjf05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>设置监控中心，对重要防护部位24小时实时报警：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf06" name="aqjc.dzjf06" value="aqjc.dzjf06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf06')" id="zpsc_dzjf06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>重点要害部位、办公大楼出入口安装门禁控制装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf07" name="aqjc.dzjf07" value="aqjc.dzjf07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf07')" id="zpsc_dzjf07" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>视频监控和回放图像质量、图像存储时间、监控录制时间达标情况：</cps:tdLabel>
					<cps:tdContent> 
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzjf08" name="aqjc.dzjf08" value="aqjc.dzjf08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzjf08')" id="zpsc_dzjf08" cssStyle="display:none"></cps:button>
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
					<cps:tdLabel width="50%"><font color='red'>*</font>机关大院出入口安装门禁门：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzwf01" name="aqjc.dzwf01" value="aqjc.dzwf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzwf01')" id="zpsc_dzwf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>重点要害部位出入口安装防盗门：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzwf02" name="aqjc.dzwf02" value="aqjc.dzwf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzwf02')" id="zpsc_dzwf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>重点要害部位安装防盗门、防盗窗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzwf03" name="aqjc.dzwf03" value="aqjc.dzwf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzwf03')" id="zpsc_dzwf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>		
				</cps:row>
			</cps:table>	
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">人防</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>设置治安保卫机构并配备专职保卫人员：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzrf01" name="aqjc.dzrf01" value="aqjc.dzrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzrf01')" id="zpsc_dzrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>出入口设值班室、专职门卫：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzrf02" name="aqjc.dzrf02" value="aqjc.dzrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzrf02')" id="zpsc_dzrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>配备使用防卫器械和报警装备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzrf03" name="aqjc.dzrf03" value="aqjc.dzrf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzrf03')" id="zpsc_dzrf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>设置保卫力量巡逻巡更设备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="dzrf04" name="aqjc.dzrf04" value="aqjc.dzrf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzrf04')" id="zpsc_dzrf04" cssStyle="display:none"></cps:button>
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
					<cps:tdLabel width="50%"><font color='red'>*</font>保安员全部持《保安员证》上岗：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="dzba01" name="aqjc.dzba01" value="aqjc.dzba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzba01')" id="zpsc_dzba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="dzba02" name="aqjc.dzba02" value="aqjc.dzba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzba02')" id="zpsc_dzba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="dzba03" name="aqjc.dzba03" value="aqjc.dzba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzba03')" id="zpsc_dzba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>保安员是否认真履职，有较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="dzba04" name="aqjc.dzba04" value="aqjc.dzba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('dzba04')" id="zpsc_dzba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>	
		</cps:tdContent>
	</cps:row>
</cps:table>
