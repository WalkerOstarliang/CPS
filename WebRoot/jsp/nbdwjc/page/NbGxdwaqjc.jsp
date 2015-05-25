<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--  内保高校安全检查 --%>
<cps:table>
	<cps:row>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent>
					制度防范
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>制定和落实内部治安保卫制度及工作责任制：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxzd01" name="aqjc.gxzd01" value="aqjc.gxzd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxzd01')" id="zpsc_gxzd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>针对各类突发事件、灾害事件、安全事故等制定紧急处置预案：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxzd02" name="aqjc.gxzd02" value="aqjc.gxzd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxzd02')" id="zpsc_gxzd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>根据预案每年至少组织一次演练：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxzd03" name="aqjc.gxzd03" value="aqjc.gxzd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxzd03')" id="zpsc_gxzd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>落实师生及员工的安全防范培训教育：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxzd04" name="aqjc.gxzd04" value="aqjc.gxzd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxzd04')" id="zpsc_gxzd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent>
					技防
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>学校主要出入口安装视频监控：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf01" name="aqjc.gxjf01" value="aqjc.gxjf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf01')" id="zpsc_gxjf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>重点要害部位安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf02" name="aqjc.gxjf02" value="aqjc.gxjf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf02')" id="zpsc_gxjf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>重点要害部位安装入侵报警装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf03" name="aqjc.gxjf03" value="aqjc.gxjf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf03')" id="zpsc_gxjf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>校内公共部位主要通道安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf04" name="aqjc.gxjf04" value="aqjc.gxjf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf04')" id="zpsc_gxjf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>停车场、车库（地下车库）安装视频监控装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf05" name="aqjc.gxjf05" value="aqjc.gxjf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf05')" id="zpsc_gxjf05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>设置监控中心并24小时值守：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf06" name="aqjc.gxjf06" value="aqjc.gxjf06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf06')" id="zpsc_gxjf06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>视频监控和回放图像质量清晰，监控24小时录像，存储时间不少于30天：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf07" name="aqjc.gxjf07" value="aqjc.gxjf07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf07')" id="zpsc_gxjf07" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>学校所属的学生宿舍（公寓）出入口安装门禁系统：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxjf08" name="aqjc.gxjf08" value="aqjc.gxjf08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxjf08')" id="zpsc_gxjf08" cssStyle="display:none"></cps:button>
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
					<cps:tdContent>
					物防
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>学校主要出入口安装防撞击金属门：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxwf01" name="aqjc.gxwf01" value="aqjc.gxwf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxwf01')" id="zpsc_gxwf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>学校主要出入口、主干道设置机动车减速装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxwf02" name="aqjc.gxwf02" value="aqjc.gxwf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxwf02')" id="zpsc_gxwf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>重点要害部位安装符合标准的防盗门、窗或金属护栏：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxwf03" name="aqjc.gxwf03" value="aqjc.gxwf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxwf03')" id="zpsc_gxwf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>财务室保险箱与墙面或地面固定：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxwf04" name="aqjc.gxwf04" value="aqjc.gxwf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxwf04')" id="zpsc_gxwf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>对供水、供电、供气、供热、供油等场所、部位设置相应的实体防护设施：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxwf05" name="aqjc.gxwf05" value="aqjc.gxwf05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxwf05')" id="zpsc_gxwf05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>对高台、楼梯、水域等易发生坠落、踩踏、溺水等安全事故的场所、部位设置警示标志和相应的防护设施：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxwf06" name="aqjc.gxwf06" value="aqjc.gxwf06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxwf06')" id="zpsc_gxwf06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
			</cps:table>	
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
				<cps:row>
					<cps:tdContent>
					人防
					</cps:tdContent>
				</cps:row>	
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>设置专职安全保卫机构：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxrf01" name="aqjc.gxrf01" value="aqjc.gxrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxrf01')" id="zpsc_gxrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>配备专职保卫力量和保安人员：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxrf02" name="aqjc.gxrf02" value="aqjc.gxrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxrf02')" id="zpsc_gxrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>主要出入口保安（门卫）人员24小时在岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxrf03" name="aqjc.gxrf03" value="aqjc.gxrf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxrf03')" id="zpsc_gxrf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>主要出入口保安（门卫）人员对外来人员、车辆实行登记、确认、查验管理：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="gxrf04" name="aqjc.gxrf04" value="aqjc.gxrf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxrf04')" id="zpsc_gxrf04" cssStyle="display:none"></cps:button>
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
					<cps:tdContent>
					保安监管
					</cps:tdContent>
				</cps:row>	
				<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>保安员全部持《保安员证》上岗：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="gxba01" name="aqjc.gxba01" value="aqjc.gxba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxba01')" id="zpsc_gxba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="gxba02" name="aqjc.gxba02" value="aqjc.gxba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxba02')" id="zpsc_gxba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="gxba03" name="aqjc.gxba03" value="aqjc.gxba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxba03')" id="zpsc_gxba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>保安员是否认真履职，有较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="gxba04" name="aqjc.gxba04" value="aqjc.gxba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('gxba04')" id="zpsc_gxba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>	
		</cps:tdContent>
	</cps:row>
</cps:table>









	