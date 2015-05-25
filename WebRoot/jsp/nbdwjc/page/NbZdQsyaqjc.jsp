<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--  内保重点企事业安全检查 --%>
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
					<cps:tdLabel><font color='red'>*</font>制定和落实内部治安保卫制度：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd01" name="aqjc.jzzd01" value="aqjc.jzzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd01')" id="zpsc_jzzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>制定单位内部治安突发事件处置紧急预案：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd02" name="aqjc.jzzd02" value="aqjc.jzzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd02')" id="zpsc_jzzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>组织开展紧急预案演练：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd03" name="aqjc.jzzd03" value="aqjc.jzzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd03')" id="zpsc_jzzd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>设置治安保卫机构：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd04" name="aqjc.jzzd04" value="aqjc.jzzd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd04')" id="zpsc_jzzd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>配备专职保卫人员：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd05" name="aqjc.jzzd05" value="aqjc.jzzd05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd05')" id="zpsc_jzzd05" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>落实内部治安保卫工作责任制：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd06" name="aqjc.jzzd06" value="aqjc.jzzd06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd06')" id="zpsc_jzzd06" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>对员工安全防范培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd07" name="aqjc.jzzd07" value="aqjc.jzzd07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd07')" id="zpsc_jzzd07" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>人员、物品、车辆出入登记手续：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzzd08" name="aqjc.jzzd08" value="aqjc.jzzd08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzzd08')" id="zpsc_jzzd08" cssStyle="display:none"></cps:button>
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
					<cps:tdLabel ><font color='red'>*</font>重点要害部位安装入侵报警系统：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzsp01" name="aqjc.jzsp01" value="aqjc.jzsp01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzsp01')" id="zpsc_jzsp01" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>重点要害部位安装的入侵报警系统与市局110联网：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzsp02" name="aqjc.jzsp02" value="aqjc.jzsp02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzsp02')" id="zpsc_jzsp02" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>重点要害部位安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzsp03" name="aqjc.jzsp03" value="aqjc.jzsp03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzsp03')" id="zpsc_jzsp031" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>视频监控图像：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'清晰','0':'不清晰'}" cssClass="validate[required]" id="jzsp04" name="aqjc.jzsp04" value="aqjc.jzsp04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzsp04')" id="zpsc_jzsp04" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>回放图像质量：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'清晰','0':'不清晰'}" cssClass="validate[required]" id="jzsp05" name="aqjc.jzsp05" value="aqjc.jzsp05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzsp05')" id="zpsc_jzsp05" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>图像存储时间满足规定的30天期限要求：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzsp06" name="aqjc.jzsp06" value="aqjc.jzsp06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzsp06')" id="zpsc_jzsp06" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>监控录制时间24小时：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzsp07" name="aqjc.jzsp07" value="aqjc.jzsp07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzsp07')" id="zpsc_jzsp07" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>重点区域安装周界报警：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzbj02" name="aqjc.jzbj02" value="aqjc.jzbj02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzbj02')" id="zpsc_jzbj02" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>主要出入口门禁系统：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzbj08" name="aqjc.jzbj08" value="aqjc.jzbj08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzbj08')" id="zpsc_jzbj08" cssStyle="display:none"></cps:button>
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
					<cps:tdLabel><font color='red'>*</font>重点要害部位出入口防盗门：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzwf01" name="aqjc.jzwf01" value="aqjc.jzwf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzwf01')" id="zpsc_jzwf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>重点要害部位防盗窗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzwf02" name="aqjc.jzwf02" value="aqjc.jzwf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzwf02')" id="zpsc_jzwf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>财务室防盗门：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzwf03" name="aqjc.jzwf03" value="aqjc.jzwf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzwf03')" id="zpsc_jzwf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>财务室防盗窗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzwf04" name="aqjc.jzwf04" value="aqjc.jzwf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzwf04')" id="zpsc_jzwf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>财务室保险箱是否与墙面或地面固定：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzwf05" name="aqjc.jzwf05" value="aqjc.jzwf05"></s:radio>
					</cps:tdContent>	
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzwf05')" id="zpsc_jzwf05" cssStyle="display:none"></cps:button>
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
					<cps:tdLabel ><font color='red'>*</font>配备足够数量的安保人员：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzrf01" name="aqjc.jzrf01" value="aqjc.jzrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzrf01')" id="zpsc_jzrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>进行上岗前培训和定期开展培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzrf02" name="aqjc.jzrf02" value="aqjc.jzrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzrf02')" id="zpsc_jzrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>配备使用防卫器械和报警装备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="jzrf03" name="aqjc.jzrf03" value="aqjc.jzrf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzrf03')" id="zpsc_jzrf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>重点要害部位值守力量是否到位：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzrf04" name="aqjc.jzrf04" value="aqjc.jzrf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzrf04')" id="zpsc_jzrf04" cssStyle="display:none"></cps:button>
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
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzba01" name="aqjc.jzba01" value="aqjc.jzba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzba01')" id="zpsc_jzba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzba02" name="aqjc.jzba02" value="aqjc.jzba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzba02')" id="zpsc_jzba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzba03" name="aqjc.jzba03" value="aqjc.jzba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzba03')" id="zpsc_jzba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>		
				<cps:row>		
					<cps:tdLabel><font color='red'>*</font>保安员是否认真履职，有较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="jzba04" name="aqjc.jzba04" value="aqjc.jzba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jzba04')" id="zpsc_jzba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>	
				</cps:row>	
			</cps:table>	
		</cps:tdContent>
	</cps:row>
</cps:table>
 