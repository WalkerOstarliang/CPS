<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--  内保一般单位安全检查 --%>
<cps:table>
	<cps:row>
		<cps:tdContent valign="top" width="50%">
			 <cps:table>
			 	<cps:row>
			 		<cps:tdContent>制度防范</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>制定和落实内部治安保卫制度：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1zd01" name="aqjc.j1zd01" value="aqjc.j1zd01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1zd01')" id="zpsc_j1zd01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>落实内部治安保卫工作责任制：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1zd03" name="aqjc.j1zd03" value="aqjc.j1zd03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1zd03')" id="zpsc_j1zd03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>落实员工安全防范培训教育：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1zd04" name="aqjc.j1zd04" value="aqjc.j1zd04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1zd04')" id="zpsc_j1zd04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>人员物品出入登记手续：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1zd05" name="aqjc.j1zd05" value="aqjc.j1zd05"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1zd05')" id="zpsc_j1zd05" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			 </cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
			 	<cps:row>
			 		<cps:tdContent>技防</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>重点要害部位安装视频监控或入侵报警系统：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1jf01" name="aqjc.j1jf01" value="aqjc.j1jf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1jf01')" id="zpsc_j1jf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>视频监控或入侵报警系统运转正常：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="j1jf02" name="aqjc.j1jf02" value="aqjc.j1jf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1jf02')" id="zpsc_j1jf02" cssStyle="display:none"></cps:button>
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
			 		<cps:tdContent>物防</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>重点要害部位出入口防盗门：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1wf01" name="aqjc.j1wf01" value="aqjc.j1wf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1wf01')" id="zpsc_j1wf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>重点要害部位防盗窗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1wf02" name="aqjc.j1wf02" value="aqjc.j1wf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1wf02')" id="zpsc_j1wf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>财务室防盗门：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1wf03" name="aqjc.j1wf03" value="aqjc.j1wf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1wf03')" id="zpsc_j1wf03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>财务室防盗窗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1wf04" name="aqjc.j1wf04" value="aqjc.j1wf04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1wf04')" id="zpsc_j1wf04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			 </cps:table>
		</cps:tdContent>
		<cps:tdContent valign="top" width="50%">
			<cps:table>
			 	<cps:row>
			 		<cps:tdContent>人防</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>配备足够数量的安保人员：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="j1rf01" name="aqjc.j1rf01" value="aqjc.j1rf01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1rf01')" id="zpsc_j1rf01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>进行上岗前培训和定期开展培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1rf02" name="aqjc.j1rf02" value="aqjc.j1rf02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1rf02')" id="zpsc_j1rf02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>配备使用防卫器械和报警装备：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'有','0':'无'}" cssClass="validate[required]" id="j1rf03" name="aqjc.j1rf03" value="aqjc.j1rf03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1rf03')" id="zpsc_j1rf03" cssStyle="display:none"></cps:button>
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
			 		<cps:tdContent>保安监管</cps:tdContent>
			 	</cps:row>
			 	<cps:row>
					<cps:tdLabel width="50%"><font color='red'>*</font>保安员全部持《保安员证》上岗：</cps:tdLabel>
					<cps:tdContent width="50%">
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="j1ba01" name="aqjc.j1ba01" value="aqjc.j1ba01"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1ba01')" id="zpsc_j1ba01" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>定期开展教育、培训：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="j1ba02" name="aqjc.j1ba02" value="aqjc.j1ba02"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1ba02')" id="zpsc_j1ba02" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>保安员是否着符合要求的保安员服装上岗：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="j1ba03" name="aqjc.j1ba03" value="aqjc.j1ba03"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1ba03')" id="zpsc_j1ba03" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>	
				<cps:row>	
					<cps:tdLabel><font color='red'>*</font>保安员是否认真履职，有较强的安全防范意识：</cps:tdLabel>
					<cps:tdContent>
						<s:radio list="#{'1':'是','0':'否'}" cssClass="validate[required]" id="j1ba04" name="aqjc.j1ba04" value="aqjc.j1ba04"></s:radio>
					</cps:tdContent>
					<cps:tdContent>
						<cps:button value="上传照片" onclick="tozpxxPage('j1ba04')" id="zpsc_j1ba04" cssStyle="display:none"></cps:button>
					</cps:tdContent>
				</cps:row>
			 </cps:table>
		</cps:tdContent>
	</cps:row>
</cps:table>
