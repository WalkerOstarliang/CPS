<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--  内保卫生系统安全检查 --%>
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
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wszd01" name="aqjc.wszd01" value="aqjc.wszd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wszd01')" id="zpsc_wszd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>制定突发事件处置紧急预案并组织开展演练：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wszd02" name="aqjc.wszd02" value="aqjc.wszd02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wszd02')" id="zpsc_wszd02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>落实员工安全防范培训教育：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wszd03" name="aqjc.wszd03" value="aqjc.wszd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wszd03')" id="zpsc_wszd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>设立警务室：</cps:tdLabel>
					<cps:tdContent> 
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wszd04" name="aqjc.wszd04" value="aqjc.wszd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wszd04')" id="zpsc_wszd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			 </cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
			 	<cps:row>
			 		<cps:tdContent  colspan="3">技防</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>医院出入口及主要通道安装视频监控：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs01" name="aqjc.wsjs01" value="aqjc.wsjs01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs01')" id="zpsc_wsjs01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>停车场或地下机动车库通往地面的出口处安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs02" name="aqjc.wsjs02" value="aqjc.wsjs02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs02')" id="zpsc_wsjs02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>挂号、收费或现金结算处安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs03" name="aqjc.wsjs03" value="aqjc.wsjs03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs03')" id="zpsc_wsjs03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>门急诊输液室、急诊抢救室、重症监护室安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs04" name="aqjc.wsjs04" value="aqjc.wsjs04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs04')" id="zpsc_wsjs04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>药库房和放射源或剧毒麻醉药品存放地安装视频监控及入侵报警系统：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs05" name="aqjc.wsjs05" value="aqjc.wsjs05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs05')" id="zpsc_wsjs05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>电梯、配电间、贵重仪器设备存放地安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs06" name="aqjc.wsjs06" value="aqjc.wsjs06"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs06')" id="zpsc_wsjs06" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>病区过道走廊以及医患沟通部门安装视频监控：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs07" name="aqjc.wsjs07" value="aqjc.wsjs07"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs07')" id="zpsc_wsjs07" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>重症监护室、院长办公室安装门禁装置：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs08" name="aqjc.wsjs08" value="aqjc.wsjs08"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs08')" id="zpsc_wsjs08" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>设置安防控制中心，图像回放质量、图像存储时间、监控录制时间均应达标：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsjs09" name="aqjc.wsjs09" value="aqjc.wsjs09"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsjs09')" id="zpsc_wsjs09" cssStyle="display:none"></cps:button>
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
			 		<cps:tdContent  colspan="3">物防</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>医院周界封闭屏障应安装金属防护栏或实体墙：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wswf01" name="aqjc.wswf01" value="aqjc.wswf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wswf01')" id="zpsc_wswf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>药库房、剧毒精麻药品存放地、放射源、中心供氧站、配电间、挂号收费处、安防控制中心等部位应安装防盗门和金属防护栏：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wswf02" name="aqjc.wswf02" value="aqjc.wswf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wswf02')" id="zpsc_wswf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			 	
			 </cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
			 	<cps:row>
			 		<cps:tdContent  colspan="3">人防</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>设置与治安保卫任务相适应的治安保卫机构：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsrf01" name="aqjc.wsrf01" value="aqjc.wsrf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsrf01')" id="zpsc_wsrf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>配备专职保卫人员：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsrf02" name="aqjc.wsrf02" value="aqjc.wsrf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsrf02')" id="zpsc_wsrf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>安防控制中心有专人值守并做好值班记录：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="wsrf03" name="aqjc.wsrf03" value="aqjc.wsrf03"></s:radio>
					</cps:tdContent>	
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsrf03')" id="zpsc_wsrf03" cssStyle="display:none"></cps:button>
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
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="wsba01" name="aqjc.wsba01" value="aqjc.wsba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsba01')" id="zpsc_wsba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="wsba02" name="aqjc.wsba02" value="aqjc.wsba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsba02')" id="zpsc_wsba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="wsba03" name="aqjc.wsba03" value="aqjc.wsba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsba03')" id="zpsc_wsba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>保安员是否认真履职，有较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="wsba04" name="aqjc.wsba04" value="aqjc.wsba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('wsba04')" id="zpsc_wsba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			 </cps:table>
		</cps:tdContent>
	</cps:row>
</cps:table>
	