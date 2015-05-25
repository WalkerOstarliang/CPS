<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="保卫机构">
<creator:Script src="/jsp/zagl/js/bwjg.js"></creator:Script>
	<creator:tbar id="op">
		<cps:button value="保存" onclick="saveBwjg()"></cps:button>
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<div id="bwjg_div">
		<creator:panel id="bwjg" title="保卫机构" tbarId="op">
			<form id="bwjg_from">
				<input type="hidden" name="dw.bwjg.bwjgbh" value="${dw.bwjg.bwjgbh}" id="bwjgbh" />
				<input type="hidden" name="dw.bwjg.jgbh" value="${jgbh}" />
				<input type="hidden" value="${operType}" id="opertype" />
				
				<cps:table>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>保卫机构名称：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="dw.bwjg.jgmc" value="${dw.bwjg.jgmc}" id="jgmc" maxlength="100" required="true" cssStyle="width:90%" />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>隶属关系：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="dw.bwjg.lsgx" value="${dw.bwjg.lsgx}" id="lsgl" maxlength="100" cssStyle="width:90%"/>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="20%">负责人身份证号：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:textfield name="dw.bwjg.fzrsfzh" value="${dw.bwjg.fzrsfzh}" 
								id="fzrsfzh" maxlength="18" isSfzh="true" onblur="queryRyBysfz(this.value,'fzr','fzrlxfs')"/>
						</cps:tdContent>
					
						<cps:tdLabel width="20%">负责人：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:textfield name="dw.bwjg.fzr" value="${dw.bwjg.fzr}" id="fzr" maxlength="15" />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>负责人联系方式：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dw.bwjg.fzrlxfs" value="${dw.bwjg.fzrlxfs}" id="fzrlxfs" maxlength="30" isPhone="true" inputType="onlychar"/>
						</cps:tdContent>
						
						<cps:tdLabel width="15%">登记人：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield name="dw.bwjg.djrxm" value="${dw.bwjg.djrxm}" id="djr" readonly="true"/>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="15%">登记时间：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield name="dw.bwjg.djsj" value="${dw.bwjg.djsj}" id="djsj" readonly="true"/>
						</cps:tdContent>
						
						<cps:tdLabel width="15%">登记单位：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="dw.bwjg.djdwdm" value="${dw.bwjg.djdwdm}" />
							<cps:textfield name="dw.bwjg.djdwmc" value="${dw.bwjg.djdwmc}" id="djdwmc" readonly="true"/>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
	</div>
</creator:view>