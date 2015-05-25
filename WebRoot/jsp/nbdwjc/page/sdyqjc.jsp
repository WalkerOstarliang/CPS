<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 三电油气检查表 --%>
<cps:table>
	<cps:row>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">制度防范</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>成立安全防范领导小组：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd01" value="aqjc.jyzd01" id="jyzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd01')" id="zpsc_jyzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>值班守护制度：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd02" value="aqjc.jyzd02" id="jyzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd02')" id="zpsc_jyzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>收费管理制度：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd03" value="aqjc.jyzd03" id="jyzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd03')" id="zpsc_jyzd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>现金管理制度：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd04" value="aqjc.jyzd04" id="jyzd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd04')" id="zpsc_jyzd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>防范设施管理制度：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd05" value="aqjc.jyzd05" id="jyzd05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd05')" id="zpsc_jyzd05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>处置突发事件预案：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd06" value="aqjc.jyzd06" id="jyzd06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd06')" id="zpsc_jyzd06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>消防、安全生产(经营)制度：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd07" value="aqjc.jyzd07" id="jyzd07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd07')" id="zpsc_jyzd07" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>组织处置突发事件演练：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd08" value="aqjc.jyzd08" id="jyzd08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd08')" id="zpsc_jyzd08" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>对员工安全防范培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyzd09" value="aqjc.jyzd09" id="jyzd09"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyzd09')" id="zpsc_jyzd09" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row> 	
			</cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">视频监控</cps:tdContent>
				</cps:row>
				 <cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>加油(气)站出入口安装视频监控：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jysp01" value="aqjc.jysp01" id="jysp01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp01')" id="zpsc_jysp01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>收费处(现金存放室)IC卡充值安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jysp02" value="aqjc.jysp02" id="jysp02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp02')" id="zpsc_jysp02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>加油区、油库(罐)区等重要部位安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'清晰','0':'不清晰'}" cssClass="validate[required]"
							name="aqjc.jysp03" value="aqjc.jysp03" id="jysp03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp03')" id="zpsc_jysp03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>视频监控图像：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'清晰','0':'不清晰'}" cssClass="validate[required]"
							name="aqjc.jysp04" value="aqjc.jysp04" id="jysp04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp04')" id="zpsc_jysp04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>视频监控图像回放：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jysp05" value="aqjc.jysp05" id="jysp05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp05')" id="zpsc_jysp05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>监控录制时间24小时：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jysp06" value="aqjc.jysp06" id="jysp06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp06')" id="zpsc_jysp06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>图像存储时间满足规定的30天期限要求：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jysp07" value="aqjc.jysp07" id="jysp07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp07')" id="zpsc_jysp07" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>视频监控是否与公安联网：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jysp08" value="aqjc.jysp08" id="jysp08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jysp08')" id="zpsc_jysp08" cssStyle="display:none"></cps:button>
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
					<cps:tdContent colspan="3">报警系统</cps:tdContent>	
				</cps:row>	
				 <cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>具备入侵条件的油库(罐)区入侵警报装置：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jybj01" value="aqjc.jybj01" id="jybj01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jybj01')" id="zpsc_jybj01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>入侵警报装置与公安局110联网或与值班室联网：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jybj02" value="aqjc.jybj02" id="jybj02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jybj02')" id="zpsc_jybj02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>重要部门入侵警报装置 ：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jybj03" value="aqjc.jybj03" id="jybj03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jybj03')" id="zpsc_jybj03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>收费处、IC卡充值紧急报警按钮：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jybj04" value="aqjc.jybj04" id="jybj04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jybj04')" id="zpsc_jybj04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>紧急报警按钮与公安110联网：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jybj05" value="aqjc.jybj05" id="jybj05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jybj05')" id="zpsc_jybj05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">物防</cps:tdContent>	
				</cps:row>	
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>收费处(现金存放室)IC卡充值出入口防盗门：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jywf01" value="aqjc.jywf01" id="jywf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jywf01')" id="zpsc_jywf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>收费柜台上方安装金属防护栏或防弹玻璃：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jywf02" value="aqjc.jywf02" id="jywf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jywf02')" id="zpsc_jywf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>收费处(现金存放室)IC卡充值窗口金属防护栏：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jywf03" value="aqjc.jywf03" id="jywf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jywf03')" id="zpsc_jywf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>油库(罐)区应对加、取油口等部位采取防破坏、防盗窃防护措施：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jywf04" value="aqjc.jywf04" id="jywf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jywf04')" id="zpsc_jywf04" cssStyle="display:none"></cps:button>
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
					<cps:tdContent colspan="3">人防</cps:tdContent>	
				</cps:row>	
				 <cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>配备专职保卫人员：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:select list="#{'1':'聘请保安','2':'聘请物业','3':'自建防护力量'}" cssClass="validate[required] cps-select"
							name="aqjc.jyrf01" value="aqjc.jyrf01" headerKey="" headerValue=" " id="jyrf01"></s:select>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyrf01')" id="zpsc_jyrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>佩戴防卫装备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]"
							name="aqjc.jyrf02" value="aqjc.jyrf02" id="jyrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jyrf02')" id="zpsc_jyrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent colspan="3">保安监管</cps:tdContent>	
				</cps:row>	
				<cps:row>
					<cps:tdLabel width="50%">
						<font color="red">*</font>保安员全部持《保安员证》上岗：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jy_jzba01" value="aqjc.jy_jzba01" id="jy_jzba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jy_jzba01')" id="zpsc_jy_jzba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jy_jzba02" value="aqjc.jy_jzba02" id="jy_jzba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jy_jzba02')" id="zpsc_jy_jzba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jy_jzba03" value="aqjc.jy_jzba03" id="jy_jzba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jy_jzba03')" id="zpsc_jy_jzba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>
						<font color="red">*</font>保安员是否认真履职，是较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]"
							name="aqjc.jy_jzba04" value="aqjc.jy_jzba04" id="jy_jzba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('jy_jzba04')" id="zpsc_jy_jzba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>	
		</cps:tdContent>
	</cps:row>
</cps:table>