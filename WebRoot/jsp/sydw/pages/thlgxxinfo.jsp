<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="特行旅馆信息">
	<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<script type="text/javascript">
		$(function(){
			var operType = $("#operType").val();
			if (operType == "detail")
			{
				$("#tzhylgyform").find(":input").attr("disabled","disabled")
			}
		});
	</script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button id="savebtn" value="保存" onclick="saveTzhyLgyBean()" display="${operType!='detail'}"></cps:button>
			<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="特种行业-旅馆业">
		<form id="tzhylgyform" action="<c:url value='/sydw/dwgl/saveTzhyLgxxBean.action'/>" method="post">
			<input type="hidden" id="thbh" name="dwBean.tzhy.thbh" value="${dwBean.tzhy.thbh}"/>
			<input type="hidden" id="tzhyjgbh" name="dwBean.tzhy.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
			<input type="hidden" id="dwjbxxjgbh" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}"/>
			<input type="hidden" id="thmc" name="dwBean.tzhy.thmc" value="${dwBean.tzhy.thmc}"/>
			<s:hidden id="operType" name="operType"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>特行类别：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="thlb" zdlb="ZAGL_THLB" name="dwBean.tzhy.thxl" value="${dwBean.tzhy.thxl}" parentDm="100" required="true" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>经营类别：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select value="${dwBean.tzhy.jylb}" name="dwBean.tzhy.jylb" zdlb="ZDY_JYLB" parentDm="100" headerKey="" headerValue=" "/>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>许可证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.tzhyxkz" value="${dwBean.tzhy.tzhyxkz}" inputType="onlychar" id="tzhyxkz" required="true" cssClass="validate[maxSize[20]]" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">有效日期：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date dateFmt="yyyy-MM-dd" name="dwBean.tzhy.xkzyxrq" id="xkzyxrq" value="${dwBean.tzhy.xkzyxrq}" />
					</cps:tdContent>
					<cps:tdLabel width="10%">核发人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.hfr" value="${dwBean.tzhy.hfr}" id="hfr" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
					<cps:tdLabel>发证机关：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="dwBean.tzhy.xkzhfdw" value="${dwBean.tzhy.xkzhfdw}" id="xkzhfdw" maxlength="80"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					
					<cps:tdLabel>领证人：</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield name="dwBean.tzhy.lzr" value="${dwBean.tzhy.lzr}" id="lzr" maxlength="15"/>
					</cps:tdContent>
					<cps:tdLabel>建档日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" name="dwBean.tzhy.thjdrq" value="${dwBean.tzhy.thjdrq}" />
					</cps:tdContent>
					<cps:tdLabel>备案时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date dateFmt="yyyy-MM-dd" maxDate="sysdate" name="dwBean.tzhy.barq" value="${dwBean.tzhy.barq}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">经营负责人身份证：</cps:tdLabel>
					<cps:tdContent width="21%">
						<cps:textfield name="dwBean.tzhy.jyfzrsfzh"  onblur="queryRyBysfz(this.value,'jyfzr','jyfzrlxdh')" value="${dwBean.tzhy.jyfzrsfzh}" id="jyfzrsfzh" isSfzh="true" cssClass="validate[maxSize[18]]" />
					</cps:tdContent>
					<cps:tdLabel width="12%">姓名：</cps:tdLabel>
					<cps:tdContent width="21%">
						<cps:textfield name="dwBean.tzhy.jyfzr" value="${dwBean.tzhy.jyfzr}"
									id="jyfzr" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
					<cps:tdLabel width="12%">联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.jyfzrlxdh" maxlength="20" minlength="7" isPhone="true" value="${dwBean.tzhy.jyfzrlxdh}" id="jyfzrlxdh"/>
					</cps:tdContent>
				</cps:row>
				 
				<cps:row>
					<cps:tdLabel>安保负责人身份证：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.abfzrsfzh" id="abfzrsfzh" onblur="queryRyBysfz(this.value,'abfzrxm','abfzrlxdh')"
							isSfzh="true" cssClass="validate[maxSize[18]]"
							inputType="onlychar" value="${dwBean.tzhy.abfzrsfzh}" />
					</cps:tdContent>
	
					<cps:tdLabel>姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.abfzrxm" value="${dwBean.tzhy.abfzrxm}"
							id="abfzrxm" cssClass="validate[maxSize[15]]" />
					</cps:tdContent>
	
					<cps:tdLabel>联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.tzhy.abfzrlxdh" id="abfzrlxdh" isPhone="true" minlength="7" maxlength="20" value="${dwBean.tzhy.abfzrlxdh}" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>变更情况：</cps:tdLabel>
					<cps:tdContent  colspan="3">
						<cps:textfield id="bgqk" name="dwBean.tzhy.bgqk" maxlength="250" value="${dwBean.tzhy.bgqk}" cssStyle="width:95%"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="bz" name="dwBean.tzhy.bz" maxlength="50" value="${dwBean.tzhy.bz}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
		 
				<cps:row>
					<cps:tdLabel width="12%">旅馆名称：</cps:tdLabel>
					<cps:tdContent width="22%">
						<input type="hidden" id="thlgjgbh" name="dwBean.thlgy.jgbh" value="${dwBean.thlgy.jgbh}"/>
						<input type="hidden" id="lgbh" name="dwBean.thlgy.lgbh" value="${dwBean.thlgy.lgbh}"/>
						<cps:textfield name="dwBean.thlgy.lgmc" id="lgmc"  readonly="true" value="${dwBean.tzhy.thmc}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>经营项目：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select zdlb="ZDY_THJYXM" name="dwBean.thlgy.jyxm" value="${dwBean.thlgy.jyxm}" required="true" id="jyxm" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>技防设备：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="jfsb" zdlb="ZDY_JGSB" name="dwBean.thlgy.lgjfsb" value="${dwBean.thlgy.lgjfsb}" required="true" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
				</cps:row>
		
				<cps:row>
					<cps:tdLabel>旅馆类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_YGLX" headerKey="" headerValue=" " name="dwBean.thlgy.lglx" value="${dwBean.thlgy.lglx}" id="lglx"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>旅馆星级：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_YGXJ" headerKey="" headerValue=" "
							name="dwBean.thlgy.lgxj" value="${dwBean.thlgy.lgxj}" id="lgxj"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>旅馆等级：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_YGDJ" headerKey="" headerValue=" "
							name="dwBean.thlgy.lgdj" value="${dwBean.thlgy.lgdj}" id="lggj"></cps:select>
					</cps:tdContent>
				</cps:row>
		
				<cps:row>
					<cps:tdLabel>旅馆是否联网：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'0':'否','1':'是'}" headerKey="" id="lgsflw"
							headerValue=" " name="dwBean.thlgy.lgsflw"
							value="dwBean.thlgy.lgsflw" cssClass="cps-select">
						</s:select>
					</cps:tdContent>
					<cps:tdLabel>旅馆客房数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="integer" name="dwBean.thlgy.lgkfs" id="lgkfs"
							value="${dwBean.thlgy.lgkfs}" maxlength="4" />
					</cps:tdContent>
					<cps:tdLabel>旅馆床位数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="integer" name="dwBean.thlgy.lgcws" id="lgcws"
							value="${dwBean.thlgy.lgcws}" maxlength="4"  />
					</cps:tdContent>
				</cps:row>
		
				<cps:row>
						
					<cps:tdLabel>旅馆状态：</cps:tdLabel>
					<cps:tdContent>
						<cps:select headerKey="" headerValue=" " zdlb="ZDY_YGZT" name="dwBean.thlgy.lgzt" value="${dwBean.thlgy.lgzt}" id="lgzt"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>旅馆车位数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="integer" name="dwBean.thlgy.lgtcws" id="lgtcws" value="${dwBean.thlgy.lgtcws}" maxlength="4" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>旅馆楼层数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="integer" name="dwBean.thlgy.lglcs" maxlength="4" value="${dwBean.thlgy.lglcs}"  id="lglcs" />
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>是否军队旅馆：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'0':'否','1':'是'}" headerKey="" id="sfjdlg" headerValue=" " name="dwBean.thlgy.sfjdlg" cssClass="cps-select" value="dwBean.thlgy.sfjdlg"></s:select>
					</cps:tdContent>
					<cps:tdLabel>装机状态：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.thlgy.zjzt" value="${dwBean.thlgy.zjzt}" id="zjzt" cssClass="validate[maxSize[25]]"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>装机方式：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwBean.thlgy.zjfs" value="${dwBean.thlgy.zjfs}"  id="zjfs" cssClass="validate[maxSize[50]]"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>建筑面积(㎡)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" name="dwBean.thlgy.jzmj" maxlength="6" id="jzmj" value="${dwBean.thlgy.jzmj}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>门庭面积(㎡)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" name="dwBean.thlgy.mtmj" maxlength="6" id="mtmj" value="${dwBean.thlgy.mtmj}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>会客室面积(㎡)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" name="dwBean.thlgy.hksmj" maxlength="6" id="hksmj" value="${dwBean.thlgy.hksmj}" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>寄存室面积(㎡)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" name="dwBean.thlgy.jcsmj" maxlength="6" id="jcsmj" value="${dwBean.thlgy.jcsmj}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>停车场面积(㎡)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" name="dwBean.thlgy.tcsmj" maxlength="6" id="tcsmj" value="${dwBean.thlgy.tcsmj}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>库房面积(㎡)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" name="dwBean.thlgy.kfmj" maxlength="6" id="kfmj" value="${dwBean.thlgy.kfmj}" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>娱乐场所面积：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" id="ylcsmj" maxlength="6" name="dwBean.thlgy.ylcsmj" value="${dwBean.thlgy.ylcsmj}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>通道宽度(m)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield inputType="number" name="dwBean.thlgy.tdkd" id="tdkd" maxlength="4" value="${dwBean.thlgy.tdkd}" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</cps:panel>
	</cps:PanelView>
</creator:view>