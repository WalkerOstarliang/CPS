<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="nbdw_div">
	<%-- 
	<creator:tbar id="dw_op">
		<cps:button value="保存" onclick="saveNbdwBean()"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</creator:tbar>
	<creator:panel id="nbdw_panel" title="企事业单位" tbarId="dw_op" height="window">
	--%>
		<input type="hidden" name="dw.nbdw.nbdwbh" id="nbdwbh" value="${dw.nbdw.nbdwbh}" />
		<input type="hidden" id="jgbh" name="dw.nbdw.jgbh" value="${dw.dwjbxx.jgbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel><font color="red">*</font>单位分类：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="dwxl" zdlb="ZDY_DWFL" name="dw.nbdw.dwxl" value="${dw.nbdw.dwxl}" optgroup="true" headerKey="" headerValue=" " required="true"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="10%"><font color="red">*</font>单位性质：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:select name="dw.nbdw.dwxz" value="${dw.nbdw.dwxz}" id="dwxz" required="true" headerValue="--请选择--" headerKey="" zdlb="ZAGL_DWXZ"/>
				</cps:tdContent>
				<!-- 
				<cps:tdLabel>重点级别：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.nbdw.zddj" value="${dw.nbdw.zddj}" zdlb="ZAGL_ZDDJ" headerKey="" headerValue="--请选择--"/>
				</cps:tdContent>
				 -->
				 <cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>&nbsp;</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="13%"><font color="red">*</font>负责人身份证：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield name="dw.nbdw.bwbmfzrsfzh" value="${dw.nbdw.bwbmfzrsfzh}" required="true" id="bwbmfzrsfzh" isSfzh="true" onblur="queryRyBysfz(this.value,'bwbmfzr','fzrdh')" />
				</cps:tdContent>
				<cps:tdLabel width="13%"><font color="red">*</font>保卫负责人：</cps:tdLabel>
				<cps:tdContent width="20%">
					<cps:textfield name="dw.nbdw.bwbmfzr" value="${dw.nbdw.bwbmfzr}" id="bwbmfzr" maxlength="15" required="true"/>
				</cps:tdContent>
				<cps:tdLabel width="10%">负责人电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.bwfzrlxdh" value="${dw.nbdw.bwfzrlxdh}" id="fzrdh" maxlength="20" minlength="7" isPhone="true"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>单位联络人：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.dwllr" value="${dw.nbdw.dwllr}" id="dwllr" maxlength="15"/>
				</cps:tdContent>
				
				<cps:tdLabel>内外网互通：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'1' : '是','0' : '否'}" name="dw.nbdw.sfnwwht" id="sfnwwht" cssClass="cps-select"></s:select>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>因特网站域名：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.ytwzym" value="${dw.nbdw.ytwzym}" id="ytwzym" maxlength="100"/>
				</cps:tdContent>
				<cps:tdLabel>内部局域网名称：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.nbjywmc" value="${dw.nbdw.nbjywmc}" id="nbjywmc" maxlength="100"/>
				</cps:tdContent>
				<cps:tdLabel>内部BBS名称：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.nbbbsmc" value="${dw.nbdw.nbbbsmc}" id="nbbbsmc" maxlength="100"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>保卫机构设置：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.nbdw.bwjgsz" value="${dw.nbdw.bwjgsz}" zdlb="ZAGL_BWJGSZ" headerKey="" headerValue="--请选择--"/>
				</cps:tdContent>
				<cps:tdLabel>年利润(万元)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.nlr" value="${dw.nbdw.nlr}" id="nlr" inputType="number" maxlength="15" />
				</cps:tdContent>

				<cps:tdLabel>年销售额(万元)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.nxse" value="${dw.nbdw.nxse}" id="nxse" inputType="number" maxlength="15"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>签订责任书日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date name="dw.nbdw.qdzazrssj" value="${dw.nbdw.qdzazrssj}" dateFmt="yyyy-MM-dd" id="qdzazrssj"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>经营状况：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.scjyzk" value="${dw.nbdw.scjyzk}" id="scjyzk" maxlength="25"></cps:textfield>
				</cps:tdContent>

				<cps:tdLabel>技防情况：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.jfqk" value="${dw.nbdw.jfqk}" id="jfqk" maxlength="25"></cps:textfield>
				</cps:tdContent>

			</cps:row>
			<cps:row>
				<cps:tdContent colspan="6" cssStyle="background-color:#FFF0B2;font-weight:600">单位员工情况：</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>在岗职工数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.zgzgs" value="${dw.nbdw.zgzgs}" id="zgzgs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
				
				<cps:tdLabel>临时职工数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.lsgs" value="${dw.nbdw.lsgs}" id="lsgs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
				
				<cps:tdLabel>职工(学生)数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.zgxsrs" value="${dw.nbdw.zgxsrs}" inputType="integer" id="zgs" maxlength="4"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>外聘专家数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.wpzjs" value="${dw.nbdw.wpzjs}" id="wpzjs" inputType="integer" maxlength="4"/>
				</cps:tdContent>

				<cps:tdLabel>外籍员工数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.wjssygs" value="${dw.nbdw.wjssygs}" id="wjssygs" inputType="integer" maxlength="4"/>
				</cps:tdContent>

				<cps:tdLabel>港澳台员工数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.gatssygs" value="${dw.nbdw.gatssygs}" id="gatssygs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>少数民族员工数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.ssmzssygs" value="${dw.nbdw.ssmzssygs}" id="ssmzssygs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
				<cps:tdLabel>新疆员工数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.xjygs" value="${dw.nbdw.xjygs}" id="xjygs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
				<cps:tdLabel>离退休人员数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.ltxrys" value="${dw.nbdw.ltxrys}" id="ltxrys" inputType="integer" maxlength="4"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>下岗职工数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.xgzgs" value="${dw.nbdw.xgzgs}" id="xgzgs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
				<cps:tdLabel>&nbsp;</cps:tdLabel>
				<cps:tdContent>
					&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdContent colspan="6" cssStyle="background-color:#FFF0B2;font-weight:600">保卫力量情况：</cps:tdContent>
			</cps:row>
				<cps:row>
				<cps:tdLabel>专职保卫数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.zzbwgbs" value="${dw.nbdw.zzbwgbs}" id="zybws" inputType="integer" maxlength="4"/>
				</cps:tdContent>

				<cps:tdLabel>兼职保卫数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.jzbwgbs" value="${dw.nbdw.jzbwgbs}" id="jzbwgbs" inputType="integer" maxlength="4"/>
				</cps:tdContent>

				<cps:tdLabel>护卫人数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.hwrs" value="${dw.nbdw.hwrs}" id="hwrs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>经警数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.jjs" value="${dw.nbdw.jjs}" inputType="integer" maxlength="4" id="bwzzlb"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>保安数(人)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.bas" value="${dw.nbdw.bas}" id="bas" inputType="integer" maxlength="4"/>
				</cps:tdContent>
				
				<cps:tdLabel>保卫犬数(条)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.hwqs" value="${dw.nbdw.hwqs}" id="bwqs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>警棍数(根)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.jgs" value="${dw.nbdw.jgs}" inputType="integer" maxlength="4" id="bwzzlb"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>装备摩托车数(辆)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.zbmtcs" value="${dw.nbdw.zbmtcs}" id="zbmtcs" inputType="integer" maxlength="4"/>
				</cps:tdContent>
				<cps:tdLabel>装备汽车数(辆)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.zbqcs" value="${dw.nbdw.zbqcs}" inputType="integer" maxlength="4" id="bwzzlb"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>装备电台数(部)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.zbdts" value="${dw.nbdw.zbdts}" inputType="integer" maxlength="4" id="zbdts"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>要害部位数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.nbdw.yhbws" value="${dw.nbdw.yhbws}" id="yhbws" inputType="integer" maxlength="4"></cps:textfield>
				</cps:tdContent>
				
				<cps:tdLabel>夜间是否值班：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'1' : '是','0' : '否'}" name="dw.nbdw.sfyjzb" id="sfyjzb" cssClass="cps-select"></s:select>
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>其他装备情况：</cps:tdLabel>
				<cps:tdContent colspan="5">
					<cps:textfield type="textarea" name="dw.nbdw.zbqk" value="${dw.nbdw.zbqk}" id="zbqk"  maxlength="150" cssStyle="width:93%;height:40px"/>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	<%-- 
	</creator:panel>
	--%>
</div>