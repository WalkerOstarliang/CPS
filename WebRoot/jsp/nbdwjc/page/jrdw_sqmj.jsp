<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 金融单位（社区民警） --%>
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
						<font color="red">*</font>单位内部治安突发事件处置紧急预案：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhzd01" value="aqjc.yhzd01" id="yhzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhzd01')" id="zpsc_yhzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>组织开展紧急预案演练：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhzd02" value="aqjc.yhzd02" id="yhzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhzd02')" id="zpsc_yhzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>组织员工安全保卫学习：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhzd03" value="aqjc.yhzd03" id="yhzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhzd03')" id="zpsc_yhzd03" cssStyle="display:none"></cps:button>
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
						<font color="red">*</font>营业网点门前和大厅安装视频监控：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhjf01" value="aqjc.yhjf01" id="yhjf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhjf01')" id="zpsc_yhjf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>营业网点大厅安装入侵报警：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhjf02" value="aqjc.yhjf02" id="yhjf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhjf02')" id="zpsc_yhjf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>营业网点出入口和沿街窗户安装入侵报警 ：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhjf04" value="aqjc.yhjf04" id="yhjf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhjf04')" id="zpsc_yhjf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助银行应安装环境、门外视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhjf05" value="aqjc.yhjf05" id="yhjf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhjf05')" id="zpsc_yhjf05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>自助银行安装紧急求助按钮或求助电话及防电信诈骗语音提示：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhjf06" value="aqjc.yhjf06" id="yhjf06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('zbzd01')" id="zpsc_zbzd01" cssStyle="display:none"></cps:button>
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
							name="aqjc.yhwf01" value="aqjc.yhwf01" id="yhwf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('zbzd01')" id="zpsc_zbzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>营业网点二层（含二层）以下防盗窗或防弹玻璃：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhwf02" value="aqjc.yhwf02" id="yhwf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhjf06')" id="zpsc_yhjf06" cssStyle="display:none"></cps:button>
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
						<font color="red">*</font>配备专职（兼职）保卫人员：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhrf01" value="aqjc.yhrf01" id="yhrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhrf01')" id="zpsc_yhrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhrf02" value="aqjc.yhrf02" id="yhrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhrf02')" id="zpsc_yhrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>配备使用防卫器械和报警装备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.yhrf03" value="aqjc.yhrf03" id="yhrf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yhrf03')" id="zpsc_yhrf03" cssStyle="display:none"></cps:button>
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
							name="aqjc.yh_jzba01" value="aqjc.yh_jzba01" id="yh_jzba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yh_jzba01')" id="zpsc_yh_jzba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.yh_jzba02" value="aqjc.yh_jzba02" id="yh_jzba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yh_jzba02')" id="zpsc_yh_jzba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.yh_jzba03" value="aqjc.yh_jzba03" id="yh_jzba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yh_jzba03')" id="zpsc_yh_jzba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否认真履职，是较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.yh_jzba04" value="aqjc.yh_jzba04" id="yh_jzba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('yh_jzba04')" id="zpsc_yh_jzba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
	</cps:row>
</cps:table> 