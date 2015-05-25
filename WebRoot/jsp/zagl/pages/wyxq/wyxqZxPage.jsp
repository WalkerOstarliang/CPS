<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/js/wyxq/wyxq.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="保存" onclick="zxWyxq()"></cps:button>
			<cps:button value="关闭" onclick="window.close();"></cps:button>
		</cps:tbar>
	
		<cps:panel title="物业小区信息" id="wyxqPanel">
			<fieldset>
				<legend>单位信息 </legend>
				<cps:table>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>小区名称：</cps:tdLabel>
						<cps:tdContent>
							${wyxq.xqmc}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel><font color="red">*</font>所属社区：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${wyxq.sssqmc}&nbsp;
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color="red">*</font>小区地址：</cps:tdLabel>
						<cps:tdContent colspan="3">
							${wyxq.dzmc}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel><font color="red">*</font>物业公司：</cps:tdLabel>
						<cps:tdContent>
							${wyxq.wygs}&nbsp;
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="16%"><font color="red">*</font>负责人：</cps:tdLabel>
						<cps:tdContent width="18%">
							${wyxq.wygsfzr}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel width="15%">建立日期：</cps:tdLabel>
						<cps:tdContent width="18%">
							${wyxq.jlrq}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel width="15%">小区面积(㎡)：</cps:tdLabel>
						<cps:tdContent>
							${wyxq.xqmj}&nbsp;
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color="red">*</font>楼栋数：</cps:tdLabel>
						<cps:tdContent>
							${wyxq.lds}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel><font color="red">*</font>进出口数：</cps:tdLabel>
						<cps:tdContent>
							${wyxq.jcks}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel><font color="red">*</font>否是有集中停车场：</cps:tdLabel>
						<cps:tdContent>
							${wyxq.sfyjztcc}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel>停车位数：</cps:tdLabel>
						<cps:tdContent>
							${wyxq.tcws}&nbsp;
						</cps:tdContent>
						
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>
				</cps:table>
			</fieldset>		
			
			<cps:table>
				<cps:row>
					<cps:tdLabel width="16%"><font color="red">*</font>登记人：</cps:tdLabel>
					<cps:tdContent width="18%">
						${wyxq.djrxm}&nbsp;
					</cps:tdContent>
					
					<cps:tdLabel width="15%"><font color="red">*</font>登记时间：</cps:tdLabel>
					<cps:tdContent width="18%">
						${wyxq.djsj}&nbsp;
					</cps:tdContent>
					
					<cps:tdLabel width="15%"><font color="red">*</font>登记单位：</cps:tdLabel>
					<cps:tdContent>
						${wyxq.djdwmc}&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
				
			<form id="wyxqForm">
				<input type="hidden" name="wyxq.id" value="${wyxq.id}" id="id" />
				<cps:table>
					<cps:row>
						<cps:tdLabel width="16%"><font color='red'>*</font>是否注销：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:select zdlb="ZDY_ZDSF" name="wyxq.zxbs" value="${wyxq.zxbs}"  id="zxbs" required="true" onchange="zxbsChange(this.value)"/>
						</cps:tdContent>
						
						<cps:tdLabel width="15%"><font color='red'>*</font>注销时间：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:date name="wyxq.zxsj" id="zxsj" value="${wyxq.zxsj}" dateFmt="yyyy-MM-dd" required="true" maxDate="sysdate"></cps:date>
						</cps:tdContent>
						<cps:tdLabel width="15%"><font color='red'>*</font>注销原因：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="wyxq.zxyy" value="${wyxq.zxyy}" id="zxyy" required="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>	
</creator:view>