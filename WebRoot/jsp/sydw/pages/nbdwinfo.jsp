<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="内保单位信息">
	<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#nbdwform").find(":input").attr("disabled","true")
			}
		});
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveNbdwBean()" display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="内保单位信息">
		<form id="nbdwform" action="<c:url value='/sydw/dwgl/saveNbdwBean.action'/>" method="post">
			 <input type="hidden" name="dwBean.nbdw.nbdwbh" value="${dwBean.nbdw.nbdwbh}" id="nbdwbh">
			 <input type="hidden" name="dwBean.nbdw.jgbh" value="${dwBean.nbdw.jgbh}" id="nbdwjgbh">
			 <input type="hidden" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}" id="jgbh">
			 <s:hidden id="operType" name="operType"/>
			 <cps:table>
				<cps:row>
					<cps:tdLabel width="14%"><font color="red">*</font>所属行业：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select id="dwxl" zdlb="ZDY_DWFL" name="dwBean.nbdw.dwxl" value="${dwBean.nbdw.dwxl}" optgroup="true" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="14%"><font color="red">*</font>单位性质：</cps:tdLabel>
					<cps:tdContent width="20%">
						<cps:select name="dwBean.nbdw.dwxz" value="${dwBean.nbdw.dwxz}" id="dwxz" required="true" headerValue="--请选择--" headerKey="" zdlb="ZAGL_DWXZ"/>
					</cps:tdContent>
					<cps:tdLabel width="14%">单位联络人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.dwllr" value="${dwBean.nbdw.dwllr}" id="dwllr" maxlength="15"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>负责人身份证：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.bwbmfzrsfzh" value="${dwBean.nbdw.bwbmfzrsfzh}" required="true" id="bwbmfzrsfzh" isSfzh="true" onblur="queryRyBysfz(this.value,'bwbmfzr','fzrdh')" />
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>保卫负责人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.bwbmfzr" value="${dwBean.nbdw.bwbmfzr}" id="bwbmfzr" maxlength="15" required="true"/>
					</cps:tdContent>
					<cps:tdLabel>负责人电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.bwfzrlxdh" value="${dwBean.nbdw.bwfzrlxdh}" id="fzrdh" maxlength="20" minlength="7" isPhone="true"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>内外网互通：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'1' : '是','0' : '否'}" name="dwBean.nbdw.sfnwwht" id="sfnwwht" cssClass="cps-select"></s:select>
					</cps:tdContent>
					<cps:tdLabel>因特网站域名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.ytwzym" value="${dwBean.nbdw.ytwzym}" id="ytwzym" maxlength="100"/>
					</cps:tdContent>
					<cps:tdLabel>内部局域网名称：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.nbjywmc" value="${dwBean.nbdw.nbjywmc}" id="nbjywmc" maxlength="100"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>保卫机构设置：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="dwBean.nbdw.bwjgsz" value="${dwBean.nbdw.bwjgsz}" zdlb="ZAGL_BWJGSZ" headerKey="" headerValue=" "/>
					</cps:tdContent>
					<cps:tdLabel>年利润(万元)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.nlr" value="${dwBean.nbdw.nlr}" id="nlr" inputType="number" maxlength="15" />
					</cps:tdContent>
	
					<cps:tdLabel>年销售额(万元)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.nxse" value="${dwBean.nbdw.nxse}" id="nxse" inputType="number" maxlength="15"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>签订责任书日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="dwBean.nbdw.qdzazrssj" value="${dwBean.nbdw.qdzazrssj}" dateFmt="yyyy-MM-dd" id="qdzazrssj"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>经营状况：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.scjyzk" value="${dwBean.nbdw.scjyzk}" id="scjyzk" maxlength="25"></cps:textfield>
					</cps:tdContent>
	
					<cps:tdLabel>技防情况：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.jfqk" value="${dwBean.nbdw.jfqk}" id="jfqk" maxlength="25"></cps:textfield>
					</cps:tdContent>
	
				</cps:row>
				 
				<cps:row>
					<cps:tdLabel>在岗职工数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.zgzgs" value="${dwBean.nbdw.zgzgs}" id="zgzgs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					
					<cps:tdLabel>临时职工数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.lsgs" value="${dwBean.nbdw.lsgs}" id="lsgs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					
					<cps:tdLabel>职工(学生)数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.zgxsrs" value="${dwBean.nbdw.zgxsrs}" inputType="integer" id="zgs" maxlength="4"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>外聘专家数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.wpzjs" value="${dwBean.nbdw.wpzjs}" id="wpzjs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
	
					<cps:tdLabel>外籍员工数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.wjssygs" value="${dwBean.nbdw.wjssygs}" id="wjssygs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
	
					<cps:tdLabel>港澳台员工数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.gatssygs" value="${dwBean.nbdw.gatssygs}" id="gatssygs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>少数民族员工数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.ssmzssygs" value="${dwBean.nbdw.ssmzssygs}" id="ssmzssygs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					<cps:tdLabel>新疆员工数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.xjygs" value="${dwBean.nbdw.xjygs}" id="xjygs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					<cps:tdLabel>离退休人员数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.ltxrys" value="${dwBean.nbdw.ltxrys}" id="ltxrys" inputType="integer" maxlength="4"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>下岗职工数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.xgzgs" value="${dwBean.nbdw.xgzgs}" id="xgzgs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					<cps:tdLabel>专职保卫数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.zzbwgbs" value="${dwBean.nbdw.zzbwgbs}" id="zybws" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					<cps:tdLabel>兼职保卫数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.jzbwgbs" value="${dwBean.nbdw.jzbwgbs}" id="jzbwgbs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>护卫人数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.hwrs" value="${dwBean.nbdw.hwrs}" id="hwrs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					<cps:tdLabel>经警数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.jjs" value="${dwBean.nbdw.jjs}" inputType="integer" maxlength="4" id="bwzzlb"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>保安数(人)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.bas" value="${dwBean.nbdw.bas}" id="bas" inputType="integer" maxlength="4"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>保卫犬数(条)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.hwqs" value="${dwBean.nbdw.hwqs}" id="bwqs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
					<cps:tdLabel>警棍数(根)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.jgs" value="${dwBean.nbdw.jgs}" inputType="integer" maxlength="4" id="bwzzlb"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>装备摩托车数(辆)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.zbmtcs" value="${dwBean.nbdw.zbmtcs}" id="zbmtcs" inputType="integer" maxlength="4"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					
					<cps:tdLabel>装备汽车数(辆)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.zbqcs" value="${dwBean.nbdw.zbqcs}" inputType="integer" maxlength="4" id="bwzzlb"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>装备电台数(部)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.zbdts" value="${dwBean.nbdw.zbdts}" inputType="integer" maxlength="4" id="zbdts"></cps:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>要害部位数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.nbdw.yhbws" value="${dwBean.nbdw.yhbws}" id="yhbws" inputType="integer" maxlength="4"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			
			</cps:table>
		</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>