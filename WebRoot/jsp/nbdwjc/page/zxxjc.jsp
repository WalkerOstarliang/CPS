<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 中小学校检查表 --%>
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
						<font color="red">*</font>校园封闭式管理是否落实到位：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxzd01" value="aqjc.xxzd01" id="xxzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxzd01')" id="zpsc_xxzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>门卫制度是否严格执行：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxzd02" value="aqjc.xxzd02" id="xxzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxzd02')" id="zpsc_xxzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>是否制定保卫制度：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxzd03" value="aqjc.xxzd03" id="xxzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxzd03')" id="zpsc_xxzd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>上学、放学时段单位护校人员是否到岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxzd04" value="aqjc.xxzd04" id="xxzd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxzd04')" id="zpsc_xxzd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>预案与演练是否制定和开展：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxzd05" value="aqjc.xxzd05" id="xxzd05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxzd05')" id="zpsc_xxzd05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>校园周边巡防力量是否到位：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxzd06" value="aqjc.xxzd06" id="xxzd06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxzd06')" id="zpsc_xxzd06" cssStyle="display:none"></cps:button>
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
						<font color="red">*</font>护卫装备是否配备齐全（两种以上）：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxjf01" value="aqjc.xxjf01" id="xxjf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxjf01')" id="zpsc_xxjf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>110联网紧急报警系统是否安装：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxjf02" value="aqjc.xxjf02" id="xxjf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxjf02')" id="zpsc_xxjf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>视频监控安装情况：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxjf03" value="aqjc.xxjf03" id="xxjf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxjf03')" id="zpsc_xxjf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>周界报警安装情况：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxjf04" value="aqjc.xxjf04" id="xxjf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxjf04')" id="zpsc_xxjf04" cssStyle="display:none"></cps:button>
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
						<font color="red">*</font>主要出入口安装金属防护门：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxwf01" value="aqjc.xxwf01" id="xxwf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxwf01')" id="zpsc_xxwf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>重要部位安装符合国家标准的防盗门：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxwf02" value="aqjc.xxwf02" id="xxwf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxwf02')" id="zpsc_xxwf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>重要部位窗户安装金属防护栏：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxwf03" value="aqjc.xxwf03" id="xxwf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxwf03')" id="zpsc_xxwf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
					<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>事故易发部位设置防护设施和警示标志：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxwf04" value="aqjc.xxwf04" id="xxwf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxwf04')" id="zpsc_xxwf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
					<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>供水、供电、供气、供热等部位设置实体防护装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxwf05" value="aqjc.xxwf05" id="xxwf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxwf05')" id="zpsc_xxwf05" cssStyle="display:none"></cps:button>
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
							name="aqjc.xxrf01" value="aqjc.xxrf01" id="xxrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxrf01')" id="zpsc_xxrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展教育和培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.xxrf02" value="aqjc.xxrf02" id="xxrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xxrf02')" id="zpsc_xxrf02" cssStyle="display:none"></cps:button>
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
							name="aqjc.xx_jzba01" value="aqjc.xx_jzba01" id="xx_jzba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xx_jzba01')" id="zpsc_xx_jzba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.xx_jzba02" value="aqjc.xx_jzba02" id="xx_jzba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xx_jzba02')" id="zpsc_xx_jzba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.xx_jzba03" value="aqjc.xx_jzba03" id="xx_jzba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xx_jzba03')" id="zpsc_xx_jzba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否认真履职，是较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.xx_jzba04" value="aqjc.xx_jzba04" id="xx_jzba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('xx_jzba04')" id="zpsc_xx_jzba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
	</cps:row>
</cps:table>