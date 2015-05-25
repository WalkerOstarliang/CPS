<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	var operType = "${operType}";
	$(function(){
		var sjxzqh = $("#sjxzqh").attr("initValue");
		var xzqh = $("#xzqh").attr("initValue");
		var jdxz = $("#jdxzdm").attr("initValue");
		var sqdm = $("#sqdm").attr("initValue");
		var sqdm1 = $("#sqdm").attr("initValue");
		if (sjxzqh != null && sjxzqh != "")
		{
			doubleSelectCountry(sjxzqh,'xzqh',callbackDzmc,xzqh);
		}
		if (xzqh != null && xzqh != "")
		{
			doubleSelectJdxz(xzqh,'jdxzdm',callbackDzmc,jdxz)
		}
		if (jdxz != null && jdxz != "")
		{
			doubleSelectSqByJdxzdm(jdxz,'sqdm',callbackDzmc,sqdm);
		}
		 $("#sqdm1").val($("#sqdm").attr("initValue"));
	});
</script>
<creator:tbar id="fwtbarpanel">
	<cps:button value="保存" onclick="saveFwBean(saveAfterCallback,'savejbxx');" id="savebtn"></cps:button>
	<cps:button id="czfwdjbtn" value="出租房登记" onclick="openCzfwInfo()" cssStyle="display:${fwBean.sfczw=='1'?'none':'inline'}"></cps:button>
    <%--
    <cps:button id="czfwdjbtn" value="出租房屋登记" onclick="openCzfwDjInfoWin()" cssStyle="display:${fwBean.sfczw=='1'?'none':'inline'}"></cps:button>
	--%>
	<cps:button id="syrkdjbtn" value="实有人口登记" onclick="openNewSyrkInfo()"></cps:button>
	<cps:button id="jwrkdjbtn" value="境外人口登记" onclick="openNewJwrkInfo()"></cps:button>
	<cps:button id="dwdjbtn" value="实有单位登记" onclick="openNewDwInfo()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="fwinfopanel" tbarId="fwtbarpanel"  title="房屋信息" height="window" width="99.5%">
	<input type="hidden" name="fwBean.isczfdj" value="${queryBean.isczfdj}" />
	<input id="fwbm" type="hidden" name="fwBean.fwbm" value="${fwBean.fwbm}" />
	<input id="sfczw" type="hidden" name="fwBean.sfczw" value="${fwBean.sfczw == null || fwBean.sfczw=='0' ? '0' : '1'}" />
	<%-- 房屋基本信息 --%>
	<div>
		<cps:table>
			<cps:row>
				<cps:tdLabel width="11%"><font color="red">*</font>产权类型：</cps:tdLabel>
				<cps:tdContent width="22%">
					<c:choose>
						<c:when test="${not empty fwBean.fwid}">
							<cps:select zdlb="ZDY_CQXZ" id="cqlx" name="fwBean.cqlx" value="${fwBean.cqlx}" required="true"  onchange="changeCqlx(this.value)"></cps:select>
						</c:when>
						<c:otherwise>
							<cps:select zdlb="ZDY_CQXZ" id="cqlx" name="fwBean.cqlx" value="${fwBean.cqlx == null ? '2' : '1'}" required="true"  onchange="changeCqlx(this.value)"></cps:select>
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="11%"><c:if test="${fwBean.sfczw=='1'}"><font color="red">*</font></c:if>房屋类型：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:select id="fwlb" zdlb="ZDY_FWLB" name="fwBean.fwlb" value="${fwBean.fwlb}" headerKey="" headerValue=" " required="${fwBean.sfczw=='1'}"></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="12%"><font color="red">*</font>房主证件类型：</cps:tdLabel>
				<cps:tdContent>
					<cps:select zdlb="GB_ZJZL" id="fzzjlx" name="fwBean.fzzjlx" required="true" value="${fwBean.fzzjlx != null ? fwBean.fzzjlx : '111'}" onchange="changefzzllx(this)"></cps:select>
				</cps:tdContent>
			</cps:row>
			 <cps:row id="hzxx">
				<cps:tdLabel id="hzsfzhlabel">
					<span class="cps_span_href" id="hzsfzhbutton"  onclick="openDetailRkInfo()">房主证件号码</span>：
				</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="hzsfzh" name="fwBean.hzsfzh" value="${fwBean.hzsfzh}" onblur="loadFwfzInfo(this.value)" maxlength="18" onkeyup="this.value=this.value.replace('x','X');" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel  id="hzxmlabel">房主姓名：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="hzxm" name="fwBean.hzxm" value="${fwBean.hzxm}" maxlength="15"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel id="hzlxdhlabel">联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="hzlxdh" name="fwBean.hzlxdh" value="${fwBean.hzlxdh}" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
				</cps:tdContent>
			</cps:row >
			<cps:row id="frxx">
				<cps:tdLabel  id="frsfzhlabel">
					<span class="cps_span_href" id="hzsfzhbutton"  onclick="openDetailRkInfo()">法人证件号码</span>：
				</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="frdbsfzh" name="fwBean.frdbsfzh" value="${fwBean.frdbsfzh}" onblur="loadFwfrInfo(this.value)" maxlength="18" onkeyup="this.value=this.value.replace('x','X');" ></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel id="frxmlabel">法人姓名：</cps:tdLabel>
				<cps:tdContent >
					<cps:textfield id="frdbxm" name="fwBean.frdbxm" value="${fwBean.frdbxm}" maxlength="30"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel>联系电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="frdblxdh" name="fwBean.frdblxdh" value="${fwBean.frdblxdh}" minlength="7" isPhone="true" maxlength="20"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="11%">管理类型：</cps:tdLabel>
				<cps:tdContent>
					<cps:select id="gllb" zdlb="ZDY_GLLX" name="fwBean.gllb" value="${fwBean.gllb}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="12%">管理类别：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:select zdlb="ZDY_FWZDGLLB" id="fwzdgllb" name="fwBean.fwzdgllb" value="${fwBean.fwzdgllb}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel width="11%">房屋用途：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:select id="fwyt" zdlb="ZDY_FWYT" name="fwBean.fwyt" value="${fwBean.fwyt}" optgroup="true" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="11%">户型结构：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:select id="hxjg" zdlb="ZDY_HXJG" name="fwBean.hxjg" value="${fwBean.hxjg}" headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				<cps:tdLabel>建成年份：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="jcnfMap" id="jcnf" name="fwBean.jcnf" listKey="key" listValue="value" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
				</cps:tdContent>
				<cps:tdLabel>房屋面积(㎡)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="fwmj" inputType="number" name="fwBean.fwmj" value="${fwBean.fwmj}" maxlength="6"></cps:textfield>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel width="12%">产权证号：</cps:tdLabel>
				<cps:tdContent width="22%">
					<cps:textfield id="cqzhm" name="fwBean.cqzhm" maxlength="60" value="${fwBean.cqzhm}"></cps:textfield>
				</cps:tdContent>
				<cps:tdLabel width="12%">发证日期：</cps:tdLabel>
				<cps:tdContent>
					<cps:date name="fwBean.czrq" value="${fwBean.czrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
				</cps:tdContent>
				<cps:tdLabel>
					&nbsp;<label id="ssdwmclabel"><font color="red">*</font>产权单位：</label>
				</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield id="ssdwmc" name="fwBean.ssdwmc" value="${fwBean.ssdwmc}" maxlength="150" required="true"/>&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
	<div id="czwxxxx"  style="display:${fwBean.sfczw =='1'?'inline':'none' }">
		<fieldset>
		<legend>出租屋信息</legend> 			
			<cps:table>
				<input id="czfwfwbh" type="hidden" name="fwBean.czfwBean.fwbh"  value="${fwBean.czfwBean.fwbh}">
				<input id="czfwid"   type="hidden" name="fwBean.czfwBean.id"  value="${fwBean.czfwBean.id}">
				<cps:row>
					<cps:tdLabel width="13%">出租屋编码：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="czfwbh" name="fwBean.czfwBean.czfwbh" value="${fwBean.czfwBean.czfwbh}" readonly="true" maxlength="50"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="11%">出租屋标牌码：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="czfwbpbm" name="fwBean.czfwBean.czfwbpbm" value="${fwBean.czfwBean.czfwbpbm}"  maxlength="50" cssStyle="width:94%" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row  id="clear_row10">
					<cps:tdLabel width="12%"><font color="red">*</font>承租用途：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select zdlb="ZDY_CZYT" required="true" id="czyt" name="fwBean.czfwBean.czyt" value="${fwBean.czfwBean.czyt}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>出租时间：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:date id="czsj" name="fwBean.czfwBean.czsj" value="${fwBean.czfwBean.czsj}" dateFmt="yyyy-MM-dd" required="true" maxDate="sysdate"></cps:date>
					</cps:tdContent>
					<cps:tdLabel><font color="red">*</font>出租间数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czjs" name="fwBean.czfwBean.czjs" value="${fwBean.czfwBean.czjs}" inputType="number" maxlength="2"></cps:textfield>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>是否签订责任书：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZDSF"  id="sfqdzrz" name="fwBean.czfwBean.sfqdzrz" value="${fwBean.czfwBean.sfqdzrz}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>租赁备案证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djbh" name="fwBean.czfwBean.djbh" value="${fwBean.czfwBean.djbh}" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>最新核签时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="zxhqsj" name="fwBean.czfwBean.zxhqsj" value="${fwBean.czfwBean.zxhqsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>出租面积<font>(㎡)</font>：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czmj" name="fwBean.czfwBean.czmj" value="${fwBean.czfwBean.czmj}" inputType="number" maxlength="5"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">月租金(元)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czyz" name="fwBean.czfwBean.czyz" value="${fwBean.czfwBean.czyz}" inputType="number" maxlength="20"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">租住类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZZLX" id="zzlx" name="fwBean.czfwBean.zzlx" value="${fwBean.czfwBean.zzlx}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>治安责任人身份证：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dlrsfzh" name="fwBean.czfwBean.dlrsfzh" value="${fwBean.czfwBean.dlrsfzh}" isSfzh="true" maxlength="20" onblur="queryRkBean(this.value,callbackZazrrxx)"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>治安责任人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dlr" name="fwBean.czfwBean.dlr" value="${fwBean.czfwBean.dlr}"  maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>责任人联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dlrlxfs" name="fwBean.czfwBean.dlrlxfs" value="${fwBean.czfwBean.dlrlxfs}" minlength="7" isPhone="true" maxlength="20"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>房屋状态：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" name="fwBean.czfwBean.fwzt" value="${fwBean.czfwBean.fwzt}" />
						<s:select id="fwzt" list="#{'0':'正常','1' : '停租'}" value="fwBean.czfwBean.fwzt" cssClass="cps-select" disabled="true"/>
					</cps:tdContent>
					<cps:tdLabel>出租终止时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="czzzsj" name="fwBean.czfwBean.czzzsj" value="${fwBean.czfwBean.czzzsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>注销原因：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zxyy" name="fwBean.czfwBean.zxyy" value="${fwBean.czfwBean.zxyy}" maxlength="100"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" id="bz" name="fwBean.czfwBean.bz" value="${fwBean.czfwBean.bz}" cssStyle="width:97%;"  maxlength="200"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
	</div>
 	<%--地址信息--%>
 	<div style="width: 100%">
		<fieldset>
			<legend>房屋地址信息</legend>
			<s:hidden id="dzid" name="fwBean.dzxxBean.dzid"></s:hidden>
			<s:hidden id="dzbm" name="fwBean.dzxxBean.dzbm"></s:hidden>
			<s:hidden id="hiddendzid" name="fwBean.dzxxBean.stid"></s:hidden>
			<s:hidden id="hiddenstid" name="fwBean.stxxBean.id"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>实体名称：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="stxxdmcs" name="fwBean.stxxBean.dmcs" value="${fwBean.stxxBean.dmcs}">
						<cps:textfield id="stmc" name="fwBean.stxxBean.stmc" value="${fwBean.stxxBean.stmc}" readonly="true" required="true" maxlength="60" onclick="openSelectStxxBeanUseFw()" appendPopuBtn="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>合并地址：</cps:tdLabel>
					<cps:tdContent colspan="3">
						 <cps:textfield id="dzmc" name="fwBean.dzxxBean.dzmc"  readonly="true" cssStyle="width:97%"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>市：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="sjxzqh" list="${cityXzqhList}" name="fwBean.stxxBean.sjxzqh" value="${fwBean.stxxBean.sjxzqh}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="doubleSelectCountry(this.value,'xzqh');return false;"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>县/区：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="xzqh" list="${countryXzqhList}" name="fwBean.stxxBean.xzqh" value="${fwBean.stxxBean.xzqh}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="doubleSelectJdxz(this.value,'jdxzdm',callbackDzmc)"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>街道/乡镇：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="jdxzdm" list="${xzjdqhList}"  name="fwBean.stxxBean.jdxzdm" value="${fwBean.stxxBean.jdxzdm}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',callbackDzmc)" ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>社区/村：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="sqdm1" name="fwBean.stxxBean.sqdm" value="${fwBean.stxxBean.sqdm }">
						<cps:select id="sqdm" list="${xzjdqhList}" value="${fwBean.stxxBean.sqdm}" listKey="dm" listValue="mc" disabled="true" headerKey="" headerValue=" " onchange="callbackDzmc()" ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>街路巷：</cps:tdLabel>
					<cps:tdContent >
						<input type="hidden" id="jlxdm" name="fwBean.stxxBean.jlxdm" value="${fwBean.stxxBean.jlxdm}">
						<cps:textfield id="jlxmc" name="fwBean.stxxBean.jlxmc" value="${fwBean.stxxBean.jlxmc}" disabled="true"  onblur="callbackDzmc()"  ondblclick="openJlxSelectWinxx('jlxdm','jlxmc');" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>门牌号<font color="black">(号)</font>：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="mph" name="fwBean.stxxBean.mph" value="${fwBean.stxxBean.mph}" disabled="true" onblur="callbackDzmc()"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>小区(组)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xqmc" name="fwBean.stxxBean.xqz" value="${fwBean.stxxBean.xqz}" disabled="true" onblur="callbackDzmc()"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>楼栋详址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="ldxz" name="fwBean.stxxBean.ldxz" value="${fwBean.stxxBean.ldxz}" disabled="true" onblur="callbackDzmc()"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>单元号：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_DYH" id="dyh" name="fwBean.dzxxBean.dyh" value="${fwBean.dzxxBean.dyh}" headerKey="" headerValue=" " onchange="callbackDzmc()" ></cps:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>楼层号：</cps:tdLabel>
					<cps:tdContent>
						<span><cps:textfield id="lch" name="fwBean.dzxxBean.lch" value="${fwBean.dzxxBean.lch}" required="true" maxlength="10" cssStyle="width:40%" onblur="checklchm()"></cps:textfield></span>
						<span><cps:select zdlb="ZDY_LCHZ" id="lchz" name="fwBean.dzxxBean.lchz" value="${fwBean.dzxxBean.lchz}" cssStyle="width:55px" onchange="callbackDzmc()"></cps:select></span>
					</cps:tdContent>
					<cps:tdLabel>房间：</cps:tdLabel>
					<cps:tdContent>
						<span><cps:textfield id="fjh" name="fwBean.dzxxBean.fjh" value="${fwBean.dzxxBean.fjh}" inputType="onlychar" maxlength="10" cssStyle="width:40%" onblur="callbackDzmc()"></cps:textfield></span>
						<span><cps:select zdlb="ZDY_SHHZ" id="shhz" name="fwBean.dzxxBean.shhz" value="${fwBean.dzxxBean.shhz}" cssStyle="width:55px" onchange="callbackDzmc()"></cps:select></span>
					</cps:tdContent>
					<cps:tdLabel>附属地址：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fsdz" name="fwBean.dzxxBean.fsdz" value="${fwBean.dzxxBean.fsdz}" maxlength="100" onblur="callbackDzmc()"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
	</div>
 	<%-- 操作登记责任单位信息 --%>
 	<div>
 		<fieldset>
			<legend>操作/登记/责任单位信息</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%"><font color="red">*</font>责任民警：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty fwBean.sszrmjjh}">
								<input type="hidden" id="sszrmjjh" name="fwBean.sszrmjjh" value="${loginInfo.username }"/>
								<cps:textfield id="sszrmjxm" name="fwBean.sszrmjxm" value="${loginInfo.realname}" required="true" ondblclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true"  appendPopuBtn="true" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')"></cps:textfield>
							</c:when>
							<c:otherwise>
								<s:hidden id="sszrmjjh" name="fwBean.sszrmjjh"></s:hidden>
								<cps:textfield id="sszrmjxm" name="fwBean.sszrmjxm" value="${fwBean.sszrmjxm}" required="true" ondblclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true" appendPopuBtn="true" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%"><font color="red">*</font>责任单位：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty fwBean.sszrdwdm}">
								<input type="hidden" id="sszrdwdm" name="fwBean.sszrdwdm"  value="${loginInfo.orgcode}"/>
								<cps:textfield id="sszrdwmc" name="fwBean.sszrdwmc" value="${loginInfo.orgname}"></cps:textfield>
							</c:when>
							<c:otherwise>
								<s:hidden id="sszrdwdm" name="fwBean.sszrdwdm"></s:hidden>
								<cps:textfield id="sszrdwmc" name="fwBean.sszrdwmc" required="true" value="${fwBean.sszrdwmc}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty fwBean.sszrmjlxdh}">
								<cps:textfield id="sszrmjlxdh" name="fwBean.sszrmjlxdh" value="${loginInfo.moblie}" minlength="7" isPhone="true" maxlength="20"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="sszrmjlxdh" name="fwBean.sszrmjlxdh" value="${fwBean.sszrmjlxdh}"  minlength="7" isPhone="true" maxlength="20"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>房屋状态：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="zxbs" list="#{'0':'正常','1' : '已注销'}" name="fwBean.zxbs" cssClass="cps-select" onchange="changeZxbs(this.value)"/>
					</cps:tdContent>
					<cps:tdLabel>注销时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="zxsj" name="fwBean.zxsj" value="${fwBean.zxsj}" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd HH:mm:ss"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>注销原因：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zxyy" name="fwBean.zxyy" value="${fwBean.zxyy}"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<%-- 
				<cps:row>
					<cps:tdLabel>操作人：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${opertype !='detail' }">
								<cps:textfield id="czrxm" name="fwBean.czrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="czrxm" name="fwBean.czrxm" value="${fwBean.czrxm}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>操作单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType != 'detail'}">
								<input type="hidden" id ="czdwdm" name="fwBean.czdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="czdwmc" name="fwBean.czdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" id ="czdwdm" name="fwBean.czdwdm" value="${fwBean.czdwdm}"/>
								<cps:textfield id="czdwmc" name="fwBean.czdwmc" value="${fwBean.czdwmc}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>操作时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${operType != 'detail'}">
								<cps:date id="czsj" name="fwBean.czsj" value="${currentSystemDate}"></cps:date>
							</c:when>
							<c:otherwise>
								<cps:date id="czsj" name="fwBean.czsj" value="${fwBean.czsj}"></cps:date>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				--%>
				<cps:row>
					<cps:tdLabel>登记人：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty fwBean.djrxm}">
								<cps:textfield id="djrxm" name="fwBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="djrxm" name="fwBean.djrxm" value="${fwBean.djrxm}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记单位：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty fwBean.djdwdm}">
								<input type="hidden" id ="djdwdm" name="fwBean.djdwdm" value="${loginInfo.orgcode}"/>
								<cps:textfield id="djdwmc" name="fwBean.djdwmc" value="${loginInfo.orgname}"></cps:textfield>
							</c:when>
							<c:otherwise>
								<input type="hidden" id ="djdwdm" name="fwBean.djdwdm" value="${fwBean.djdwdm}"/>
								<cps:textfield id="djdwmc" name="fwBean.djdwmc" value="${fwBean.djdwmc}" readonly="true"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>登记时间：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty fwBean.djsj}">
								<cps:textfield id="djsj" name="fwBean.djsj" value="${currentSystemDate}"></cps:textfield>
							</c:when>
							<c:otherwise>
								<cps:textfield id="djsj" name="fwBean.djsj" value="${fwBean.djsj}"></cps:textfield>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
 	</div>
</creator:panel>
 
